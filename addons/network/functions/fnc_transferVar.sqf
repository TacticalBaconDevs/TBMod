#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
    
    Example:
        (begin example)
            [
                2,
                "varName",
                {
                    systemChat format ["Result: %1", _this];
                },
                [11, 22]
            ] call TBMod_network_fnc_transfer;
        (end)
*/
params [
    ["_target", 2],
    ["_varNames", "", ["", []]],
    ["_resultCode", {}],
    ["_namespace", missionNamespace]
];

// not zero or one allowed
if (remoteExecutedOwner < 2) exitWith {};

if (_varNames isEqualType "") then {_varNames = [_varNames]};

[
    _target,
    {
        params ["_namespace", "_varNames"];
        private _result = {(_this # 0) getVariable _x} apply _varNames;
        if (count _result == 1) then {_result # 0} else {_result};
    },
    _resultCode,
    [_namespace, _varNames]
] call FUNC(transfer);
