/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

enableEnvironment [false, true];
enableSaving [false, false];

if (TB_crashHelfer) then {[true] spawn TB_fnc_crashHelferServer};

// Zeus im Spiel erstellen
[
    "TB_addZeus",
    {
        _this spawn
        {
            params ["_player"];

            private _moderatorModule = (createGroup [sideLogic, true]) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
            _moderatorModule addCuratorEditableObjects [vehicles + allUnits, true];
            _moderatorModule setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
            _player assignCurator _moderatorModule;
            _player setVariable ["TB_Admin_Zeus", _moderatorModule, true];

            ["TB_informAdminsAndZeus", ["%1 wurde zum Zeus", name _player]] call CBA_fnc_globalEvent; // Admin Info Broadcast
            "Zeus wurde erstellt!" remoteExec ["systemChat", _player];
        };
    }
] call CBA_fnc_addEventHandler;

// Leere Gruppen löschen
[
    {
        {
            if ((units _x) isEqualTo []) then {[_x] call CBA_fnc_deleteEntity};
        }
        forEach allGroups;
    },
    1800
] call CBA_fnc_addPerFrameHandler;

["CBA_loadingScreenDone", {TB_init_done = true}] call CBA_fnc_addEventHandler;
