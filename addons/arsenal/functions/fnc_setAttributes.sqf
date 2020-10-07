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
    }
    else
    {
        ACE_player setVariable ["ace_medical_medicClass", 0, true];
        ACE_player setUnitTrait ["medic", false];
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
if (!isNil "TBMod_skins") then
{
    private _icon = [_rolle, false] call FUNC(getRollenName);
    ACE_player setVariable ["diwako_dui_radar_customIcon", format [QPATHTOEF(skins,pictures\playericons\%1.paa), _icon], true];
};
