#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_radar"];

if !(isNil QGVAR(arty_seekers)) exitWith {};

[QGVAR(arty_seekers), []] call CBA_fnc_publicVariable;

// CRAM braucht 1 Sekunde zum Schauen, deswegen _downSpeed * 2 da m/s also noch in 2 Sekunden da
/*FUNC(getBestTarget) = {
    params ["_target", "_seeker"];
    private _downSpeed = abs (((velocityModelSpace _target) select 2) min 0);

    (((getPosATL _x) param [2, 0]) - (2 * _downSpeed)) > ((getPosATL _seeker) param [2, 0]);
};


    // Shells sind netId 0:0 also nicht da oder so o.O geht alles nicht
[{
    params ["_args", "_idPFH"];

    private _artySeekers = GVAR(arty_seekers) select {alive _x};
    [QGVAR(arty_seekers), _artySeekers] call CBA_fnc_publicVariable;

    {
        _x params ["_type", "_seeker", "_range"];

        private _hasTarget = _seeker getVariable [QGVAR(arty_hasTarget), false];
        if (!_hasTarget) then
        {
            for "_i" from 0 to 3 do
            {
                private _targets = _seeker nearObjects [["RocketCore", "ShellCore", "SubmunitionCore", "MissileCore"] select _i, _range];
                private _target = _targets param [_targets findIf {[_x, _seeker] call FUNC(getBestTarget)}, objNull];
                if (alive _target) exitWith
                {
                    private _broadcast = [_seeker, QGVAR(arty_target), _target] call CBA_fnc_setVarNet;
                    ["LOGIC: Assign Target1 to: %1 - Target: %2 -> VarValue: %3 -> Broadcast: %4 -> _curTarget: %5 (%6)", _seeker, _target, _seeker getVariable [QGVAR(arty_target), objNull], _broadcast, _curTarget, alive _curTarget] call TBMod_main_fnc_debug;
                    _seeker setVariable [QGVAR(arty_target), _target, true];
                    ["LOGIC: Assign Target2 to: %1 - Target: %2 -> VarValue: %3 -> Broadcast: %4 -> Owner: %5 (%6) -> NetId: %7", _seeker, _target, _seeker getVariable [QGVAR(arty_target), objNull], _broadcast, isServer, clientOwner, netId _target] call TBMod_main_fnc_debug;
                };
            };
        };
    }
    forEach _artySeekers;
}, 1] call CBA_fnc_addPerFrameHandler;*/

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
