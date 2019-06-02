/*
WARLORDS-SPECIFIC FUNCTION

Author: Josef Zem�nek

Description: System init.
*/

startLoadingScreen [""];
progressLoadingScreen 1;

titleCut ["", "BLACK FADED", 30];
_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// --- load up scenario parameters, use defaults when needed

_logicDefaultParams = [
    "StartingDaytime", -6,
    "TimeAcceleration", 16,
    "Progress", 1,
    "FTEnabled", 0,
    "ScanEnabled", 0,
    "AIVoting", 0,
    "ArsenalEnabled", 0,
    "VotingResetEnabled", 1,
    "MarkersTransparency", 0.5,
    "PlayersTransparency", 0.5,
    "FatigueEnabled", 1,
    "Music", 0,
    "Voice", 1,
    "StartCP", 500,
    "CPMultiplier", 1,
    "VotingTimeout", 60,
    "VehicleSpan", 3600,
    "FactionBLUFOR", "BLU_F",
    "FactionOPFOR", "OPF_F",
    "FactionIndep", "IND_F",
    "AssetList", ["TB_RHS"],
    "MissionEnd", 1,
    "DebriefingWinBLUFOR", "BIS_WLVictoryWEST",
    "DebriefingFailBLUFOR", "BIS_WLDefeatWEST",
    "DebriefingWinOPFOR", "BIS_WLVictoryEAST",
    "DebriefingFailOPFOR", "BIS_WLDefeatEAST"
];

_missionParams = "TRUE" configClasses (missionConfigFile >> "Params");
_useMissionParams = FALSE;
//if (isMultiplayer && count _missionParams > 0) then {_useMissionParams = TRUE};

{
    if (_forEachIndex % 2 == 0) then {
        if (isNil {_logic getVariable _x}) then {
            _logic setVariable [_x, _logicDefaultParams # ((_logicDefaultParams find _x) + 1)];
        };
        if (_useMissionParams) then {
            _i = _missionParams find (missionConfigFile >> "Params" >> format ["BIS_WL%1", _x]);
            if (_i >= 0) then {
                _logic setVariable [_x, paramsArray # _i];
            };
        };
    };
} forEach _logicDefaultParams;

if (isServer) then {
    if ((_logic getVariable "StartingDaytime") < 100) then {
        skipTime (-dayTime + 12 + (_logic getVariable "StartingDaytime"));
    };
    {createCenter _x} forEach [EAST, WEST, RESISTANCE, CIVILIAN];
    BIS_WL_recentStart = TRUE; publicVariable "BIS_WL_recentStart";
    addMissionEventHandler ["HandleDisconnect", {
        BIS_WL_trackerTick = TRUE;
        params ["_unit", "_id", "_uid", "_name"];
        if (count weapons _unit == 0) then {
            forceRespawn _unit;
        };
        removeAllOwnedMines _unit;
        if (!isNull (_unit getVariable ["BIS_WL_selectedSector", objNull])) then {
            if (side group _unit == WEST) then {
                BIS_WL_disconnectedVotes_WEST pushBack (_unit getVariable ["BIS_WL_selectedSector", objNull]);
                publicVariable "BIS_WL_disconnectedVotes_WEST";
            } else {
                BIS_WL_disconnectedVotes_EAST pushBack (_unit getVariable ["BIS_WL_selectedSector", objNull]);
                publicVariable "BIS_WL_disconnectedVotes_EAST";
            };
        };
    }];
    [] spawn {
        sleep 120;
        BIS_WL_recentStart = FALSE; publicVariable "BIS_WL_recentStart";
    };
    setTimeMultiplier (_logic getVariable "TimeAcceleration");
};

WEST setFriend [EAST, 0];
EAST setFriend [WEST, 0];
RESISTANCE setFriend [WEST, 0];
WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
EAST setFriend [RESISTANCE, 0];

if !(isDedicated) then {
    waitUntil {!isNull player && isPlayer player && ((side group player) in [WEST, EAST])};
};

_logic call BIS_fnc_WLVarsInit;

// --- start sector-related server handles

if (isServer) then {
    BIS_WL_sectors = call BIS_fnc_WLsectorsSetup;
    publicVariable "BIS_WL_sectors";
    {
        _x setVariable ["BIS_WL_selectedSector", objNull];
        if !(isPlayer _x) then {
            _x setVariable ["BIS_WL_funds", BIS_WL_startCP, TRUE];
            _x addEventHandler ["HandleRating", {
                if ((_this # 1) > 100) then {
                    (_this # 0) setVariable ["BIS_WL_funds", ((_this # 0) getVariable "BIS_WL_funds") + ((_this # 1) / 20), TRUE];
                    ["Kill reward: %1 (%2)", name (_this # 0), (_this # 1) / 20] call BIS_fnc_WLdebug;
                };
            }];
        };
        _x setVariable ["BIS_WL_AIHandle", _x call BIS_fnc_WLAICore];
        (group _x) setVariable ["BIS_WL_groupVehs", [], TRUE];
        _x addEventHandler ["Respawn", {(_this # 0) setVariable ["BIS_WL_AIHandle", (_this # 0) call BIS_fnc_WLAICore];}];
        _x allowFleeing 0;
        if !(isNil {_x getVariable "BIS_WL_requisitionPreset"}) then {
            _x call BIS_fnc_WLParseAssetList;
        };
        _x spawn BIS_WL_spawnProtectionCode;
    } forEach BIS_WL_allWarlords;
    {_x call BIS_fnc_WLsectorHandleServer} forEach [BIS_WL_base_WEST, BIS_WL_base_EAST];
    {_x call BIS_fnc_WLsectorSelectionHandleServer} forEach [EAST, WEST];
    {_x call BIS_fnc_WLsectorFundsPayoff} forEach [EAST, WEST];
    _null = [] spawn BIS_fnc_WLPlayersTrackingServer;
    _null = [] spawn {
        scriptName "WLInit (buried deletion)";
        while {TRUE} do {
            sleep 120;
            {if (abs ((getPosATL _x) # 2) > 0.5 && !isPlayer _x) then {["Deleting buried unit %1 (%2)", _x, typeOf _x] call BIS_fnc_WLdebug; deleteVehicle _x}} forEach allDeadMen;
            _holders = ((allMissionObjects "WeaponHolderSimulated") + (allMissionObjects "WeaponHolder")) select {count (_x nearObjects ["Man", 10]) == 0};
            ["Deleting %1 weapon holders", count _holders] call BIS_fnc_WLdebug;
            {deleteVehicle _x} forEach _holders;
        };
    };
    addMissionEventHandler ["EntityKilled", {
        _limit = 3;
        params ["_killed", "_killer", "_instigator"];
        if (isNull _instigator) then {_instigator = _killer};
        if (_killed != _instigator && isPlayer _instigator && side group _killed == side group _instigator && group _killed != group _instigator && isPlayer leader group _killed) then {
            _uid = getPlayerUID _instigator;
            if (_uid != "") then {
                _varID = format ["BIS_WL_friendlyKills_%1", _uid];
                _friendlyKills = missionNamespace getVariable [_varID, 0];
                if (isPlayer _killed) then {
                    _friendlyKills = _friendlyKills + 1;
                } else {
                    _friendlyKills = _friendlyKills + 0.5;
                };
                missionNamespace setVariable [_varID, _friendlyKills];
                if (_friendlyKills >= _limit) then {
                    missionNamespace setVariable [_varID, 0];
                    _arrID = BIS_WL_friendlyFirePunishPool find _uid;
                    if (_arrID >= 0) then {
                        _punishments = BIS_WL_friendlyFirePunishPool select (_arrID + 1);
                        _lastPunishment = _punishments select ((count _punishments) - 1);
                        if (_lastPunishment + BIS_WL_punishmentDuration < (call BIS_fnc_WLSyncedTime)) then {
                            _punishments pushBack (call BIS_fnc_WLSyncedTime);
                            BIS_WL_friendlyFirePunishPool set [_arrID + 1, _punishments];
                        };
                    } else {
                        BIS_WL_friendlyFirePunishPool append [_uid, [(call BIS_fnc_WLSyncedTime)]];
                    };
                };
            };
        };
    }];
    _null = [] spawn {
        scriptName "WLInit (friendly fire loop)";
        while {TRUE} do {
            {
                _uid = getPlayerUID _x;
                if ((_x getVariable ["BIS_WL_friendlyFirePunishmentEnd", 0]) == 0) then {
                    _arrID = BIS_WL_friendlyFirePunishPool find _uid;
                    if (_arrID >= 0) then {
                        _punishments = BIS_WL_friendlyFirePunishPool select (_arrID + 1);
                        _lastPunishment = _punishments select ((count _punishments) - 1);
                        if ((call BIS_fnc_WLSyncedTime) < (_lastPunishment + BIS_WL_punishmentDuration + (30 * (((count _punishments) - 1) min 8)))) then {
                            _x setVariable ["BIS_WL_friendlyFirePunishmentEnd", _lastPunishment + BIS_WL_punishmentDuration + (30 * (((count _punishments) - 1) min 8)), TRUE];
                        };
                        {
                            if (_x < ((call BIS_fnc_WLSyncedTime) - 1800)) then {_punishments = _punishments - [_x]};
                        } forEach _punishments;
                        BIS_WL_friendlyFirePunishPool set [_arrID + 1, _punishments];
                    };
                } else {
                    _x setVariable ["BIS_WL_friendlyFirePunishmentEnd", 0];
                };
            } forEach (BIS_WL_allWarlords select {isPlayer _x});
            sleep 1;
        };
    };
    [] spawn {
        while {TRUE} do {
            sleep 60;
            {
                _class = _x;
                _litter = (allMissionObjects _class) select {!(_x getVariable ["BIS_WL_litterTracked", FALSE])};
                {
                    _x setVariable ["BIS_WL_litterTracked", TRUE];
                    _x spawn {
                        waitUntil {sleep 5; (position _this) select 2 < 1};
                        sleep 5;
                        deleteVehicle _this;
                    };
                } forEach _litter;
            //} forEach BIS_WL_planeLitterClasses;
            } forEach ["Plane_Canopy_Base_F", "Ejection_Seat_Base_F"];
        };
    };
    [] spawn {
        while {TRUE} do {
            sleep 300;
            {
                if (_forEachIndex % 2 == 1) then {
                    _playerID = BIS_WL_friendlyFirePunishPool select (_forEachIndex - 1);
                    _punishments = _x;
                    {
                        if (_x < ((call BIS_fnc_WLSyncedTime) - 1800)) then {_punishments = _punishments - [_x]};
                    } forEach _punishments;
                    if (count _punishments == 0) then {
                        BIS_WL_friendlyFirePunishPool = BIS_WL_friendlyFirePunishPool - [_playerID];
                    };
                };
            } forEach BIS_WL_friendlyFirePunishPool;
            BIS_WL_friendlyFirePunishPool = BIS_WL_friendlyFirePunishPool - [[]];
        };
    };
};

waitUntil {!isNil "BIS_WL_sectors" && !isNil "BIS_WL_scenarioServices"};

{_x call BIS_fnc_WLParseAssetList} forEach [WEST, EAST];

call BIS_fnc_WLUpdateAO;

if !(isDedicated) then {
    [] spawn BIS_fnc_WLClientInit;
    if !(isNil {player getVariable "BIS_WL_requisitionPreset"}) then {
        player call BIS_fnc_WLParseAssetList;
    } else {
        player setVariable ["BIS_WL_purchasable", missionNamespace getVariable format ["BIS_WL_purchasable%1", side group player]];
    };
} else {
    BIS_WL_sectorsArrayWEST = [WEST] call BIS_fnc_WLSectorListing;
    BIS_WL_sectorsArrayEAST = [EAST] call BIS_fnc_WLSectorListing;
    endLoadingScreen;
};

// --- move respawn markers to faction bases

if (isServer) then {
    {
        if (isNil {_x getVariable "BIS_WL_purchasable"}) then {
            _x setVariable ["BIS_WL_purchasable", missionNamespace getVariable format ["BIS_WL_purchasable%1", side group _x]];
        }
    } forEach BIS_WL_allWarlords;
    {
        _side = _x;
        _base = missionNamespace getVariable format ["BIS_WL_base_%1", _side];
        for [{_i = 0}, {_i < 1}, {_i = _i + 1}] do {
            _postfix = "_%2"; if (_i == 0) then {_postfix = ""};
            _mrkrName = format ["respawn_%1" + _postfix, _side, _i];
            if ((markerType _mrkrName) == "") then {
                _mrkr = createMarker [_mrkrName, (position _base) vectorAdd [-5 + random 10, -5 + random 10, 0]];
                _mrkrName setMarkerType "Empty";
            } else {
                _mrkrName setMarkerPos ((position _base) vectorAdd [-5 + random 10, -5 + random 10, 0]);
            };
        };
    } forEach [EAST, WEST];
};

// --- scenario end handle

if ((_logic getVariable "MissionEnd") > 0) then {
    _null = _logic spawn {
        scriptName "WLInit (ending condition)";
        waitUntil {(BIS_WL_base_WEST getVariable "BIS_WL_sectorSide") != WEST || (BIS_WL_base_EAST getVariable "BIS_WL_sectorSide") != EAST};

        if (isDedicated) exitWith {endMission "End1"};

        _endWinBLUFOR = "BIS_WLVictoryWEST"; if ((_this getVariable "DebriefingWinBLUFOR") != "") then {_endWinBLUFOR = _this getVariable "DebriefingWinBLUFOR"};
        _endWinOPFOR = "BIS_WLVictoryEAST"; if ((_this getVariable "DebriefingWinOPFOR") != "") then {_endWinOPFOR = _this getVariable "DebriefingWinOPFOR"};
        _endDefeatBLUFOR = "BIS_WLDefeatWEST"; if ((_this getVariable "DebriefingFailBLUFOR") != "") then {_endDefeatBLUFOR = _this getVariable "DebriefingFailBLUFOR"};
        _endDefeatOPFOR = "BIS_WLDefeatEAST"; if ((_this getVariable "DebriefingFailOPFOR") != "") then {_endDefeatOPFOR = _this getVariable "DebriefingFailOPFOR"};

        if ((BIS_WL_base_WEST getVariable "BIS_WL_sectorSide") != WEST) then {
            playMusic "";
            0 fadeMusic 1;
            if (side group player == EAST) then {
                _endWinOPFOR call BIS_fnc_endMission;
                "Victory" call BIS_fnc_WLSoundMsg;
                [BIS_WL_base_WEST, "seize", "succeed"] call BIS_fnc_WLSectorTaskHandle;
                [BIS_WL_base_EAST, "defend", "succeed"] call BIS_fnc_WLSectorTaskHandle;
            } else {
                [_endDefeatBLUFOR, FALSE] call BIS_fnc_endMission;
                "Defeat" call BIS_fnc_WLSoundMsg;
                [BIS_WL_base_EAST, "seize", "fail"] call BIS_fnc_WLSectorTaskHandle;
                [BIS_WL_base_WEST, "defend", "fail"] call BIS_fnc_WLSectorTaskHandle;
            };
        } else {
            if (side group player == WEST) then {
                _endWinBLUFOR call BIS_fnc_endMission;
                "Victory" call BIS_fnc_WLSoundMsg;
                [BIS_WL_base_EAST, "seize", "succeed"] call BIS_fnc_WLSectorTaskHandle;
                [BIS_WL_base_WEST, "defend", "succeed"] call BIS_fnc_WLSectorTaskHandle;
            } else {
                [_endDefeatOPFOR, FALSE] call BIS_fnc_endMission;
                "Defeat" call BIS_fnc_WLSoundMsg;
                [BIS_WL_base_WEST, "seize", "fail"] call BIS_fnc_WLSectorTaskHandle;
                [BIS_WL_base_EAST, "defend", "fail"] call BIS_fnc_WLSectorTaskHandle;
            };
        };
    };
};