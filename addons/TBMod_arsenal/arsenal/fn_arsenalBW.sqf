/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
// Hier kommen alle Items rein die ALLE Rollen haben
private _allgemein = [
    // Gepäck
    "BWA3_AssaultPack_Fleck",
    "BWA3_AssaultPack_Tropen",
    "BWA3_FieldPack_Fleck",
    "BWA3_FieldPack_Tropen",
    "B_Parachute",
    // ### LR-Funke
    // "TFAR_rt1523g_big_bwmod",
    // "TFAR_rt1523g_big_bwmod_tropen",
    // "TFAR_rt1523g_big",
    // "TFAR_rt1523g_big_rhs",
    "OPXT_blk_1523",    // schwarz
    "OPXT_aor1_1523",   // sand
    "OPXT_oga_1523",    // grün
    "OPXT_scorpion_1523",
    "OPXT_m81_1523",
    "OPXT_multicam_1523",
    "OPXT_at_au_1523",  // grau1
    "OPXT_ogag_1523",   //grau2

    // Gesichtsbedeckung
    "BWA3_G_Combat_clear",
    "BWA3_G_Combat_orange",
    "BWA3_G_Combat_black",
    // ### Vanilla
    "G_Aviator",

    // Nachtsichtgeräte
    "ACE_NVG_Gen4",

    // Ferngläser
    "Binocular",

    // Karte
    "ItemMap",

    // Terminal
    "ItemGPS",
    "BWA3_ItemNaviPad",

    // Kommunikation
    "TFAR_anprc152",

    // Navigation
    "ItemCompass",

    // Uhr
    "ItemWatch",
    "ACE_Altimeter",

    // Items
    // ### Sprays
    //"ACE_SpraypaintBlue",
    //"ACE_SpraypaintGreen",
    //"ACE_SpraypaintRed",
    //"ACE_SpraypaintBlack",
    // ### Lampe
    "ACE_Chemlight_Shield",
    //"ACE_Flashlight_XL50",
    "ACE_Flashlight_KSF1",
    //"ACE_Flashlight_MX991",
    // ### Items
    "ACE_RangeTable_82mm",
    "ACE_MapTools",
    "ACE_CableTie",
    //"ACE_IR_Strobe_Item",
    "ACE_HuntIR_monitor",
    "ACE_EntrenchingTool",
    //"ACE_Sandbag_empty",
    "ACE_SpareBarrel",
    //"ACE_microDAGR",
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
    //"SmokeShellYellow",
    "SmokeShellRed",
    "SmokeShellGreen",
    //"SmokeShellPurple",
    "SmokeShellBlue",
    //"SmokeShellOrange",
    "BWA3_DM51A1",
    "ACE_M84",
    // ### Spreng
    "AMP_Breaching_Charge_Mag"
];

private _allgemein_gewehre = [
    // Gewehr
    "hlc_rifle_G36A1",
    "hlc_rifle_G36C",
    "hlc_rifle_G36CV",
    "hlc_rifle_G36CTac",
    "hlc_rifle_G36E1",
    "hlc_rifle_G36KA1KSK",
    "hlc_rifle_G36KA1",
    "hlc_rifle_G36KE1",
    "hlc_rifle_G36KV",
    "hlc_rifle_g36KTac",
    "hlc_rifle_G36V",
    "hlc_rifle_G36TAC"
];

private _allgemein_magazine = [
    "hlc_30rnd_556x45_EPR_G36",
    "hlc_30rnd_556x45_SOST_G36",
    "hlc_30rnd_556x45_SPR_G36",
    "hlc_30rnd_556x45_Tracers_G36",
    "hlc_30rnd_556x45_MDIM_G36",
    "hlc_30rnd_556x45_TDIM_G36"
];

private _allgemein_visiere = [
    "BWA3_optic_MicroT2",
    "BWA3_optic_MicroT1",
    "BWA3_optic_CompM2",
    "BWA3_optic_CompM2_tan",
    "BWA3_optic_EOTech",
    "BWA3_optic_EOTech_sand",
    "BWA3_optic_EOTech_sand_Mag_On",
    "BWA3_optic_EOTech_sand_Mag_Off",
    "BWA3_optic_EOTech_Mag_On",
    "BWA3_optic_EOTech_Mag_Off",
    "BWA3_optic_RSAS",
    //"BWA3_optic_ZO4x30_Single", keine Ahnung was das neue ist
    "BWA3_optic_ZO4x30",
    "HLC_Optic_G36Dualoptic15x",
    "HLC_Optic_G36Dualoptic15x2d",
    "HLC_Optic_G36dualoptic35x",
    "HLC_Optic_G36dualoptic35x2d",
    "HLC_Optic_G36Export15x",
    "HLC_Optic_G36Export15x2d",
    "HLC_Optic_G36Export35x",
    "HLC_Optic_G36Export35x2d",
    "BWA3_optic_NSV600" //  Zusatz zum ZO4x30
];

private _allgemein_befestigungsschiene = [
    "BWA3_acc_VarioRay_irlaser",
    "BWA3_acc_VarioRay_laser",
    "BWA3_acc_VarioRay_flash",
    "BWA3_acc_LLM01_irlaser",
    "BWA3_acc_LLM01_laser",
    "BWA3_acc_LLM01_flash",
    "ACE_acc_pointer_green",
    "ACE_acc_pointer_green_IR"
];

private _allgemein_geschuetzzubehoer = [
    "hlc_muzzle_300blk_KAC",
    "hlc_muzzle_556NATO_KAC"
];

private _allgemein_zweibein = [
    "bipod_01_F_blk",
    "HLC_Bipod_G36"
];

private _allgemein_raketenwerfer = [
    "BWA3_PzF3",
    "BWA3_RGW90",
    // ### Visiere
    "BWA3_optic_CarlGustav",
    "BWA3_optic_NSA80",
    // ### Munition
    "BWA3_PzF3_Tandem",
    "BWA3_RGW90_HH"
];

private _allgemein_handfeuerwaffen = [
    // Handfeuerwaffen
    "BWA3_P2A1",
    "BWA3_P8",
    "hlc_pistol_P226R_Combat",
    // ### Munition
    "BWA3_1Rnd_Flare_Singlestar_White",
    "BWA3_1Rnd_Flare_Singlestar_Green",
    "BWA3_1Rnd_Flare_Singlestar_Red",
    "BWA3_1Rnd_Flare_Illum",
    "BWA3_1Rnd_Flare_Multistar_White",
    "BWA3_1Rnd_Flare_Multistar_Green",
    "BWA3_1Rnd_Flare_Multistar_Red",
    "BWA3_15Rnd_9x19_P8",
    "hlc_15Rnd_9x19_B_P226",
    "hlc_15Rnd_9x19_JHP_P226",
    // ### Befestigungsschiene
    "BWA3_acc_LLM01_irlaser",
    "BWA3_acc_LLM01_laser",
    "BWA3_acc_LLM01_flash",
    "hlc_optic_docter_cadex",
    "hlc_acc_dbalpl_fl",
    "muzzle_snds_l"
];

private _allgemein_uniformen = [
    "BWA3_Uniform_Fleck",
    "BWA3_Uniform_Tropen",
    "BWA3_Uniform_tee_Fleck",
    "BWA3_Uniform_tee_Tropen",
    "BWA3_Uniform_sleeves_Fleck",
    "BWA3_Uniform_sleeves_Tropen",
    "BWA3_Uniform2_Fleck",
    "BWA3_Uniform2_Tropen",
    "BWA3_Uniform2_sleeves_Fleck",
    "BWA3_Uniform2_sleeves_Tropen"
];

private _allgemein_westen = [
    "BWA3_Vest_Fleck",
    "BWA3_Vest_Tropen",
    "BWA3_Vest_Rifleman_Fleck",
    "BWA3_Vest_Rifleman_Tropen",
    "BWA3_Vest_JPC_Rifleman_Fleck",
    "BWA3_Vest_JPC_Rifleman_Tropen",
    "BWA3_Vest_JPC_Radioman_Fleck",
    "BWA3_Vest_JPC_Radioman_Tropen"
];

private _allgemein_kopfbedeckung = [
    "BWA3_Booniehat_Fleck",
    "BWA3_Booniehat_Tropen",
    "BWA3_M92_Fleck",
    "BWA3_M92_Tropen",
    //"BWA3_MICH_Fleck", nicht gefunden
    //"BWA3_MICH_Tropen", nicht gefunden
    "BWA3_OpsCore_Fleck_Camera",
    "BWA3_OpsCore_Fleck_Patch",
    "BWA3_OpsCore_Fleck",
    "BWA3_OpsCore_Tropen_Camera",
    "BWA3_OpsCore_Tropen_Patch",
    "BWA3_OpsCore_Tropen"
];

private _grenadier_gewehr = [
    "hlc_rifle_G36A1AG36",
    "hlc_rifle_G36E1AG36",
    "HLC_Rifle_G36KSKAG36",
    "hlc_rifle_G36VAG36"
];

private _grenadier_munition = [
    "1Rnd_HE_Grenade_shell",
    "ACE_HuntIR_M203",
    "1Rnd_SmokeOrange_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokePurple_Grenade_shell",
    "1Rnd_SmokeYellow_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "UGL_FlareCIR_F",
    "UGL_FlareYellow_F",
    "UGL_FlareRed_F",
    "UGL_FlareGreen_F",
    "UGL_FlareWhite_F"
];

private _dmr_munition = [
    "BWA3_10Rnd_762x51_G28_LR",
    "BWA3_20Rnd_762x51_G28", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_Tracer", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_Tracer_Dim", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_AP", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_SD", //G27 und G28 Patrol

    "hlc_20rnd_762x51_b_G3",
    "hlc_20rnd_762x51_Mk316_G3",
    "hlc_20rnd_762x51_barrier_G3",
    "hlc_20rnd_762x51_T_G3",
    "hlc_20rnd_762x51_MDim_G3",
    "hlc_20rnd_762x51_IRDim_G3",
    "hlc_20rnd_762x51_S_G3"
];

private _mg_munition = [
    "BWA3_30Rnd_556x45_G36",
    "BWA3_30Rnd_556x45_G36_Tracer",
    //"BWA3_B_556x45_Ball_SD",
    //"BWA3_B_556x45_Ball_AP",
    "hlc_100rnd_556x45_EPR_G36",
    "hlc_100rnd_556x45_M_G36",
    "hlc_100rnd_556x45_Mdim_G36",
    "hlc_50Rnd_762x51_B_MG3",
    "hlc_50Rnd_762x51_M_MG3",
    "hlc_50Rnd_762x51_Barrier_MG3",
    "hlc_50Rnd_762x51_T_MG3"
];

private _pilot_munition = [
    "BWA3_40Rnd_46x30_MP7",
    "BWA3_40Rnd_46x30_MP7_SD"
];

private _sniper_munition = [
    "7Rnd_408_Mag",
    "hlc_5rnd_300WM_T_AWM",
    "hlc_5rnd_300WM_FMJ_AWM"
];

private _aaat_munition = [
    "BWA3_Fliegerfaust_Mag",
    "BWA3_CarlGustav_HEAT",
    "BWA3_CarlGustav_HE",
    "BWA3_CarlGustav_HEDP",
    "BWA3_CarlGustav_Smoke",
    "BWA3_CarlGustav_Illum",
    "BWA3_PzF3_Tandem",
    "BWA3_RGW90_HH"
];

private _gepaeck_mittel = [
    "BWA3_TacticalPack_Fleck",
    "BWA3_TacticalPack_Tropen",
    "BWA3_Kitbag_Fleck",
    "BWA3_Kitbag_Tropen"
];

private _gepaeck_gross = [
    "BWA3_Carryall_Fleck",
    "BWA3_Carryall_Tropen",
    "BWA3_PatrolPack_Fleck",
    "BWA3_PatrolPack_Tropen"
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

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
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
            "BWA3_Vest_Leader_Fleck",
            "BWA3_Vest_Leader_Tropen",
            "BWA3_Vest_JPC_Leader_Fleck",
            "BWA3_Vest_JPC_Leader_Tropen",

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
        _allgemein_magazine +
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
            // Weste
            "BWA3_Vest_Medic_Tropen",
            "BWA3_Vest_Medic_Fleck",

            // Gepäck
            "BWA3_Kitbag_Fleck_Medic",
            "BWA3_Kitbag_Tropen_Medic",
            "BWA3_TacticalPack_Fleck_Medic",
            "BWA3_TacticalPack_Tropen_Medic"
        ]
    };

    case "arzt":
    {
        _allgemein +
        _allgemein_magazine +
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
            // Weste
            "BWA3_Vest_Medic_Tropen",
            "BWA3_Vest_Medic_Fleck",

            // Gepäck
            "BWA3_Kitbag_Fleck_Medic",
            "BWA3_Kitbag_Tropen_Medic",
            "BWA3_TacticalPack_Fleck_Medic",
            "BWA3_TacticalPack_Tropen_Medic",

            // Kopfbedeckung
            "BWA3_CrewmanKSK_Fleck_Headset",
            "BWA3_CrewmanKSK_Fleck",
            "BWA3_CrewmanKSK_Tropen_Headset",
            "BWA3_CrewmanKSK_Tropen",

            // Uniform
            "BWA3_Uniform_Helipilot",
            "BWA3_Uniform_Crew_Fleck",
            "BWA3_Uniform_Crew_Tropen"
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
            // Weste
            "BWA3_Vest_Grenadier_Fleck",
            "BWA3_Vest_Grenadier_Tropen"
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
            // Weste
            "BWA3_Vest_Marksman_Fleck",
            "BWA3_Vest_Marksman_Tropen",

            // Weapons
            "BWA3_G28_Patrol",
            "hlc_rifle_g3sg1ris",
            // ### Visiere
            "BWA3_optic_PMII_ShortdotCC",   //x8 
            "optic_ams",                    // x8.8 Vanilla
                        
            // ### Schalli
            "hlc_muzzle_300blk_KAC",

            // Items
            "ACE_Yardage450",
            "ACE_RangeCard",
            //"ACE_VectorDay",
            "ACE_Vector", // Tag/Nacht Version
            "ACE_Kestrel4500"
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
        _gepaeck_mittel +
        [
            // Gewehr
            "hlc_rifle_MG36",
            "BWA3_MG4",
            "hlc_lmg_MG3", // MG3 nur 50 Schuss

            // Weste
            "BWA3_Vest_MachineGunner_Tropen",
            "BWA3_Vest_MachineGunner_Fleck"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_magazine +
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
            // Weapons
            "BWA3_MP7",
            // ### Geschützzubehör
            "BWA3_muzzle_snds_Rotex_II",

            // Uniforms
            "BWA3_Uniform_Helipilot",
            "BWA3_Uniform_Crew_Fleck",
            "BWA3_Uniform_Crew_Tropen",

            // Kopfbedeckung
            "BWA3_CrewmanKSK_Fleck_Headset",
            "BWA3_CrewmanKSK_Fleck",
            "BWA3_CrewmanKSK_Tropen_Headset",
            "BWA3_CrewmanKSK_Tropen",
            "BWA3_Knighthelm",

            // Gesichtsbedeckung
            "G_Aviator",

            // Items
            "ToolKit"
        ]
    };

    case "rifle":
    {
        _allgemein +
        _allgemein_magazine +
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
        _pilot_munition +
        [
            // Gewehre
            "srifle_LRR_F",
            "srifle_LRR_tna_F",
            "hlc_rifle_awMagnum_FDE_ghillie",
            "hlc_rifle_awMagnum_FDE",
            "BWA3_MP7",

            // ### Visiere
            "bwa3_optic_m5xi_msr",
            // ### Geschützzubehör
            "BWA3_muzzle_snds_Rotex_II",

            // Uniforms
            "BWA3_Uniform_Ghillie_Tropen",
            "BWA3_Uniform_Ghillie_Fleck",
            "BWA3_Uniform2_Ghillie_Fleck",
            "BWA3_Uniform2_Ghillie_Tropen",

            // Westen
            "BWA3_Vest_Marksman_Tropen",
            "BWA3_Vest_Marksman_Fleck",

            // Ferngläser
            "ACE_Vector",
            "Laserdesignator",
            "lerca_1200_black",
            "lerca_1200_tan",

            // Items
            "ACE_SpottingScope",
            "ACE_Tripod",
            "ACE_ATragMX",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Laserbatteries",
            "BWA3_optic_NSV80"
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
        _pilot_munition +
        _gepaeck_mittel +
        _grenadier_gewehr +
        _grenadier_munition +
        [
            // Gewehre
            "BWA3_MP7",
            // ### Geschützzubehör
            "BWA3_muzzle_snds_Rotex_II",

            // Uniforms
            "BWA3_Uniform_Ghillie_Tropen",
            "BWA3_Uniform_Ghillie_Fleck",
            "BWA3_Uniform2_Ghillie_Fleck",
            "BWA3_Uniform2_Ghillie_Tropen",

            // Westen
            "BWA3_Vest_Marksman_Tropen",
            "BWA3_Vest_Marksman_Fleck",

            // Ferngläser
            "ACE_Vector",
            "Laserdesignator",
            "lerca_1200_black",
            "lerca_1200_tan",

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
        _allgemein_magazine +
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
        _allgemein_magazine +
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
            "BWA3_Fliegerfaust",
            "BWA3_CarlGustav",
            // ### Visiere
            "BWA3_CarlGustav_Optic"
        ]
    };

    case "jtac":
    {
        _allgemein +
        _allgemein_magazine +
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
            "ACE_UAVBattery",
            "Laserbatteries"
        ]
    };

    case "pionier":
    {
        _allgemein +
        _allgemein_magazine +
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

            // Kopfbedeckung
            "BWA3_CrewmanKSK_Fleck_Headset",
            "BWA3_CrewmanKSK_Fleck",
            "BWA3_CrewmanKSK_Tropen_Headset",
            "BWA3_CrewmanKSK_Tropen",

            // Gepäck
            "BWA3_Kitbag_Fleck",
            "BWA3_Kitbag_Tropen",

            // Items
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
