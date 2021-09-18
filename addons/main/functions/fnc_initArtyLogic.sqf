#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_radar"];

if !(isNil QGVAR(arty_seekers)) exitWith {};

[QGVAR(arty_seekers), []] call CBA_fnc_publicVariable;

[{
    params ["_args", "_idPFH"];

    for "_i" from 0 to 3 do
    {
        {
            _x params ["_seeker", "_range"];

            if !(alive (_seeker getVariable [QGVAR(arty_target), objNull])) then
            {
                private _target = (_seeker nearObjects [["RocketCore", "ShellCore", "SubmunitionCore", "MissileCore"] select _i, _range]) param [0, objNull];
                [_seeker, QGVAR(arty_target), _target] call CBA_fnc_setVarNet;
            }
        }
        forEach GVAR(arty_seekers);
    };
}, 1] call CBA_fnc_addPerFrameHandler;

/*
    // TODO: ggf mal über Fired Eventhandler dann muss nicht immer gesucht werden, ist das aber besser?!?

//GVAR(arty_targets) = [];
//publicVariable QGVAR(arty_targets);
[
    "AllVehicles",
    "Fired",
    {
        params ["_entity", "", "", "", "", "", "_projectile", ""];
        diag_log format ["initPostTEST1: %1 -> %2", typeOf _entity, [configOf _entity, true] call BIS_fnc_returnParents];

        if (alive _entity && alive _projectile) then
        {
            diag_log format ["initPostTEST2: %1 -> %2", typeOf _entity, [configOf _entity, true] call BIS_fnc_returnParents];

            GVAR(arty_targets) pushBackUnique _projectile;
            GVAR(arty_targets) = GVAR(arty_targets) select {alive _x};
            publicVariable QGVAR(arty_targets);
        };
    },
    true,
    []
] call CBA_fnc_addClassEventHandler;


[{
    params ["_args", "_idPFH"];

    GVAR(arty_targets) = GVAR(arty_targets) select {alive _x};

    {
        private _target = _x;
        private _found = QGVAR(arty_seekers) findIf {
            params ["_seeker", "_range"];
            !(alive (_seeker getVariable [QGVAR(arty_target), objNull])) && {_seeker distance _target <= _range}
        };

        if (_found != -1) then
        {
            (QGVAR(arty_seekers) select _found) setVariable [QGVAR(arty_target), _target];
        };
    }
    forEach GVAR(arty_targets);
}, 1] call CBA_fnc_addPerFrameHandler;*/
