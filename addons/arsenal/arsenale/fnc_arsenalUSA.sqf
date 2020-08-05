/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: shukari
*/
private _allgemein = [
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
    //"G_Aviator",
    // ### Beards
    "SFG_Tac_smallBeardB",
    "SFG_Tac_smallBeardD",
    "SFG_Tac_smallBeardG",
    "SFG_Tac_smallBeardO",
    "SFG_Tac_BeardB",
    "SFG_Tac_BeardD",
    "SFG_Tac_BeardG",
    "SFG_Tac_BeardO",
    "SFG_Tac_chinlessbB",
    "SFG_Tac_chinlessbD",
    "SFG_Tac_chinlessbG",
    "SFG_Tac_chinlessbO",
    "SFG_Tac_moustacheB",
    "SFG_Tac_moustacheD",
    "SFG_Tac_moustacheG",
    "SFG_Tac_moustacheO",
    "SFG_Tac_ChopsB",
    "SFG_Tac_ChopsD",
    "SFG_Tac_ChopsG",
    "SFG_Tac_ChopsO",

    // Nachtsichtgeräte
    "rhsusf_ANPVS_14",
    "rhsusf_ANPVS_15",
    "rhsusf_Rhino",

    // Ferngläser
    "m24_bino",
    "Leupold_Mk4",

    // Karte
    "ItemMap",

    // Terminal
    "ItemGPS",

    // Kommunikation
    "TFAR_anprc152",

    // Navigation
    "ItemCompass",
    "ACE_microDAGR",

    // Uhr
    "ItemWatch",
    "ACE_Altimeter",

    // Items
    // ### Lampe
    "ACE_Chemlight_Shield",
    "ACE_Flashlight_KSF1",
    // ### Items
    "ACE_MapTools",
    "ACE_CableTie",
    "ACE_EntrenchingTool",
    "ACE_SpareBarrel",
    //"ACE_IR_Strobe_Item",
    // ### Chemlights
    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_IR",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_HiWhite",
    // ### BuildingItems
    "TB_building_item_Land_BagFence_Long_F",
    "TB_building_item_Land_BagFence_Round_F",
    "TB_building_item_ace_concertinawirecoil",
    // ### Granaten
    "SmokeShell",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellBlue",
    "rhs_mag_mk84",
    "rhs_mag_mk3a2",
    "rhs_mag_m67",
    "B_IR_Grenade",
    // ### Sprengstoff
    "AMP_Breaching_Charge_Mag",
    // ### Fallschirme
    "B_Parachute"
];

private _allgemein_magazine = [
    // M855 vs. M855A1 -> https://www.americanrifleman.org/wp-content/uploads/2014/05/Comparison-Chart.jpg
    "rhs_mag_30Rnd_556x45_M855A1_PMAG",
    "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan",
    "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",
    "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red",
    "rhs_mag_30Rnd_556x45_Mk262_PMAG",
    "rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan",
    "rhs_mag_30Rnd_556x45_Mk318_PMAG",
    "rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan",

    // Schrot
    "rhsusf_5Rnd_00Buck",
    "rhsusf_5Rnd_Slug",
    "rhsusf_8Rnd_00Buck",
    "rhsusf_8Rnd_Slug"
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
    "rhs_weap_mk18_KAC_wd"
];
_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "rhsusf_acc_g33_xps3",
    "rhsusf_acc_g33_xps3_tan",
    "rhsusf_acc_ACOG",
    "rhsusf_acc_acog_rmr",
    "rhsusf_acc_su230",
    "rhsusf_acc_su230_c",
    "rhsusf_acc_su230_mrds",
    "rhsusf_acc_su230_mrds_c",
    "rhsusf_acc_eotech_552",
    "rhsusf_acc_eotech_552_d",
    "rhsusf_acc_eotech_552_wd",
    "rhsusf_acc_compm4",
    "rhsusf_acc_ACOG_d",
    "rhsusf_acc_ACOG_wd"
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
    "rhsusf_acc_wmx_bk"
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

private _AT_raketenwerfer = [
    "TB_rhs_weap_M136_CS",
    "rhs_weap_M136",
    // ### Befestigungsschiene
    "rhs_acc_at4_handler",
    // ### Munition
    "rhs_m136_mag",
    "rhs_m136_CS_mag"
];

private _HEDP_raketenwerfer = [
    "rhs_weap_m72a7",
    "rhs_weap_M136_hedp",
    // ### Munition
    "rhs_m72a7_mag",
    "rhs_m136_hedp_mag"
];

private _allgemein_handfeuerwaffen = [
    "rhsusf_weap_m1911a1",
    "rhsusf_weap_m9",
    "rhsusf_weap_glock17g4",
    "tb_weap_taser",
    // ### Befestigungsschiene
    "acc_flashlight_pistol",
    // ### Geschützzubehör
    "rhsusf_acc_omega9k",
    // ### Munition
    "rhsusf_mag_7x45acp_MHP",
    "rhsusf_mag_15Rnd_9x19_FMJ",
    "rhsusf_mag_15Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "TB_mag_taser"
];

private _allgemein_uniformen = [
    "rhs_uniform_acu_ucp",
    "rhs_uniform_cu_ocp",
    "rhs_uniform_cu_ucp",
    "rhs_uniform_FROG01_d",
    "rhs_uniform_FROG01_wd",

    // experimentell
    "rhs_uniform_g3_blk",
    "rhs_uniform_g3_m81",
    "rhs_uniform_g3_rgr",
    "rhs_uniform_g3_tan"
];

private _allgemein_westen = [
    "rhsusf_iotv_ocp",
    "rhsusf_iotv_ucp",
    "rhsusf_mbav",
    "rhsusf_spc",
    "rhsusf_spcs_ocp",
    "rhsusf_spcs_ucp",
    "SPC_Black_01",
    "UCP_Black_01",
    "MBAV_Black_01",
    "MBAV_Black_02",
    "TB_vest_sps_ucp",
    "TB_vest_sps_ocp"
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
    "TB_headgear_sps_ucp",
    "rhsusf_patrolcap_ocp",
    "rhsusf_patrolcap_ucp",
    "rhsusf_protech_helmet",
    "rhsusf_protech_helmet_ess",
    "rhsusf_protech_helmet_rhino",
    "rhsusf_protech_helmet_rhino_ess",

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

    // ### Handfeuerwaffe
    "rhs_weap_M320"
];

private _grenadier_munition = [
    "TB_rhs_mag_40mm_HE",
    "TB_rhs_mag_40mm_HEDP",
    "rhs_mag_m4009",    // Stun

    // Flares
    "rhs_mag_M585_white",
    "rhs_mag_m661_green",
    "rhs_mag_m662_red",

    // AIM Smokes
    "3Rnd_Smoke_Grenade_shell_precise",
    "rhs_mag_m713_Red_precise",
    "rhs_mag_m714_White_precise",
    "rhs_mag_m715_Green_precise",
    "rhs_mag_m716_Yellow_precise",

    // Sondermunition
    "TB_rhs_mag_40mm_Delay",
    "TB_rhs_mag_40mm_IR_Grenade",
    "TB_rhs_mag_40mm_Slugshot",

    "ACE_HuntIR_M203"
];

private _dmr_munition = [
    "rhsusf_20Rnd_762x51_m118_special_Mag",
    "rhsusf_20Rnd_762x51_m62_Mag",
    "rhsusf_20Rnd_762x51_m993_Mag",
    "rhsusf_5Rnd_762x51_m118_special_Mag",
    "rhsusf_10Rnd_762x51_m118_special_Mag",
    "rhsusf_10Rnd_762x51_m62_Mag",
    "rhsusf_10Rnd_762x51_m993_Mag",
    "rhs_mag_20Rnd_SCAR_762x51_m118_special",
    "rhs_mag_20Rnd_SCAR_762x51_m61_ap",
    "rhs_mag_20Rnd_SCAR_762x51_m62_tracer",
    "rhs_mag_20Rnd_SCAR_762x51_m80_ball",
    "rhs_mag_20Rnd_SCAR_762x51_mk316_special",
    "rhsusf_5Rnd_762x51_m118_special_Mag"
];

private _rifle_munition = [
    // 7.62
    "rhsusf_20Rnd_762x51_SR25_m62_Mag",
    "rhsusf_20Rnd_762x51_SR25_m993_Mag",
    "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"
];

private _mg_munition = [
    // 7.62
    "rhsusf_100Rnd_762x51_m62_tracer",
    "rhsusf_100Rnd_762x51_m61_ap",

    // 5.56
    "rhsusf_200Rnd_556x45_M855_soft_pouch_coyote",
    "rhsusf_200Rnd_556x45_M855_soft_pouch",
    "rhsusf_200Rnd_556x45_M855_soft_pouch_ucp",
    "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote",
    "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_ucp",
    "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch"
];

private _pilot_munition = [
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_AP"
];

private _sniper_munition = [
    "rhsusf_mag_10Rnd_STD_50BMG_mk211",
    "rhsusf_mag_10Rnd_STD_50BMG_M33",
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_AP",
    "rhs_mag_20Rnd_SCAR_762x51_mk316_special_LRS",
    "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"
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

private _gepaeck_klein = [
    // Gepäck
    "rhsusf_falconii_coy",          // maximumLoad = 96; mass = 12; Quotient = 8
    "rhsusf_falconii_mc",
    "B_AssaultPack_blk",
    "B_AssaultPack_rgr",
    "B_FieldPack_cbr",              // maximumLoad = 96; mass = 12; Quotient = 8
    "B_FieldPack_khk",
    "B_FieldPack_blk",
    "B_TacticalPack_blk",           // maximumLoad = 96; mass = 12; Quotient = 8
    "B_TacticalPack_oli",
    "B_TacticalPack_mcamo"
];

private _gepaeck_mittel = [
    "B_Kitbag_cbr",                 // maximumLoad = 280; mass = 50; Quotient = 5,6
    "B_Kitbag_sgg",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo",
    "B_Kitbag_tan",
    "TB_backpacks_kitbag_black",
    "rhsusf_assault_eagleaiii_coy", // maximumLoad = 280; mass = 50; Quotient = 5,6
    "rhsusf_assault_eagleaiii_ocp",
    "rhsusf_assault_eagleaiii_ucp"
];

private _gepaeck_gross = [
    "B_Carryall_cbr",   // maximumLoad = 320; mass = 60; Quotient = 5,3
    "B_Carryall_ocamo",
    "B_Carryall_khk",
    "B_Carryall_mcamo",
    "B_Carryall_oli",
    "B_Carryall_oucamo"
];

private _gepaeck_sehrgross = [
    "TB_backpacks_bergen_urban", // maximumLoad = 500; mass = 104; Quotient = 4.8
    "TB_backpacks_bergen_M81",
    "TB_backpacks_bergen_marpad_d",
    "TB_backpacks_bergen_marpad_wd",
    "TB_backpacks_bergen_multitarn"
];

private _lrFunken = [
    // ### LR-Funke
    "OPXT_blk_1523",    // schwarz
    "OPXT_aor1_1523",   // sand
    "OPXT_oga_1523",    // grün
    "OPXT_scorpion_1523",
    "OPXT_m81_1523",
    "OPXT_multicam_1523",
    "OPXT_at_au_1523",  // grau1
    "OPXT_ogag_1523"    //grau2
];

private _moerser_munition = [
    "TB_vz99_HE",
    "TB_vz99_HE_multi",
    "TB_vz99_smokeWhite",
    "TB_vz99_smokeRed",
    "TB_vz99_flare"
];

private _items = [];

// #################################################################
// LAYOUTS
// Ab hier sind Items nur noch für die bestimmten Rollen
// #################################################################
// _allgemein                        - Grundlegenden Sachen für alle
// _allgemein_gewehre                - 5.56 Waffen und Mags
// _allgemein_magazine               - 5.56 Mags einzeln
// _allgemein_visiere                - normalen Visiere
// _allgemein_befestigungsschiene    - Laser/Lampe usw
// _allgemein_geschuetzzubehoer      - Schalldämpfer usw
// _allgemein_zweibein               - Zweibeine
// _AT_raketenwerfer                 - einmal AT Raketenwerfer
// _HEDP_raketenwerfer               - einmal HEDP Raketenwerfer
// _allgemein_handfeuerwaffen        - Pistolen
// _allgemein_uniformen              - Uniformen
// _allgemein_westen                 - Westen
// _allgemein_kopfbedeckung          - Helme
// _grenadier_gewehr                 - Alle M320 und M203 Gewehre
// _grenadier_munition               - Grenadier Unterlauf
// _dmr_munition                     - DMR Munition
// _mg_munition                      - MG Munition
// _pilot_munition                   - Piloten MP7 Munition
// _sniper_munition                  - Sniper Munition
// _aaat_munition                    - AntiTank Munition
// _gepaeck_mittel                   - Seesack
// _gepaeck_gross                    - Carryall
// _gepaeck_sehrgross                - Bergen
// _lrFunken                         - LR Funken
// _moerser_munition                 - Munition für Kommandomoerser

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
    {
        _allgemein +
        _allgemein_gewehre +
        _grenadier_munition +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _HEDP_raketenwerfer +
        [
            // Weste
            "rhsusf_iotv_ocp_Squadleader",
            "rhsusf_iotv_ocp_Teamleader",
            "rhsusf_iotv_ucp_Squadleader",
            "rhsusf_iotv_ucp_Teamleader",
            "rhsusf_mbav_mg",
            "rhsusf_spc_teamleader",
            "rhsusf_spcs_ocp_squadleader",
            "rhsusf_spcs_ocp_teamleader",
            "rhsusf_spcs_ucp_squadleader",
            "rhsusf_spcs_ucp_teamleader",
            "rhsusf_plateframe_teamleader",

            // Waffen
            "rhs_weap_m4a1_d",

            // Handwaffen
            "rhs_weap_M320",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",
            "ACE_MX2A", // Thermal
            "ACE_Vector", // Tag/Nacht Version

            // Items
            "ACE_HuntIR_monitor",
            "TB_rhs_mag_40mm_IR_Grenade",
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
            "rhsusf_spcs_ocp_medic",
            "rhsusf_spcs_ucp_medic",
            "rhsusf_plateframe_medic",

            // Kopfbedeckung
            "TB_helmet_Sani_A_Black",
            "TB_helmet_Sani_B_Grey",
            "TB_helmet_Sani_C_Green"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _gepaeck_mittel +
        _pilot_munition +
        [
            // Waffen
            "rhsusf_weap_MP7A2",
            "rhsusf_weap_MP7A2_grip3",
            "rhs_weap_M590_8RD",
            "rhs_weap_M590_5RD",
            // ### Munition
            "rhsusf_8Rnd_00Buck",
            "rhsusf_8Rnd_Slug",
            "rhsusf_5Rnd_00Buck",
            "rhsusf_5Rnd_Slug",

            // Westen
            "rhsusf_iotv_ocp_Medic",
            "rhsusf_iotv_ucp_Medic",
            "rhsusf_mbav_Medic",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_medic",
            "rhsusf_spcs_ucp_medic",
            "rhsusf_plateframe_medic",

            // Kopfbedeckung
            "rhsusf_cvc_green_helmet",
            "rhsusf_cvc_green_alt_helmet",
            "rhsusf_cvc_green_ess",
            "rhsusf_cvc_helmet",
            "rhsusf_cvc_alt_helmet",
            "rhsusf_cvc_ess",
            "TB_helmet_Sani_A_Black",
            "TB_helmet_Sani_B_Grey",
            "TB_helmet_Sani_C_Green"
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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _grenadier_gewehr +
        _grenadier_munition +
        _gepaeck_mittel +
        [
            // Westen
            "rhsusf_iotv_ocp_Grenadier",
            "rhsusf_iotv_ucp_Grenadier",
            "rhsusf_mbav_Grenadier",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_grenadier",
            "rhsusf_spcs_ucp_grenadier",
            "rhsusf_plateframe_grenadier",

            // Items
            "ACE_HuntIR_monitor"
        ]
    };

    case "dmr": {[]};

    case "mg":
    {
        _allgemein +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        _gepaeck_klein +
        _gepaeck_mittel +
        [
            // Gewehre
            "rhs_weap_m240G",
            "rhs_weap_m249_light_S",
            // ### Geschützzubehör
            "rhsusf_acc_ARDEC_M240",
            // ### Zweibein
            "rhsusf_acc_saw_lw_bipod",

            // Vests
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_mbav_mg",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_machinegunner",
            "rhsusf_spcs_ucp_machinegunner",
            "rhsusf_plateframe_machinegunner",

            // Zubehör
            "ACE_RangeCard"
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
        _AT_raketenwerfer +
        _HEDP_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        _grenadier_munition +
        _rifle_munition +
        _dmr_munition +
        _pilot_munition +
        _sniper_munition +
        _aaat_munition +
        _gepaeck_mittel +
        _gepaeck_gross +
        _gepaeck_sehrgross +
        _moerser_munition +
        [
            // Westen
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_mbav_mg",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_machinegunner",
            "rhsusf_spcs_ucp_machinegunner",
            "rhsusf_plateframe_machinegunner",

            // Ferngläser
            "ACE_Vector",

            // Waffen
            "TB_vz99_carryWeapon"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_handfeuerwaffen +
        _lrFunken +
        _gepaeck_klein +
        _pilot_munition +
        _allgemein_magazine +
        _pilot_munition +
        _mg_munition +
        _grenadier_munition +
        _dmr_munition +
        _pilot_munition +
        _sniper_munition +
        _aaat_munition +
        [
            // Gewehr
            "rhsusf_weap_MP7A2",
            "rhsusf_weap_MP7A2_grip3",

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
            "rhsusf_ihadss",
            "H_PilotHelmetFighter_B",

            // Westen
            "rhsusf_iotv_ocp",
            "rhsusf_iotv_ucp",

            // Uniform
            "U_B_PilotCoveralls",
            "U_B_HeliPilotCoveralls",
            "rhs_uniform_cu_ocp",
            "rhs_uniform_cu_ucp",

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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        _dmr_munition +
        _rifle_munition +
        [
            // Gewehre
            "rhs_weap_m14ebrri",
            "rhs_weap_mk17_CQC",
            "rhs_weap_mk17_LB",
            "rhs_weap_mk17_STD",
            "rhs_weap_sr25",
            "rhs_weap_sr25_d",
            "rhs_weap_sr25_ec_d",
            "rhs_weap_sr25_ec_wd",
            "rhs_weap_sr25_wd",
            "rhs_weap_m24sws",
            "rhs_weap_m24sws_d",
            "rhs_weap_m24sws_wd",
            // ### Geschützzubehör
            "rhsusf_acc_sr25s",
            "rhsusf_acc_sr25s_d",
            "rhsusf_acc_sr25s_wd",
            "muzzle_snds_b",
            "muzzle_snds_b_snd_f",
            "rhsusf_acc_aac_762sdn6_silencer",
            "rhsusf_acc_m24_silencer_black",
            "rhsusf_acc_m24_silencer_d",
            "rhsusf_acc_m24_silencer_wd",
            "rhsusf_acc_harris_swivel",
            // ### Visiere
            "optic_ams",
            "optic_ams_khk",
            "optic_ams_snd",
            "optic_sos",

            // Weste
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_mbav_Rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_rifleman",
            "rhsusf_spcs_ucp_rifleman",
            "rhsusf_spc_marksman",
            "rhsusf_plateframe_marksman",
            "rhsusf_plateframe_rifleman",
            // Spezial
            "ACE_Kestrel4500",
            "ACE_RangeCard",

            // Binocular
            "ace_vector"
        ]
    };

    case "sniper":
    {
        _allgemein +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _sniper_munition +
        _dmr_munition +
        _allgemein_uniformen +
        [
            // Gewehre
            "rhs_weap_M107",
            "rhs_weap_M107_d",
            "rhs_weap_M107_w",
            "rhsusf_weap_MP7A2",
            "rhsusf_weap_MP7A2_grip3",
            "rhs_weap_mk17_CQC",
            "rhs_weap_mk17_LB",
            "rhs_weap_mk17_STD",
            // ### Visiere
            "rhsusf_acc_premier_anpvs27",
            "rhsusf_acc_premier",
            "rhsusf_acc_LEUPOLDMK4_2",
            "rhsusf_acc_LEUPOLDMK4_2_d",
            "optic_lrps",
            "ace_optic_lrps_2d",
            "ace_optic_sos_2d",
            "optic_ams",
            "optic_ams_khk",
            "optic_ams_snd",
            // ### Geschützzubehör
            "muzzle_snds_b",
            "muzzle_snds_b_snd_f",
            "bipod_01_f_blk",
            "bipod_01_f_snd",
            "rhsusf_acc_rotex_mp7",

            // Uniforms
            "U_B_FullGhillie_lsh",
            "U_B_FullGhillie_sard",
            "U_B_FullGhillie_ard",
            "U_B_T_FullGhillie_tna_F",

            // Westen
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_mbav_rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_sniper",
            "rhsusf_spcs_ucp_sniper",
            "rhsusf_plateframe_marksman",
            "rhsusf_plateframe_rifleman",

            // Rucksäcke
            "ace_gunbag_Tan",
            "ace_gunbag",

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
        _AT_raketenwerfer +
        _HEDP_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _sniper_munition +
        _gepaeck_mittel +
        _lrFunken +
        _grenadier_gewehr +
        _grenadier_munition +
        _allgemein_uniformen +
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
            "rhsusf_spcs_ocp_sniper",
            "rhsusf_spcs_ucp_sniper",
            "rhsusf_plateframe_marksman",
            "rhsusf_plateframe_rifleman",

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
            "ACE_HuntIR_monitor",
            "ACE_DefusalKit",
            "ACE_wirecutter",
            "ACE_Clacker", // 250m

            // ### Minen
            "APERSTripMine_Wire_Mag"
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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        _HEDP_raketenwerfer +
        [
            // Handwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Westen
            "rhsusf_mbav_rifleman",
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_rifleman",
            "rhsusf_spcs_ucp_rifleman",
            "rhsusf_plateframe_rifleman",

            // Items
            "ACE_M26_Clacker",
            "ACE_Clacker",
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
            "rhs_weap_optic_smaw",

            // Vesten
            "rhsusf_mbav_mg",
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_saw",
            "rhsusf_spcs_ucp_saw",
            "rhsusf_plateframe_rifleman"
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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        [
            // Gepäck
            "B_UAV_01_backpack_F",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",

            // Vesten
            "rhsusf_mbav_rifleman",
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_rifleman",
            "rhsusf_spcs_ucp_rifleman",
            "rhsusf_plateframe_rifleman",

            // Experiment
            "B_UAV_06_backpack_F", // UAV Bag (AL-6) [NATO]

            // Items
            "B_UavTerminal",
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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        _lrFunken +
        _AT_raketenwerfer +
        _HEDP_raketenwerfer +
        [
            // Handfeuerwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Weste
            "rhsusf_mbav_rifleman",
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_rifleman",
            "rhsusf_spcs_ucp_rifleman",
            "rhsusf_plateframe_rifleman",

            // Items
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
