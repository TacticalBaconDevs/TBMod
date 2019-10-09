#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_rolle"];

// #################################################################
// Wichtige Eigenschaften der Rollen setzen
// #################################################################
// Sanitäter / Arzt / Pilot
if (isNil "TB_origin_medicClass") then {TB_origin_medicClass = ACE_player getVariable ["ace_medical_medicClass", 0]};
if (TB_origin_medicClass == 0) then
{
    if (_rolle in ["sani", "arzt", "pilot"]) then
    {
        ACE_player setVariable ["ace_medical_medicClass", [2, 1] select (_rolle == "sani"), true];
        ACE_player setUnitTrait ["medic", true];
        EGVAR(medical,coef) = ([0.9, 0.55] select (_rolle == "arzt")) * EGVAR(medical,coef_global);
    }
    else
    {
        ACE_player setVariable ["ace_medical_medicClass", 0, true];
        ACE_player setUnitTrait ["medic", false];
        EGVAR(medical,coef) = 1.1 * EGVAR(medical,coef_global);
    };
};

// Sanitäter - Enigneer / Pilot / Pionier / JTAC
if (isNil "TB_origin_IsEngineer") then {TB_origin_IsEngineer = ACE_player getVariable ["ACE_IsEngineer", 0]};
if (TB_origin_IsEngineer == 0) then
{
    if (_rolle in ["spreng", "pilot", "pionier", "jtac"]) then
    {
        ACE_player setVariable ["ACE_IsEngineer", 2, true];
        ACE_player setUnitTrait ["engineer", true];
        ACE_player setUnitTrait ["explosiveSpecialist", true];
    }
    else
    {
        ACE_player setVariable ["ACE_IsEngineer", 0, true];
        ACE_player setUnitTrait ["engineer", false];
        ACE_player setUnitTrait ["explosiveSpecialist", false];
    };
};

// erhöhte Kistentragefähigkeit - Pilot / Muniträger / Pionier
if (isNil "TB_origin_maxWeightCarry") then {TB_origin_maxWeightCarry = ACE_maxWeightCarry};
ACE_maxWeightCarry = [TB_origin_maxWeightCarry, TB_origin_maxWeightCarry * 4] select (_rolle in ["pilot", "trag", "pionier"]);

// erhöhte LoadAusdauer - AntiTank / Muniträger  / Pionier
if (isNil "TB_origin_loadFactor") then {TB_origin_loadFactor = ace_advanced_fatigue_LoadFactor};
ace_advanced_fatigue_LoadFactor = [TB_origin_loadFactor, TB_origin_loadFactor / 2] select (_rolle in ["aaat", "trag", "pionier"]);

// erhöhter Anti-Verwackler - AntiTank / Muniträger / Pionier / Unterstützungsschütze
if (isNil "TB_origin_swayFactor") then {TB_origin_swayFactor = ace_advanced_fatigue_swayFactor};
ace_advanced_fatigue_swayFactor = [TB_origin_swayFactor, TB_origin_swayFactor / 2] select (_rolle in ["aaat", "trag", "pionier", "mg", "sniper"]);

// Pilot
if (_rolle == "pilot") then {ACE_player setVariable ["ACE_GForceCoef", 0.4, true]};
if (isNil "TB_origin_playerDamageThreshold") then {TB_origin_playerDamageThreshold = ace_medical_playerDamageThreshold};
ace_medical_playerDamageThreshold = if (_rolle == "pilot") then {TB_origin_playerDamageThreshold + 10} else {TB_origin_playerDamageThreshold};

// KompassStuff
// TODO: an/aus machbar
private _icon = switch (_rolle) do
{
    case "lead": {"\TBMod_skins\pictures\playericons\TB_Truppführer.paa"};
    case "sani": {"\TBMod_skins\pictures\playericons\TB_Kampfsanitäter.paa"};
    case "arzt": {"\TBMod_skins\pictures\playericons\TB_Arzt.paa"};
    case "grena": {"\TBMod_skins\pictures\playericons\TB_Grenadier.paa"};
    case "dmr": {"\TBMod_skins\pictures\playericons\TB_Spotter.paa"};
    case "mg": {"\TBMod_skins\pictures\playericons\TB_Unterstützungsschütze.paa"};
    case "trag": {"\TBMod_skins\pictures\playericons\TB_Munitionsträger.paa"};
    case "pilot": {"\TBMod_skins\pictures\playericons\TB_Pilot.paa"};
    case "rifle": {"\TBMod_skins\pictures\playericons\TB_Waffenspezialist.paa"};
    case "sniper": {"\TBMod_skins\pictures\playericons\TB_Scharfschütze.paa"};
    case "spotter": {"\TBMod_skins\pictures\playericons\TB_Spotter.paa"};
    case "spreng": {"\TBMod_skins\pictures\playericons\TB_Sprengstoffexperte.paa"};
    case "aaat": {"\TBMod_skins\pictures\playericons\TB_Anti-Fahrzeug.paa"};
    case "jtac": {"\TBMod_skins\pictures\playericons\TB_Drohnen-OP.paa"};
    case "pionier": {"\TBMod_skins\pictures\playericons\TB_Pionier.paa"};
    default {nil};
};

ACE_player setVariable ["diwako_dui_radar_customIcon", _icon, true];
