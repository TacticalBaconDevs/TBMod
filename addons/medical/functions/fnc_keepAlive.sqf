#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    FNC: TBMod_medical_fnc_keepAlive
    Example: ["add", _unit] call TBMod_medical_fnc_keepAlive
*/
params ["_mode", ["_args", []]];
private _SELF = FUNC(keepAlive);

switch (_mode) do
{
    case "init":
    {
        GVAR(keepAlive_units) = [];
        GVAR(keepAlivePEFH) = [{
            params ["_arg", "_idPFH"];

            {
                private _volume = _x getVariable ["ace_medical_bloodVolume", 6];
                if (_volume < 4.2) then {_x setVariable ["ace_medical_bloodVolume", 4.7, true]};

                private _cardiacArrestTimeLeft = _x getVariable ["ace_medical_statemachine_cardiacArrestTimeLeft", 0];
                if (_cardiacArrestTimeLeft > 0) then {_x setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft", 10 * 60, true]};
            }
            forEach (GVAR(keepAlive_units) select {alive _x && "Unconscious" == [_x, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState});
        }, 5] call CBA_fnc_addPerFrameHandler;
    };

    case "add":
    {
        if (isNil QGVAR(keepAlivePEFH)) then {["init"] call _SELF};

        private _units = GVAR(keepAlive_units) select {alive _x};
        _units pushBackUnique _args;
        GVAR(keepAlive_units) = _units;
    };
};
