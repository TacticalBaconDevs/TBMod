﻿/*
    Author: Willi "shukari" Graff
    Zuständiger fürs USA Arsenal: shukari
*/

private _allgemein = [
    // Gepäck
    "rhsusf_assault_eagleaiii_coy",
    "rhsusf_assault_eagleaiii_ocp",
    "rhsusf_assault_eagleaiii_ucp",
    "rhsusf_falconii_coy",
    "rhsusf_falconii_mc",
    "B_Parachute",
    // ### LR-Funke
    "TFAR_rt1523g",
    "TFAR_rt1523g_big",
    "TFAR_rt1523g_big_bwmod",
    "TFAR_rt1523g_big_bwmod_tropen",
    "TFAR_rt1523g_big_rhs",
    "TFAR_rt1523g_black",
    "TFAR_rt1523g_bwmod",
    "TFAR_rt1523g_fabric",
    "TFAR_rt1523g_green",
    "TFAR_rt1523g_rhs",
    "TFAR_rt1523g_sage",

    // Gesichtsbedeckung
    "rhs_googles_orange",
    "rhs_googles_clear",
    "rhs_googles_yellow",
    "rhs_ess_black",
    "rhs_googles_black",
    "rhsusf_shemagh_grn",
    "rhsusf_shemagh2_grn",
    "rhsusf_shemagh_od",
    "rhsusf_shemagh2_od",
    "rhsusf_shemagh_tan",
    "rhsusf_shemagh2_tan",
    "rhsusf_shemagh_white",
    "rhsusf_shemagh2_white",
    "rhsusf_shemagh_gogg_grn",
    "rhsusf_shemagh2_gogg_grn",
    "rhsusf_shemagh_gogg_od",
    "rhsusf_shemagh2_gogg_od",
    "rhsusf_shemagh_gogg_tan",
    "rhsusf_shemagh2_gogg_tan",
    "rhsusf_shemagh_gogg_white",
    "rhsusf_shemagh2_gogg_white",
    "rhsusf_oakley_goggles_blk",
    "rhsusf_oakley_goggles_clr",
    "rhsusf_oakley_goggles_ylw",
    // ### Vanilla
    "G_Aviator",

    // Nachtsichtgeräte
    "rhsusf_ANPVS_14",
    "rhsusf_ANPVS_15",
    "rhsusf_Rhino",

    // Ferngläser
    "Binocular",
    "Leupold_Mk4",

    // Karte
    "ItemMap",

    // Terminal
    "ItemGPS",

    // Kommunikation
    "TFAR_anprc152",

    // Navigation
    "ItemCompass",

    // Uhr
    "ItemWatch",
    "ACE_Altimeter",

    // Items
    // ### Sprays
    "ACE_SpraypaintBlue",
    "ACE_SpraypaintGreen",
    "ACE_SpraypaintRed",
    "ACE_SpraypaintBlack",
    // ### Lampe
    "ACE_Chemlight_Shield",
    "ACE_Flashlight_XL50",
    "ACE_Flashlight_KSF1",
    "ACE_Flashlight_MX991",
    // ### Items
    "ACE_RangeTable_82mm",
    "ACE_MapTools",
    "ACE_CableTie",
    "ACE_IR_Strobe_Item",
    "ACE_HuntIR_monitor",
    "ACE_EntrenchingTool",
    "ACE_SpareBarrel",
    "ACE_microDAGR",
    // ### Chemlights
    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_IR",
    "ACE_Chemlight_Orange",
    "ACE_Chemlight_HiOrange",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_White",
    "ACE_Chemlight_HiWhite",
    "Chemlight_blue",
    "Chemlight_yellow",
    "Chemlight_green",
    "Chemlight_red",
    // ### BuildingItems
    "TB_building_item_RoadBarrier_F",
    "TB_building_item_RoadCone_F",
    "TB_building_item_Land_PortableLight_single_F",
    "TB_building_item_Land_Pallet_vertical_F",
    "TB_building_item_Land_BagFence_Long_F",
    "TB_building_item_Land_BagFence_Round_F",
    "TB_building_item_ace_concertinawirecoil",
    "TB_building_item_Land_SandbagBarricade_01_hole_F",
    // ### Granaten
    "SmokeShell",
    "SmokeShellYellow",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellPurple",
    "SmokeShellBlue",
    "SmokeShellOrange",
    "rhs_mag_mk84",
    "ACE_M84",
    "rhs_mag_mk3a2",
    "rhs_mag_m67",
    // ### Mörsermunition
    "ACE_1Rnd_82mm_Mo_HE",
    "ACE_1Rnd_82mm_Mo_Smoke",
    "ACE_1Rnd_82mm_Mo_Illum",
    "AMP_Breaching_Charge_Mag"
];

private _allgemein_magazine = [
    "rhs_mag_30Rnd_556x45_M855_Stanag",
    "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
    "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Green",
    "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Yellow",
    "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Orange",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange",
    "rhs_mag_30Rnd_556x45_Mk318_Stanag",
    "rhs_mag_30Rnd_556x45_Mk262_Stanag",
    "rhsusf_5Rnd_00Buck",
    "rhsusf_5Rnd_Slug",
    "rhsusf_8Rnd_00Buck",
    "rhsusf_8Rnd_Slug",
    "hlc_30Rnd_9x19_B_MP5",
    "hlc_30Rnd_9x19_GD_MP5",
    "hlc_30Rnd_9x19_SD_MP5"
];

private _allgemein_gewehre = [
    "rhs_weap_hk416d10",
    "rhs_weap_hk416d10_LMT",
    "rhs_weap_hk416d10_LMT_d",
    "rhs_weap_hk416d10_LMT_wd",
    "rhs_weap_hk416d145",
    "rhs_weap_hk416d145_d",
    "rhs_weap_hk416d145_d_2",
    "rhs_weap_hk416d145_wd",
    "rhs_weap_hk416d145_wd_2",
    "rhs_weap_m16a4",
    "rhs_weap_m16a4_carryhandle",
    "rhs_weap_m16a4_carryhandle_pmag",
    "rhs_weap_m16a4_pmag",
    "rhs_weap_m16a4_pmag",
    "rhs_weap_m4",
    "rhs_weap_m4_carryhandle_mstock",
    "rhs_weap_m4_carryhandle",
    "rhs_weap_m4_carryhandle_pmag",
    "rhs_weap_m4_pmag",
    "rhs_weap_m4_mstock",
    "rhs_weap_m4a1_carryhandle",
    "rhs_weap_m4a1_carryhandle_pmag",
    "rhs_weap_m4a1_carryhandle_mstock",
    "rhs_weap_m4a1_blockII",
    "rhs_weap_m4a1_blockII_KAC_d",
    "rhs_weap_m4a1_blockII_bk",
    "rhs_weap_m4a1_blockII_KAC_bk",
    "rhs_weap_m4a1_blockII_KAC",
    "rhs_weap_m4a1_blockII_KAC_wd",
    "rhs_weap_m4a1_blockII_d",
    "rhs_weap_m4a1_blockII_wd",
    "rhs_weap_m4a1",
    "rhs_weap_m4a1_d",
    "rhs_weap_m4a1_d_mstock",
    "rhs_weap_m4a1_pmag",
    "rhs_weap_m4a1_mstock",
    "rhs_weap_m4a1_wd",
    "rhs_weap_m4a1_wd_mstock",
    "rhs_weap_M590_8RD",
    "rhs_weap_M590_5RD",
    "rhs_weap_mk18",
    "rhs_weap_mk18_d",
    "rhs_weap_mk18_KAC_d",
    "rhs_weap_mk18_bk",
    "rhs_weap_mk18_KAC_bk",
    "rhs_weap_mk18_KAC",
    "rhs_weap_mk18_wd",
    "rhs_weap_mk18_KAC_wd",
    "hlc_smg_mp5a2",
    "hlc_smg_mp5sd5"
];
_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "rhsusf_acc_T1_high",
    "rhsusf_acc_T1_low",
    "rhsusf_acc_T1_low_fwd",
    "rhsusf_acc_ACOG2_USMC",
    "rhsusf_acc_ACOG3_USMC",
    "rhsusf_acc_ACOG_USMC",
    "rhsusf_acc_EOTECH",
    "rhsusf_acc_g33_t1",
    "rhsusf_acc_g33_xps3",
    "rhsusf_acc_g33_xps3_tan",
    "rhsusf_acc_ACOG",
    "rhsusf_acc_ACOG2",
    "rhsusf_acc_ACOG3",
    "rhsusf_acc_M2A1",
    "rhsusf_acc_eotech_552",
    "rhsusf_acc_eotech_552_d",
    "rhsusf_acc_eotech_552_wd",
    "rhsusf_acc_compm4",
    "rhsusf_acc_ACOG_RMR",
    "rhsusf_acc_ACOG_d",
    "rhsusf_acc_ACOG_wd",
    "rhsusf_acc_eotech_xps3"
];

private _allgemein_befestigungsschiene = [
    "rhsusf_acc_anpeq15side",
    "rhsusf_acc_anpeq15_top",
    "rhsusf_acc_anpeq15_wmx",
    "rhsusf_acc_anpeq15_wmx_light",
    "rhsusf_acc_anpeq15side_bk",
    "rhsusf_acc_anpeq15_bk_top",
    "rhsusf_acc_anpeq15",
    "rhsusf_acc_anpeq15_light",
    "rhsusf_acc_anpeq15_bk",
    "rhsusf_acc_anpeq15_bk_light",
    "rhsusf_acc_anpeq15A",
    "rhsusf_acc_M952V",
    "rhsusf_acc_wmx",
    "rhsusf_acc_wmx_bk",
    "hlc_acc_Surefiregrip"
];

private _allgemein_geschuetzzubehoer = [
    "rhsusf_acc_nt4_black",
    "rhsusf_acc_nt4_tan",
    "rhsusf_acc_rotex5_grey",
    "rhsusf_acc_rotex5_tan",
    "rhsusf_acc_SF3P556",
    "rhsusf_acc_SFMB556"
];

private _allgemein_zweibein = [
    "rhsusf_acc_grip2",
    "rhsusf_acc_grip2_tan",
    "rhsusf_acc_grip2_wd",
    "rhsusf_acc_grip1",
    "rhsusf_acc_harris_bipod",
    "rhsusf_acc_grip3",
    "rhsusf_acc_grip3_tan"
];

private _allgemein_raketenwerfer = [
    "rhs_weap_M136",
    "rhs_weap_M136_hedp",
    "rhs_weap_M136_hp",
    "rhs_weap_m72a7",
    // ### Befestigungsschiene
    "rhs_acc_at4_handler",
    // ### Munition
    "rhs_m136_mag",
    "rhs_m136_hedp_mag",
    "rhs_m136_hp_mag",
    "rhs_m72a7_mag"
];

private _allgemein_handfeuerwaffen = [
    "rhsusf_weap_m1911a1",
    "rhsusf_weap_m9",
    "rhsusf_weap_glock17g4",
    "hlc_pistol_P226R_357Combat",
    // ### Befestigungsschiene
    "acc_flashlight_pistol",
    "hlc_muzzle_Octane9",
    // ### Geschützzubehör
    "rhsusf_acc_omega9k",
    "hlc_acc_DBALPL",
    "HLC_Optic_Romeo1_RX",
    "HLC_optic_Siglite",
    // ### Munition
    "rhsusf_mag_7x45acp_MHP",
    "rhsusf_mag_15Rnd_9x19_FMJ",
    "rhsusf_mag_15Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "hlc_12Rnd_357SIG_B_P226",
    "hlc_12Rnd_357SIG_JHP_P226"
];

private _allgemein_uniformen = [
    "rhs_uniform_acu_ucp",
    "rhs_uniform_cu_ocp",
    "rhs_uniform_cu_ucp",
    "rhs_uniform_FROG01_d",
    "rhs_uniform_FROG01_wd",
    "rhs_uniform_g3_mc"
];

private _allgemein_westen = [
    "rhsusf_iotv_ocp",
    "rhsusf_iotv_ucp",
    "rhsusf_mbav",
    "rhsusf_spc",
    "rhsusf_spcs_ocp",
    "rhsusf_spcs_ucp"
];

private _allgemein_kopfbedeckung = [
    "rhsusf_ach_bare",
    "rhsusf_ach_bare_des",
    "rhsusf_ach_bare_des_ess",
    "rhsusf_ach_bare_des_headset",
    "rhsusf_ach_bare_des_headset_ess",
    "rhsusf_ach_bare_ess",
    "rhsusf_ach_bare_headset",
    "rhsusf_ach_bare_headset_ess",
    "rhsusf_ach_bare_semi",
    "rhsusf_ach_bare_semi_ess",
    "rhsusf_ach_bare_semi_headset",
    "rhsusf_ach_bare_semi_headset_ess",
    "rhsusf_ach_bare_tan",
    "rhsusf_ach_bare_tan_ess",
    "rhsusf_ach_bare_tan_headset",
    "rhsusf_ach_bare_tan_headset_ess",
    "rhsusf_ach_bare_wood",
    "rhsusf_ach_bare_wood_ess",
    "rhsusf_ach_bare_wood_headset",
    "rhsusf_ach_bare_wood_headset_ess",
    "rhsusf_ach_helmet_ocp",
    "rhsusf_ach_helmet_ESS_ocp",
    "rhsusf_ach_helmet_headset_ocp",
    "rhsusf_ach_helmet_headset_ess_ocp",
    "rhsusf_ach_helmet_camo_ocp",
    "rhsusf_ach_helmet_ocp_norotos",
    "rhsusf_ach_helmet_ucp",
    "rhsusf_ach_helmet_ESS_ucp",
    "rhsusf_ach_helmet_headset_ucp",
    "rhsusf_ach_helmet_headset_ess_ucp",
    "rhsusf_ach_helmet_ucp_norotos",
    "rhs_booniehat2_marpatd",
    "rhs_booniehat2_marpatwd",
    "rhs_Booniehat_ocp",
    "rhs_Booniehat_ucp",
    "rhsusf_Bowman",
    "rhsusf_bowman_cap",
    "rhsusf_opscore_aor1",
    "rhsusf_opscore_aor1_pelt",
    "rhsusf_opscore_aor1_pelt_nsw",
    "rhsusf_opscore_aor2",
    "rhsusf_opscore_aor2_pelt",
    "rhsusf_opscore_aor2_pelt_nsw",
    "rhsusf_opscore_bk",
    "rhsusf_opscore_bk_pelt",
    "rhsusf_opscore_coy_cover",
    "rhsusf_opscore_coy_cover_pelt",
    "rhsusf_opscore_fg",
    "rhsusf_opscore_fg_pelt",
    "rhsusf_opscore_fg_pelt_cam",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_mc_cover",
    "rhsusf_opscore_mc_cover_pelt",
    "rhsusf_opscore_mc_cover_pelt_nsw",
    "rhsusf_opscore_mc_cover_pelt_cam",
    "rhsusf_opscore_mc",
    "rhsusf_opscore_mc_pelt",
    "rhsusf_opscore_mc_pelt_nsw",
    "rhsusf_opscore_paint",
    "rhsusf_opscore_paint_pelt",
    "rhsusf_opscore_paint_pelt_nsw",
    "rhsusf_opscore_paint_pelt_cam",
    "rhsusf_opscore_rg_cover",
    "rhsusf_opscore_rg_cover_pelt",
    "rhsusf_opscore_ut",
    "rhsusf_opscore_ut_pelt",
    "rhsusf_opscore_ut_pelt_cam",
    "rhsusf_opscore_ut_pelt_nsw",
    "rhsusf_opscore_ut_pelt_nsw_cam",
    "rhsusf_opscore_mar_fg",
    "rhsusf_opscore_mar_fg_pelt",
    "rhsusf_opscore_mar_ut",
    "rhsusf_opscore_mar_ut_pelt",
    "rhsusf_lwh_helmet_marpatd",
    "rhsusf_lwh_helmet_marpatd_ess",
    "rhsusf_lwh_helmet_marpatd_headset",
    "rhsusf_lwh_helmet_marpatwd",
    "rhsusf_lwh_helmet_marpatwd_blk_ess",
    "rhsusf_lwh_helmet_marpatwd_headset_blk",
    "rhsusf_lwh_helmet_marpatwd_headset",
    "rhsusf_lwh_helmet_marpatwd_ess",
    "rhsusf_mich_helmet_marpatd",
    "rhsusf_mich_helmet_marpatd_alt",
    "rhsusf_mich_helmet_marpatd_alt_headset",
    "rhsusf_mich_helmet_marpatd_headset",
    "rhsusf_mich_helmet_marpatd_norotos",
    "rhsusf_mich_helmet_marpatd_norotos_arc",
    "rhsusf_mich_helmet_marpatd_norotos_arc_headset",
    "rhsusf_mich_helmet_marpatd_norotos_headset",
    "rhsusf_mich_helmet_marpatwd",
    "rhsusf_mich_helmet_marpatwd_alt",
    "rhsusf_mich_helmet_marpatwd_alt_headset",
    "rhsusf_mich_helmet_marpatwd_headset",
    "rhsusf_mich_helmet_marpatwd_norotos",
    "rhsusf_mich_helmet_marpatwd_norotos_arc",
    "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
    "rhsusf_mich_helmet_marpatwd_norotos_headset",
    "rhsusf_patrolcap_ocp",
    "rhsusf_patrolcap_ucp",
    "rhs_8point_marpatd",
    "rhs_8point_marpatwd"
];

private _grenadier_gewehr = [
    "rhs_weap_hk416d10_m320",
    "rhs_weap_hk416d145_m320",
    "rhs_weap_m16a4_carryhandle_M203",
    "rhs_weap_m4_m203",
    "rhs_weap_m4_m203S",
    "rhs_weap_m4_m320",
    "rhs_weap_m4a1_carryhandle_m203",
    "rhs_weap_m4a1_carryhandle_m203S",
    "rhs_weap_m4a1_blockII_M203_d",
    "rhs_weap_m4a1_blockII_M203",
    "rhs_weap_m4a1_blockII_M203_wd",
    "rhs_weap_m4a1_M203s_d",
    "rhs_weap_m4a1_M203",
    "rhs_weap_m4a1_M203s",
    "rhs_weap_m4a1_M320",
    "rhs_weap_m4a1_M203s_wd",
    "rhs_weap_mk18_m320",
    "hlc_smg_9mmar",
    // ### Handfeuerwaffe
    "rhs_weap_M320"
];

private _grenadier_munition = [
    "rhs_mag_M433_HEDP",
    "rhs_mag_M397_HET",
    "rhs_mag_m4009",
    "rhs_mag_m576",
    "rhs_mag_M585_white",
    "rhs_mag_m661_green",
    "rhs_mag_m662_red",
    "rhs_mag_m713_Red",
    "rhs_mag_m714_White",
    "rhs_mag_m715_Green",
    "rhs_mag_m716_yellow",
    "ACE_HuntIR_M203",
    "rhs_mag_M441_HE",
    "1Rnd_HE_Grenade_shell"
];

private _dmr_munition = [
    "rhsusf_20Rnd_762x51_m118_special_Mag",
    "rhsusf_20Rnd_762x51_m993_Mag",
    "rhsusf_20Rnd_762x51_m62_Mag",
    "rhsusf_5Rnd_762x51_m118_special_Mag",
    "rhsusf_5Rnd_762x51_m993_Mag",
    "rhsusf_5Rnd_762x51_m62_Mag",
    "rhsusf_10Rnd_762x51_m118_special_Mag",
    "rhsusf_10Rnd_762x51_m993_Mag",
    "rhsusf_10Rnd_762x51_m62_Mag"
];

private _mg_munition = [
    "rhsusf_50Rnd_762x51",
    "rhsusf_50Rnd_762x51_m61_ap",
    "rhsusf_50Rnd_762x51_m62_tracer",
    "rhsusf_50Rnd_762x51_m80a1epr",
    "rhsusf_50Rnd_762x51_m993",
    "rhsusf_100Rnd_762x51",
    "rhsusf_100Rnd_762x51_m61_ap",
    "rhsusf_100Rnd_762x51_m62_tracer",
    "rhsusf_100Rnd_762x51_m80a1epr",
    "rhs_200rnd_556x45_M_SAW",
    "rhs_200rnd_556x45_B_SAW",
    "rhs_200rnd_556x45_T_SAW",
    "rhsusf_100Rnd_556x45_M855_soft_pouch",
    "rhsusf_200Rnd_556x45_M855_soft_pouch",
    "rhsusf_100Rnd_556x45_soft_pouch",
    "rhsusf_200Rnd_556x45_soft_pouch",
    "rhsusf_100Rnd_556x45_M200_soft_pouch"
];

private _pilot_munition = [
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_AP",
    "hlc_30Rnd_10mm_B_MP5",
    "hlc_30Rnd_10mm_JHP_MP5"
];

private _sniper_munition = [
    "rhsusf_mag_10Rnd_STD_50BMG_mk211",
    "rhsusf_mag_10Rnd_STD_50BMG_M33",
    "rhsusf_5Rnd_300winmag_xm2010",
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_AP"
];

private _aaat_munition = [
    "rhs_fgm148_magazine_AT",
    "rhs_fim92_mag",
    "rhs_mag_maaws_HEAT",
    "rhs_mag_maaws_HEDP",
    "rhs_mag_maaws_HE",
    "rhs_mag_smaw_HEAA",
    "rhs_mag_smaw_HEDP",
    "rhs_mag_smaw_SR"
];

private _gepaeck_mittel = [
    "B_Kitbag_cbr",
    "B_Kitbag_sgg",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo"
];

private _gepaeck_gross = [
    "B_Carryall_cbr",
    "B_Carryall_ocamo",
    "B_Carryall_khk",
    "B_Carryall_mcamo",
    "B_Carryall_oli",
    "B_Carryall_oucamo",
    "B_Carryall_ghex_F"
];

private _items = [];

// #################################################################
// LAYOUTS
// Ab hier sind Items nur noch für die bestimmten Rollen
// #################################################################
// _allgemein                         - Grundlegenden Sachen für alle
// _allgemein_gewehre                 - 5.56 Waffen und Mags
// _allgemein_magazine                 - 5.56 Mags einzeln
// _allgemein_visiere                - normalen Visiere
// _allgemein_befestigungsschiene    - laser/Lampe usw
// _allgemein_geschuetzzubehoer        - Schalldämpfer usw
// _allgemein_zweibein                - Zweibeine
// _allgemein_raketenwerfer            - einmal Raketenwerfer
// _allgemein_handfeuerwaffen        - Pistolen
// _allgemein_uniformen                - Uniformen
// _allgemein_westen                - Westen
// _allgemein_kopfbedeckung            - Helme
// _grenadier_gewehr                - Alle m320 und M203 Gewehre
// _grenadier_munition                - Grenadier Unterlauf
// _dmr_munition                    - DMR Munition
// _mg_munition                        - MG Munition
// _pilot_munition                    - Piloten MP7 Munition
// _sniper_munition                    - Sniper munition
// _aaat_munition                    - AtiTank Munition
// _gepaeck_mittel                    - Seesack
// _gepaeck_gross                    - Carryall

private _rolle = ACE_player getVariable ["TB_rolle", ""];
_items append (switch (_rolle) do
{
    case "lead":
    {
        _allgemein +
        _allgemein_magazine +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _grenadier_gewehr +
        _grenadier_munition +
        [
            // Weste
            "rhsusf_iotv_ocp_Squadleader",
            "rhsusf_iotv_ucp_Squadleader",
            "rhsusf_mbav_grenadier",
            "rhsusf_spc_squadleader",
            "rhsusf_spc_teamleader",

            // Gepäck
            "B_UAV_01_backpack_F",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",

            // Items
            "B_UavTerminal",
            "ACE_UAVBattery",
            "Laserbatteries"
        ]
    };

    case "sani":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        [
            // Westen
            "rhsusf_iotv_ocp_Medic",
            "rhsusf_iotv_ucp_Medic",
            "rhsusf_mbav_Medic",
            "rhsusf_spc_iar",

            // Item
            "TB_Item_liveMonitor"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        [
            // Westen
            "rhsusf_iotv_ocp_Medic",
            "rhsusf_iotv_ucp_Medic",
            "rhsusf_mbav_Medic",
            "rhsusf_spc_iar",

            // Kopfbedeckung
            "rhsusf_cvc_green_helmet",
            "rhsusf_cvc_green_alt_helmet",
            "rhsusf_cvc_green_ess",
            "rhsusf_cvc_helmet",
            "rhsusf_cvc_alt_helmet",
            "rhsusf_cvc_ess",

            // Item
            "TB_Item_liveMonitor"
        ]
    };

    case "grena":
    {
        _allgemein +
        _allgemein_magazine +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _grenadier_gewehr +
        _grenadier_munition +
        [
            // Westen
            "rhsusf_iotv_ocp_Grenadier",
            "rhsusf_iotv_ucp_Grenadier",
            "rhsusf_mbav_Grenadier",
            "rhsusf_spc_iar"
        ]
    };

    case "dmr":
    {
        _allgemein +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _dmr_munition +
        [
            // Gewehre
            "rhs_weap_m14ebrri",
            "rhs_weap_m24sws",
            "rhs_weap_m24sws_blk",
            "rhs_weap_m40a5",
            "rhs_weap_m40a5_d",
            "rhs_weap_m40a5_wd",
            "rhs_weap_sr25",
            "rhs_weap_sr25_d",
            "rhs_weap_sr25_ec_d",
            "rhs_weap_sr25_ec_wd",
            "rhs_weap_sr25_wd",
            "rhs_weap_sr25_ec",
            // ### Visiere
            "rhsusf_acc_ELCAN",
            "rhsusf_acc_ELCAN_ard",
            "rhsusf_acc_SpecterDR",
            "rhsusf_acc_SpecterDR_OD",
            "rhsusf_acc_SpecterDR_D",
            "rhsusf_acc_SpecterDR_A",
            "rhsusf_acc_ACOG_MDO",
            // ### Geschützzubehör
            "rhsusf_acc_sr25S",
            // ### Zweibein
            "rhsusf_acc_harris_swivel",

            // Westen
            "rhsusf_spc_marksman",

            // Spezial
            "ACE_Yardage450",
            "ACE_RangeCard"
        ]
    };

    case "mg":
    {
        _allgemein +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        [
            // Gewehre
            "rhs_weap_m240B_CAP",
            "rhs_weap_m249_pip_L",
            "rhs_weap_m249_pip_L_para",
            "rhs_weap_m249_pip_L_vfg",
            "rhs_weap_m249_pip_S",
            "rhs_weap_m249_pip_S_para",
            "rhs_weap_m249_pip_S_vfg",
            "rhs_weap_m249_pip",
            //"rhs_weap_m27iar",        // TODO: Munition fehlt
            //"rhs_weap_m27iar_grip",
            // ### Geschützzubehör
            "rhsusf_acc_ARDEC_M240",

            // Vests
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_mbav_mg",
            "rhsusf_spc_iar"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        _grenadier_munition    +
        _dmr_munition +
        _pilot_munition +
        _sniper_munition    +
        _aaat_munition +
        _gepaeck_mittel +
        _gepaeck_gross +
        [
            // Westen
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_iotv_ucp_SAW"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _pilot_munition +
        [
            // Gewehr
            "rhsusf_weap_MP7A2",
            "rhsusf_weap_MP7A2_grip3",
            "hlc_smg_mp510",

            // Kopfbedeckung
            "rhsusf_hgu56p_black",
            "rhsusf_hgu56p_mask_black",
            "rhsusf_hgu56p_mask_black_skull",
            "rhsusf_hgu56p_visor_black",
            "rhsusf_hgu56p_visor_mask_black",
            "rhsusf_hgu56p_visor_mask_Empire_black",
            "rhsusf_hgu56p_visor_mask_black_skull",
            "rhsusf_hgu56p_green",
            "rhsusf_hgu56p_mask_green",
            "rhsusf_hgu56p_mask_green_mo",
            "rhsusf_hgu56p_visor_green",
            "rhsusf_hgu56p_visor_mask_green",
            "rhsusf_hgu56p_visor_mask_green_mo",
            "rhsusf_hgu56p",
            "rhsusf_hgu56p_mask",
            "rhsusf_hgu56p_mask_mo",
            "rhsusf_hgu56p_mask_skull",
            "rhsusf_hgu56p_visor",
            "rhsusf_hgu56p_visor_mask",
            "rhsusf_hgu56p_visor_mask_mo",
            "rhsusf_hgu56p_visor_mask_skull",
            "rhsusf_hgu56p_pink",
            "rhsusf_hgu56p_mask_pink",
            "rhsusf_hgu56p_visor_pink",
            "rhsusf_hgu56p_visor_mask_pink",
            "rhsusf_hgu56p_saf",
            "rhsusf_hgu56p_mask_saf",
            "rhsusf_hgu56p_visor_saf",
            "rhsusf_hgu56p_visor_mask_saf",
            "rhsusf_hgu56p_mask_smiley",
            "rhsusf_hgu56p_visor_mask_smiley",
            "rhsusf_hgu56p_usa",
            "rhsusf_hgu56p_visor_usa",
            "RHS_jetpilot_usaf",
            
            // Uniform
            "U_B_PilotCoveralls",

            // Items
            "ToolKit"
        ]
    };

    case "rifle":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        [
            // Weste
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_mbav_Rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_rifleman",
            "rhsusf_spcs_ucp_rifleman"
        ]
    };

    case "sniper":
    {
        _allgemein +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _sniper_munition +
        [
            // Gewehre
            "rhs_weap_M107",
            "rhs_weap_M107_d",
            "rhs_weap_M107_w",
            "rhs_weap_XM2010",
            "rhs_weap_XM2010_wd",
            "rhs_weap_XM2010_sa",
            "rhs_weap_XM2010_d",
            "rhsusf_weap_MP7A2",
            "rhsusf_weap_MP7A2_grip3",
            // ### Visiere
            "rhsusf_acc_M8541",
            "rhsusf_acc_M8541_low",
            "rhsusf_acc_M8541_low_d",
            "rhsusf_acc_M8541_low_wd",
            "rhsusf_acc_premier_low",
            "rhsusf_acc_premier_anpvs27",
            "rhsusf_acc_premier",
            "rhsusf_acc_LEUPOLDMK4",
            "rhsusf_acc_LEUPOLDMK4_2",
            "rhsusf_acc_LEUPOLDMK4_2_d",
            // ### Geschützzubehör
            "rhsusf_acc_M2010S",
            "rhsusf_acc_M2010S_d",
            "rhsusf_acc_M2010S_sa",
            "rhsusf_acc_M2010S_wd",
            "rhsusf_acc_rotex_mp7",

            // Uniforms
            "U_B_FullGhillie_lsh",
            "U_B_FullGhillie_sard",
            "U_B_FullGhillie_ard",
            "U_B_T_FullGhillie_tna_F",

            // Westen
            "rhsusf_spc_marksman",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",
            "ACE_Vector",

            // Items
            "ACE_SpottingScope",
            "ACE_Tripod",
            "ACE_ATragMX",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Laserbatteries"
        ]
    };

    case "spotter":
    {
        _allgemein +
        _allgemein_magazine +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _sniper_munition +
        _gepaeck_mittel +
        _grenadier_gewehr +
        _grenadier_munition +
        [
            // Uniform
            "U_B_FullGhillie_sard",
            "U_B_FullGhillie_ard",
            "U_B_FullGhillie_lsh",
            "U_B_T_FullGhillie_tna_F",

            // Weste
            "rhsusf_iotv_ocp_Grenadier",
            "rhsusf_iotv_ucp_Grenadier",
            "rhsusf_mbav_Grenadier",
            "rhsusf_spc_iar",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",
            "ACE_Vector",

            // Items
            "ACE_SpottingScope",
            "ACE_Tripod",
            "ACE_ATragMX",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Laserbatteries",
            // ### Minen
            "APERSTripMine_Wire_Mag",
            "APERSBoundingMine_Range_Mag",
            "APERSMine_Range_Mag"
        ]
    };

    case "spreng":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        [
            // Handwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Items
            "ACE_Clacker",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ACE_DeadManSwitch",
            "ToolKit",
            "ACE_wirecutter",
            // ### Minen
            "IEDLandBig_Remote_Mag",
            "IEDUrbanBig_Remote_Mag",
            "IEDLandSmall_Remote_Mag",
            "IEDUrbanSmall_Remote_Mag",
            "DemoCharge_Remote_Mag",
            "ATMine_Range_Mag",
            "SatchelCharge_Remote_Mag",
            "ClaymoreDirectionalMine_Remote_Mag",
            "APERSBoundingMine_Range_Mag",
            "SLAMDirectionalMine_Wire_Mag",
            "APERSMine_Range_Mag",
            "APERSTripMine_Wire_Mag"
        ]
    };

    case "aaat":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _aaat_munition +
        _gepaeck_mittel +
        _gepaeck_gross +
        [
            // Raketenwerfer
            "rhs_weap_fgm148",
            "rhs_weap_fim92",
            "rhs_weap_maaws",
            "rhs_weap_smaw",
            "rhs_weap_smaw_green",
            // ### Visiere
            "rhs_optic_maaws",
            "rhs_weap_optic_smaw"
        ]
    };

    case "jtac":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        [
            // Gepäck
            "B_UAV_01_backpack_F",
            
            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",

            // Items
            "B_UavTerminal",
            "ITC_Land_B_UAV_AR2i",
            "ACE_UAVBattery",
            "Laserbatteries"
        ]
    };

    case "pionier":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        [
            // Handfeuerwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Items
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});


// #################################################################
// MEDIC STUFF (nichts ÄNDERN!!!)
// Sollte das Mediclvl advanced sein werden die anderen Sachen für alle auch noch hinzugefügt
// #################################################################
_items append [
    // Medic Stuff BASIC
    "ACE_fieldDressing",
    "ACE_morphine"
];

if (ace_medical_level >= 2) then
{
    _items append [
        // Medic Stuff ADV
        // "ACE_packingBandage",
        "ACE_elasticBandage",
        "ACE_quikclot",
        "ACE_tourniquet"
    ];
};

if (_rolle in ["sani", "arzt", "pilot"]) then
{
    _items append [
        "ACE_bodyBag",
        "ACE_epinephrine",
        "ACE_bloodIV",
        "ACE_bloodIV_500",
        "ACE_bloodIV_250"
    ];

    if (ace_medical_level >= 2) then
    {
        _items append [
            // Medic Stuff ADV
            "ACE_atropine",
            // "ACE_salineIV",
            // "ACE_salineIV_500",
            // "ACE_salineIV_250",
            // "ACE_plasmaIV",
            // "ACE_plasmaIV_500",
            // "ACE_plasmaIV_250",
            "ACE_personalAidKit",
            "ACE_surgicalKit"
        ];
    };
};

_items = _items arrayIntersect _items;

if ((ACE_player getVariable ["TB_arsenalType", ""]) == "USA") then {TB_allowedItems = ([_items] call TB_fnc_whitelist) apply {toLower _x}};

// Basicsystem loadouts aus adv laden
if (ace_medical_level < 2) then {TB_allowedItems = TB_allowedItems append ["ACE_elasticBandage","ACE_quikclot","ACE_tourniquet","ACE_atropine","ACE_personalAidKit","ACE_surgicalKit"]};

+_items
