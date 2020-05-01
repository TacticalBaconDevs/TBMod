#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _values = missionNamespace getVariable ["#EM_Values", []];
private _cone = 30;
private _weite = 300;
private _min = missionNamespace getVariable ["#EM_SMin", -60];
private _max = missionNamespace getVariable ["#EM_SMax", 0];

{
    private _index = _values find (parseNumber _x);
    private _sender = GVAR(transmitters) getVariable [_x, objNull];

    if (isNil "_sender" || isNull _sender) then
    {
        GVAR(transmitters) setVariable [_x, nil];
        if (_index != -1) then {_values set [_index + 1, -100]};
    }
    else
    {
        _value = [_sender] call FUNC(calcSignal);

        if (_index == -1) then
        {
            _values append [parseNumber _x, _value];
        }
        else
        {
            _values set [_index + 1, _value];
        };
    };
}
forEach (allVariables GVAR(transmitters));

missionNamespace setVariable ["#EM_Values", _values];
