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

if (_save) then
{
    {
        private _name = _x;
        private _state = EGVAR(tasks,Namespace) getVariable [format["%1_state", _name], STATE_NotInitialised];
        _storagearray pushBack [_name, _state];
    } 
    forEach EGVAR(tasks,loadedTasks);
}
else // load
{
    {
        _x params ["_name", "_state"];
        private _currentState = EGVAR(tasks,Namespace) getVariable [format["%1_state", _name], STATE_NotInitialised];
        if (_currentState == STATE_NotInitialised && _state != STATE_NotInitialised) then {
            call (EGVAR(tasks,Namespace) getVariable [format["%1_initServer", _name], {}]);
            [[], EGVAR(tasks,Namespace) getVariable [format["%1_init", _name], {}]] remoteExec ["call", 0];
            EGVAR(tasks,Namespace) setVariable [format["%1_state", _name], STATE_Initialised];
            _currentState = STATE_Initialised;
        };

        if (_currentState == STATE_Initialised && _state == STATE_Failed) then {
            call (EGVAR(tasks,Namespace) getVariable [format["%1_failedServer", _name], {}]);
            [[], EGVAR(tasks,Namespace) getVariable [format["%1_failed", _name], {}]] remoteExec ["call", 0];
            EGVAR(tasks,Namespace) setVariable [format["%1_state", _name], STATE_Failed];
            _currentState == STATE_Failed;
        };

        if (_currentState == STATE_Initialised && _state == STATE_Completed) then {
            call (EGVAR(tasks,Namespace) getVariable [format["%1_completedServer", _name], {}]);
            [[], EGVAR(tasks,Namespace) getVariable [format["%1_completed", _name], {}]] remoteExec ["call", 0];
            EGVAR(tasks,Namespace) setVariable [format["%1_state", _name], STATE_Completed];
            _currentState == STATE_Completed;
        };
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Tasks wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;