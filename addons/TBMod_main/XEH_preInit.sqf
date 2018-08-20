/*
    Author: Willi "shukari" Graff
*/
if !(call TB_fnc_isTBMission) exitWith {};

[
    "TB_enableAdvSimulationManager",
    "CHECKBOX",
    ["erweiterten SimulationsManager", "optimierter SimulationsManager"],
    "TBMod",
    false
] call CBA_Settings_fnc_init;

// Default Values
if (isNil "TB_addArztRolle") then {TB_addArztRolle = false};
if (isNil "TB_crashHelfer") then {TB_crashHelfer = true};
if (isNil "TB_doorBreach") then {TB_doorBreach = false};
if (isNil "TB_recoilCoef") then {TB_recoilCoef = 1};
