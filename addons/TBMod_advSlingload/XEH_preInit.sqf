/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

[
    "TB_enableVanillaSlingload",    // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX",                     // setting type
    "Enable Vanilla Slingload",     // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "TBMod",                        // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false                           // data for this setting: [min, max, default, number of shown trailing decimals]
] call CBA_Settings_fnc_init;
