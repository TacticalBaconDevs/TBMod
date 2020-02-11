#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    ["_target", 2],
    ["_remoteCode", {}], // _this = [player, _args]
    ["_returnCode", {}], // _this = [_remoteReturn, _args]
    ["_args", []]
];

[[_remoteCode, _returnCode, _args], {
    if (remoteExecutedOwner isEqualTo 0) exitWith {};
    params ["_remoteCode", "_returnCode", "_args"];
    private _remoteReturn = [player, _args] call _remoteCode;
    [[_remoteReturn, _args], _returnCode] remoteExecCall ["call", remoteExecutedOwner];
}] remoteExecCall ["call", _target];
