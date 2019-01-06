/*
    WARLORDS-SPECIFIC FUNCTION

    Author: Josef Zemánek

    Description: System init.

    Modified for: tacticalbacon.de
*/

if (isMultiplayer) then {
    startLoadingScreen [""];
    progressLoadingScreen 1;
};

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
    "StartCP", 0,
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
            _logic setVariable [_x, _logicDefaultParams select ((_logicDefaultParams find _x) + 1)];
        };
        if (_useMissionParams) then {
            _i = _missionParams find (missionConfigFile >> "Params" >> format ["BIS_WL%1", _x]);
            if (_i >= 0) then {
                _logic setVariable [_x, paramsArray select _i];
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
        _arrID = BIS_WL_friendlyFirePunishPool find _uid;
        if (_arrID >= 0) then {
            _startTime = BIS_WL_friendlyFirePunishPool select (_arrID + 1);
            if (_startTime + BIS_WL_punishmentDuration < serverTime) then {
                BIS_WL_friendlyFirePunishPool deleteRange [_arrID, 2];
            };
        };
        if (count weapons _unit == 0) then {
            forceRespawn _unit;
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
                if ((_this select 1) > 100) then {
                    (_this select 0) setVariable ["BIS_WL_funds", ((_this select 0) getVariable "BIS_WL_funds") + ((_this select 1) / 20), TRUE];
                    ["Kill reward: %1 (%2)", name (_this select 0), (_this select 1) / 20] call BIS_fnc_WLdebug;
                };
            }];
        };
        _x setVariable ["BIS_WL_AIHandle", _x call BIS_fnc_WLAICore];
        (group _x) setVariable ["BIS_WL_groupVehs", [], TRUE];
        _x addEventHandler ["Respawn", {(_this select 0) setVariable ["BIS_WL_AIHandle", (_this select 0) call BIS_fnc_WLAICore];}];
        _x allowFleeing 0;
    } forEach BIS_WL_allWarlords;
    {_x call BIS_fnc_WLsectorHandleServer} forEach [BIS_WL_base_WEST, BIS_WL_base_EAST];
    {_x call BIS_fnc_WLsectorSelectionHandleServer} forEach [EAST, WEST];
    {_x call BIS_fnc_WLsectorFundsPayoff} forEach [EAST, WEST];
    _null = [] spawn BIS_fnc_WLPlayersTrackingServer;
    _null = [] spawn {
        scriptName "WLInit (buried deletion)";
        while {TRUE} do {
            sleep 300;
            {if ((getPosATL _x) select 2 < -0.5) then {["Deleting buried unit %1 (%2)", _x, typeOf _x] call BIS_fnc_WLdebug; deleteVehicle _x}} forEach allDeadMen;
        };
    };
    addMissionEventHandler ["EntityKilled", {
        _limit = 3;
        params ["_killed", "_killer", "_instigator"];
        if (isNull _instigator) then {_instigator = _killer};
        if (_killed != _instigator && isPlayer _killed && isPlayer _instigator) then {
            if (side group _killed == side group _instigator) then {
                _uid = getPlayerUID _instigator;
                if (_uid != "") then {
                    _varID = format ["BIS_WL_friendlyKills_%1", _uid];
                    _friendlyKills = missionNamespace getVariable [_varID, 0];
                    _friendlyKills = _friendlyKills + 1;
                    missionNamespace setVariable [_varID, _friendlyKills];
                    if (_friendlyKills >= _limit) then {
                        missionNamespace setVariable [_varID, 0];
                        _arrID = BIS_WL_friendlyFirePunishPool find _uid;
                        if (_arrID >= 0) then {
                            _lastPunishment = BIS_WL_friendlyFirePunishPool select (_arrID + 1);
                            if (_lastPunishment + BIS_WL_punishmentDuration < serverTime) then {
                                BIS_WL_friendlyFirePunishPool set [_arrID + 1, serverTime];
                            };
                        } else {
                            BIS_WL_friendlyFirePunishPool append [_uid, serverTime];
                        };
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
                        _lastPunishment = BIS_WL_friendlyFirePunishPool select (_arrID + 1);
                        if (serverTime < (_lastPunishment + BIS_WL_punishmentDuration)) then {
                            _x setVariable ["BIS_WL_friendlyFirePunishmentEnd", _lastPunishment + BIS_WL_punishmentDuration, TRUE];
                        };
                    };
                } else {
                    _x setVariable ["BIS_WL_friendlyFirePunishmentEnd", 0];
                };
            } forEach (BIS_WL_allWarlords select {isPlayer _x});
            sleep 1;
        };
    };
};

waitUntil {!isNil "BIS_WL_sectors" && !isNil "BIS_WL_scenarioServices"};

// --- set up purchase menu variables

{
    _side = _x;
    _totalArr = [];
    {
        _type = _x;
        _entries = [];
        {
            _entries append (configProperties [configFile >> "CfgWLRequisitionPresets" >> _x >> str _side >> _type]) + (configProperties [missionConfigFile >> "CfgWLRequisitionPresets" >> _x >> str _side >> _type]);
        } forEach BIS_WL_shoppingList;
        _typeArr = [];
        if (_type == "Gear") then {
            if (BIS_WL_arsenalEnabled == 1) then {
                _typeArr pushBack ["Arsenal", BIS_WL_arsenalCost, [], "< " + (localize "STR_A3_Arsenal") + " >", "\A3\Data_F_Warlords\Data\preview_arsenal.jpg", localize "STR_A3_WL_arsenal_open", "Gear"];
            };
            if (BIS_WL_lastLoadoutEnabled == 1) then {
                _typeArr pushBack ["LastLoadout", BIS_WL_lastLoadoutCost, [], "< " + (localize "STR_A3_WL_last_loadout") + " >", "\A3\Data_F_Warlords\Data\preview_loadout.jpg", localize "STR_A3_WL_last_loadout_info", "Gear"];
            };
        };
        {
            _entryClass = configName _x;
            _req = getArray (_x >> "requirements");
            if (getNumber (BIS_WL_cfgVehs >> _entryClass >> "scope") != 2) then {["Warning: class '%1' doesn't have public scope!", _entryClass] call BIS_fnc_WLdebug;};
            if (_req findIf {!(_x in BIS_WL_scenarioServices)} == -1) then {
                _arr = [];
                _arr pushBack _entryClass;
                _arr pushBack getNumber (_x >> "cost");
                _arr pushBack _req;
                _arr pushBack getText (BIS_WL_cfgVehs >> _entryClass >> "displayName");
                _arr pushBack getText (BIS_WL_cfgVehs >> _entryClass >> "editorPreview");
                _text = "";
                if (_type == "Infantry") then {
                    _wpns = getArray (BIS_WL_cfgVehs >> _entryClass >> "weapons");
                    _wpnArrPrimary = _wpns select {getNumber (BIS_WL_cfgWpns >> _x >> "type") == 1};
                    _wpnArrSecondary = _wpns select {getNumber (BIS_WL_cfgWpns >> _x >> "type") == 4};
                    _wpnArrHandgun = _wpns select {getNumber (BIS_WL_cfgWpns >> _x >> "type") == 2};
                    _wpn = if (count _wpnArrSecondary > 0) then {
                        _wpnArrSecondary select 0;
                    } else {
                        if (count _wpnArrPrimary > 0) then {
                            _wpnArrPrimary select 0;
                        } else {
                            if (count _wpnArrHandgun > 0) then {
                                _wpnArrPrimary select 0;
                            } else {
                                ""
                            };
                        };
                    };
                    {
                        _text = _text + (getText (BIS_WL_cfgWpns >> _x >> "displayName")) + "<br/>";
                    } forEach (_wpnArrPrimary + _wpnArrSecondary + _wpnArrHandgun);
                    _text = _text + "<br/>";
                    _linked = getArray (BIS_WL_cfgVehs >> _entryClass >> "linkedItems");
                    if (count _linked > 0) then {
                        _text = _text + (getText (BIS_WL_cfgWpns >> _linked select 0 >> "displayName")) + "<br/>";
                    };
                    _backpack = getText (BIS_WL_cfgVehs >> _entryClass >> "backpack");
                    if (_backpack != "") then {_text = _text + (getText (BIS_WL_cfgVehs >> _backpack >> "displayName"))};
                };
                if (_type in ["Vehicles", "Defences", "Aircraft", "Naval"]) then {
                    _text = getText (BIS_WL_cfgVehs >> _entryClass >> "Library" >> "LibTextDesc");    // --- the texts should just all be here
                    if (_text == "") then {_text = getText (BIS_WL_cfgVehs >> _entryClass >> "Armory" >> "description")};    // --- why are some of them here
                    if (_text == "") then {    // --- some are not even there
                        _validClassArr = "toLower getText (_x >> 'vehicle') == toLower _entryClass" configClasses BIS_WL_cfgHints;
                        if (count _validClassArr > 0) then {
                            _hintLibClass = ("toLower getText (_x >> 'vehicle') == toLower _entryClass" configClasses BIS_WL_cfgHints) select 0;    // --- who thought of this omg
                            _text = getText (_hintLibClass >> "description");    // --- the fun does not stop here though
                            if (count _text > 0) then {
                                if (((toArray _text) select 0) == 37) then {     // --- yes that can happen
                                    _text = localize (((getArray (_hintLibClass >> "arguments")) select 1) select 0);    // --- WHYYYYY???!!!!
                                };
                            };
                        };
                    };
                };
                if (_type == "Gear") then {
                    _transportWeapons = (BIS_WL_cfgVehs >> _entryClass >> "TransportWeapons");
                    _weaponsCnt = (count _transportWeapons);
                    for [{_i = 0}, {_i < _weaponsCnt}, {_i = _i + 1}] do {
                        _item = getText ((_transportWeapons select _i) >> "weapon");
                        _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgWpns >> _item >> "displayName"), getNumber ((_transportWeapons select _i) >> "count"), if (_text == "") then {""} else {", "}];
                    };
                    _transportItems = (BIS_WL_cfgVehs >> _entryClass >> "TransportItems");
                    _itemsCnt = (count _transportItems);
                    for [{_i = 0}, {_i < _itemsCnt}, {_i = _i + 1}] do {
                        _item = getText ((_transportItems select _i) >> "name");
                        _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgWpns >> _item >> "displayName"), getNumber ((_transportItems select _i) >> "count"), if (_text == "") then {""} else {", "}];
                    };
                    _transportMags = (BIS_WL_cfgVehs >> _entryClass >> "TransportMagazines");
                    _magsCnt = (count _transportMags);
                    for [{_i = 0}, {_i < _magsCnt}, {_i = _i + 1}] do {
                        _item = getText ((_transportMags select _i) >> "magazine");
                        _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgMags >> _item >> "displayName"), getNumber ((_transportMags select _i) >> "count"), if (_text == "") then {""} else {", "}];
                    };
                    _transportBPacks = (BIS_WL_cfgVehs >> _entryClass >> "TransportBackpacks");
                    _bPacksCnt = (count _transportBPacks);
                    for [{_i = 0}, {_i < _bPacksCnt}, {_i = _i + 1}] do {
                        _item = getText ((_transportBPacks select _i) >> "backpack");
                        _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgVehs >> _item >> "displayName"), getNumber ((_transportMags select _i) >> "count"), if (_text == "") then {""} else {", "}];
                    };
                };
                if (_text != "") then {
                    _textNew = (_text splitString "$") select 0;
                    if (_textNew != _text) then {_text = localize _textNew} else {_text = _textNew};
                };
                _textSize = count _text;
                _textLimit = if (_type in ["Infantry", "Vehicles", "Defences", "Aircraft", "Naval"]) then {500} else {750};
                if (_textSize > _textLimit) then {
                    _textArr = toArray _text;
                    _textArr deleteRange [_textLimit, _textSize - _textLimit];
                    _text = toString _textArr;
                    if (_type in ["Infantry", "Vehicles", "Defences", "Aircraft", "Naval"]) then {
                        _text = _text + "...<br/><br/>" + localize "STR_A3_WL_menu_field_manual_tip";
                    } else {
                        _text = _text + "..."
                    };
                };
                if (_text == "") then {_text = " "};
                _arr pushBack _text;
                _arr pushBack _type;
                if (_type == "Gear_custom") then {
                    _arr pushBack getText (_x >> "template");
                    _arr pushBack getText (_x >> "displayName");
                    _arr pushBack getNumber (_x >> "clear");
                    _arr pushBack getArray (_x >> "weapons");
                    _arr pushBack getArray (_x >> "magazines");
                    _arr pushBack getArray (_x >> "items");
                    _arr pushBack getArray (_x >> "backpacks");
                };
                _typeArr pushBack _arr;
            };
        } forEach _entries;
        _totalArr pushBack _typeArr;
    } forEach ["Infantry", "Vehicles", "Gear", "Defences", "Aircraft", "Naval", "Gear_custom"];
    _servicesArr = [];
    if (BIS_WL_scanEnabled == 1) then {_servicesArr pushBack ["Scan", BIS_WL_scanCost, [], localize "STR_A3_WL_param4_title", "\A3\Data_F_Warlords\Data\preview_scan.jpg", localize "STR_A3_WL_menu_scan_info", "Services"]};
    if (BIS_WL_FTEnabled in [1, 2, 4]) then {_servicesArr pushBack ["FTSeized", 0, [], localize "STR_A3_WL_menu_fasttravel_seized", "\A3\Data_F_Warlords\Data\preview_ft_owned.jpg", localize "STR_A3_WL_menu_fasttravel_info", "Services"]};
    if (BIS_WL_FTEnabled in [1, 2]) then {_servicesArr pushBack ["FTConflict", BIS_WL_FTCost, [], localize "STR_A3_WL_menu_fasttravel_conflict", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", localize "STR_A3_WL_menu_fasttravel_info", "Services"]};
    if (BIS_WL_fundTransferEnabled == 1) then {_servicesArr pushBack ["FundsTransfer", BIS_WL_transferCost, [], localize "STR_A3_WL_menu_fundstransfer", "\A3\Data_F_Warlords\Data\preview_cp_transfer.jpg", localize "STR_A3_WL_menu_fundstransfer_info", "Services"]};
    if (BIS_WLVotingResetEnabled == 1) then {_servicesArr pushBack ["VotingReset", BIS_WL_votingResetCost, [], localize "STR_A3_WL_menu_resetvoting", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", localize "STR_A3_WL_menu_resetvoting_info", "Services"]};
    _totalArr pushBack _servicesArr;
    missionNamespace setVariable [format ["BIS_WL_purchasable%1", _side], _totalArr];
} forEach [WEST, EAST];

call BIS_fnc_WLUpdateAO;

if !(isDedicated) then {
    [] spawn BIS_fnc_WLClientInit;
    if (side group player == EAST) then {
        BIS_WL_purchasable = BIS_WL_purchasableEAST;
    } else {
        BIS_WL_purchasable = BIS_WL_purchasableWEST;
    };
} else {
    BIS_WL_sectorsArrayWEST = [WEST] call BIS_fnc_WLSectorListing;
    BIS_WL_sectorsArrayEAST = [EAST] call BIS_fnc_WLSectorListing;
    endLoadingScreen;
};

// --- move respawn markers to faction bases

if (isServer) then {
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