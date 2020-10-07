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

// Settings
[
    QGVAR(enableVanillaSlingload),
    "CHECKBOX",
    "Enable Vanilla Slingload",
    ["TBMod", QUOTE(COMPONENT)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxWeight),
    "SLIDER",
    "Maximales Gewicht",
    ["TBMod", QUOTE(COMPONENT)],
    [100, 20000, 12000, 0],
    1
] call CBA_fnc_addSetting;

ADDON = true;
