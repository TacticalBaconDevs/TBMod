#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_array"];

private _return = call CBA_fnc_createNamespace;

{
    private _result = [] call compile preprocessFileLineNumbers (format ["tasks\%1.sqf", _x]);

    GVAR(states) setVariable [_x, STATE_NotInitialised, true];
    _return setVariable [_x, _result];
}
forEach _array;

_return;
