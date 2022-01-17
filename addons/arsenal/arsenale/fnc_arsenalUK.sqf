/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: Darky, Eron
*/
private _allgemein = [
    // Gepäck
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
    "UK3CB_BAF_G_Tactical_Orange",
    "UK3CB_BAF_G_Tactical_Yellow",
    "UK3CB_BAF_G_Tactical_Grey",
    "UK3CB_BAF_G_Tactical_Clear",
    "UK3CB_BAF_G_Tactical_Black",
    "UK3CB_BAF_G_Balaclava_Win",       // Nur für Wintermissionen
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
    "UK3CB_ANPVS7",
    "UK3CB_BAF_HMNVS",

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
    // ### Sprengstoff
    "AMP_Breaching_Charge_Mag",
    // ### ITC Tablet
    "itc_land_tablet_rover"
];

private _allgemein_magazine = [
    "UK3CB_BAF_556_30Rnd",
    "UK3CB_BAF_556_30Rnd_T"
];

private _allgemein_gewehre = [
    "UK3CB_BAF_L22",
    "UK3CB_BAF_L22A2",
    "UK3CB_BAF_L85A2",
    "UK3CB_BAF_L85A2_RIS",
    "UK3CB_BAF_L85A2_RIS_Green",
    "UK3CB_BAF_L85A2_RIS_Tan"
];

_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "rksl_optic_eot552",        // Holo
    "rksl_optic_lds",
    "rksl_optic_lds_c",
    "rksl_optic_rmr_rm33",      // Mini Holo
    "uk3cb_baf_ta31f",
    "uk3cb_baf_ta31f_hornbill",
    "uk3cb_baf_ta648",
    "uk3cb_baf_ta648_308",
    "optic_erco_snd_f",
    "optic_erco_khk_f",
    "optic_erco_blk_f",
    "optic_mrco",
    "rhsusf_acc_ACOG",
    "rhsusf_acc_acog_rmr",
    "rhsusf_acc_ACOG_d",
    "rhsusf_acc_ACOG_wd"
];

private _allgemein_befestigungsschiene = [
    "ace_acc_pointer_green",
    "ace_acc_pointer_red",
    "uk3cb_baf_llm_flashlight_black",
    "uk3cb_baf_llm_ir_black"
];

private _allgemein_geschuetzzubehoer = [
    "uk3cb_baf_silencer_l85",
    "uk3cb_baf_sffh"
];

private _allgemein_zweibein = [

];

private _allgemein_raketenwerfer = [
    "TB_rhs_weap_M136_CS",
    "rhs_weap_M136_hedp",
    "rhs_weap_m72a7",
    "rhs_weap_M136",
    "launch_NLAW_F",
    // ### Befestigungsschiene
    "rhs_acc_at4_handler",
    // ### Munition
    "rhs_m136_mag",
    "rhs_m136_hedp_mag",
    "rhs_m136_CS_mag",
    "rhs_m72a7_mag"
];

private _allgemein_handfeuerwaffen = [
    "tb_weap_taser",
    "UK3CB_BAF_L105A1",
    "UK3CB_BAF_L105A2",
    "UK3CB_BAF_L107A1",
    "UK3CB_BAF_L117A2",
    "UK3CB_BAF_L131A1",
    "UK3CB_BAF_L9A1",
    "TB_weap_glock18",

    // ### Befestigungsschiene
    "acc_flashlight_pistol",
    "uk3cb_baf_flashlight_l105a1",
    "uk3cb_baf_l105a1_llm_ir_g",
    "uk3cb_baf_l105a1_llm_ir_r",

    // ### Geschützzubehör
    "rhsusf_acc_omega9k",
    "uk3cb_baf_silencer_l105a1",
    "muzzle_snds_l",

    // ### Munition
    "TB_mag_taser",
    "UK3CB_BAF_9_15Rnd",
    "UK3CB_BAF_9_17Rnd",
    "UK3CB_BAF_9_13Rnd",
    "30Rnd_9x21_Green_Mag",
    "TB_mag_33Rnd_9x19_JHP",
    "TB_mag_33Rnd_9x19_FMJ"
];

private _allgemein_uniformen = [
    // Sand Tarnung
    "UK3CB_BAF_U_CombatUniform_DDPM",
    "UK3CB_BAF_U_CombatUniform_DDPM_ShortSleeve",

    // Wald Tarnung
    "UK3CB_BAF_U_CombatUniform_DPMT",
    "UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve",
    "UK3CB_BAF_U_CombatUniform_DPMW",
    "UK3CB_BAF_U_CombatUniform_DPMW_ShortSleeve",

    // Multicam
    "UK3CB_BAF_U_CombatUniform_MTP",
    "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",

    // Schneetarnung
    "UK3CB_BAF_U_Smock_Arctic"
];

private _allgemein_westen = [
    // Sandtarn
    "UK3CB_BAF_V_Osprey_DDPM1",
    "UK3CB_BAF_V_Osprey_DDPM2",
    "UK3CB_BAF_V_Osprey_DDPM5",
    "UK3CB_BAF_V_Osprey_DDPM8",

    // Waldtarn
    "UK3CB_BAF_V_Osprey_DPMT1",
    "UK3CB_BAF_V_Osprey_DPMT2",
    "UK3CB_BAF_V_Osprey_DPMT4",
    "UK3CB_BAF_V_Osprey_DPMT8",
    "UK3CB_BAF_V_Osprey_DPMW2",
    "UK3CB_BAF_V_Osprey_DPMW5",
    "UK3CB_BAF_V_Osprey_DPMW8",

    // Multicam
    "UK3CB_BAF_V_Osprey_Belt_A",
    "UK3CB_BAF_V_Osprey_Holster",
    "UK3CB_BAF_V_Osprey_Marksman_A",
    "UK3CB_BAF_V_Osprey_MG_B",
    "UK3CB_BAF_V_Osprey_Rifleman_B",
    "UK3CB_BAF_V_Osprey_SL_D",

    // Schneetarn
    "UK3CB_BAF_V_Osprey_Winter"
];

private _allgemein_kopfbedeckung = [
    // Schneetarn
    "UK3CB_BAF_H_Mk7_Win_A",
    "UK3CB_BAF_H_Mk7_Win_ESS_A",

    // Sandtarn
    "UK3CB_BAF_H_Mk6_DDPM_A",
    "UK3CB_BAF_H_Mk6_DDPM_C",

    // Waldtarn
    "UK3CB_BAF_H_Mk6_DPMT_A",
    "UK3CB_BAF_H_Mk6_DPMT_C",
    "UK3CB_BAF_H_Mk6_DPMT_F",
    "UK3CB_BAF_H_Mk6_DPMW_C",
    "UK3CB_BAF_H_Mk6_DPMW_F",

    // Multicam
    "UK3CB_BAF_H_Mk7_Camo_A",
    "UK3CB_BAF_H_Mk7_Camo_B",
    "UK3CB_BAF_H_Mk7_Camo_ESS_A",
    "UK3CB_BAF_H_Mk7_Camo_ESS_B",
    "UK3CB_BAF_H_Mk7_Net_A",
    "UK3CB_BAF_H_Mk7_Net_B",
    "UK3CB_BAF_H_Mk7_Net_ESS_A",
    "UK3CB_BAF_H_Mk7_Scrim_B",
    "UK3CB_BAF_H_Mk7_Scrim_E",
    "UK3CB_BAF_H_Mk7_Scrim_ESS_B",
    "UK3CB_BAF_H_Mk7_Scrim_ESS_C"
];

private _grenadier_gewehr = [
    "UK3CB_BAF_L85A2_UGL",
    "UK3CB_BAF_L85A2_UGL_HWS"
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
];

private _rifle_munition = [
    // 7.62
    "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr",
    "rhs_mag_20Rnd_SCAR_762x51_m62_tracer",
    "rhs_mag_20Rnd_SCAR_762x51_m80_ball"
];

private _mg_munition = [
    // 7.62
    "UK3CB_BAF_762_200Rnd_T",
    "UK3CB_BAF_762_200Rnd",
    "UK3CB_BAF_762_100Rnd_T",
    "UK3CB_BAF_762_100Rnd",
    // 5.56
    "UK3CB_BAF_556_200Rnd_T",
    "UK3CB_BAF_556_200Rnd"

];

private _pilot_munition = [
    "UK3CB_BAF_9_30Rnd"
];

private _sniper_munition = [
    "rhsusf_mag_10Rnd_STD_50BMG_M33",
    "rhsusf_mag_10Rnd_STD_50BMG_mk211"
];

private _aaat_munition = [
    "rhs_mag_smaw_HEDP",
    "rhs_mag_smaw_HEAA",
    "rhs_mag_maaws_HEAT",
    "rhs_mag_maaws_HEDP",
    "rhs_mag_maaws_HE",
    "rhs_fgm148_magazine_AT",
    "rhs_fim92_mag",
    "rhs_mag_smaw_SR"
];

private _gepaeck_mittel = [
    // Bergen
    "UK3CB_BAF_B_Bergen_Arctic_Rifleman_A",
    "UK3CB_BAF_B_Bergen_DDPM_Rifleman_A",
    "UK3CB_BAF_B_Bergen_DPMT_Rifleman_A",
    "UK3CB_BAF_B_Bergen_DPMW_Rifleman_A",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",
    "UK3CB_BAF_B_Bergen_OLI_Rifleman_A",
    "UK3CB_BAF_B_Bergen_TAN_Rifleman_A",

    // Kitbag
    "UK3CB_BAF_B_Kitbag_Arctic",
    "UK3CB_BAF_B_Kitbag_DDPM",
    "UK3CB_BAF_B_Kitbag_DPMT",
    "UK3CB_BAF_B_Kitbag_DPMW",
    "UK3CB_BAF_B_Kitbag_MTP",
    "UK3CB_BAF_B_Kitbag_OLI",
    "UK3CB_BAF_B_Kitbag_TAN"
];

private _gepaeck_gross = [
    // Carryall
    "UK3CB_BAF_B_Carryall_Arctic",   // maximumLoad = 320; mass = 60; Quotient = 5,3
    "UK3CB_BAF_B_Carryall_DDPM",
    "UK3CB_BAF_B_Carryall_DPMT",
    "UK3CB_BAF_B_Carryall_DPMW",
    "UK3CB_BAF_B_Carryall_MTP",
    "UK3CB_BAF_B_Carryall_OLI",
    "UK3CB_BAF_B_Carryall_TAN"
];

private _lrFunken = [
    // LR 20km
    "UK3CB_BAF_B_Bergen_Arctic_SL_A",
    "UK3CB_BAF_B_Bergen_DDPM_SL_A",
    "UK3CB_BAF_B_Bergen_DPMT_SL_A",
    "UK3CB_BAF_B_Bergen_DPMW_SL_A",
    "UK3CB_BAF_B_Bergen_MTP_Radio_L_A",
    "UK3CB_BAF_B_Bergen_OLI_SL_A",
    "UK3CB_BAF_B_Bergen_TAN_SL_A",

    // LR 40km
    "UK3CB_BAF_B_Bergen_Arctic_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_DDPM_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_DPMW_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_TAN_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_MTP_JTAC_H_A"
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
// _allgemein_raketenwerfer          - einmal Raketenwerfer
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
        [
            // Handwaffen
            "rhs_weap_M320",
            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",
            "UK3CB_BAF_Soflam_Laserdesignator",
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
            "UK3CB_BAF_V_Osprey_Medic_A",
            "UK3CB_BAF_V_Osprey_Medic_B",

            // Rucksack
            "UK3CB_BAF_B_Bergen_MTP_Medic_L_B",
            "UK3CB_BAF_B_Bergen_MTP_Medic_L_A"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_visiere +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _gepaeck_mittel +
        _pilot_munition +
        [
            // Waffen
            "UK3CB_BAF_L92A1",
            "UK3CB_BAF_L128A1",

            // ### Munition
            "UK3CB_BAF_12G_Pellets",
            "UK3CB_BAF_12G_Slugs",

            // Westen
            "UK3CB_BAF_V_Osprey_Medic_A",
            "UK3CB_BAF_V_Osprey_Medic_B",

            // Rucksack
            "UK3CB_BAF_B_Bergen_MTP_Medic_L_B",
            "UK3CB_BAF_B_Bergen_MTP_Medic_L_A"
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
        _allgemein_kopfbedeckung +
        _grenadier_gewehr +
        _grenadier_munition +
        _gepaeck_mittel +
        [
            // Westen
            "UK3CB_BAF_V_Osprey_DDPM3",
            "UK3CB_BAF_V_Osprey_DPMT3",
            "UK3CB_BAF_V_Osprey_DPMW3",
            "UK3CB_BAF_V_Osprey_Grenadier_B",
            // Schneetarnung
            "UK3CB_BAF_U_Smock_Arctic",
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
        _gepaeck_mittel +
        [
            // Gewehre
            "UK3CB_BAF_L7A2",
            "UK3CB_BAF_L110A3",

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
        _sniper_munition    +
        _aaat_munition +
        _gepaeck_gross +
        _moerser_munition +
        [
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
        _allgemein_uniformen +
        _allgemein_westen +
        _lrFunken +
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
            "UK3CB_BAF_L92A1",
            "UK3CB_BAF_L91A1",

            // Kopfbedeckung
            "H_PilotHelmetFighter_B",

            // Uniform
            "UK3CB_BAF_U_HeliPilotCoveralls_Army",
            "UK3CB_BAF_U_HeliPilotCoveralls_RAF",
            "UK3CB_BAF_U_HeliPilotCoveralls_RN",

            // Items
            "ToolKit"
        ]
    };

    case "rifle":
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
        _gepaeck_mittel +
        _moerser_munition +
        _dmr_munition +
        _rifle_munition +
        [
            // Spezial
            "ACE_Kestrel4500",
            "ACE_RangeCard",

            // Waffen
            "TB_vz99_carryWeapon",
            "UK3CB_BAF_L86A3",
            "UK3CB_BAF_L86A2",
            "rhs_weap_mk17_STD",
            "rhs_weap_mk17_LB",
            "rhs_weap_mk17_CQC"
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
        _dmr_munition +
        _allgemein_uniformen +
        [
            // Gewehre
            "rhs_weap_M107_w",

            // ### Visiere
            "rhsusf_acc_premier_anpvs27",
            "rhsusf_acc_premier",
            "rhsusf_acc_premier_mrds",
            "rhsusf_acc_LEUPOLDMK4_2",
            "rhsusf_acc_LEUPOLDMK4_2_d",
            "optic_lrps",
            "ace_optic_lrps_2d",
            "ace_optic_sos_2d",
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
        _allgemein_raketenwerfer +
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
        [
            // Handwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Rucksack
            "UK3CB_BAF_B_Bergen_MTP_Sapper_L_A",    // Rucksack mit visuellem Minendetektor, Mulicam
            "UK3CB_BAF_B_Bergen_MTP_Engineer_L_A",  //                        Brechstange,   Multicam
            // Items
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ACE_DeadManSwitch",
            "ToolKit",
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
        [
            // Handfeuerwaffen
            "ACE_VMH3",
            "ACE_VMM3",

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
