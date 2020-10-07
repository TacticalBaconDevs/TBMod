#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Teststart: call TBMod_nachschub_fnc_test;
*/
private _log = ["TestSkript von Addon 'Nachschub' gestartet..."];

_log append (call FUNC(kistenCheckTest));

_log pushBack "TestSkript von Addon 'Nachschub' beendet.";

// Testlog Ausgabe
{systemChat _x; diag_log _x} forEach _log;