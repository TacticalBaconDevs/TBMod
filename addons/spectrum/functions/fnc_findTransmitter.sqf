#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// nicht aktiviert oder Gerät nicht als primär
if (!GVAR(enable) || {!GVAR(receive)}) exitWith
{
    [GVAR(transmitterPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(transmitterPFH) = nil;
};

private _values = missionNamespace getVariable ["#EM_Values", []];

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
