#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
addMissionEventHandler ["ExtensionCallback", {
   params ["_name", "_function", "_data"];

    if (_name isEqualTo "TBModExtension") then
    {
        // underscore = multipart
        private _multipartFind = _function find "_";
        if (_multipartFind != -1) then
        {
            private _multipartId = _function select [_multipartFind + 1];
            _function = _function select [0, _multipartFind];

            private _cache = missionNamespace getVariable [_multipartId, ""];
            _data = _cache + _data;

            if (_function != "multipart") exitWith {missionNamespace setVariable [_multipartId, nil]};

            missionNamespace setVariable [_multipartId, _data];
        };
        if (_function == "multipart") exitWith {};

        // parse with parseSimpleArray if _data is array
        _data = if (_data select [0, 1] == "[" && _data select [(count _data) - 1] == "]") then {parseSimpleArray _data} else {_data};

        private _msg = format ["[ExtensionCallback] %1 - %2", _function, _data];
        diag_log _msg; // nur für Übergangsphase alles loggen

        switch (toLower _function) do
        {
            case "spawn": {[] spawn (compile _data)};
            case "call": {[] call (compile _data)};
            case "task"; // nur Tests
            case "log";
            case "error": {systemChat _msg};
        };
    };
}];

// Extension laden
private _return = "TBModExtensionHost" callExtension "-";
if (_return != "") then
{
    diag_log format ["TBModExtensionInit: %1", _return];

    GVAR(loggingExtension) = 1 == ("TBModExtensionHost" callExtension ["host", ["check", "Logging"]]) param [1, 0];

    if (GVAR(loggingExtension)) then
    {
        // Logger Module erstellen
        GVAR(adminLog) = 1 == ('TBModExtensionHost' callExtension ["logging", ["register", ["adminlog", "#AdminLog.log"]]]) param [1, 0];
    };
}
else
{
    diag_log "TBModExtensionInit: <nicht vorhanden>";
};

// Admin Logging
[
    "TB_informAdminsAndZeus",
    {
        if (!isNil QGVAR(loggingExtension) && {GVAR(loggingExtension)} && {GVAR(adminLog)} && {isServer}) then
        {
            "TBModExtensionHost" callExtension ["logging", ["#log", ["adminlog", "LOG", if (_this isEqualType []) then {format _this} else {_this}]]];
        };
    }
] call CBA_fnc_addEventHandler;
