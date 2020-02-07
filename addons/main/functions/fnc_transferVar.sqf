#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    ["_target", 2],
    "_varName",
    ["_namespace", missionNamespace],
    ["_codeOrWaitUntil", true] // entweder Code oder sonst Bool ob waitUntil
];

if (_codeOrWaitUntil isEqualType false && {_codeOrWaitUntil} && {!canSuspend}) exitWith {systemChat format ["transferVar soll waitUntil machen ist aber unscheduled -> %1", _this]};

private _waitVar = nil;
private _result = if (_codeOrWaitUntil isEqualType {}) then
{
    _codeOrWaitUntil
}
else
{
    if (_codeOrWaitUntil isEqualType false && {_codeOrWaitUntil}) then
    {
        _waitVar = "waitVar_"+ str (round (random 999999));
        missionNamespace setVariable [_waitVar, false];
        compile format ["%1 = nil", _waitVar];
    }
    else
    {
        {}
    }
};

[
    _target,
    {
        (_this # 1) params ["_namespace", "_varName"];
        _namespace getVariable _varName;
    }, {
        params ["_return", "_args"];
        _args params ["_namespace", "_varName", "_result"];
        _namespace setVariable [_varName, _return];
        [_return] call _result;
    },
    [_namespace, _varName, _result]
] call FUNC(transfer);

if (!isNil "_waitVar") then
{
    waitUntil {missionNamespace getVariable [_waitVar, true]};
}
