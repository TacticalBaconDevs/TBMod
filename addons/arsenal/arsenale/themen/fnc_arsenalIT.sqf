/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: shukari
*/
private _allgemein = [
    // Gesichtsbedeckung
    "rhs_googles_orange",
    "G_Bandanna_oli",
    "G_Bandanna_khk",
    "G_Balaclava_oli",
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
    "G_AirPurifyingRespirator_02_olive_F",
    "G_AirPurifyingRespirator_02_sand_F",
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
    "TB_NVG_widescreen",

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
    "ACE_wirecutter",
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
    "B_IR_Grenade",
    // ### Sprengstoff
    "AMP_Breaching_Charge_Mag",
    // ### Fallschirme
    "B_Parachute",
    // ### ITC Tablet
    "itc_land_tablet_rover"
];

private _allgemein_magazine = [
    // M855 vs. M855A1 -> https://www.americanrifleman.org/wp-content/uploads/2014/05/Comparison-Chart.jpg
    "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
    "ACE_30Rnd_556x45_Stanag_Mk318_mag",
    "30Rnd_556x45_Stanag_Tracer_Green",

    // Schrot
    "rhsusf_5Rnd_00Buck",
    "rhsusf_5Rnd_Slug",
    "rhsusf_8Rnd_00Buck",
    "rhsusf_8Rnd_Slug",

    // 12.7 UL
    "TB_mag_MPR_10Rnd_Antimateriel",
    "TB_mag_MPR_10Rnd_Slug",
    "TB_mag_MPR_10Rnd_Buckshot",
    "TB_mag_MPR_10Rnd_Underwater",

    // .45 Cal
    "TB_mag_40Rnd_45_FMJ",
    "TB_mag_40Rnd_45_FMJ_Tracer_Red",
    "TB_mag_40Rnd_45_JHP",
    "TB_mag_40Rnd_45_JHP_Tracer_Red"
];

private _allgemein_gewehre = [
    "ASZ_ARX160",
    "ASZ_ARX160_IV_L_CC",
    "ASZ_ARX160SF",
    "ASZ_ARX160SF_CC",
    "ASZ_ARX160SF_IV_L_CC",
    "ASZ_AR7090",
    "ASZ_SCS90",
    "rhs_weap_m4a1_carryhandle"
];

_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "rhsusf_acc_eotech_xps3",
    "rhsusf_acc_eotech",
    "rhsusf_acc_acog2",
    "rhsusf_acc_acog_rmr",
    "rhsusf_acc_ACOG_d",
    "rhsusf_acc_eotech_552",
    "rhsusf_acc_eotech_552_d",
    "rhsusf_acc_compm4",
    "rhsusf_acc_rm05",
    "rhsusf_acc_rx01_nofilter",
    "rhsusf_acc_rx01",
    "rhsusf_acc_rx01_nofilter_tan",
    "rhsusf_acc_rx01_tan",
    "optic_yorris",
    "optic_aco_smg",
    "optic_mrco"
];

private _allgemein_befestigungsschiene = [
    "ace_acc_pointer_red",
    "ace_acc_pointer_green",
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
    "rhsusf_acc_SFMB556",
    "rhsusf_acc_aac_762sdn6_silencer"
];

private _allgemein_zweibein = [
    "rhsusf_acc_grip2",
    "rhsusf_acc_grip2_tan",
    "rhsusf_acc_grip2_wd",
    "rhsusf_acc_grip1",
    "rhsusf_acc_harris_bipod",
    "rhsusf_acc_kac_grip",
    "rhsusf_acc_rvg_blk",
    "asz_bipod_arx_blk",
    "asz_bipod_arx_des",
    "rhsusf_acc_rvg_de"
];

private _AT_raketenwerfer = [
    "ASZ_PzF3_Loaded",
    // ### Munition
    "ASZ_PZF3_Mag"
];

private _HEDP_raketenwerfer = [
    "rhs_weap_m72a7",
    // ### Munition
    "rhs_m72a7_mag"
];

private _allgemein_handfeuerwaffen = [
    "rhsusf_weap_m9",
    "rhsusf_weap_glock17g4",
    "tb_weap_taser",
    // ### Befestigungsschiene
    "acc_flashlight_pistol",
    // ### Geschützzubehör
    "rhsusf_acc_omega9k",
    // ### Munition
    "rhsusf_mag_17Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "TB_mag_taser"
];

private _allgemein_uniformen = [
    "ASZ_Uniforme_EI_CBT",
    "ASZ_Uniforme_EI_CB60",

    // experimentell
    "ASZ_SOF_Uniform_CBT",
    "ASZ_SOF_Uniform_CB60"
];

private _allgemein_westen = [
   "ASZ_NC4_09_base",
   "ASZ_NC4_09"
];

private _allgemein_kopfbedeckung = [
    "ASZ_BoonieHat_CB60",
    "ASZ_BoonieHat_CBT",
    "ASZ_Mich_CB60",
    "ASZ_Mich_CB60_alp",
    "ASZ_Mich_CB60_bers",
    "ASZ_Mich_CBT",
    "ASZ_Mich_CBT_alp",
    "ASZ_Mich_CBT_bers",
    "ASZ_Mich_ESS_CB60",
    "ASZ_Mich_ESS_CB60_alp",
    "ASZ_Mich_ESS_CB60_bers",
    "ASZ_Mich_ESS_CBT",
    "ASZ_Mich_ESS_CBT_alp",
    "ASZ_Mich_ESS_CBT_bers",
    "ASZ_Mich_Net_CB60",
    "ASZ_Mich_Net_CB60_alp",
    "ASZ_Mich_Net_CB60_bers",
    "ASZ_Mich_Net_CBT",
    "ASZ_Mich_Net_CBT_alp",
    "ASZ_Mich_Net_CBT_bers",
    "ASZ_mach_2_CB60",
    "ASZ_mach_2_CBT",
    "ASZ_mach_2_netting_CB60",
    "ASZ_mach_2_netting_CBT",
    "ASZ_Basco_EI"
];

private _grenadier_gewehr = [
    "ASZ_AR7090_gl",
    "ASZ_ARX160_GLS",
    "ASZ_ARX160_GLS_CC",
    "ASZ_ARX160SF_GLS",
    "ASZ_ARX160SF_GLS_CC",
    "ASZ_SC90_gl"
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
    "20Rnd_762x51_Mag",
    "ACE_20Rnd_762x51_Mag_Tracer"
];

private _rifle_munition = [
    // 7.62
    "ACE_20Rnd_762x51_Mag_Tracer",
    "20Rnd_762x51_Mag"
];

private _mg_munition = [
    // 5.56
    "rhsusf_200Rnd_556x45_M855_soft_pouch_coyote",
    "rhsusf_200Rnd_556x45_M855_soft_pouch",
    "rhsusf_200Rnd_556x45_M855_soft_pouch_ucp",
    "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote",
    "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_ucp",
    "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch",
    "TB_mag_100Rnd_556x45_Mk318_tracer",
    "TB_mag_100Rnd_556x45_Mk318_dim"
];

private _pilot_munition = [
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_AP",

    // .45 Cal
    "TB_mag_40Rnd_45_FMJ",
    "TB_mag_40Rnd_45_FMJ_Tracer_Red",
    "TB_mag_40Rnd_45_JHP",
    "TB_mag_40Rnd_45_JHP_Tracer_Red"
];

private _sniper_munition = [
    "rhsusf_mag_10Rnd_STD_50BMG_mk211",
    "rhsusf_mag_10Rnd_STD_50BMG_M33",
    "TB_mag_10Rnd_338_LS_Tracer",
    "TB_mag_10Rnd_338_LS_DIM",
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_AP"
];

private _aaat_munition = [
    "rhs_fgm148_magazine_AT",
    "rhs_fim92_mag"
];

private _gepaeck_klein = [
    // Gepäck
    "ASZ_BackPack_30lt_CB60",
    "ASZ_BackPack_30lt_CBT",
    "ASZ_BackPack_30lt_Tan",
    "ASZ_BackPack_30lt_Green"
];

private _gepaeck_mittel = [
    "ASZ_BackPack_40lt_CB60",
    "ASZ_BackPack_40lt_CBT",
    "ASZ_BackPack_40lt_Tan",
    "ASZ_BackPack_40lt_Green"
];

private _gepaeck_gross = [
    "ASZ_BackPack_50lt_CB60",
    "ASZ_BackPack_50lt_CBT",
    "ASZ_BackPack_50lt_Green",
    "ASZ_BackPack_50lt_Tan"
];

private _gepaeck_sehrgross = [
    "ASZ_BackPack_75lt_CB60",
    "ASZ_BackPack_75lt_CBT",
    "ASZ_BackPack_75lt_Green",
    "ASZ_BackPack_75lt_Tan"
];

private _lrFunken = [
    // ### LR-Funke
    "OPXT_blk_1523",    // schwarz
    "OPXT_aor1_1523",   // sand
    "OPXT_oga_1523",    // grün
    "OPXT_scorpion_1523",
    "OPXT_krtk_nom_1523",
    "OPXT_at_ix_1523",
    "OPXT_m81_1523",
    "OPXT_multicam_1523",
    "OPXT_at_au_1523",  // grau1
    "OPXT_ogag_1523",    //grau2
    // Workshop Funk
    "tfw_ilbe_blade_arid",
    "tfw_ilbe_blade_black",
    "tfw_ilbe_blade_mct",
    "tfw_ilbe_blade_mc",
    "tfw_ilbe_blade_ocp",
    "tfw_ilbe_blade_wd2",
    "tfw_ilbe_blade_coy"
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
// _pilot_munition                   - Piloten MP7/Vector Munition
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
            "ASZ_NC4_09_TL",

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
            "ASZ_NC4_09_Medic",

            // Kopfbedeckung
            "TB_helmet_Sani_A_Black",
            "TB_helmet_Sani_B_Grey",
            "TB_helmet_Sani_C_Green",

            // Rucksäcke
            "ASZ_BackPack_TSSI_M9_Med_Tan",
            "ASZ_BackPack_TSSI_M9_Med_Green"
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
            "TB_weap_Vector",

            // MP7 zubehör
            "rhsusf_weap_MP7A2_grip3",

            // Schrotflinte
            "rhs_weap_M590_8RD",
            "rhs_weap_M590_5RD",

            // ### Munition
            "rhsusf_8Rnd_00Buck",
            "rhsusf_8Rnd_Slug",
            "rhsusf_5Rnd_00Buck",
            "rhsusf_5Rnd_Slug",

            // ### Visiere
            "rhsusf_acc_mrds",
            "rhsusf_acc_mrds",
            "rhsusf_acc_compm4",
            "optic_yorris",
            "rhsusf_acc_eotech_552",

            // ### Geschützzubehör
            "rhsusf_acc_rotex_mp7",
            "rhsusf_acc_anpeq15a",

            // Rucksäcke
            "ASZ_BackPack_TSSI_M9_Med_Tan",
            "ASZ_BackPack_TSSI_M9_Med_Green",

            // Westen
            "ASZ_NC4_09_Medic",

            // Kopfbedeckung
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
            "ASZ_NC4_09_GL",

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
            "TB_weap_m249_light_S",

            // ### Geschützzubehör
            "rhsusf_acc_ARDEC_M240",
            "muzzle_snds_h_mg_blk_f",
            // ### Zweibein
            "rhsusf_acc_saw_lw_bipod",

            // Westen
            "ASZ_NC4_09_MG",

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
            "ASZ_NC4_09_naja",

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
        _allgemein_magazine +
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
            "TB_weap_Vector",

            // ### Visiere
            "rhsusf_acc_mrds",
            "rhsusf_acc_mrds",
            "rhsusf_acc_compm4",
            "optic_yorris",
            "rhsusf_acc_eotech_552",

            // ### Geschützzubehör
            "rhsusf_acc_rotex_mp7",
            "rhsusf_acc_anpeq15a",

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

            // Uniform
            "U_B_PilotCoveralls",
            "U_B_HeliPilotCoveralls",
            "rhs_uniform_cu_ocp",
            "rhs_uniform_cu_ucp",

            // Westen
            "TB_vest_iotv_ocp_mg_classIV",
            "TB_vest_iotv_ucp_mg_classIV",
            "TB_vest_spcs_ocp_mg_classIII",
            "TB_vest_spcs_ucp_mg_classIII",
            "TB_vest_plateframe_mg_classIII",
            "TB_vest_plateframe_mg_classIV",

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
        _AT_raketenwerfer +
        _HEDP_raketenwerfer +
        _gepaeck_mittel +
        _dmr_munition +
        _rifle_munition +
        [
            // Gewehre
            "APD_ARX200",
            "APD_ARX200sf",
            "APD_ARX200sf_VGrip",
            "APD_ARX200_VGrip",

            // ### Geschützzubehör
            "muzzle_snds_b",
            "muzzle_snds_b_snd_f",
            "rhsusf_acc_aac_762sdn6_silencer",
            "rhsusf_acc_harris_swivel",
            "asz_bipod_arx_blk",
            "asz_bipod_arx_des",

            // ### Visiere
            "optic_ams",
            "optic_ams_khk",
            "optic_ams_snd",
            "optic_sos",
            "asz_leupold_vxr_patrol",

            // Weste
            "ASZ_NC4_09_MarkS",

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
        _gepaeck_mittel +
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
            "TB_rhs_weap_mk22_ASR",
            "rhs_weap_m24sws",
            "rhs_weap_m24sws_d",
            "rhs_weap_m24sws_wd",
            "rhs_weap_m40a5",
            "rhs_weap_m40a5_d",
            "rhs_weap_m40a5_wd",

            // ### Visiere
            "rhsusf_acc_premier_anpvs27",
            "rhsusf_acc_premier",
            "rhsusf_acc_premier_mrds",
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
            "rhsusf_acc_m24_silencer_black",
            "rhsusf_acc_m24_silencer_d",
            "rhsusf_acc_m24_silencer_wd",

            // Uniforms
            "ASZ_GhillieSuit_des",
            "ASZ_GhillieSuit",

            // Westen
            "ASZ_NC4_09_MarkS",

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
            "ASZ_GhillieSuit_des",
            "ASZ_GhillieSuit",

            // Weste
            "ASZ_NC4_09_MarkS",

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
            "ASZ_NC4_09_naja",

            // Items
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ToolKit",
            "B_UavTerminal",
            "TB_MineDetector",

            // ### Minen
            "APERSMineDispenser_Mag",
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
            "APERSTripMine_Wire_Mag",

            // Gepäck
            "B_UGV_02_Demining_backpack_F"
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
        _AT_raketenwerfer +
        _HEDP_raketenwerfer +
        _gepaeck_mittel +
        _gepaeck_gross +
        [
            // Raketenwerfer
            "rhs_weap_fgm148",
            "rhs_weap_fim92"
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
            "B_UAV_06_backpack_F",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",

            // Vesten
            "ASZ_NC4_09_TL",

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
            "ASZ_NC4_09_naja",

            // Items
            "ACE_DefusalKit",
            "ToolKit",
            "B_UavTerminal",
            "TB_MineDetector"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items