/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: shukari
*/
private _allgemein = [
    // Gepäck
    "rhsusf_assault_eagleaiii_coy", // maximumLoad = 160; mass = 20; Quotient = 8
    "rhsusf_assault_eagleaiii_ocp",
    "rhsusf_assault_eagleaiii_ucp",
    "rhsusf_falconii_coy",          // maximumLoad = 160; mass = 20; Quotient = 8
    "rhsusf_falconii_mc",
    "B_Parachute",

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
    //"TB_building_item_RoadBarrier_F",
    //"TB_building_item_RoadCone_F",
    //"TB_building_item_Land_PortableLight_single_F",
    //"TB_building_item_Land_Pallet_vertical_F",
    //"TB_building_item_Land_SandbagBarricade_01_hole_F",
    // ### Granaten
    "SmokeShell",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellBlue",
    "rhs_mag_mk84",
    "rhs_mag_mk3a2",
    "rhs_mag_m67",
    // ### Sprengstoff
    "AMP_Breaching_Charge_Mag"
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
    "rhsusf_8Rnd_Slug",

    // MP5
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
    //"rhsusf_acc_T1_high",
    //"rhsusf_acc_T1_low",
    //"rhsusf_acc_T1_low_fwd",
    //"rhsusf_acc_ACOG2_USMC",
    //"rhsusf_acc_ACOG3_USMC",
    //"rhsusf_acc_ACOG_USMC",
    //"rhsusf_acc_EOTECH",
    //"rhsusf_acc_g33_t1",
    "rhsusf_acc_g33_xps3",
    "rhsusf_acc_g33_xps3_tan",
    "rhsusf_acc_ACOG",
    //"rhsusf_acc_ACOG2",
    //"rhsusf_acc_ACOG3",
    //"rhsusf_acc_M2A1",
    "rhsusf_acc_eotech_552",
    "rhsusf_acc_eotech_552_d",
    "rhsusf_acc_eotech_552_wd",
    "rhsusf_acc_compm4",
    "rhsusf_acc_ACOG_RMR",
    "rhsusf_acc_ACOG_d",
    "rhsusf_acc_ACOG_wd"
    //"rhsusf_acc_eotech_xps3"
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
    "tb_weap_taser",
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
    "hlc_12Rnd_357SIG_JHP_P226",
    "TB_mag_taser"
];

private _allgemein_uniformen = [
    "rhs_uniform_acu_ucp",
    "rhs_uniform_cu_ocp",
    "rhs_uniform_cu_ucp",
    "rhs_uniform_FROG01_d",
    "rhs_uniform_FROG01_wd",
    "rhs_uniform_g3_mc",

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

    // experimentell
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
    "hlc_smg_9mmar",

    // ### Handfeuerwaffe
    "rhs_weap_M320"
];

private _grenadier_munition = [
    "rhs_mag_M441_HE",
    "rhs_mag_M433_HEDP",
    "rhs_mag_M397_HET",
    "rhs_mag_m4009",    // Stun
    //"rhs_mag_m576",   // Buckshot

    // Flares
    "rhs_mag_M585_white",
    "rhs_mag_m661_green",
    "rhs_mag_m662_red",

    // Smoke
    "rhs_mag_m713_Red",
    "rhs_mag_m714_White",
    "rhs_mag_m715_Green",
    "rhs_mag_m716_yellow",

    // AIM Smokes
    "3Rnd_Smoke_Grenade_shell_precise",
    "rhs_mag_m713_Red_precise",
    "rhs_mag_m714_White_precise",
    "rhs_mag_m715_Green_precise",
    "rhs_mag_m716_Yellow_precise",

    "ACE_HuntIR_M203"
];

private _dmr_munition = [
    "rhsusf_20Rnd_762x51_m118_special_Mag",
    "rhsusf_20Rnd_762x51_m62_Mag",
    "rhsusf_20Rnd_762x51_m993_Mag",
    "rhsusf_5Rnd_762x51_m118_special_Mag",
    "rhsusf_5Rnd_762x51_m62_Mag",
    "rhsusf_5Rnd_762x51_m993_Mag",
    "rhsusf_10Rnd_762x51_m118_special_Mag",
    "rhsusf_10Rnd_762x51_m62_Mag",
    "rhsusf_10Rnd_762x51_m993_Mag",
    "rhsusf_20Rnd_762x51_SR25_m118_special_Mag",
    "rhsusf_20Rnd_762x51_SR25_m62_Mag",
    "rhsusf_20Rnd_762x51_SR25_m993_Mag"

    // verfügbar aber nicht in Benutzung m40A5
    //rhsusf_5Rnd_762x51_AICS_m118_special_Mag
    //rhsusf_5Rnd_762x51_AICS_m62_Mag
    //rhsusf_5Rnd_762x51_AICS_m993_Mag
];

private _mg_munition = [
    // 7.72
    "rhsusf_50Rnd_762x51_m62_tracer",
    "rhsusf_50Rnd_762x51_m61_ap",
    "rhsusf_50Rnd_762x51_m80a1epr",
    "rhsusf_100Rnd_762x51_m62_tracer",
    "rhsusf_100Rnd_762x51_m61_ap",
    "rhsusf_100Rnd_762x51_m80a1epr",

    // 5.56
    "rhsusf_100Rnd_556x45_soft_pouch",
    "rhsusf_100Rnd_556x45_mixed_soft_pouch",
    "rhsusf_200Rnd_556x45_box",
    "rhsusf_200rnd_556x45_mixed_box"
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
    "B_Kitbag_cbr",     // maximumLoad = 280; mass = 50; Quotient = 5,6
    "B_Kitbag_sgg",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo"
];

private _gepaeck_gross = [
    "B_Carryall_cbr",   // maximumLoad = 320; mass = 60; Quotient = 5,3
    "B_Carryall_ocamo",
    "B_Carryall_khk",
    "B_Carryall_mcamo",
    "B_Carryall_oli",
    "B_Carryall_oucamo",
    "B_Carryall_ghex_F"
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
    "OPXT_ogag_1523"   //grau2
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
// _lrFunken                          - LR Funken

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
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

            // Waffen
            "rhs_weap_m4a1_d",

            // Handwaffen
            "rhs_weap_M320",

            // Gepäck
            //"B_UAV_01_backpack_F",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",
            "rhsusf_lrf_Vector21",
            "ACE_MX2A", // Thermal
            "ACE_Vector", // Tag/Nacht Version

            // Items
            //"B_UavTerminal",
            //"ACE_UAVBattery",
            "ACE_HuntIR_monitor",
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
            "rhsusf_spcs_ucp_medic"
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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _gepaeck_mittel +
        [
            // Westen
            "rhsusf_iotv_ocp_Medic",
            "rhsusf_iotv_ucp_Medic",
            "rhsusf_mbav_Medic",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_medic",
            "rhsusf_spcs_ucp_medic",

            // Kopfbedeckung
            "rhsusf_cvc_green_helmet",
            "rhsusf_cvc_green_alt_helmet",
            "rhsusf_cvc_green_ess",
            "rhsusf_cvc_helmet",
            "rhsusf_cvc_alt_helmet",
            "rhsusf_cvc_ess"
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
        [
            // Westen
            "rhsusf_iotv_ocp_Grenadier",
            "rhsusf_iotv_ucp_Grenadier",
            "rhsusf_mbav_Grenadier",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_grenadier",
            "rhsusf_spcs_ucp_grenadier",

            // Items
            "ACE_HuntIR_monitor"
        ]
    };

    case "dmr":
    {
        _allgemein +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
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
            "rhsusf_acc_su230a",
            "rhsusf_acc_su230a_c",
            "rhsusf_acc_su230a_mrds",
            "rhsusf_acc_su230a_mrds_c",
            "rhsusf_acc_m8541_low",
            "rhsusf_acc_m8541_low_d",
            "rhsusf_acc_m8541_low_wd",
            "rhsusf_acc_leupoldmk4",
            "rhsusf_acc_leupoldmk4_d",
            "rhsusf_acc_leupoldmk4_wd",
            "rhsusf_acc_ACOG_MDO",
            // ### Geschützzubehör
            "rhsusf_acc_sr25s",
            "rhsusf_acc_sr25s_d",
            "rhsusf_acc_sr25s_wd",
            "rhsusf_acc_m24_muzzlehider_black",
            "rhsusf_acc_m24_muzzlehider_d",
            "rhsusf_acc_m24_muzzlehider_wd",
            "rhsusf_acc_m24_silencer_black",
            "rhsusf_acc_m24_silencer_d",
            "rhsusf_acc_m24_silencer_wd",
            // ### Zweibein
            "rhsusf_acc_harris_swivel",

            // Westen
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_mbav_rifleman",
            "rhsusf_spc_marksman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_rifleman",
            "rhsusf_spcs_ucp_rifleman",

            // Ferngläser
            "ACE_Yardage450",
            "lerca_1200_black",
            "lerca_1200_tan",
            "rhsusf_lrf_Vector21",
            //"ACE_VectorDay",
            "ACE_Vector", // Tag/Nacht Version
            "ACE_Kestrel4500",

            // Spezial
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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        [
            // Gewehre
            "rhs_weap_m240B_CAP",
            "rhs_weap_m249_pip_L",
            //"rhs_weap_m249_pip_L_para",
            //"rhs_weap_m249_pip_L_vfg",
            //"rhs_weap_m249_pip_S",
            //"rhs_weap_m249_pip_S_para",
            //"rhs_weap_m249_pip_S_vfg",
            //"rhs_weap_m27iar",
            // ### Geschützzubehör
            "rhsusf_acc_ARDEC_M240",

            // Vests
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_mbav_mg",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_machinegunner",
            "rhsusf_spcs_ucp_machinegunner"
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
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_mbav_mg",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_machinegunner",
            "rhsusf_spcs_ucp_machinegunner"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _lrFunken +
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
            "rhsusf_ihadss",

            // Uniform
            "U_B_PilotCoveralls",
            "U_B_HeliPilotCoveralls",

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
        _lrFunken +
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
            "rhsusf_iotv_ucp_Rifleman",
            "rhsusf_iotv_ocp_Rifleman",
            "rhsusf_mbav_rifleman",
            "rhsusf_spc_rifleman",
            "rhsusf_spcs_ocp_sniper",
            "rhsusf_spcs_ucp_sniper",

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
        _lrFunken +
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
            "rhsusf_spcs_ocp_sniper",
            "rhsusf_spcs_ucp_sniper",

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
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
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
            "rhs_weap_optic_smaw",

            // Vesten
            "rhsusf_mbav_mg",
            "rhsusf_iotv_ucp_SAW",
            "rhsusf_iotv_ocp_SAW",
            "rhsusf_spc_iar",
            "rhsusf_spcs_ocp_saw",
            "rhsusf_spcs_ucp_saw"
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

            // Items
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
