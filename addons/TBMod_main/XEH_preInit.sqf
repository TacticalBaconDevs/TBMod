/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

// Default Values
if (isNil "TB_medical_coef") then {TB_medical_coef = 1};

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

// if (isNil "TB_debug_lvl") then {TB_debug_lvl = 0};
[
    "TB_debug_lvl",
    "LIST",
    ["Debug Level", "Zeigt massig Debuginformationen an"],
    "TBMod",
    [[0, 1, 2, 3], ["aus", "RPT", "RPT+systemChat", "RPT+systemChat+Hint"], 0]
] call CBA_Settings_fnc_init;
[
    "TB_debug_remote",
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

// if (isNil "TB_crashHelfer") then {TB_crashHelfer = true};
[
    "TB_crashHelfer",
    "CHECKBOX",
    "Crashhelfer",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil "TB_doorBreach") then {TB_doorBreach = true};
[
    "TB_doorBreach",
    "CHECKBOX",
    "Door Breach",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil "TB_recoilCoef") then {TB_recoilCoef = 1.0};
[
    "TB_recoilCoef",
    "SLIDER",
    "recoilCoef",
    "TBMod",
    [0.1, 2, 1, 1]
] call CBA_Settings_fnc_init;

// if (isNil "TB_recoilStart") then {TB_recoilStart = 0.50};
[
    "TB_recoilStart",
    "SLIDER",
    "recoilStart",
    "TBMod",
    [0.1, 2, 0.5, 1]
] call CBA_Settings_fnc_init;

// if (isNil "TB_fpsMonitor_client") then {TB_fpsMonitor_client = true};
[
    "TB_fpsMonitor_client",
    "CHECKBOX",
    "fpsMonitor_client",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil "TB_fpsMonitor_zeus") then {TB_fpsMonitor_zeus = true};
[
    "TB_fpsMonitor_zeus",
    "CHECKBOX",
    "fpsMonitor_zeus",
    "TBMod",
    true
] call CBA_Settings_fnc_init;

// if (isNil "TB_medical_coef_global") then {TB_medical_coef_global = 1};
[
    "TB_medical_coef_global",
    "SLIDER",
    "medicalCoef Global",
    "TBMod",
    [0.1, 2, 1, 1]
] call CBA_Settings_fnc_init;
