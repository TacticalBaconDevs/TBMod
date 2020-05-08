#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _values = missionNamespace getVariable ["#EM_Values", []];

// UAVs haben Dauerfunk
{
    if !(_x getVariable ["hasFreq", false]) then
    {
        _x setVariable ["hasFreq", true, true];

        private _freq = (random [420, 443, 480]) toFixed 2;
        private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x};
        _values pushBackUnique _x;

        [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;
    };
}
forEach allUnitsUAV;

// Transmitter durchgehen
{
    private _index = _values find (parseNumber _x);
    private _senders = (GVAR(transmitters) getVariable [_x, []]) select {!isNil "_x" && alive _x};

    private _value = -100;
    {
        private _sender = _x;
        if (_sender != ACE_player) then {_value = ([_sender] call FUNC(calcSignal)) max _value};
    }
    forEach _senders;

    if (_index == -1) then
    {
        _values append [parseNumber _x, _value];
    }
    else
    {
        _values set [_index + 1, _value];
    };

    [GVAR(transmitters), _x, _senders] call CBA_fnc_setVarNet;
}
forEach (allVariables GVAR(transmitters));

missionNamespace setVariable ["#EM_Values", _values];
