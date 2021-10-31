#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Teststart: call TBMod_extension_fnc_test;
*/
private _log = ["TestSkript von Addon 'Extension' gestartet..."];

//_log append (call FUNC(baseWeaponTest));
//_log append (call FUNC(checkArsenalsTest));
//_log append (call FUNC(defaultLoadoutTest));

_log pushBack "TestSkript von Addon 'Extension' beendet.";

// Testlog Ausgabe
{systemChat _x; diag_log _x} forEach _log;
