/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )
  
    Complete rewrite and modification:
        shukari
*/
private ["_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool"];

params ["_faction", "_type"];
private _tempArray = [];

// MISSION POOL
if (["unitPools.sqf"] call TB_EOS_fnc_fileExists && _faction <= 10) exitWith
{
    if (isNil "TB_EOS_fnc_unitPools_custom") then {TB_EOS_fnc_unitPools_custom = compile preprocessFileLineNumbers "unitPools.sqf"};
    _this call TB_EOS_fnc_unitPools_custom;
};

switch (_faction) do
{
    case 11:
    {
        _InfPool = ["rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_RShG2","rhs_msv_emr_strelok_rpg_assist","rhs_msv_emr_engineer","rhs_msv_emr_machinegunner",
            "rhs_msv_emr_machinegunner_assistant","rhs_msv_emr_officer","rhs_msv_emr_officer_armored","rhs_msv_emr_medic"];
        _ArmPool = ["rhs_t72ba_tv","rhs_t80","rhs_bmp2e_msv","rhs_Ob_681_2"];
        _MotPool = ["rhs_btr60_msv","rhs_btr70_msv","rhs_gaz66_msv","rhs_gaz66o_msv","RHS_Ural_MSV_01","RHS_Ural_Open_MSV_01","rhs_zil131_msv","rhs_zil131_open_msv","rhs_tigr_msv","rhs_tigr_sts_msv",
            "rhs_tigr_m_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01"];
        _ACHPool = ["RHS_Mi24V_vdv","RHS_Mi8MTV3_vdv","RHS_Ka52_vvsc"];
        _CHPool = ["RHS_Mi8mt_Cargo_vdv","RHS_Mi8mt_Cargo_vv","rhs_ka60_c","RHS_Mi8mt_Cargo_vvsc"];
        _stPool = ["rhs_KORD_high_MSV"];
        _shipPool = ["O_Boat_Transport_01_F"];
        _diverPool = ["O_diver_F","O_diver_TL_F","O_diver_exp_F"];
        _crewPool = ["rhs_msv_emr_crew","rhs_msv_emr_armoredcrew","rhs_msv_emr_combatcrew","rhs_msv_emr_crew_commander","rhs_msv_emr_driver","rhs_msv_emr_driver_armored"];
        _heliCrew = ["rhs_pilot","rhs_pilot_combat_heli","rhs_pilot_tan","rhs_pilot_transport_heli"];
    };
};

////////////////////////////////////////////////////////////////////////////////////////

switch (_type) do
{
    case 0:
    {
        for "_i" from 0 to 5 do {_tempArray pushBack (selectRandom _InfPool)};
    };
    
    case 1:
    {
        _tempArray = _diverPool;
    };
    
    // CREATE ARMOUR & CREW
    case 2:
    {
        _tempArray pushBack (selectRandom _ArmPool);
        _tempArray pushBack (selectRandom _crewPool);
    };
    
    // CREATE ATTACK CHOPPER & CREW
    case 3:
    {
        _tempArray pushBack (selectRandom _ACHPool);
        _tempArray pushBack (selectRandom _heliCrew);
    };
    
    // CREATE TRANSPORT CHOPPER & CREW 
    case 4:
    {
        _tempArray pushBack (selectRandom _CHPool);
        _tempArray pushBack (selectRandom _heliCrew);
    };
    
    // CREATE STATIC & CREW
    case 5:
    {
        _tempArray pushBack (selectRandom _stPool);
        _tempArray pushBack (selectRandom _crewPool);
    };
    
    case 6:
    {
        _tempArray pushBack (selectRandom _uavPool);
    };
    
    // CREATE TRANSPORT & CREW
    case 7:
    {
        _tempArray pushBack (selectRandom _MotPool);
        _tempArray pushBack (selectRandom _crewPool);
    };
    
    // CREATE BOAT & DIVER CREW
    case 8:
    {
        _tempArray pushBack (selectRandom _shipPool);
        _tempArray pushBack (selectRandom _diverPool);
    };
    
    // CREATE CARGO
    case 9:
    {
        for "_i" from 0 to 4 do {_tempArray pushBack (selectRandom _InfPool)};
    };
    
    // CREATE DIVER CARGO
    case 10:
    {
        for "_i" from 0 to 4 do {_tempArray pushBack (selectRandom _diverPool)}; 
    };
    
    // default {};
};

_tempArray
