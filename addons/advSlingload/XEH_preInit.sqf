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

// Settings
[
    QGVAR(enableVanillaSlingload),
    "CHECKBOX",
    "Enable Vanilla Slingload",
    "TBMod",
    false
] call CBA_fnc_addSetting;

[
    QGVAR(maxWeight),
    "SLIDER",
    "Maximales Gewicht",
    "TBMod",
    [100, 20000, 12000, 0]
] call CBA_fnc_addSetting;

ADDON = true;
