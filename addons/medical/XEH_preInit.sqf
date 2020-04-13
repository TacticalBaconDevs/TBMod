#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if !(call EFUNC(main,isTBMission)) exitWith {};

[
    QGVAR(coef_global),
    "SLIDER",
    ["MedicSystemCoef", "Bestimmt die Zeiten für medizinische Aktionen (kleiner = weniger Zeit)"],
    "TBMod",
    [0.1, 2, 1, 1]
] call CBA_fnc_addSetting;

ADDON = true;
