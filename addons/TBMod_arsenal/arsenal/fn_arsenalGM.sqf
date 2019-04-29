/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: IDarky
*/
// Mengen definierung
private _allgemein = [

    // Gesichtsbedeckung
    "G_Bandanna_beast",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_blk",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Shades_Black",
    "gm_gc_army_facewear_schm41m",
    "gm_gc_facewear_m65",

    // Pistolen + Munition

    "gm_lp1_blk",
    "gm_p1_blk",
    "gm_p2a1_blk",
    "gm_pm_blk",

    "gm_8Rnd_9x18mm_B_pst_pm_blk",
    "gm_8Rnd_9x19mm_B_DM11_p1_blk",
    "gm_8Rnd_9x19mm_B_DM51_p1_blk",

    "gm_1Rnd_265mm_smoke_single_blk_gc",
    "gm_1Rnd_265mm_smoke_single_wht_gc",
    "gm_1Rnd_265mm_smoke_single_org_DM22",
    "gm_1Rnd_265mm_flare_multi_red_gc",
    "gm_1Rnd_265mm_flare_multi_grn_DM21",
    "gm_1Rnd_265mm_flare_multi_nbc_DM47",
    

    // Rucksäcke

    "gm_ge_army_backpack_80_oli",
    "gm_dk_army_backpack_73_oli",

    // Items

    "ACE_CableTie",
    "ACE_IR_Strobe_Item",
    "ACE_Altimeter",
    "ACE_wirecutter",
    //"ACE_Flashlight_XL50",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
    "ItemGPS",
    "gm_watch_kosei_80",    // Uhr
    "gm_ge_army_conat2",    // Kompass
    "gm_gc_compass_f73",    // Kompass
    "ItemMap",
    //"ACE_SpraypaintBlue",
    //"ACE_SpraypaintGreen",
    "ACE_Flashlight_KSF1",
    //"ACE_Flashlight_MX991",
    //"ACE_SpraypaintRed",
    "ACE_EntrenchingTool",
    "ACE_Sandbag_empty",
    "ACE_ConcertinaWireCoil",
    "AMP_Breaching_Charge_Mag",

    // Visiere
    "gm_feroz24_blk",
    "gm_feroz24_des",
    //"gm_pgo7v_blk",
 
    //Granaten
    "gm_smokeshell_wht_dm25",
    "gm_smokeshell_blk_gc",
    "gm_handgrenade_frag_dm51a1",
    "gm_handgrenade_frag_rgd5",
    "gm_handgrenade_conc_dm51",

    // SR-Funke
    "TFAR_anprc152"
    
];

private _allgemein_Uniform = [

    "gm_ge_army_uniform_crew_80_oli",
    "gm_ge_army_uniform_soldier_80_oli",
    "gm_ge_army_uniform_soldier_80_ols",
    "gm_ge_army_uniform_soldier_parka_80_win",
    "gm_ge_army_uniform_soldier_parka_80_oli",
    "gm_ge_army_uniform_soldier_parka_80_ols",
    "gm_ge_bgs_uniform_soldier_80_smp",

    "gm_gc_army_uniform_soldier_80_win",
    "gm_gc_army_uniform_soldier_80_str",
    "gm_gc_army_uniform_soldier_80_blk",

    "gm_dk_army_uniform_soldier_84_oli",
    "gm_dk_army_uniform_soldier_84_win",
    "gm_dk_army_uniform_soldier_84_m84"
];

private _allgemein_Westen = [

    "gm_ge_bgs_vest_80_rifleman",
    "gm_ge_army_vest_80_mp_wht",
    "gm_gc_bgs_vest_80_border_str",
    "gm_dk_army_vest_54_rifleman"

];

private _LR = [
    //schwarz
    "OPXT_blk_1523",
    //tropen
    "OPXT_at_ix_1523",
    "OPXT_at_fg_1523",
    "OPXT_multicamt_1523",
    //MTP+Multicam
    "OPXT_scorpion_1523",
    "OPXT_multicam_1523",
    "OPXT_wht_1523"

];

private _allgemein_Helm = [
    "gm_ge_bgs_headgear_m35_53_net_blk",
    "gm_ge_headgear_m62_net",
    "gm_ge_headgear_m62_win_pap_01",
    "gm_dk_headgear_m52_net_win",
    "gm_dk_headgear_m52_net_oli",
    
];

private _allgemein_Waffen = [
    "gm_g3a3_oli",
    "gm_g3a3_grn",
    "gm_mpiak74n_brn"

];

private _allgemein_Magazine = [
    "gm_30Rnd_545x39mm_B_7N6_ak74_prp"
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
            // Kopf
            "gm_ge_headgear_beret_crew_red_opcom"
            
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
        [
            "gm_ge_pol_vest_80_wht",
            "gm_ge_backpack_satchel_80_san"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _LR +
        [
            // Rucksack
            "gm_ge_backpack_satchel_80_san",
            
            // Waffe
            "gm_mp2a1_blk",
            "gm_32Rnd_9x19mm_B_DM51_mp2_blk",
            "gm_32Rnd_9x19mm_B_DM11_mp2_blk"
        ]
    };

    case "grena":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Munition 
            "gm_1rnd_67mm_heat_dm22a1_g3"
        ]
    };


    case "mg":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        [
            // Weapons
            "arifle_MX_SW_F",
            "arifle_MX_SW_Black_F",
            "arifle_MX_SW_khk_F",
            "arifle_SPAR_02_blk_F",
            "arifle_SPAR_02_snd_F",
            "arifle_SPAR_02_khk_F",
            "LMG_03_F",

            // Magazine
            "150Rnd_556x45_Drum_Mag_Tracer_F",
            "200Rnd_556x45_Box_Tracer_F",
            "200Rnd_556x45_Box_Tracer_Red_F",
            "100Rnd_65x39_caseless_mag_Tracer"
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
            // Backpack
            "B_Carryall_cbr",
            "B_Carryall_ocamo",
            "B_Carryall_khk",
            "B_Carryall_mcamo",
            "B_Carryall_oli",
            "B_Carryall_oucamo",

            // Magazine
            "150Rnd_556x45_Drum_Mag_Tracer_F",
            "200Rnd_556x45_Box_Tracer_F",
            "200Rnd_556x45_Box_Tracer_Red_F",
            "20Rnd_762x51_Mag",

            //AT
            "Vorona_HEAT",
            "Vorona_HE",
            "MRAWS_HEAT_F",
            "MRAWS_HE_F"
        ]
    };


    case "rifle":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [

        ]
    };


    case "spreng":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Westen
           "gm_ge_army_vest_80_demolition"

            // Items
            "MineDetector",
            "ACE_wirecutter",
            "ACE_Clacker",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "gm_repairkit_01",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",

            // Minen
            
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
          
            // Magazine
            
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
            // Items
            "MineDetector",
            //"MCC_multiTool",
            "ACE_wirecutter",
            "ACE_DefusalKit",
            "ToolKit",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
