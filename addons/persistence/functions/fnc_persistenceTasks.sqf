#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define STATE_NotInitialised 0
#define STATE_Initialised 1
#define STATE_Completed 2
#define STATE_Failed 3

params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

// nicht aktiv
if (isNil QEGVAR(tasks,states)) exitWith {_storagearray};

if (_save) then
{
    {
        _storagearray pushBack [_x, EGVAR(tasks,states) getVariable [_x, STATE_NotInitialised]];
    }
    forEach (allVariables EGVAR(tasks,states));
}
else // load
{
    {
        _x params ["_name", "_state"];

        private _currentState = EGVAR(tasks,states) getVariable [_name, STATE_NotInitialised];

        if (_currentState == STATE_NotInitialised && _state != STATE_NotInitialised) then
        {
            (EGVAR(tasks,loadedTasks) getVariable [_name, []]) params ["", "_init", "_initServer"];
            _currentState = [[_currentState, STATE_Initialised], [{true}, _init, _initServer]] call FUNC(execute);
        };

        if (_currentState == STATE_Initialised && _state == STATE_Failed) then
        {
            (EGVAR(tasks,loadedTasks) getVariable [_name, []]) params ["", "", "", "", "", "", "", "_failed", "_failedServer"];
            _currentState = [[_currentState, STATE_Failed], [{true}, _failed, _failedServer]] call FUNC(execute);
        };

        if (_currentState == STATE_Initialised && _state == STATE_Completed) then
        {
            (EGVAR(tasks,loadedTasks) getVariable [_name, []]) params ["", "", "", "", "_completed", "_completedServer"];
            [[_currentState, STATE_Completed], [{true}, _completed, _completedServer]] call FUNC(execute);
        };
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Tasks wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;