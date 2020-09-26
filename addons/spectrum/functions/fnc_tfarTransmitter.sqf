#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (!GVAR(enable)) exitWith {};

params ["_unit", "", "_transType", "_add", "_down"];

private _freq = "";

if (_transType == 0) then
{
    _freq = [call TFAR_fnc_activeSwRadio, ([(call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwChannel, (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getAdditionalSwChannel] select _add) + 1] call TFAR_fnc_GetChannelFrequency;
};

if (_transType == 1) then
{
    _freq = [call TFAR_fnc_activeLrRadio, ([(call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrChannel, (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getAdditionalLrChannel] select _add) + 1] call TFAR_fnc_GetChannelFrequency;
};

if (_freq != "") then
{
    private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x && _x != _unit};

    if (_down) then {_values pushBackUnique _unit};

    [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;
};
