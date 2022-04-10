#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
    
    Example:
        (begin example)
            [
                2,
                {
                    params ["_arg1", "_arg2"];
                    _arg1 + _arg2;
                },
                {
                    params ["_return", "_args"];
                    systemChat format ["Result: %1", _return];
                },
                [11, 22]
            ] call TBMod_network_fnc_transfer;
        (end)
*/
params [
    ["_target", 2],         // https://community.bistudio.com/wiki/Multiplayer_Scripting#Machine_network_ID
    ["_remoteCode", {}],    // _this = _args
    ["_returnCode", {}],    // _this = [_remoteReturn, _args]
    ["_args", []]
];

// not zero or one allowed
if (remoteExecutedOwner < 2) exitWith {};

// set returnCode to a variable
private _returnCodeId = ["init", [_returnCode]] call FUNC(manageTransfer);

// Send to target
[
    [_remoteCode, _returnCodeId, _args], 
    {
        params ["_remoteCode", "_returnCodeId", "_args"];

        // get result of the code
        private _remoteReturn = _args call _remoteCode;

        // send return to caller and remove the code
        ["exec", [_returnCodeId, _remoteReturn, _args]] remoteExecCall [QFUNC(manageTransfer), remoteExecutedOwner];
    }
] remoteExecCall ["call", _target];
