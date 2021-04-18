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
    "gm_ge_facewear_m65",
    "gm_headgear_foliage_summer_grass_01",
    "gm_headgear_foliage_summer_grass_02",
    "gm_headgear_foliage_summer_grass_03",
    "gm_headgear_foliage_summer_grass_04",
    "gm_headgear_foliage_summer_forest_01",
    "gm_headgear_foliage_summer_forest_02",
    "gm_headgear_foliage_summer_forest_03",
    "gm_headgear_foliage_summer_forest_04",
    "gm_ge_facewear_dustglasses",

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

    // Fallschirme
    "gm_backpack_rs9_parachute",
    "gm_backpack_t10_parachute",

    // Items
    "ACE_CableTie",
    "ACE_wirecutter",
    //"ACE_Flashlight_XL50",
    "gm_df7x40_blk",
    "gm_ferod16_oli",
    "gm_ferod16_win",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
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
    "gm_c79a1_oli",
    "gm_c79a1_blk",
    // ### AT Visire
    "gm_feroz2x17_pzf84_blk",
    "gm_feroz2x17_pzf84_win",
    "gm_feroz2x17_pzf44_2_blk",
    "gm_feroz2x17_pzf44_2_win",

    //Granaten
    "gm_smokeshell_grn_dm21",
    "gm_smokeshell_red_dm23",
    "gm_smokeshell_wht_dm25",
    "gm_smokeshell_yel_dm26",
    "gm_smokeshell_org_dm32",
    "gm_smokeshell_wht_dm25",
    "gm_handgrenade_frag_dm51",
    "gm_handgrenade_frag_dm51a1",
    "gm_handgrenade_conc_dm51",
    "gm_handgrenade_conc_dm51a1",

    // SR-Funke
    "TFAR_anprc152"
];

private _allgemein_Helm = [
    /*"gm_ge_bgs_headgear_m35_53_net_blk",
    "gm_ge_headgear_m62_net",
    "gm_ge_headgear_m62_win_pap_01",
    "gm_dk_headgear_m52_net_win",
    "gm_dk_headgear_m52_net_oli",*/

    // 90 er
    "gm_dk_headgear_m96_oli",
    "gm_dk_headgear_m96_cover_m84",
    "gm_dk_headgear_m96_cover_wht",
    "gm_dk_headgear_m96_cover_wdl",
    "gm_ge_headgear_m92_flk",
    "gm_ge_headgear_m92_trp",
    "gm_ge_headgear_m92_glasses_trp",
    "gm_ge_headgear_m92_glasses_flk",
    "gm_ge_headgear_m92_cover_win",
    "gm_ge_headgear_m92_cover_glasses_win"
];

private _allgemein_Uniform = [
    /*"gm_ge_army_uniform_soldier_80_oli",
    "gm_ge_army_uniform_soldier_80_ols",
    "gm_ge_army_uniform_soldier_parka_80_win",
    "gm_ge_army_uniform_soldier_parka_80_oli",
    "gm_ge_army_uniform_soldier_parka_80_ols",
    "gm_ge_bgs_uniform_soldier_80_smp",*/

    // 90 er
    "gm_ge_uniform_soldier_90_flk",
    "gm_ge_uniform_soldier_90_trp",
    "gm_ge_uniform_soldier_tshirt_90_trp",
    "gm_ge_uniform_soldier_rolled_90_flk",
    "gm_ge_uniform_soldier_rolled_90_trp",
    "gm_ge_uniform_soldier_tshirt_90_flk",

    // DK Army
    "gm_dk_army_uniform_soldier_84_oli",
    "gm_dk_army_uniform_soldier_84_win",
    "gm_dk_army_uniform_soldier_84_m84"
];

private _allgemein_Westen = [
    /*"gm_ge_bgs_vest_80_rifleman",
    "gm_dk_army_vest_54_rifleman",
    "gm_dk_army_vest_m00_win_rifleman",
    "gm_dk_army_vest_m00_m84_rifleman",
    "gm_dk_army_vest_m00_wdl_rifleman",*/

    "gm_ge_vest_armor_90_rifleman_flk"
];

private _allgemein_Rucksack = [
    /*"gm_ge_army_backpack_80_oli",
    "gm_dk_army_backpack_73_oli",*/
    "gm_ge_army_backpack_90_flk",
    "gm_ge_army_backpack_90_trp"
];

private _allgemein_Waffen = [
    /*"gm_g3a3_oli",
    "gm_g3a3_grn",
    "gm_g3a3_blk",*/
    "gm_c7a1_oli",
    "gm_c7a1_blk",
    "gm_g36a1_blk",
    "gm_g36a1_des",
    "gm_g36e_blk"

];

private _allgemein_Magazine = [
    /*"gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",
    "gm_20Rnd_762x51mm_AP_DM151_g3_blk",*/
    "gm_30Rnd_556x45mm_B_T_DM21_g36_blk",
    "gm_30Rnd_556x45mm_B_DM11_g36_blk",
    "gm_30Rnd_556x45mm_B_T_M856_stanag_gry",
    "gm_30Rnd_556x45mm_B_M855_stanag_gry",
    "gm_30Rnd_556x45mm_B_T_DM21_g36_des",
    "gm_30Rnd_556x45mm_B_DM11_g36_des"
];

private _crew_Munition = [
    "gm_30Rnd_9x19mm_B_DM51_mp5_blk",
    "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk",
    "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk",
    "gm_30Rnd_9x19mm_B_DM11_mp5_blk",
    "gm_25Rnd_9x18mm_B_pst_pm63_blk",
    "gm_32Rnd_9x19mm_B_DM51_mp2_blk",
    "gm_32Rnd_9x19mm_B_DM11_mp2_blk"
];
private _crew_Waffen = [
    "gm_pm63_blk",
    "gm_mp5sd3_blk",
    "gm_mp5sd2_blk",
    "gm_mp5a2_blk",
    "gm_mp5a3_blk",
    "gm_mp2a1_blk",

    // Schalldämpfer für pm63
    "gm_suppressor_safloryt_blk"
];

private _aaat_munition = [
    // PzF 84
    "gm_1Rnd_84x245mm_ILLUM_DM16_carlgustaf",
    "gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf",

    // PzF 3
    "gm_1Rnd_60mm_heat_dm32_pzf3",
    "gm_1Rnd_60mm_heat_dm12_pzf3",
    "gm_1Rnd_60mm_heat_dm22_pzf3",

    //FIM-43
    "gm_1Rnd_70mm_he_m585_fim43"
];

private _rifle_munition = [
    // Unterlauf
    "1Rnd_HE_Grenade_shell",
    "3Rnd_Smoke_Grenade_shell_precise",

    // 7,52
    "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",
    "gm_20Rnd_762x51mm_B_T_DM21A1_g3_des",
    "gm_20Rnd_762x51mm_AP_DM151_g3_blk",
    "gm_20Rnd_762x51mm_AP_DM151_g3_des"
];

private _LR = [
    // Sommer
    "OPXT_ogao_210",
    "OPXT_ogag_210",
    "OPXT_multicamt_210",
    "OPXT_oga_210",
    "gm_ge_backpack_sem35_oli",
    // Winter
    "OPXT_multicama_210"
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
        _allgemein_Rucksack +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [
            // Kopf
            "gm_ge_headgear_beret_crew_red_opcom",

            // Weste
            "gm_ge_vest_armor_90_leader_flk"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Rucksack +
        _allgemein_Westen +
        _crew_Waffen +
        _crew_Munition +
        _LR +
        [
            // Weste
            "gm_ge_vest_armor_90_medic_flk"
        ]
    };

    case "sani":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Rucksack +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Westen
            "gm_ge_vest_armor_90_medic_flk"
        ]
    };

    

    case "rifle":      
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Rucksack +
        _allgemein_Westen +
        _allgemein_Magazine +
        _rifle_munition +
        [

            // Waffen
            "gm_g3a4_ebr_oli",
            "gm_g3a4_ebr_des",
            "gm_g3a4_ebr_blk",
            "gm_hk69a1_blk",

            // Munition
            "gm_1rnd_67mm_heat_dm22a1_g3"
        ]
    };


    case "mg":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Rucksack +
        [
            // Weapons
            "gm_mg3_blk",

            // Magazine
            "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn",
            "gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn",

            // Westen
            /*"gm_ge_army_vest_80_machinegunner",
            "gm_dk_army_vest_54_machinegunner",
            "gm_dk_army_vest_m00_m84_machinegunner",
            "gm_dk_army_vest_m00_win_machinegunner",*/

            "gm_ge_vest_armor_90_machinegunner_flk",

            // Dreibein
            "gm_mg3_aatripod_weaponBag"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _aaat_munition +
        _rifle_munition +
        [
            // Magazine
            "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn",
            "gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn",

            // Westen
            "gm_ge_vest_armor_90_machinegunner_flk",

            // Rucksack
            "TB_backpacks_bergen_m81"
        ]
    };

    case "aaat":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Rucksack +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _aaat_munition +
        [
            // AT
            "gm_pzf84_oli",
            "gm_pzf84_win",
            "gm_pzf3_blk",
            "gm_fim43_oli",

            // Rucksack TOW
            "gm_fagot_launcher_weaponBag",
            "gm_milan_launcher_weaponBag"

        ]
    };

    case "pilot":
    {
        _allgemein +
        _LR +
        _crew_Waffen +
        _crew_Munition +
        [
            // Uniform
           "gm_ge_pol_uniform_pilot_rolled_grn",
           "gm_ge_pol_uniform_pilot_grn",

           // Weste 
           "gm_ge_army_vest_pilot_pads_oli",
           "gm_ge_army_vest_pilot_oli",

           // Helm
           "gm_ge_headgear_sph4_oli",
           "gm_ge_headgear_beret_crew_bdx_paratrooper",
           "gm_ge_headgear_headset_crew_oli",
           "gm_ge_headgear_beret_bdx_armyaviation",

           // items
           "ToolKit"

        ]
    };

    case "pionier":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Rucksack +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [
            // Items
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ToolKit",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",
            "TB_MineDetector",

            // Westen
            "gm_ge_vest_armor_90_demolition_flk",

            // Minen
            "gm_mine_at_dm21",
            "gm_mine_at_tm46",
            "gm_explosive_petn_charge",
            "gm_explosive_plnp_charge",
            "gm_mine_ap_dm31"
        ]
    };

    case "jtac":            // Panzer Besatzung
    {
        _allgemein +
        _crew_Waffen +
        _crew_Munition +
        _LR +
        [
            // Helme
            "gm_ge_headgear_beret_blk_armor",
            "gm_ge_headgear_crewhat_80_blk",
            "gm_ge_headgear_beret_crew_blk_armor",

            // Uniformen
            "gm_ge_army_uniform_crew_80_oli",
            "gm_ge_army_uniform_crew_90_trp",
            "gm_ge_army_uniform_crew_90_flk",

            // Westen
            "gm_ge_army_vest_pilot_oli",
            "gm_ge_army_vest_pilot_pads_oli",

            "gm_ge_vest_armor_90_crew_flk",

            // Items
            "TB_MineDetector",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ToolKit",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",

            // Minen
            "gm_mine_at_dm21",
            "gm_mine_at_tm46",
            "gm_explosive_petn_charge",
            "gm_explosive_plnp_charge",
            "gm_mine_ap_dm31"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
