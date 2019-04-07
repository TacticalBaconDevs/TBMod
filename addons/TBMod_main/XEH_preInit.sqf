/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

// Default Values
if (isNil "TB_inkognitoSystem") then {TB_inkognitoSystem = false};
if (isNil "TB_crashHelfer") then {TB_crashHelfer = true};
if (isNil "TB_doorBreach") then {TB_doorBreach = false};
if (isNil "TB_recoilCoef") then {TB_recoilCoef = 1.0};
if (isNil "TB_recoilStart") then {TB_recoilStart = 0.50};
if (isNil "TB_fpsMonitor_client") then {TB_fpsMonitor_client = true};
if (isNil "TB_fpsMonitor_zeus") then {TB_fpsMonitor_zeus = true};
if (isNil "TB_medical_coef") then {TB_medical_coef = 1};
if (isNil "TB_debug_lvl") then {TB_debug_lvl = 0};

// ### RECHTE & ChatCommands
TB_lvl3 = compileFinal (str [
    "_SP_PLAYER_",
    "76561198029318101", /* shukari */
    "76561198053478498", /* Sponst */
    "76561198040057152", /* Culli */
    "76561198047437015" /* BeLink */
]);

TB_lvl2 = compileFinal (str ((call TB_lvl3) + [
    "76561198066861232" /* Darky */
]));
