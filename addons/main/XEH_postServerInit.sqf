#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

enableEnvironment [false, true];
enableSaving [false, false];

if (GVAR(crashHelfer)) then {[true] call FUNC(crashHelferServer)};

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

            ["TB_informAdminsAndZeus", ["%1 wurde zum Zeus", [_player] call ace_common_fnc_getName]] call CBA_fnc_globalEvent; // Admin Info Broadcast
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

["CBA_loadingScreenDone", {GVAR(initDone) = true}] call CBA_fnc_addEventHandler;
