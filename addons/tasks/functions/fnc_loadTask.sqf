#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_name"];

result = [] call compile preprocessFileLineNumbers format["taks/%1.sqf", _name];
result params ["_canInit","_init","_initServer","_canWin","_win","_winServer","_canLose","_lose","_loseServer"];

GVAR(Namespace) setVariable [format["%1_canInit", _nane], _canInit];
GVAR(Namespace) setVariable ["%1_Init", _init];
GVAR(Namespace) setVariable ["%1_initServer", _initServer];




GVAR(loadedTasks) pushBackUnique _name;