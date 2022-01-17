/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: IDarky
*/
private _allgemein = [
    // Gesichtsbedeckung
    // ### Vanilla
    "G_Bandanna_beast",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_blk",
    "G_Aviator",

    // Atemschutz
    "G_AirPurifyingRespirator_02_olive_F",
    "G_AirPurifyingRespirator_02_sand_F",
    "G_AirPurifyingRespirator_02_black_F",
    "G_AirPurifyingRespirator_01_F",
    "G_RegulatorMask_F",

    // Bärte
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
    "G_Blindfold_01_black_F",
    "G_Blindfold_01_white_F",

    // Pistole
    "TB_weapon_rhino60",
    "hgun_ACPC2_F",
    "hgun_Pistol_heavy_01_green_F",
    "hgun_Rook40_F",
    "hgun_P07_F",
    "hgun_P07_blk_F",
    "hgun_P07_khk_F",
    "tb_weap_taser",

    //#Munition
    "11Rnd_45ACP_Mag",
    "TB_mag_taser",
    "16Rnd_9x21_yellow_Mag",
    "9Rnd_45ACP_Mag",
    "TB_mag_6Rnd_500_FMJ",
    "6Rnd_45ACP_Cylinder",

    // ESD
    "hgun_esd_01_F",
    "acc_esd_01_flashlight",
    "muzzle_antenna_02_f",
    "muzzle_antenna_01_f",
    "muzzle_antenna_03_f",


    // Rucksäcke
    "B_CombinationUnitRespirator_01_F",
    "B_SCBA_01_F",
    "B_Kitbag_sgg",
    "B_Kitbag_rgr",

    // Items
    "ACE_CableTie",
    "ACE_wirecutter",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
    "ACE_Altimeter",
    "Binocular",
    "ItemWatch",
    "ItemCompass",
    "ACE_microDAGR",
    "ItemGPS",
    "ItemMap",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",
    "ACE_Sandbag_empty",
    "ACE_ConcertinaWireCoil",
    "AMP_Breaching_Charge_Mag",
    "ACE_rope36",
    "APERSMineDispenser_Mag",

    // NV
    "O_NVGoggles_grn_F",
    "ACE_NVG_Wide",

    // Granaten
    "HandGrenade",
    "MiniGrenade",
    "SmokeShell",
    "SmokeShellYellow",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellPurple",
    "SmokeShellBlue",
    "SmokeShellOrange",
    "I_E_IR_Grenade",

    // SR-Funke
    "TFAR_anprc152"
];

private _allgemein_Uniform = [
    "U_I_E_Uniform_01_F",
    "U_I_E_Uniform_01_sweater_F",
    "U_I_E_Uniform_01_tanktop_F",
    "U_I_E_Uniform_01_shortsleeve_F",
    "U_B_CombatUniform_tshirt_mcam_wdL_f",
    "U_I_E_CBRN_Suit_01_EAF_F"
];

private _allgemein_Westen = [
    "V_CarrierRigKBT_01_light_Olive_F",
    "V_CarrierRigKBT_01_light_EAF_F",
    "V_CarrierRigKBT_01_EAF_F",
    "V_SmershVest_01_F"
];

private _LR = [
    "B_RadioBag_01_digi_F",
    "B_RadioBag_01_eaf_F",
    "B_RadioBag_01_black_F",
    "B_RadioBag_01_tropic_F",
    "B_RadioBag_01_wdl_F"
];

private _allgemein_Helm = [
    "H_HelmetHBK_headset_F",
    "H_HelmetHBK_chops_F",
    "H_HelmetHBK_ear_F",
    "H_HelmetHBK_F"
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

private _moerser_munition = [
    "TB_vz99_HE",
    "TB_vz99_HE_multi",
    "TB_vz99_smokeWhite",
    "TB_vz99_smokeRed",
    "TB_vz99_flare"
];

private _allgemein_zweibein = [
    "bipod_02_f_tan",
    "bipod_02_f_hex",
    "bipod_01_f_khk",
    "bipod_01_f_mtp",
    "bipod_03_f_oli",
    "bipod_01_f_snd",
    "bipod_03_f_blk",
    "bipod_02_f_blk",
    "bipod_01_f_blk",
    "bipod_02_f_arid",
    "bipod_02_f_lush"
];

private _allgemein_geschuetzzubehoer = [

    // Pistolen
    "acc_flashlight_pistol",
    "muzzle_snds_acp",
    "muzzle_snds_l",

    // Waffen
    "acc_flashlight",
    "ace_acc_pointer_green",
    "ace_acc_pointer_red",
    "muzzle_snds_65_ti_blk_f",
    "muzzle_snds_65_ti_ghex_f",
    "muzzle_snds_h",
    "muzzle_snds_b",
    "muzzle_snds_m",
    "muzzle_snds_570"
];

private _allgemein_visiere = [
    // Pistolen
    "optic_yorris",
    "optic_mrd",
    "optic_mrd_black",

    // Waffen
    "optic_aco_grn",
    "optic_aco",
    "optic_mrco",
    "optic_erco_snd_f",
    "optic_erco_khk_f",
    "optic_erco_blk_f",
    "optic_arco_ak_blk_f",
    "optic_arco_ak_arid_f",
    "optic_arco_ak_lush_f",
    "optic_holosight_arid_f",
    "optic_holosight_lush_f"
];

private _allgemein_kopfbedeckung = [
    "H_Booniehat_mgrn",
    "H_Booniehat_taiga",
    "H_Booniehat_wdl",
    "H_Booniehat_eaf",
    "H_MilCap_grn",
    "H_MilCap_taiga",
    "H_MilCap_wdl",
    "H_MilCap_eaf",
    "H_Bandanna_camo",
    "H_Bandanna_gry",
    "H_Watchcap_khk",
    "H_Watchcap_cbr",
    "H_Watchcap_camo",
    "H_Bandanna_khk_hs"
];

private _grenadier_gewehr = [
    "arifle_MSBS65_GL_F",
    "arifle_MSBS65_GL_sand_F",
    "arifle_MSBS65_GL_black_F",
    "arifle_MSBS65_GL_camo_F"
];

private _grenadier_munition = [
    "3Rnd_Smoke_Grenade_shell_precise",
    "1Rnd_HE_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokeYellow_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeOrange_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_SmokePurple_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "ACE_HuntIR_M203",
    "UGL_FlareCIR_F",
    "ACE_40mm_Flare_ir",
    "TB_rhs_mag_40mm_IR_Grenade"
];

private _sniper_munition = [
    "ACE_7Rnd_408_305gr_Mag",
    "TB_mag_7Rnd_M200_Tracer",
    "ACE_5Rnd_127x99_Mag",
    "ACE_5Rnd_127x99_AMAX_Mag",
    "ACE_5Rnd_127x99_API_Mag",
    "5Rnd_127x108_APDS_Mag",
    "ACE_20Rnd_762x51_Mag_SD",
    "ACE_20Rnd_762x51_Mag_Tracer_Dim",
    "ACE_20Rnd_762x51_Mag_Tracer"
];

private _aaat_munition = [
    "RPG32_F",
    "RPG32_HE_F",
    "Vorona_HEAT",
    "Vorona_HE",
    "Titan_AT",
    "Titan_AP",
    "Titan_AA",
    "MRAWS_HEAT_F",
    "MRAWS_HE_F"
];

private _mg_munition = [
    "ACE_200Rnd_65x39_cased_Box_Tracer_Dim",
    "200Rnd_65x39_cased_Box_Tracer",
    "200Rnd_65x39_cased_Box",
    "200Rnd_556x45_Box_Tracer_F",
    "200Rnd_556x45_Box_F",
    "130Rnd_338_Mag"
];

private _mp_munition = [
    "30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
    "30Rnd_45ACP_Mag_SMG_01",
    "50Rnd_570x28_SMG_03",
    "30Rnd_9x21_Red_Mag",
    "30Rnd_9x21_Mag_SMG_02_Tracer_Red"

];

private _mp = [
    "SMG_03C_TR_camo",
    "SMG_03C_TR_hex",
    "SMG_03C_TR_khaki",
    "SMG_03C_TR_black",
    "hgun_PDW2000_F",
    "SMG_02_F",
    "SMG_05_F",
    "SMG_01_F"
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
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _LR +
        [
        
        "U_I_E_Uniform_01_officer_F",

        // Ferngläser
        "Laserdesignator_01_khk_F",
        "Laserdesignator_03",
        "Laserdesignator",
        "ACE_MX2A", // Thermal
        "ACE_Vector", // Tag/Nacht Version

        // Items
        "ACE_HuntIR_monitor",
        "Laserbatteries"

        ]
    };

    case "sani":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [

        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _mp_munition +
        _mp +
        _LR +
        [
        ]
    };

    case "grena":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _grenadier_gewehr +
        _grenadier_munition +
        [
        ]
    };


    case "mg":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _mg_munition +
        [
            // Waffen
            "LMG_Mk200_black_F",
            "LMG_03_F",
            "MMG_02_camo_F",
            "MMG_02_sand_F",
            "MMG_02_black_F"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _moerser_munition +
        _mg_munition +
        _aaat_munition +
        _sniper_munition +
        [
            // Rucksack
            "B_Carryall_eaf_F",
            "B_Carryall_green_F",
            "TB_backpacks_bergen_m81",
            "TB_backpacks_bergen_marpad_wd",

            // Waffen
            "TB_vz99_carryWeapon"

        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _mp_munition +
        _mp +
        _LR +
        [
            // Helm
            "H_PilotHelmetFighter_I_E",
            "H_CrewHelmetHeli_I_E",
            "H_PilotHelmetHeli_I_E",

            //items
            "ToolKit",

            // Uniform
            "U_I_E_Uniform_01_coveralls_F",
            "U_O_R_Gorka_01_black_F"
        ]
    };

    case "jtac":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
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
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
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
            "optic_dms_weathered_f"
        ]
    };

    case "aaat":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _aaat_munition +

        [
            // Waffe
            "launch_RPG32_green_F",
            "launch_RPG32_F",
            "launch_MRAWS_green_F",         // kann Entfernung messen (ungelenkt)
            "launch_MRAWS_olive_F",
            "launch_MRAWS_sand_F",
            "launch_O_Vorona_brown_F",      // kabelgelenkt
            "launch_O_Vorona_green_F",
            "launch_B_Titan_F",
            "launch_O_Titan_F",
            "launch_B_Titan_short_F",
            "launch_I_Titan_short_F"
        ]
    };

    case "pionier":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        _mp_munition +
        _mp +
        _LR +
        [
            // Uniform
            "U_I_E_Uniform_01_coveralls_F",
            "U_O_R_Gorka_01_black_F",

            // Rucksack
            "B_Carryall_eaf_F",
            "B_Carryall_green_F",

            // Drohne
            "I_E_UGV_02_Demining_backpack_F",
            "I_E_UGV_02_Science_backpack_F",
            "I_E_UavTerminal",

            // Westen
            "V_CarrierRigKBT_01_heavy_EAF_F",
            "V_CarrierRigKBT_01_heavy_Olive_F",

            // Items
            "MineDetector",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ToolKit",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",

            // Minen
            "ATMine_Range_Mag",
            "APERSMine_Range_Mag",
            "APERSBoundingMine_Range_Mag",
            "SLAMDirectionalMine_Wire_Mag",
            "APERSTripMine_Wire_Mag",
            "ClaymoreDirectionalMine_Remote_Mag",
            "DemoCharge_Remote_Mag"
        ]
    };

    case "sniper":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _sniper_munition +
        _grenadier_munition +
        [
            // Uniform
            "U_B_T_FullGhillie_tna_F",
            "U_B_FullGhillie_lsh",
            "U_B_FullGhillie_ard",

            // Gewehre
            "srifle_LRR_camo_F",
            "srifle_LRR_F",
            "srifle_LRR_tna_F",
            "srifle_GM6_F",
            "srifle_DMR_06_hunter_F",
            "srifle_DMR_06_olive_F",

            // ### Visiere
            "optic_lrps",
            "optic_lrps_tna_f",
            "ace_optic_lrps_2d",
            "ace_optic_sos_2d",
            "optic_ams",
            "optic_ams_khk",
            "optic_ams_snd",
            "optic_khs_blk",
            "optic_khs_old",
            "optic_khs_tan",


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
        _allgemein_Helm +
        _allgemein_kopfbedeckung +
        _allgemein_visiere +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _grenadier_gewehr +
        _grenadier_munition +
        _sniper_munition +
        _LR +
        [
            // Uniform
            "U_B_T_FullGhillie_tna_F",
            "U_B_FullGhillie_lsh",
            "U_B_FullGhillie_ard",

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
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ACE_HuntIR_monitor",
            "APERSTripMine_Wire_Mag",
            "Laserbatteries"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
