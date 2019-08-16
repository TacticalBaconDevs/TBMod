/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: IDarky
*/
private _allgemein = [
    // Gesichtsbedeckung
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_blk",
    "G_Bandanna_aviator",
    "G_Bandanna_beast",
    "G_Blindfold_01_black_F",
    "G_Blindfold_01_white_F",

    //Atemschutz
    "G_AirPurifyingRespirator_02_olive_F",
    "G_AirPurifyingRespirator_02_sand_F",
    "G_AirPurifyingRespirator_02_black_F",
    "G_AirPurifyingRespirator_01_F",
    "G_RegulatorMask_F",
    

    // Pistole
    "hgun_Pistol_heavy_01_green_F",
    "optic_mrd_black",
    "muzzle_snds_acp",
    "11Rnd_45ACP_Mag",
    
    // Rucksäcke
    "B_CombinationUnitRespirator_01_F",
    "B_SCBA_01_F",
    "B_Kitbag_sgg",


    // Items
    "ACE_CableTie",
    "ACE_wirecutter",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
    "ACE_Altimeter",
    "ItemWatch",
    "ItemCompass",
    "ItemGPS",
    "ItemMap",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",
    "ACE_Sandbag_empty",
    "ACE_ConcertinaWireCoil",
    "AMP_Breaching_Charge_Mag",

    //NV 
    "O_NVGoggles_grn_F",
    "NVGoggles_tna_F",
    "ACE_NVG_Gen2",
    "NVGoggles_INDEP"


    //Visire 
    "optic_erco_snd_f",
    "optic_erco_khk_f",
    "optic_erco_blk_f",
    "optic_arco_arid_f",
    "optic_arco_lush_f",
    "optic_holosight_arid_f",
    "optic_holosight_lush_f",
    "optic_ico_01_f",
    "optic_ico_01_sand_f",
    "optic_ico_01_black_f",
    "optic_ico_01_camo_f",
    
    //Attachments
    "muzzle_snds_65_ti_ghex_f",
    "muzzle_snds_65_ti_blk_f",
    "acc_pointer_ir",
    "ace_acc_pointer_green",
    "acc_flashlight",

    //Granaten
    "MiniGrenade",

    // SR-Funke
    "TFAR_anprc152"
];

private _allgemein_Uniform = [
    "U_I_E_Uniform_01_F",
    "U_I_E_Uniform_01_sweater_F",
    "U_I_E_Uniform_01_officer_F",
    "U_I_E_Uniform_01_tanktop_F",
    "U_I_E_Uniform_01_shortsleeve_F",
    "U_I_E_CBRN_Suit_01_EAF_F"    
];

private _allgemein_Westen = [
    "V_CarrierRigKBT_01_light_Olive_F",
    "V_CarrierRigKBT_01_light_EAF_F"
];

private _LR = [
    "OPXT_scorpion_1523",
    "OPXT_pen_grz_1523",
    "OPXT_ogao_1523",
    "OPXT_oga_1523",
    "OPXT_multicamt_1523",
    "OPXT_multicam_1523",
    "OPXT_m81_1523",
    "OPXT_at_ix_1523"
];

private _allgemein_Helm = [
    "H_HelmetHBK_headset_F",
    "H_HelmetHBK_chops_F",
    "H_HelmetHBK_ear_F",
    "H_HelmetHBK_F",
    "H_MilCap_eaf"
];

private _allgemein_Waffen = [
    "arifle_MSBS65_F",
    "arifle_MSBS65_sand_F",
    "arifle_MSBS65_black_F",
    "arifle_MSBS65_camo_F"
];

private _allgemein_Magazine = [
    "30Rnd_65x39_caseless_msbs_mag_Tracer",
    "30Rnd_65x39_caseless_msbs_mag"
];

private _items = [];

// #################################################################
// LAYOUTS
// Ab hier sind Items nur noch für die bestimmten Rollen
// #################################################################

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [

        ]
    };

    case "sani":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        []
    };

    case "grena":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        [
            // Waffen 
            "arifle_MSBS65_GL_sand_F",
            "arifle_MSBS65_GL_black_F",
            "arifle_MSBS65_GL_camo_F",

            // Munition 
            "1Rnd_HE_Grenade_shell",
            "ACE_HuntIR_M203",
            "3Rnd_Smoke_Grenade_shell_precise"
        ]
    };


    case "mg":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Westen +
        _allgemein_Uniform +
        [
            // Waffen
            "LMG_Mk200_black_F",

            // Magazine
            "200Rnd_65x39_cased_Box_Tracer_Red",
            "200Rnd_65x39_cased_Box_Tracer",
            "200Rnd_65x39_cased_Box_Red",

            // Attachments 
            "bipod_01_f_khk",
            "bipod_03_f_blk"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Rucksack
            "B_Carryall_eaf_F",
            "B_Carryall_green_F",

            // Magazine
            "200Rnd_65x39_cased_Box_Tracer_Red",
            "200Rnd_65x39_cased_Box_Tracer",
            "200Rnd_65x39_cased_Box_Red",

            // AT
            "RPG32_F",
            "RPG32_HE_F"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [
        // Helm
        "H_PilotHelmetFighter_I_E",
        "H_CrewHelmetHeli_I_E",
        "H_PilotHelmetHeli_I_E",

        // Uniform
        "U_I_E_Uniform_01_coveralls_F"
        ]
    };

    case "JTAC":
    {
        _allgemein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [
        // Drohne 
        "I_E_UAV_01_backpack_F",
        "I_E_UGV_02_Demining_backpack_F",
        "I_E_UGV_02_Science_backpack_F",
        "I_E_UavTerminal"

        ]
    };

    case "rifle":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        [
        // Waffen
        "arifle_MSBS65_UBS_F",
        "arifle_MSBS65_UBS_sand_F",
        "arifle_MSBS65_UBS_black_F",
        "arifle_MSBS65_UBS_camo_F",
        "arifle_MSBS65_Mark_F",
        "arifle_MSBS65_Mark_sand_F",
        "arifle_MSBS65_Mark_black_F",
        "arifle_MSBS65_Mark_camo_F",

        // Magazine 
        "6Rnd_12Gauge_Pellets",
        "6Rnd_12Gauge_Slug",

        // Attachments
        "bipod_02_f_lush",
        "optic_dms_weathered_f"
        ]
    };

    case "aaat":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // AT
            "launch_RPG32_green_F",

            // Magazine
            "RPG32_F",
            "RPG32_HE_F"
        ]
    };
    case "pionier":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [   
            // Rucksack
            "B_Carryall_eaf_F",
            "B_Carryall_green_F",

            // Westen
            "V_CarrierRigKBT_01_heavy_EAF_F",
            "V_CarrierRigKBT_01_heavy_Olive_F",
            
            // Items
            "MineDetector",
            "ACE_wirecutter",
            "ACE_Clacker",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3"            
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
