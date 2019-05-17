#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

if !([_target] call FUNC(isArsenalType)) exitWith {};

private _tbCargo = ACE_player getVariable ["TB_arsenalCargo", []];
if (!(_tbCargo isEqualTo []) && {!(_tbCargo isEqualTo (_target getVariable ["ace_arsenal_virtualItems", []]))}) then
{
    _target setVariable ["ace_arsenal_virtualItems", _tbCargo];

    {
        if (!(_x isEqualTo _target) && [_x] call FUNC(isArsenalType) && {!(_tbCargo isEqualTo (_x getVariable ["ace_arsenal_virtualItems", []]))}) then
        {
            _x setVariable ["ace_arsenal_virtualItems", _tbCargo];
        };
    }
    forEach (entities (typeOf _target));
};

TB_arsenal_kiste = _target;
