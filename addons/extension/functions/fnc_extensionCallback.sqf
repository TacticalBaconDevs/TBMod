#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_name", "_function", "_data"];

if (_name isEqualTo "TBModExtension") then
{
    // parse as simpleArray if array
    _data = if (_data select [0,1] == "[" && _data select [(count _data) - 1] == "]") then {parseSimpleArray _data} else {_data};

    private _msg = format ["[ExtensionCallback] %1 - %2 - %3", _name, _function, _data];
    diag_log _msg; // nur für Übergangsphase alles loggen

    switch (_function) do
    {
        case "spawn": {[] spawn (compile _data)};
        case "call": {[] call (compile _data)};
        //case "debug": {diag_log _msg}; // nicht gebraucht solange alles im debug
        case "log";
        case "error": {systemChat _msg};
    };
};
