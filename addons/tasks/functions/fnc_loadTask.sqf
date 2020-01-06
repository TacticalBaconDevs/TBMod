#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_name"];

result = [] call compile preprocessFileLineNumbers format["tasks\%1.sqf", _name];

result params ["_canInit","_init","_initServer","_canComplete","_completed","_completedServer","_canFail","_failed","_failedServer"];

GVAR(Namespace) setVariable [format["%1_canInit", _name], _canInit];
GVAR(Namespace) setVariable [format["%1_init", _name], _init];
GVAR(Namespace) setVariable [format["%1_initServer", _name], _initServer];
GVAR(Namespace) setVariable [format["%1_canComplete", _name], _canComplete];
GVAR(Namespace) setVariable [format["%1_completed", _name], _completed];
GVAR(Namespace) setVariable [format["%1_completedServer", _name], _completedServer];
GVAR(Namespace) setVariable [format["%1_canFail", _name], _canFail];
GVAR(Namespace) setVariable [format["%1_failed", _name], _failed];
GVAR(Namespace) setVariable [format["%1_failedServer", _name], _failedServer];
GVAR(Namespace) setVariable [format["%1_state", _name], STATE_NotInitialised, true];

GVAR(loadedTasks) pushBackUnique _name;
publicVariable QGVAR(loadedTasks);
