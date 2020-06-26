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

        private _return = _obj call _condition;
        _x set [0, CBA_missionTime + (_return param [0, random [45, 60, 90]])];

        private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x};
        _values pushBackUnique _obj;
        [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;

        [{
            params ["_obj", "_freq"];
            [GVAR(transmitters), _freq, (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x && _x != _obj}] call CBA_fnc_setVarNet;
        }, [_obj, _freq], _return param [1, random [5, 10, 20]]] call CBA_fnc_waitAndExecute;

        if (_return param [2, false]) then {GVAR(condTransmitter) deleteAt _forEachIndex};
    };
}
forEach GVAR(condTransmitter);