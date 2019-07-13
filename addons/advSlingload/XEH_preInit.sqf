#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
if !(call FUNC(isTBMission)) exitWith {};

CALL_XEHPREP;

// Settings
[
    QGVAR(enableVanillaSlingload),
    "CHECKBOX",
    "Enable Vanilla Slingload",
    "TBMod",
    false
] call CBA_Settings_fnc_init;

[
    QGVAR(maxWeight),
    "SLIDER",
    "Maximales Gewicht",
    "TBMod",
    [100, 50000, 12000, 0]
] call CBA_Settings_fnc_init;
