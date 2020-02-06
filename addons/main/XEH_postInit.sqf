#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

addMissionEventHandler ["ExtensionCallback", {
   params ["_name", "_function", "_data"];

    if (_name isEqualTo "TBModExtension") then
    {
        _data = if (_data select [0,1] == "[") then {parseSimpleArray _data} else {_data};
        private _msg = format ["[ExtensionCallback] %1 - %2 - %3", _name, _function, _data];
        systemChat _msg;
        diag_log _msg;

        //_function == "error" -> wenn extension einen error hat, _data stacktrace
        //_function == "task" -> status eines async tasks, _data = [ID, FNC, STATUS]
    };
}];

// Extension laden
diag_log format ["TBModExtension-callExtension: %1", "TBModExtension" callExtension "-"];
