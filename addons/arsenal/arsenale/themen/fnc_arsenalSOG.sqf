#include "../../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: IDarky
*/
private _allgemein = [

    // Gesichtsbedeckung
    "vn_o_bandana_g",
    "vn_b_bandana_a",
    "vn_o_bandana_b",
    "vn_b_acc_m17_01",
    "vn_b_acc_m17_02",
    "vn_b_aviator",
    "vn_o_poncho_01_01",
    "vn_o_scarf_01_04",
    "vn_o_scarf_01_03",
    "vn_o_scarf_01_02",
    "vn_b_scarf_01_01",
    "vn_o_scarf_01_01",
    "vn_b_scarf_01_03",
    "vn_b_bandana_06",
    "vn_b_bandana_01",
    "vn_b_bandana_03",
    "vn_b_bandana_04",
    "vn_b_bandana_05",
    "vn_b_bandana_02",
    "vn_b_boonie_02_06",
    "vn_b_boonie_02_01",
    "vn_b_boonie_02_03",
    "vn_b_boonie_02_04",
    "vn_b_boonie_02_05",
    "vn_b_boonie_02_02",
    "vn_b_headband_05",
    "vn_c_headband_02",
    "vn_b_headband_01",
    "vn_b_headband_03",
    "vn_c_headband_04",
    "vn_b_headband_04",
    "vn_b_headband_02",
    "G_Bandanna_beast",

    // Pistolen + Munition + Zubehör
    "vn_p38s",
    "vn_hp",
    "vn_izh54_p",
    "vn_m1895",
    "vn_m1911",
    "vn_mx991_m1911",
    "vn_m712",
    "vn_mk22",
    "vn_m10",
    "vn_tt33",

    "vn_m10_mag",
    "vn_hp_mag",
    "vn_izh54_so_mag",
    "vn_m1895_mag",
    "vn_m1911_mag",
    "vn_m712_mag",
    "vn_mk22",
    "vn_mk22_mag",
    "vn_tt33_mag",

    "vn_s_mk22",
    "vn_s_m1911",
    "vn_s_m1895",

    // One Use
    "vn_m72",

    // Items
    "ItemMap",
    "vn_b_item_trapkit",
    "vn_b_item_map",
    "vn_b_item_watch",
    "vn_b_item_compass_sog",
    "vn_b_item_compass",
    "vn_m19_binocs_grey",
    "vn_m19_binocs_grn",
    "vn_mk21_binocs",
    "ACE_CableTie",
    "ACE_wirecutter",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",
    "ACE_Sandbag_empty",
    "ACE_ConcertinaWireCoil",
    "AMP_Breaching_Charge_Mag",

    // Geschützzubehör
    "vn_o_4x_m16",

    //Granaten
    "vn_m18_white_mag",
    "vn_m18_red_mag",
    "vn_m18_purple_mag",
    "vn_m18_green_mag",
    "vn_m18_yellow_mag",
    "vn_m61_grenade_mag",
    "vn_m67_grenade_mag",
    "vn_m34_grenade_mag",
    "vn_f1_grenade_mag",
    "ACE_M84",

    // SR-Funke
    "vn_b_item_radio_urc10"
];

private _allgemein_Helm = [
    "vn_b_helmet_m1_09_01",
    "vn_i_helmet_m1_01_01",
    "vn_b_helmet_m1_04_01",
    "vn_b_helmet_m1_08_01",
    "vn_b_helmet_m1_01_01",
    "vn_b_helmet_m1_02_01",
    "vn_b_helmet_m1_03_01",
    "vn_b_helmet_m1_05_01",
    "vn_b_helmet_m1_06_01",
    "vn_b_helmet_m1_07_01"
];

private _allgemein_Uniform = [
    "vn_b_uniform_macv_01_06",
    "vn_b_uniform_macv_01_04",
    "vn_b_uniform_macv_01_05",
    "vn_b_uniform_macv_01_02",
    "vn_b_uniform_macv_03_06",
    "vn_b_uniform_macv_03_05",
    "vn_b_uniform_macv_03_02",
    "vn_b_uniform_macv_04_06",
    "vn_b_uniform_macv_04_05",
    "vn_b_uniform_macv_04_02",
    "vn_b_uniform_macv_05_06",
    "vn_b_uniform_macv_05_05",
    "vn_b_uniform_macv_05_02",
    "vn_b_uniform_macv_06_06",
    "vn_b_uniform_macv_06_05",
    "vn_b_uniform_macv_06_02"
];

private _allgemein_Westen = [
    "vn_b_vest_usarmy_03",
    "vn_b_vest_usarmy_02"
];

private _allgemein_Rucksack = [
    "vn_b_pack_lw_01",
    "vn_b_pack_trp_02_02",
    "vn_b_pack_01_02"
];

private _allgemein_Waffen = [
    "vn_m16",
    "vn_m16_camo",
    "vn_m63a",
    "vn_xm177",
    "vn_xm177_short",
    "vn_xm177_stock",
    "vn_xm177_stock_camo",
    "vn_xm177_camo",
    "vn_xm177_fg",
    "vn_m1897",
    "vn_b_m1897"
];

private _allgemein_Magazine = [
    "vn_m16_40_t_mag",
    "vn_m16_20_t_mag",
    "vn_m16_30_t_mag",
    "vn_m63a_30_t_mag",
    "vn_m1897_fl_mag",
    "vn_m1897_buck_mag"
];

private _mp_Waffen = [
    "vn_mat49_f",
    "vn_mat49_vc",
    "vn_mat49",
    "vn_s_mat49",
    "vn_mc10",
    "vn_s_mc10"
];

private _mp_Munition = [
    "vn_mat49_t_mag",
    "vn_mat49_vc_mag",
    "vn_mc10_t_mag"
];

private _grenadier_munition = [
    "vn_40mm_m381_he_mag",
    "vn_40mm_m397_ab_mag",
    "vn_40mm_m406_he_mag",
    "vn_40mm_m433_hedp_mag",
    "vn_40mm_m651_cs_mag",
    "vn_40mm_m680_smoke_w_mag",
    "vn_40mm_m682_smoke_r_mag",
    "vn_40mm_m583_flare_w_mag",
    "vn_40mm_m661_flare_g_mag",
    "vn_40mm_m662_flare_r_mag",

    // Gewehrgranate für Waffenspez
    "vn_22mm_lume_mag",
    "vn_22mm_cs_mag",
    "vn_22mm_m17_frag_mag",
    "vn_22mm_m19_wp_mag",
    "vn_22mm_m1a2_frag_mag",
    "vn_22mm_m22_smoke_mag",
    "vn_22mm_m9_heat_mag"
];

private _LR = [
    // Sommer
    "vn_b_pack_lw_06",
    "vn_b_pack_prc77_01"
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
            "vn_b_beret_01_01",
            "vn_b_beret_01_05",
            "vn_b_beret_01_06",

            // Weste
            "vn_b_vest_usarmy_09"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _mp_Waffen +
        _mp_Munition +
        _LR +
        [
            // Weste + Rucksack
            "vn_b_vest_usarmy_07",
            "vn_b_pack_lw_07",
            "vn_b_pack_m5_01"
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
        [
            // Weste + Rucksack
            "vn_b_vest_usarmy_07",
            "vn_b_pack_lw_07",
            "vn_b_pack_m5_01"
        ]
    };

    case "grena":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Rucksack +
        _allgemein_Magazine +
        _grenadier_munition +
        [
            // Waffen
            "vn_m16_xm148",
            "vn_xm177_xm148",
            "vn_xm177_xm148_camo",

            // Weste
            "vn_b_vest_usarmy_05"
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
        _grenadier_munition +
        [
            // Waffen
            "vn_m40a1_camo",
            "vn_o_9x_m40a1",
            "vn_b_camo_m40a1",

            "vn_m1carbine_gl",
            "vn_o_3x_m84",

            "vn_m14_camo",
            "vn_b_m14",
            "vn_o_9x_m14",
            "vn_s_m14",
            "vn_b_camo_m14",

            // Munition
            "vn_m40a1_t_mag",
            "vn_m14_mag",
            "vn_carbine_30_t_mag",

            // Weste
            "vn_b_vest_usarmy_04"
        ]
    };


    case "mg":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        [
            // Weste + Rucksack
            "vn_b_pack_lw_05",
            "vn_b_pack_lw_02",
            "vn_b_pack_trp_01_02",
            "vn_o_vest_03",
            "vn_b_vest_sog_05",

            // Waffe + Munition
            "vn_m60",
            "vn_m60_shorty",
            "vn_m60_shorty_camo",
            "vn_m60_100_mag"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Weste + Rucksack
            "vn_b_pack_lw_05",
            "vn_b_pack_lw_02",
            "vn_b_pack_trp_01_02",
            "vn_o_vest_03",
            "vn_b_vest_sog_05",
            "TB_backpacks_bergen_m81",
            "TB_backpacks_bergen_marpad_wd",

            // Munition
            "vn_m60_100_mag",
            "vn_m40a1_t_mag",
            "vn_m14_mag"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _mp_Waffen +
        _mp_Munition +
        [
            // Uniform
            "vn_b_uniform_heli_01_01",
            "vn_b_uniform_k2b_02_01",
            "vn_b_uniform_k2b_01_01",
            "vn_b_uniform_k2b_02_02",
            "vn_b_uniform_k2b_01_02",
            "vn_b_uniform_sog_02_03",
            "vn_b_uniform_sog_01_03",

            // Weste 
            "vn_b_vest_usarmy_14",
            "vn_b_vest_aircrew_03",
            "vn_b_vest_aircrew_05",

            // Helm
            "vn_b_helmet_aph6_01_01",
            "vn_b_helmet_aph6_02_01",
            "vn_b_helmet_svh4_01_01",
            "vn_b_helmet_svh4_02_01",
            "vn_b_helmet_svh4_01_04",
            "vn_b_helmet_svh4_02_04",
            "vn_b_helmet_svh4_01_06",
            "vn_b_helmet_svh4_02_06",
            "vn_b_helmet_svh4_01_05",
            "vn_b_helmet_svh4_02_05",
            "vn_b_helmet_t56_01_01",
            "vn_b_helmet_t56_02_01",
            "vn_b_helmet_t56_01_02",
            "vn_b_helmet_t56_02_02",
            "vn_b_helmet_t56_01_03",
            "vn_b_helmet_t56_02_03",
            "vn_b_acc_ms22001_01",
            
             // items + LR
            "ToolKit",
            "vn_b_pack_prc77_01"
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
            // ### Minen
            "vn_mine_m112_remote_mag",
            "vn_mine_m15_mag",
            "vn_mine_m16_mag",
            "vn_mine_tripwire_m49_04_mag",
            "vn_mine_tripwire_f1_04_mag",
            "vn_mine_satchel_remote_02_mag",
            "vn_mine_tm57_mag",
            "vn_mine_m18_x3_range_mag",
            "vn_mine_m18_x3_mag",
            "vn_mine_m14_mag",
            
            // Weste
            "vn_b_vest_sog_03",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",
            "TB_MineDetector"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
