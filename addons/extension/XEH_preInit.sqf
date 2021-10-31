#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Callback registrieren
addMissionEventHandler ["ExtensionCallback", {call FUNC(extensionCallback)}];

// Extension laden
private _return = "TBModExtensionHost" callExtension "-";
if (_return != "") then
{
    diag_log format ["TBModExtensionHost Init: %1", _return];
    diag_log format ["TBModExtensionHost AllCmds: %1", ["host", "allCmds"] call FUNC(callExtension)];

    GVAR(loggingExtension) = 1 == ["host", "check", "logging", true] call FUNC(callExtension);
    diag_log format ["loggingExtension: %1", GVAR(loggingExtension)];

    // Logger Module erstellen
    if (GVAR(loggingExtension)) then
    {
        GVAR(adminLog) = 1 == ["logging", "register", ["adminlog", "#AdminLog.log"], true] call FUNC(callExtension);
        diag_log format ["adminLog: %1", GVAR(adminLog)];
        GVAR(deadCauses) = 1 == ["logging", "register", ["deadcauses", "#DeadCauses.log"], true] call FUNC(callExtension);
        diag_log format ["deadCauses: %1", GVAR(deadCauses)];
    };
}
else
{
    diag_log "TBModExtensionHost Init: <nicht vorhanden>";
};

ADDON = true;
