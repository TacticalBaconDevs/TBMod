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
        
        switch (_function) do {
            //case "error": {}; // wenn extension einen error hat, _data stacktrace
            //case "task": {}; // status einer asyncTask, _data = [ID, FNC, STATUS]
            default {
            	private _msg = format ["[ExtensionCallback] %1 - %2 - %3", _name, _function, _data];
        		systemChat _msg;
        		diag_log _msg;
            };
        };
    };
}];

// Extension laden
private _return = "TBModExtension" callExtension "-";
if (_return != "") then
{
    diag_log format ["TBModExtensionInit: %1", _return];

    if (isServer && {("TBModExtension" callExtension ["check", ["logging"]]) params [1, 0] == 1}) then
    {
        GVAR(loggingExtension) = 1 == ("TBModExtension" callExtension ["registerlogger", ["adminlog", "#AdminLog.log"]]) params [1, 0];
        diag_log format ["TBModExtension-extension-logging geladen: ", GVAR(loggingExtension)];
    };
}
else
{
    diag_log "TBModExtensionInit: <nicht vorhanden>";
};

