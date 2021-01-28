#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Name: TBMod_spectrum_fnc_conditionTransmitterPFH
*/
{
    if (_x param [0, CBA_missionTime] <= CBA_missionTime) then
    {
        _x params ["", "_condition", "_obj", "_freq"];

        (_obj call _condition) params [["_delay", random [45, 60, 90]], ["_dauer", random [5, 10, 20]], ["_remove", false]];
        TRACE_6("conditionTransmitterPFH SIGNAL ACTIV", _freq, _delay, _dauer, _remove, _obj call _condition, _condition);
        _x set [0, CBA_missionTime + _delay + _dauer];

        private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x};
        _values pushBackUnique _obj;
        [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;

        [{
            params ["_obj", "_freq"];
            TRACE_1("conditionTransmitterPFH SIGNAL AUS", _freq);
            [GVAR(transmitters), _freq, (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x && _x != _obj}] call CBA_fnc_setVarNet;
        }, [_obj, _freq], _dauer] call CBA_fnc_waitAndExecute;

        if (_remove) then {GVAR(condTransmitter) deleteAt _forEachIndex};
    };
}
forEach GVAR(condTransmitter);