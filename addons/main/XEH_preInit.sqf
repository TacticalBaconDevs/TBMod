#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Default Values
if (isNil QEGVAR(medical,coef)) then {EGVAR(medical,coef) = 1};

// ### RECHTE & ChatCommands
TB_lvl3 = compileFinal (str [
    "_SP_PLAYER_",
    "76561198029318101", /* shukari */
    "76561198053478498", /* Sponst */
    "76561198040057152", /* Culli */
    "76561198047437015" /* BeLink */
]);

TB_lvl2 = compileFinal (str ((call TB_lvl3) + [
    "76561198066861232", /* Darky */
    "76561198127241859", /* Eric */
    "76561198049880123" /* Eron */
]));

// CBA Settings
// https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf

// if (isNil QGVAR(debug_lvl)) then {GVAR(debug_lvl) = 0};
[
    QGVAR(debug_lvl),
    "LIST",
    ["Debug Level", "Zeigt massig Debuginformationen an"],
    "TBMod",
    [[0, 1, 2, 3], ["aus", "RPT", "RPT+systemChat", "RPT+systemChat+Hint"], 0]
] call CBA_Settings_fnc_init;
[
    QGVAR(debug_remote),
    "CHECKBOX",
    ["Debug Remote", "Zeigt remote Debuginformationen an"],
    "TBMod",
    false
] call CBA_Settings_fnc_init;

// if (isNil "TB_inkognitoSystem") then {TB_inkognitoSystem = false};
[
    "TB_inkognitoSystem",
    "CHECKBOX",
    ["Inkognito System", "Erlaubt mehre Ausrüstungen und wechsel zu zivilen Sachen"],
    "TBMod",
    false
] call CBA_Settings_fnc_init;

// if (isNil QGVAR(crashHelfer)) then {GVAR(crashHelfer) = true};
[
    QGVAR(crashHelfer),
    "CHECKBOX",
    "Crashhelfer",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil QGVAR(doorBreach)) then {GVAR(doorBreach) = true};
[
    QGVAR(doorBreach),
    "CHECKBOX",
    "Door Breach",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil QGVAR(recoilCoef)) then {GVAR(recoilCoef) = 1.0};
[
    QGVAR(recoilCoef),
    "SLIDER",
    "recoilCoef",
    "TBMod",
    [0.1, 2, 1, 1]
] call CBA_Settings_fnc_init;

// if (isNil QGVAR(recoilStart)) then {GVAR(recoilStart) = 0.50};
[
    QGVAR(recoilStart),
    "SLIDER",
    "recoilStart",
    "TBMod",
    [0.1, 2, 0.5, 1]
] call CBA_Settings_fnc_init;

// if (isNil QGVAR(fpsMonitor_client)) then {GVAR(fpsMonitor_client) = true};
[
    QGVAR(fpsMonitor_client),
    "CHECKBOX",
    "fpsMonitor_client",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil QGVAR(fpsMonitor_zeus)) then {GVAR(fpsMonitor_zeus) = true};
[
    QGVAR(fpsMonitor_zeus),
    "CHECKBOX",
    "fpsMonitor_zeus",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil QEGVAR(medical,coef_global)) then {EGVAR(medical,coef_global) = 1};
[
    QEGVAR(medical,coef_global),
    "SLIDER",
    "medicalCoef Global",
    "TBMod",
    [0.1, 2, 1, 1]
] call CBA_Settings_fnc_init;

ADDON = true;
