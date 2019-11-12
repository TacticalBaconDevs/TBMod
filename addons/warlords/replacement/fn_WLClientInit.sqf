/*
WARLORDS-SPECIFIC FUNCTION

Author: Josef Zemánek

Description: System init (client-side).
*/

BIS_WL_sectors call BIS_fnc_WLSectorsCommonInit;

if (BIS_WL_arsenalEnabled == 1) then {
    _null = ["Preload"] call BIS_fnc_arsenal;
};

0 fadeSound 0; 0 fadeSpeech 0;
endLoadingScreen;

// --- register default player tasks

if (side group player == EAST) then {
    [BIS_WL_base_EAST, "defend", "create"] call BIS_fnc_WLSectorTaskHandle;
    [BIS_WL_base_WEST, "seize", "create"] call BIS_fnc_WLSectorTaskHandle;
} else {
    [BIS_WL_base_WEST, "defend", "create"] call BIS_fnc_WLSectorTaskHandle;
    [BIS_WL_base_EAST, "seize", "create"] call BIS_fnc_WLSectorTaskHandle;
};

player createDiaryRecord ["Diary", [localize "STR_A3_WL_rules_title", format [localize "STR_A3_WL_rules_text", "<br/>- ", "<br/><br/>- "]]];
player kbAddTopic ["Warlords", "A3\Missions_F_Warlords\kb\warlords.bikb"];

player setVariable ["BIS_WL_connectedAt", call BIS_fnc_WLSyncedTime, TRUE];

waitUntil {!isNil "BIS_WL_recentStart"};

// --- handle map icons hover actions

addMissionEventHandler ["GroupIconOverEnter", {
    _grp = _this # 1;
    _sector = _grp getVariable "BIS_WL_sector";
    if (!isNil {_sector getVariable "Name"} || isPlayer _sector) then {
        [_sector, "hover"] call BIS_fnc_WLSectorIconUpdate;
    };
}];

addMissionEventHandler ["GroupIconOverLeave", {
    BIS_WL_hoverPlayed = FALSE;
    BIS_WL_hoverAnimated = FALSE;
    _grp = _this # 1;
    _sector = _grp getVariable "BIS_WL_sector";
    if (!isNil {_sector getVariable "Name"} || isPlayer _sector) then {
        [_sector, "default"] call BIS_fnc_WLSectorIconUpdate;
    };
}];

"BIS_WL_newlySelectedSector" addPublicVariableEventHandler {
    _sector = _this # 1;
    if !(_sector getVariable "BIS_WL_handleClientRunning") then {
        _sector call BIS_fnc_WLsectorHandle;
        if (BIS_WL_scanEnabled == 1) then {[_sector, side group player] call BIS_fnc_WLsectorScanHandle};
    };
};

sleep 0.01;

{
    _x addAction [localize "STR_A3_WL_action_dismiss_teammate", {_unit = (_this select 0); if (vehicle _unit == _unit) then {deleteVehicle _unit} else {(vehicle _unit) deleteVehicleCrew _unit}}, [], -20, FALSE, TRUE, "", "_this == leader _target || _this == _target", -1, FALSE];
    _x addEventHandler ["Fired", BIS_WL_mineRestrictionCode];
} forEach ((units group player) - [player]);

{
    _x addAction [localize "STR_A3_WL_menu_remove_item", {{_x setPos position _x} forEach crew (_this select 0); deleteVehicle (_this select 0)}, [], -20, FALSE, TRUE, "", "vehicle _this != _target && _target in ((group _this) getVariable ['BIS_WL_groupVehs', []])", -1, FALSE];
} forEach (((group player) getVariable ["BIS_WL_groupVehs", []]) select {alive _x && !isNull _x});

while {count waypoints group player > 1} do {deleteWaypoint (waypoints group player # 1);};

if (BIS_WL_arsenalEnabled == 1) then {
    BIS_fnc_arsenal_data set [3, BIS_WL_factionAppropriateUniforms];
    BIS_fnc_arsenal_data set [5, (BIS_fnc_arsenal_data select 5) - BIS_WL_mortarBackpacks];
    BIS_fnc_arsenal_data set [23, (BIS_fnc_arsenal_data select 23) - ["APERSMineDispenser_Mag"]];
    BIS_WL_arsenalSetupDone = TRUE;
};

// --- add default amount of funds at the scenario start or a smaller amount in case of JIP

if (BIS_WL_recentStart) then {
    player setVariable ["BIS_WL_funds", BIS_WL_startCP, TRUE];
} else {
    player setVariable ["BIS_WL_funds", if (BIS_WL_startCP > 50) then {50 min BIS_WL_maxCP} else {0}, TRUE];
};

if (isNil {player getVariable "BIS_WL_selectedSector"}) then {
    player setVariable ["BIS_WL_selectedSector", objNull, TRUE];
};

player setVariable ["BIS_WL_sectorSide", side group player];

player enableSimulationGlobal FALSE;
player hideObjectGlobal TRUE;
startLoadingScreen [""];

_null = [] spawn {
    scriptName "WLClientInit (loading)";
    if (isMultiplayer) then {
        _i = 0;
        while {_i < 1} do {
            if (_i < 0.5) then {
                startLoadingScreen [""];
            };
            progressLoadingScreen _i;
            _i = _i + 0.075;
            sleep 0.1;
        };
    };
    player enableSimulationGlobal TRUE;
    player hideObjectGlobal FALSE;
    endLoadingScreen;
    titleCut ["", "BLACK IN", 1];
    1 fadeSound 1; 1 fadeRadio 1; 1 fadeSpeech 1;
    sleep 1;
    "Initialized" call BIS_fnc_WLSoundMsg;
    [toUpper localize "STR_A3_WL_popup_init"] spawn BIS_fnc_WLSmoothText;
    BIS_WL_selectionFSM = player call BIS_fnc_WLsectorSelectionHandle;
    sleep 3;
};

_null = [] spawn {
    scriptName "WLClientInit (group icons)";
    while {TRUE} do {
        setGroupIconsVisible [TRUE,FALSE];
        setGroupIconsSelectable TRUE;
        sleep 5;
    };
};

player addEventHandler ["Killed", {player call BIS_fnc_WLloadoutGrab}];
player addEventHandler ["HandleRating", {
    if ((_this # 1) > 100) then {
        (_this # 0) setVariable ["BIS_WL_funds", (((_this # 0) getVariable "BIS_WL_funds") + ((_this # 1) / 20)) min BIS_WL_maxCP, TRUE];
        ["Kill reward: %1 (%2)", name (_this # 0), (_this # 1) / 20] call BIS_fnc_WLdebug;
        systemChat format [localize "STR_A3_WL_award_kill", (_this # 1) / 20];
    };
}];
player addEventHandler ["Fired", BIS_WL_mineRestrictionCode];

_null = [] spawn BIS_fnc_WLReputation;
_null = [] spawn BIS_fnc_WLOSD;
_null = [] spawn BIS_fnc_WLFundsInfo;
_null = "init" spawn BIS_fnc_WLPurchaseMenu;
_null = [] spawn BIS_fnc_WLPlayersTracking;
_null = [] spawn {
    scriptName "WLClientInit (cursor swap)";
    disableSerialization;
    while {TRUE} do {
        waitUntil {BIS_WL_currentSelection != ""};
        _ctrl = (findDisplay 12) displayCtrl 51;
        _ctrl ctrlMapCursor ["Track", "HC_move"];
        waitUntil {BIS_WL_currentSelection == "" && visibleMap};
        _ctrl ctrlMapCursor ["Track", "Track"];
    };
};

if (BIS_WL_playersAlpha > 0) then {
    _null = [] spawn {
        scriptName "WLClientInit (iconDrawArray update)";
        while {TRUE} do {
            _tempArray = (+BIS_WL_allWarlords select {side group _x == side group player}) + (allUnits select {group _x == group player});
            BIS_WL_iconDrawArrayMap = _tempArray;
            BIS_WL_iconDrawArray = _tempArray select {_x distance2D player < 75};
            sleep 2;
        };
    };
};

if (BIS_WL_music == 1) then {
    _null = [] spawn {
        scriptName "WLClientInit (music)";
        _musicPool = "getText (_x >> 'name') != '' && getNumber (_x >> 'duration') > 20" configClasses (configFile >> "CfgMusic");
        _poolSize = count _musicPool;
        sleep 5;
        0 fadeMusic 0.1;
        BIS_WL_musicStopped = FALSE;
        addMusicEventHandler ["MusicStop", {BIS_WL_musicStopped = TRUE}];
        while {TRUE} do {
            _trackClass = _musicPool # floor random _poolSize;
            playMusic configName _trackClass;
            waitUntil {BIS_WL_musicStopped};
            BIS_WL_musicStopped = FALSE;
            sleep 1;
        };
    };
};

if (BIS_WL_fatigueEnabled == 0) then {
    _null = [] spawn {
        scriptName "WLClientInit (fatigue)";
        while {TRUE} do {
            {_x enableStamina FALSE} forEach units group player;
            sleep 5;
        };
    };
};

[] spawn {
    scriptName "WLClientInit (uniform)";
    _uniform = uniform player;
    while {TRUE} do {
        waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
        while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
            if ((backpack player) in BIS_WL_mortarBackpacks) then {
                removeBackpack player;
            };
            if !(uniform player in BIS_WL_factionAppropriateUniforms) then {
                player forceAddUniform _uniform;
            };
            sleep 0.01;
        };
        /*waitUntil {isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
        if !(uniform player in BIS_WL_factionAppropriateUniforms) then {
            player forceAddUniform _uniform;
        };
        if ((backpack player) in BIS_WL_mortarBackpacks) then {
            removeBackpack player;
        };*/
    };
};

[] spawn {
    _currentSectorVarID = format ["BIS_WL_currentSector_%1", side group player];
    waitUntil {isNull (missionNamespace getVariable _currentSectorVarID)};
    _t = (call BIS_fnc_WLSyncedTime) + 10;
    waitUntil {(call BIS_fnc_WLSyncedTime) > _t || visibleMap};
    if !(visibleMap) then {
        [toUpper localize "STR_A3_WL_tip_voting", 5] spawn BIS_fnc_WLSmoothText;
    };
};

[] spawn {
    _currentSectorVarID = format ["BIS_WL_currentSector_%1", side group player];
    _t = (call BIS_fnc_WLSyncedTime) + 10;
    waitUntil {(call BIS_fnc_WLSyncedTime) > _t && !isNull (missionNamespace getVariable _currentSectorVarID)};
    sleep 5;
    while {!(uiNamespace getVariable ["BIS_WL_purchaseMenuDiscovered", FALSE])} do {
        [format [toUpper localize "STR_A3_WL_tip_menu", (actionKeysNamesArray "Gear") # 0], 5] spawn BIS_fnc_WLSmoothText;
        sleep 30;
    };
};

[] spawn {
    while {TRUE} do {
        _autonomous = player getVariable ["BIS_WL_autonomousPool", []];
        _autonomousAlive = _autonomous select {alive _x};
        player setVariable ["BIS_WL_autonomousPool", _autonomousAlive];
        sleep 1;
    };
};

[] spawn {
    waitUntil {!isNull findDisplay 46};
    sleep 2;
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        _key = _this # 1;
        if (_key in actionKeys "Gear" && !(missionNamespace getVariable ["BIS_gearKeyPressed", FALSE]) && !(player getVariable ["BIS_WL_toSwitchSides", FALSE]) && (player getVariable ["BIS_WL_friendlyFirePunishmentEnd", 0]) == 0) then {
            if !(isNull (uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull])) then {
                "close" call BIS_fnc_WLPurchaseMenu;
            } else {
                BIS_gearKeyPressed = TRUE;
                [] spawn {
                    _t = time + 0.5;
                    waitUntil {!BIS_gearKeyPressed || time >= _t};
                    if (time < _t) then {
                        if (isNull findDisplay 602) then {
                            if (vehicle player == player) then {
                                if (cursorTarget distance player <= 5 && !(cursorTarget isKindOf "House") && (!alive cursorTarget || !(cursorTarget isKindOf "Man"))) then {
                                    player action ["Gear", cursorTarget];
                                } else {
                                    player action ["Gear", objNull];
                                };
                            } else {
                                vehicle player action ["Gear", vehicle player];
                            };
                        } else {
                            closeDialog 602;
                        };
                    } else {
                        if (BIS_gearKeyPressed) then {
                            if (BIS_WL_currentSelection in ["", "voted"]) then {
                                "open" spawn BIS_fnc_WLPurchaseMenu;
                            } else {
                                playSound "AddItemFailed";
                                _action = switch (BIS_WL_currentSelection) do {
                                    case "voting": {localize "STR_A3_WL_popup_voting"};
                                    case "fastTravel": {localize "STR_A3_WL_action_destination_select"};
                                    case "drop": {localize "STR_A3_WL_action_dropzone"};
                                    case "scan": {localize "STR_A3_WL_action_scan_select"};
                                };
                                [toUpper format [(localize "STR_A3_WL_another_action") + " (%1).", _action]] spawn BIS_fnc_WLSmoothText;
                            };
                        };
                    };
                };
            };
            TRUE
        };
    }];
    (findDisplay 46) displayAddEventHandler ["KeyUp", {
        _key = _this # 1;
        if (_key in actionKeys "Gear") then {
            BIS_gearKeyPressed = FALSE;
        };
    }];
};

[] spawn {
    _enemySide = if (side group player == WEST) then {EAST} else {WEST};
    _enemyTargetOld = objNull;
    _enemyVotingResetVarID = format ["BIS_WL_sectorVotingReset_%1", _enemySide];
    while {TRUE} do {
        _enemyTarget = missionNamespace getVariable [format ["BIS_WL_currentSector_%1", _enemySide], objNull];
        if (_enemyTarget != _enemyTargetOld && !isNull _enemyTarget) then {_enemyTargetOld = _enemyTarget};
        if (missionNamespace getVariable [_enemyVotingResetVarID, FALSE]) then {
            if !(isServer) then {
                missionNamespace setVariable [_enemyVotingResetVarID, FALSE];
            };
            if (!isNull _enemyTargetOld && (_enemyTargetOld == (missionNamespace getVariable [format ["BIS_WL_currentSector_%1", side group player], objNull]) || (_enemyTargetOld getVariable "BIS_WL_sectorSide") == side group player)) then {
                [toUpper format [localize "STR_A3_WL_popup_voting_reset_user", _enemySide call BIS_fnc_WLSideToFaction]] spawn BIS_fnc_WLSmoothText;
            };
        };
        sleep 1;
    };
};

addMissionEventHandler ["Draw3D", {
    if (BIS_WL_markersAlpha > 0) then {
        _curSector = if (side group player == WEST) then {BIS_WL_currentSector_WEST} else {BIS_WL_currentSector_EAST};
        if !(isNull _curSector) then {
            _color = BIS_WL_sectorColors # (BIS_WL_sidesPool find (_curSector getVariable "BIS_WL_sectorSide"));
            _dist = player distance _curSector;
            _units = "m";
            _dist = round _dist;
            if (_dist > 1000) then {_dist = _dist / 100; _dist = round _dist; _dist = _dist / 10; _units = "km"};
            drawIcon3D [
                if !(_curSector in [BIS_WL_base_WEST, BIS_WL_base_EAST]) then {BIS_WL_sectorIcon} else {BIS_WL_baseIcon},
                [_color # 0, _color # 1, _color # 2, BIS_WL_markersAlpha],
                [(position _curSector) # 0, (position _curSector) # 1, 3],
                1,
                1,
                0,
                "",
                0,
                0,
                "PuristaSemibold",
                "center",
                TRUE
            ];
            drawIcon3D [
                "",
                [1, 1, 1, BIS_WL_markersAlpha],
                [(position _curSector) # 0, (position _curSector) # 1, 3],
                0,
                0.5,
                0,
                format ["%1%2 %3", _dist, if (_dist % 1 == 0 && _units == "km") then {".0"} else {""}, if (_units == "m") then {BIS_WL_localized_m} else {BIS_WL_localized_km}],
                2,
                0.0325,
                "PuristaSemibold"
            ];
        };
    };
    if (BIS_WL_playersAlpha > 0) then {
        {
            drawIcon3D [
                "A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
                [1, 1, 1, BIS_WL_playersAlpha],
                if (vehicle _x == _x) then {
                    (_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.75];
                } else {
                    getPosATLVisual _x
                },
                0,
                0,
                0,
                name _x,
                2,
                0.0325,
                "PuristaSemibold",
                "center",
                FALSE
            ];
        } forEach (BIS_WL_iconDrawArray);
    };
    {
        drawIcon3D [
            "\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa",
            [1, 1, 1, 0.5],
            (getPosATLVisual _x) vectorAdd [0,0,1],
            1,
            1,
            0,
            _x getVariable ["BIS_WL_iconText", ""],
            2,
            0.0325,
            "PuristaSemibold",
            "center",
            FALSE
        ];
    } forEach BIS_WL_recentlyPurchasedAssets;
}];

[] spawn {
    while {TRUE} do {
        waitUntil {sleep 0.1; (player getVariable ["BIS_WL_friendlyFirePunishmentEnd", 0]) > 0};
        _end = player getVariable ["BIS_WL_friendlyFirePunishmentEnd", 0];
        systemChat toUpper localize "str_a3_mission_failed_friendly_fire";
        titleCut ["", "BLACK OUT", 1];
        while {(call BIS_fnc_WLSyncedTime) < _end} do {
            titleText [format ["%1\n\n%2", toUpper localize "str_a3_mission_failed_friendly_fire", ceil (_end - (call BIS_fnc_WLSyncedTime))], "PLAIN"];
            removeAllWeapons player;
            sleep 1;
            titleCut ["", "BLACK FADED", 1000];
        };
        titleText ["", "PLAIN"];
        titleCut ["", "BLACK IN", 1];
        player setVariable ["BIS_WL_friendlyFirePunishmentEnd", 0];
        forceRespawn player;
    };
};

if !(isServer || BIS_WLTeamBalanceEnabled == 0) then {
    sleep 0.01;
    [] spawn {
        _exit = FALSE;
        _maxDelay = (call BIS_fnc_WLSyncedTime) + 20;
        waitUntil {sleep 3; (player getVariable ["BIS_WL_toSwitchSides", FALSE] && alive player) || (call BIS_fnc_WLSyncedTime) >= _maxDelay};
        if ((call BIS_fnc_WLSyncedTime) < _maxDelay) then {
            while {!_exit} do {
                if (player getVariable ["BIS_WL_toSwitchSides", FALSE]) then {
                    _loadout = getUnitLoadout player;
                    removeAllWeapons player;
                    titleCut [format [toUpper localize "STR_A3_WL_popup_team_balance", (([WEST, EAST] - [side group player]) select 0) call BIS_fnc_WLSideToFaction], "BLACK FADED", 100000];
                    waitUntil {sleep 0.25; !alive player || !(player getVariable ["BIS_WL_toSwitchSides", FALSE])};
                    titleCut ["", "BLACK IN", 1];
                    if (alive player) then {
                        _exit = TRUE;
                        player setUnitLoadout _loadout;
                    } else {
                        waitUntil {sleep 0.25; alive player};
                    };
                };
            };
        };
    };
};

BIS_WL_enemiesCheckTrigger = createTrigger ["EmptyDetector", position player, FALSE];
BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]];
BIS_WL_enemiesCheckTrigger setTriggerArea [200, 200, 0, FALSE];
BIS_WL_enemiesCheckTrigger setTriggerActivation ["ANY", "PRESENT", TRUE];
BIS_WL_enemiesCheckTrigger setTriggerStatements [
    "{(side group _x) != side group player && (side group _x) in [EAST, WEST, RESISTANCE]} count thislist > 0",
    "",
    ""
];
player addEventHandler ["GetInMan", {detach BIS_WL_enemiesCheckTrigger; BIS_WL_enemiesCheckTrigger attachTo [vehicle player, [0, 0, 0]]}];
player addEventHandler ["GetOutMan", {detach BIS_WL_enemiesCheckTrigger; BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]]}];
player addEventHandler ["Respawn", {detach BIS_WL_enemiesCheckTrigger; BIS_WL_enemiesCheckTrigger attachTo [player, [0, 0, 0]]}];

waitUntil {visibleMap};

BIS_colorDrawE = BIS_WL_sectorColors # 0; BIS_colorDrawE set [3, 0.5];
BIS_colorDrawW = BIS_WL_sectorColors # 1; BIS_colorDrawW set [3, 0.5];
BIS_colorDrawESel = [0.75, 0.75, 0.75, 1];
BIS_colorDrawWSel = [0.75, 0.75, 0.75, 1];

(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {
    if !(isNull BIS_WL_currentSector_EAST) then {
        (_this # 0) drawIcon [
            "A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
            BIS_colorDrawE,
            BIS_WL_currentSector_EAST,
            60,
            60,
            if (side group player == EAST || BIS_WL_currentSector_EAST != BIS_WL_currentSector_WEST) then {0} else {45},
            "",
            if (side group player == EAST || BIS_WL_currentSector_EAST != BIS_WL_currentSector_WEST) then {2} else {1}
        ];
    };
    if !(isNull BIS_WL_currentSector_WEST) then {
        (_this # 0) drawIcon [
            "A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
            BIS_colorDrawW,
            BIS_WL_currentSector_WEST,
            60,
            60,
            if (side group player == WEST || BIS_WL_currentSector_EAST != BIS_WL_currentSector_WEST) then {0} else {45},
            "",
            if (side group player == WEST || BIS_WL_currentSector_EAST != BIS_WL_currentSector_WEST) then {2} else {1}
        ];
    };
    if (BIS_WL_playersAlpha > 0) then {
        {
            (_this # 0) drawIcon [
                "A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
                if (_x == player) then {[1, 0, 0, BIS_WL_playersAlpha]} else {[1, 1, 1, BIS_WL_playersAlpha]},
                getPosVisual _x,
                20,
                20,
                0,
                if (_x == player) then {""} else {format [" %1", name _x]},
                2,
                0.05,
                "EtelkaNarrowMediumPro",
                "right"
            ];
        } forEach (BIS_WL_iconDrawArrayMap);
    };
    if (cheatsEnabled) then {
        if (cheat5) then {
            {
                _leader = _x;
                {
                    (_this # 0) drawLine [
                        position _x,
                        position _leader,
                        [0,1,0,1]
                    ];
                    if !(isNull assignedVehicle _x) then {
                        (_this # 0) drawLine [
                            position _x,
                            position assignedVehicle _x,
                            [0,0,1,1]
                        ];
                    };
                    (_this # 0) drawLine [
                        position _x,
                        (expectedDestination _x) # 0,
                        [1,0,0,1]
                    ];
                } forEach units group _leader;
            } forEach (BIS_WL_allWarlords select {!isPlayer _x});

            {
                (_this # 0) drawIcon [
                    "A3\ui_f\data\map\markers\military\dot_CA.paa",
                    [1, 1, 0, 0.5],
                    getPosVisual _x,
                    20,
                    20,
                    0,
                    typeOf _x,
                    2,
                    0.05,
                    "RobotoCondensed",
                    "right"
                ];
            } forEach allDeadMen;
        };
    };
}];
