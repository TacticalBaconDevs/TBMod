#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if(!isServer) exitWith {"[TBMod_tasks] loop wurde nicht auf dem Server gestartet" remoteExecCall ["systemChat"]};

{
	_name = _x;
	_state = GVAR(Namespace) getVariable [format["%1_state", _name], STATE_Completed]; //if not found handle as wind

	if(_state isEqualTo STATE_NotInitialised) then 
	{
		_canInit = call GVAR(Namespace) getVariable [format["%1_canInit", _name], {false}];
		if (_canInit) then {
			call GVAR(Namespace) getVariable [format["%1_initServer", _name], {}];
			[[], GVAR(Namespace) getVariable [format["%1_init", _name], {}]] remoteExec ["call", 0];
			GVAR(Namespace) setVariable [format["%1_state", _name], STATE_Initialised];
		}
	};

	if(_state isEqualTo STATE_Initialised) then 
	{
		_canFail = call GVAR(Namespace) getVariable [format["%1_canFail", _name], {false}];
		if (_canInit) then {
			call GVAR(Namespace) getVariable [format["%1_failedServer", _name], {}];
			[[], GVAR(Namespace) getVariable [format["%1_failed", _name], {}]] remoteExec ["call", 0];
			GVAR(Namespace) setVariable [format["%1_state", _name], STATE_Failed];
		}
	};
	//Dont complete if failed at the same time
	if(_state isEqualTo STATE_Initialised) then 
	{
		_canComplete = call GVAR(Namespace) getVariable [format["%1_canComplete", _name], {false}];
		if (_canComplete) then {
			call GVAR(Namespace) getVariable [format["%1_completedServer", _name], {}];
			[[], GVAR(Namespace) getVariable [format["%1_completed", _name], {}]] remoteExec ["call", 0];
			GVAR(Namespace) setVariable [format["%1_state", _name], STATE_Completed];
		}
	};

} forEach GVAR(loadedTasks);

[FUNC(loop), [], 1] call CBA_fnc_waitAndExecute;