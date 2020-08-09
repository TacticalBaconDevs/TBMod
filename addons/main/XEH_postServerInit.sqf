#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

enableEnvironment [true, true];
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

["CBA_loadingScreenDone", {
    GVAR(initDone) = true;

    // ### DeadCauses
    if (!isNil QGVAR(loggingExtension) && GVAR(loggingExtension)) then
    {
        GVAR(deadCauses) = 1 == ('TBModExtension' callExtension ["registerlogger", ["deadcauses", "#DeadCauses.log"]]) param [1, 0];

        if (GVAR(deadCauses)) then
        {
            ["ace_killed", {
                params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

                if (!isNull _killer && isNull _instigator) then {_instigator = effectiveCommander _killer};

                "TBModExtension" callExtension ["logger", ["deadcauses", "KILLED", format ["%1(%2) von %3(%4) durch %5  --->  %6", [_unit] call ace_common_fnc_getName, typeOf _unit, [_instigator] call ace_common_fnc_getName, typeOf _instigator, _causeOfDeath, _this]]];
            }] call CBA_fnc_addEventHandler;
        };
    };
}] call CBA_fnc_addEventHandler;
