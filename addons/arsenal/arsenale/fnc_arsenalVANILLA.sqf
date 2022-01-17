/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: IDarky
*/
private _allgemein = [
    // Gesichtsbedeckung
    "G_Bandanna_shades",
    "G_Bandanna_beast",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_blk",
    "G_Bandanna_sport",
    "G_Combat",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Shades_Black",
    "G_Balaclava_combat",
    "G_Balaclava_lowprofile",
    "G_Balaclava_oli",
    "G_Balaclava_blk",
    "G_Tactical_Clear",
    "G_Tactical_Black",
    "G_Headset_lxWS",
    "G_Combat_lxWS",
    "G_Balaclava_snd_lxWS",
    "G_Balaclava_blk_lxWS",
    "G_Balaclava_oli_lxWS",

    // Pistolen + Munition
    "hgun_Pistol_heavy_01_F",
    "hgun_Pistol_heavy_01_green_F",
    "hgun_P07_F",
    "hgun_P07_khk_F",
    "tb_weap_taser",
    "16Rnd_9x21_green_Mag",
    "TB_mag_taser",
    "11Rnd_45ACP_Mag",

    // Rucksäcke
    "ACE_TacticalLadder_Pack",
    "B_Kitbag_cbr",
    "B_Kitbag_sgg",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo",
    "B_Parachute",
    "B_Kitbag_desert_lxWS",
    "B_shield_backpack_lxWS",

    // Attachments
    "acc_flashlight",
    "ACE_acc_pointer_green",
    "ace_acc_pointer_red",
    "ACE_muzzle_mzls_H",
    "muzzle_snds_H",
    "muzzle_snds_H_snd_F",
    "bipod_01_F_snd",
    "bipod_01_F_blk",
    "ACE_muzzle_mzls_smg_01",
    "muzzle_snds_acp",
    "ACE_muzzle_mzls_smg_02",
    "muzzle_snds_L",
    "muzzle_snds_m",
    "muzzle_snds_m_khk_f",
    "muzzle_snds_m_snd_f",
    "muzzle_snds_h_mg_blk_f",
    "muzzle_snds_h_mg",
    "muzzle_snds_h_mg_khk_f",
    "muzzle_snds_b_khk_f",
    "muzzle_snds_b_snd_f",
    "muzzle_snds_b",
    "bipod_02_f_mtp",
    "bipod_02_f_snd",
    "bipod_02_f_blk",

    // Items
    "ACE_NVG_Gen4",
    "ACE_CableTie",
    "ACE_IR_Strobe_Item",
    "ACE_Altimeter",
    "ACE_wirecutter",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
    "Binocular",
    "ACE_microDAGR",
    "ItemGPS",
    "ItemWatch",
    "ItemCompass",
    "ItemMap",
    "ACE_HuntIR_monitor",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",
    "ACE_Sandbag_empty",
    "ACE_UAVBattery",
    "ACE_HuntIR_M203",
    "ACE_ConcertinaWireCoil",
    "AMP_Breaching_Charge_Mag",
    // ### ITC Tablet
    "itc_land_tablet_rover",

    // Visiere
    "optic_ACO_grn_smg",
    "optic_ACO_grn_smg",
    "optic_ACO_grn",
    "optic_Aco",
    "optic_Holosight",
    "optic_Holosight_smg",
    "optic_Arco",
    "optic_Arco_blk_F",
    "optic_ERCO_snd_F",
    "optic_ERCO_blk_F",
    "optic_Hamr",
    "optic_MRCO",
    "optic_NVS",
    "optic_MRD",
    "optic_mrd_black",
    "optic_holosight_khk_f",
    "optic_holosight",
    "optic_yorris",

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
    "ACE_M84",

    // Unterlaufgranten
    "1Rnd_HE_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeYellow_Grenade_shell",
    "1Rnd_SmokePurple_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokeOrange_Grenade_shell",
    "3Rnd_HE_Grenade_shell",
    "3Rnd_Smoke_Grenade_shell",
    "3Rnd_SmokeRed_Grenade_shell",
    "3Rnd_SmokeGreen_Grenade_shell",
    "3Rnd_SmokeYellow_Grenade_shell",
    "3Rnd_SmokePurple_Grenade_shell",
    "3Rnd_SmokeBlue_Grenade_shell",
    "3Rnd_SmokeOrange_Grenade_shell",
    "UGL_FlareWhite_F",
    "UGL_FlareGreen_F",
    "UGL_FlareRed_F",
    "UGL_FlareYellow_F",
    "UGL_FlareCIR_F",
    "6rnd_Smoke_Mag_lxWS",
    "6rnd_HE_Mag_lxWS",
    "6Rnd_12Gauge_Slug",
    "6Rnd_12Gauge_Pellets",
    "ACE_6Rnd_12Gauge_Pellets_No0_Buck",
    "ACE_6Rnd_12Gauge_Pellets_No4_Bird",
    "3Rnd_Smoke_Grenade_shell_precise",
    "TB_rhs_mag_40mm_IR_Grenade",

    // SR-Funke
    "TFAR_anprc152",

    // Diving
    "G_B_Diving",
    "U_B_Wetsuit",
    "V_RebreatherB",

    // Mörser Rounds
    "ACE_1Rnd_82mm_Mo_HE",
    "ACE_1Rnd_82mm_Mo_Smoke",
    "ACE_1Rnd_82mm_Mo_Illum"
];

private _allgemein_Uniform = [
    "U_B_CTRG_1",
    "U_B_CTRG_2",
    "U_B_CTRG_3",
    "U_B_CTRG_Soldier_urb_1_F",
    "U_B_CTRG_Soldier_urb_2_F",
    "U_B_CTRG_Soldier_urb_3_F",
    "U_B_CTRG_Soldier_F",
    "U_B_CTRG_Soldier_2_F",
    "U_B_CTRG_Soldier_3_F",
    "U_B_CombatUniform_mcam",
    "U_B_CombatUniform_mcam_tshirt",
    "U_B_CombatUniform_mcam_vest",
    "U_B_CombatUniform_mcam_wdl_f",
    "U_B_CombatUniform_tshirt_mcam_wdL_f",
    "U_B_CombatUniform_vest_mcam_wdl_f",
    "U_B_T_Soldier_F",
    "U_B_T_Soldier_AR_F",
    "U_B_T_Soldier_SL_F",
    "U_B_CBRN_Suit_01_Wdl_F",
    "U_B_CBRN_Suit_01_MTP_F",
    "U_B_CBRN_Suit_01_Tropic_F",
    "U_lxWS_B_CombatUniform_desert_vest",
    "U_lxWS_B_CombatUniform_desert",
    "U_lxWS_B_CombatUniform_desert_tshirt",
    "U_lxWS_UN_Camo2",
    "U_lxWS_UN_Camo3"
];

private _allgemein_Westen = [
    "V_PlateCarrierSpec_rgr",
    "V_PlateCarrierSpec_tna_F",
    "V_PlateCarrierSpec_mtp",
    "V_PlateCarrierSpec_blk",
    "V_PlateCarrierSpec_wdl",
    "V_PlateCarrier2_rgr_noflag_F",
    "V_PlateCarrier2_blk",
    "V_PlateCarrier2_wdl",
    "V_PlateCarrier2_tna_F",
    "V_CarrierRigKBT_01_Olive_F",
    "V_CarrierRigKBT_01_light_Olive_F",
    "V_SmershVest_01_F",
    "V_SmershVest_01_radio_F",
    "V_lxWS_PlateCarrierGL_desert",
    "V_lxWS_UN_Vest_Lite_F",
    "V_lxWS_PlateCarrier1_desert",
    "V_lxWS_PlateCarrierSpec_desert",
    "V_lxWS_PlateCarrier2_desert"
];
private _mg_waffen = [
    
    "arifle_MX_SW_F",
    "arifle_MX_SW_Black_F",
    "arifle_MX_SW_khk_F",
    "arifle_SPAR_02_blk_F",
    "arifle_SPAR_02_snd_F",
    "arifle_SPAR_02_khk_F",
    "LMG_03_F",
    "LMG_Mk200_F",
    "LMG_Mk200_black_F",
    "LMG_Zafir_F",
    "TB_weap_Mk48"
];

private _mg_munition = [

    "150Rnd_556x45_Drum_Mag_Tracer_F",
    "100Rnd_65x39_caseless_mag_Tracer",
    "75Rnd_556x45_Stanag_lxWS",

    // MK 200
    "200Rnd_65x39_cased_Box_Red",
    "200Rnd_65x39_cased_Box_Tracer",

    // Zafir
    "150Rnd_762x54_Box",
    "150Rnd_762x54_Box_Tracer",

    // Minimi (Apex)
    "200Rnd_556x45_Box_Tracer_F",
    "200Rnd_556x45_Box_F",

    // Mk 48 (TB) .338
    "TB_mag_100Rnd_338_LS_DIM",
    "TB_mag_100Rnd_338_LS_Tracer"
];

private _LR = [
    // schwarz
    "OPXT_blk_1523",
    // tropen
    "OPXT_at_ix_1523",
    "OPXT_at_fg_1523",
    "OPXT_multicamt_1523",
    // MTP+Multicam
    "OPXT_scorpion_1523",
    "OPXT_multicam_1523",
    "OPXT_wht_1523",

    // Vanilla
    "B_RadioBag_01_mtp_F",
    "B_RadioBag_01_black_F",
    "B_RadioBag_01_tropic_F",
    "B_RadioBag_01_wdl_F",

    // Wüste
    "OPXT_aor1_1523",
    "OPXT_oga_1523"
];

private _allgemein_Helm = [
    // Head
    "H_HelmetSpecB",
    "H_HelmetSpecB_paint1",
    "H_HelmetSpecB_sand",
    "H_HelmetSpecB_snakeskin",
    "H_HelmetSpecB_blk",
    "H_HelmetB_Enh_tna_F",
    "H_HelmetSpecB_paint2",
    "H_HelmetB_light_wdl",
    "H_HelmetSpecB_wdl",
    "lxWS_H_PASGT_basic_UN_F",
    "lxWS_H_PASGT_goggles_UN_F",
    "lxWS_H_PASGT_goggles_olive_F",
    "lxWS_H_PASGT_goggles_black_F",
    "lxWS_H_PASGT_goggles_white_F",
    "lxWS_H_Booniehat_desert",
    "lxWS_H_CapB_rvs_blk_ION",
    "lxWS_H_MilCap_desert"
];

private _allgemein_Waffen = [
    "arifle_MX_F",
    "arifle_MX_Black_F",
    "arifle_MX_khk_F",
    "arifle_SPAR_01_blk_F",
    "arifle_SPAR_01_snd_F",
    "arifle_SPAR_01_khk_F",
    "arifle_XMS_Base_lxWS",
    "arifle_XMS_Base_khk_lxWS",
    "arifle_XMS_Base_Sand_lxWS",
    "arifle_XMS_M_lxWS",
    "arifle_XMS_M_khk_lxWS",
    "arifle_XMS_M_Sand_lxWS",
    "TB_weapon_MPR",
    "TB_weap_Vector"
];

private _allgemein_Magazine = [
    "30Rnd_65x39_caseless_mag",
    "30Rnd_65x39_caseless_mag_Tracer",
    "30Rnd_556x45_Stanag_Tracer_Red",
    "30Rnd_556x45_Stanag_Tracer_Green",
    "30Rnd_556x45_Stanag_Tracer_Yellow",
    "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
    "ACE_30Rnd_556x45_Stanag_Mk218_mag",
    "ACE_30Rnd_556x45_Stanag_Mk318_mag",
    "TB_mag_40Rnd_45_FMJ",
    "TB_mag_40Rnd_45_FMJ_Tracer_Red",
    "TB_mag_40Rnd_45_JHP",
    "TB_mag_40Rnd_45_JHP_Tracer_Red",
    "TB_mag_MPR_10Rnd_Antimateriel",
    "TB_mag_MPR_10Rnd_Buckshot",
    "TB_mag_MPR_10Rnd_Underwater"
];

private _allgemein_WaffeGL = [
    "arifle_MX_GL_F",
    "arifle_MX_GL_Black_F",
    "arifle_MX_GL_khk_F",
    "arifle_SPAR_01_GL_blk_F",
    "arifle_SPAR_01_GL_snd_F",
    "arifle_SPAR_01_GL_khk_F",
    "arifle_XMS_GL_lxWS",
    "arifle_XMS_GL_khk_lxWS",
    "arifle_XMS_GL_Sand_lxWS",
    "arifle_XMS_Shot_lxWS",
    "arifle_XMS_Shot_khk_lxWS",
    "arifle_XMS_Shot_Sand_lxWS"
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

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _allgemein_WaffeGL +
        _LR +
        [
            // Items
            "B_UavTerminal",
            "ACE_UAVBattery",
            "Laserdesignator",
            "Laserbatteries",

            // Uniform
            "U_lxWS_UN_Camo1"
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
            "TB_Item_liveMonitor"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _LR +
        [
            "TB_Item_liveMonitor",
            "TB_weap_Vector"
        ]
    };

    case "grena":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _allgemein_WaffeGL +
        [
        ]
    };

    case "dmr":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        [
            // Weapons
            "arifle_MXM_F",
            "arifle_MXM_Black_F",
            "arifle_MXM_khk_F",
            "srifle_EBR_F",
            "arifle_SPAR_03_blk_F",
            "arifle_SPAR_03_snd_F",
            "arifle_SPAR_03_khk_F",
            "srifle_DMR_06_olive_F",
            "srifle_DMR_06_camo_F",
            "srifle_EBR_blk_lxWS",
            // ### Magazine
            "20Rnd_762x51_Mag",
            "ACE_20Rnd_762x51_Mag_Tracer",
            // ### Attachments
            "optic_DMS"
        ]
    };

    case "mg":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _mg_munition +
        _mg_waffen +
        [
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
        _mg_munition +
        _moerser_munition +
        [
            // Backpack
            "B_Carryall_cbr",
            "B_Carryall_ocamo",
            "B_Carryall_khk",
            "B_Carryall_mcamo",
            "B_Carryall_oli",
            "B_Carryall_oucamo",
            "B_Carryall_wdl_F",
            "B_Carryall_green_F",
            "B_Carryall_desert_lxWS",

            //Munition
            "20rnd_762x51_mag",
            "ACE_20Rnd_762x51_Mag_Tracer",

            // Waffen
            "TB_vz99_carryWeapon",

            // AT
            "Vorona_HEAT",
            "Vorona_HE",
            "MRAWS_HEAT_F",
            "MRAWS_HE_F"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _LR +
        _allgemein_Magazine +
        [
            // Head
            "H_HelmetCrew_I",
            "H_PilotHelmetFighter_B",
            "H_CrewHelmetHeli_B",
            "H_PilotHelmetFighter_I_E",
            "lxWS_H_HelmetCrew_I",

            // Goggles
            //"G_Aviator",

            // Uniforms
            "U_B_HeliPilotCoveralls",
            "U_lxWS_UN_Pilot",

            // Westen
            "V_DeckCrew_blue_F",
            "V_DeckCrew_brown_F",
            "V_DeckCrew_yellow_F",
            "V_DeckCrew_green_F",
            "V_DeckCrew_red_F",
            "V_DeckCrew_violet_F",
            "V_DeckCrew_white_F",

            // Weapons
            "SMG_02_F",
            "SMG_01_F",
            "SMG_05_F",
            "hgun_PDW2000_F",
            "TB_weap_Vector",
            // ### Magazine
            "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
            "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
            "30Rnd_9x21_Yellow_Mag",
            "30rnd_45acp_mag_smg_01",

            // Items
            "ToolKit"
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

    case "sniper":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Westen +
        _LR +
        [
            // Uniforms
            "U_B_FullGhillie_sard",
            "U_B_FullGhillie_ard",
            "U_B_FullGhillie_lsh",
            "U_B_GhillieSuit",

            // Items
            "ACE_RangeTable_82mm",
            "ACE_SpottingScope",
            "ACE_Tripod",
            "ACE_ATragMX",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Laserdesignator",
            "Laserbatteries",
            "ACE_Vector",

            // Waffenbag
            "ace_gunbag",
            "ace_gunbag_Tan",

            // Waffen
            "srifle_GM6_F",
            "srifle_GM6_ghex_F",
            "srifle_GM6_camo_F",
            "srifle_LRR_F",
            "srifle_LRR_camo_F",
            // ### Magazine
            "5Rnd_127x108_Mag",
            "5Rnd_127x108_APDS_Mag",
            "7Rnd_408_Mag",
            "ACE_7Rnd_408_305gr_Mag",
            // ### Attachments
            "optic_LRPS",
            "optic_DMS",
            "optic_AMS_snd",
            "optic_AMS",
            "optic_KHS_tan",
            "optic_KHS_blk",
            "optic_LRPS",
            "optic_SOS"
        ]
    };

    case "spotter":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Westen +
        _allgemein_Magazine +
        _allgemein_WaffeGL +
        _LR +
        [
            // Uniforms
            "U_B_FullGhillie_sard",
            "U_B_FullGhillie_ard",
            "U_B_FullGhillie_lsh",
            "U_B_GhillieSuit",

            // Items
            "ACE_RangeTable_82mm",
            "ACE_SpottingScope",
            "ACE_Tripod",
            "ACE_ATragMX",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Laserdesignator",
            "Laserbatteries",
            "ACE_Vector",

            // Magazine
            "5Rnd_127x108_Mag",
            "5Rnd_127x108_APDS_Mag",
            "7Rnd_408_Mag",
            "ACE_7Rnd_408_305gr_Mag",

            // Waffenbag
            "ace_gunbag",
            "ace_gunbag_Tan"
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
           "V_EOD_olive_F",
           "V_EOD_coyote_F",
           "V_PlateCarrierGL_tna_F",
           "V_PlateCarrierGL_mtp",
           "V_PlateCarrierGL_blk",
           "V_PlateCarrierGL_rgr",
           "V_PlateCarrierGL_wdl",
           "V_CarrierRigKBT_01_heavy_Olive_F",

            // Items
            "MineDetector",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ACE_DeadManSwitch",
            "ToolKit",
            "TB_MineDetector",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",

            // Minen
            "APERSMineDispenser_Mag",
            "ATMine_Range_Mag",
            "APERSMine_Range_Mag",
            "APERSBoundingMine_Range_Mag",
            "SLAMDirectionalMine_Wire_Mag",
            "APERSTripMine_Wire_Mag",
            "ClaymoreDirectionalMine_Remote_Mag",
            "DemoCharge_Remote_Mag"
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
            "launch_NLAW_F",
            "launch_RPG32_F",
            "launch_MRAWS_green_F",         // kann Entfernung messen (ungelenkt)
            "launch_MRAWS_olive_F",
            "launch_MRAWS_sand_F",
            "launch_O_Vorona_brown_F",      // kabelgelenkt
            "launch_O_Vorona_green_F",
            "RPG32_F",
            "RPG32_HE_F",
            "launch_B_Titan_F",
            "launch_O_Titan_F",
            "Titan_AA",
            "launch_B_Titan_short_F",
            "launch_I_Titan_short_F",
            "Titan_AT",
            "Titan_AP",

            // Magazine
            "Vorona_HEAT",
            "Vorona_HE",
            "MRAWS_HEAT_F",
            "MRAWS_HE_F"


        ]
    };

    case "jtac":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_WaffeGL +
        _allgemein_Magazine +
        _LR +
        [
            // Backpacks
            "B_UAV_01_backpack_F",
            "B_UAV_02_backpack_lxWS",
            "ION_UAV_02_backpack_lxWS",
            "ION_UAV_01_backpack_lxWS",
            "CIV_UAV_01_backpack_lxWS",

            // Items
            "B_UavTerminal",
            "ACE_UAVBattery",
            "Laserdesignator",
            "Laserbatteries"
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
            "B_UavTerminal",
            "TB_MineDetector",
            //"MCC_multiTool",
            "ACE_DefusalKit",
            "ToolKit",

            // Westen
            "V_EOD_olive_F",
            "V_EOD_coyote_F",
            "V_PlateCarrierGL_tna_F",
            "V_PlateCarrierGL_mtp",
            "V_PlateCarrierGL_blk",
            "V_PlateCarrierGL_rgr",

            // Uniforms
            "U_lxWS_UN_Pilot",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
