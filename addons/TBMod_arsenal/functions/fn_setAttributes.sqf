    #include "../script_macros.hpp"
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
        TB_medical_coef = ([0.9, 0.55] select (_rolle == "arzt")) * TB_medical_coef_global;
    }
    else
    {
        ACE_player setVariable ["ace_medical_medicClass", 0, true];
        ACE_player setUnitTrait ["medic", false];
        TB_medical_coef = 1.1 * TB_medical_coef_global;
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
/*private _icon = switch (_rolle) do
{
    case "lead": {"a3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa"};
    case "sani": {"a3\ui_f\data\GUI\Cfg\Cursors\add_gs.paa"}; // alternatives: "a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoMisc_ca.paa", "a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa","a3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa"
    case "arzt": {"a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoMisc_ca.paa"}; // alternatives: "a3\ui_f\data\GUI\Cfg\Cursors\add_gs.paa", "a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa","a3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa"
    case "grena": {"a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoThrow_ca.paa"};
    case "dmr": {"a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\binoculars_ca.paa"};
    case "mg": {"a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa"};
    case "trag": {"a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa"};
    case "pilot": {"a3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa"};
    case "rifle": {"a3\ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa"};
    case "sniper": {"a3\ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa"};
    case "spotter": {"a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\binoculars_ca.paa"};
    case "spreng": {"a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"};
    case "aaat": {"a3\ui_f\data\GUI\Cfg\Hints\Launcher_ca.paa"};
    case "jtac": {"a3\ui_f\data\GUI\Cfg\Hints\UAVBasic_ca.paa"}; // alternatives: "a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\radio_ca.paa", "a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\gps_ca.paa"
    case "pionier": {"a3\ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa"};
    default {nil};
};

ACE_player setVariable ["diwako_dui_radar_customIcon", _icon, true];*/
