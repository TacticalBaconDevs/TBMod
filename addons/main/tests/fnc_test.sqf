#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Teststart: call TBMod_main_fnc_test;
*/
private _log = {systemChat _this; diag_log _this};
"TestSkript vom TBMod gestartet..." call _log;

call TBMod_arsenal_fnc_test;
call TBMod_nachschub_fnc_test;
call TBMod_extension_fnc_test;

"TestSkript vom TBMod beendet." call _log;
