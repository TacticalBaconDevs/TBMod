#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_taskId", -1, [0]]];

if (!canSuspend) exitWith {"ERROR: Suspending not allowed in this contex"};

private _result = "";

if (_taskId > 1) then
{
    private _return = "";
    waitUntil
    {
        _return = ["host", "status", _taskId] call FUNC(callExtension);
        _return != "QUEUE"
    };

    if (_return in ["ERROR", "UNKNOWN_TASKID"]) exitWith {_return};

    waitUntil
    {
        _return = ["host", "getCache", _taskId] call FUNC(callExtension);
        if (_return == "ERROR") exitWith {};
        _result = _result + _return;
    };
};

_result;
