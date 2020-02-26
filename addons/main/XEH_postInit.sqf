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
        diag_log _msg; // nur für Übergangsphase alles loggen

        switch (_function) do
        {
            case "spawn": {[] spawn (compile _data)};
            case "call": {[] call (compile _data)};
            case "log";
            case "error": {systemChat _msg};
        };
    };
}];

// Extension laden
private _return = "TBModExtension" callExtension "-";
if (_return != "") then
{
    diag_log format ["TBModExtensionInit: %1", _return];

    GVAR(loggingExtension) = 1 == ('TBModExtension' callExtension ['registerlogger', ['adminlog', '#AdminLog.log']]) params [1, 0];
}
else
{
    diag_log "TBModExtensionInit: <nicht vorhanden>";
};

