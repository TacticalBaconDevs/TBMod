#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (!GVAR(enable)) exitWith {};

// UAVs haben Dauerfunk
{
    if !(_x getVariable [QGVAR(hasFreq), false]) then
    {
        _x setVariable [QGVAR(hasFreq), true];

        private _freq = (random [420, 443, 480]) toFixed 2;
        private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x};
        _values pushBackUnique _x;

        [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;
    };
}
forEach allUnitsUAV;
