/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// Hier kommen alle Items rein die ALLE Rollen haben
private _allgemein = [
    // Gepäck
    "BWA3_AssaultPack_Fleck",
    "BWA3_AssaultPack_Tropen",
    "BWA3_FieldPack_Fleck",
    "BWA3_FieldPack_Tropen",
    "B_Parachute",

    // Gesichtsbedeckung
    "BWA3_G_Combat_clear",
    "BWA3_G_Combat_orange",
    "BWA3_G_Combat_black",
    // ### Vanilla
    "G_Bandanna_beast",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_blk",
    "G_Aviator",

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

    // Schalldämpfer
    "bwa3_muzzle_snds_qdss",
    "bwa3_muzzle_snds_qdss_green",
    "bwa3_muzzle_snds_qdss_tan",
    "bwa3_muzzle_snds_rotex_iiic",
    "bwa3_muzzle_snds_rotex_iiic_green",
    "bwa3_muzzle_snds_rotex_iiic_tan",
    "muzzle_snds_m_khk_f",
    "muzzle_snds_m_snd_f",
    "muzzle_snds_m",
    "bwa3_muzzle_snds_rotex_iia",
    "muzzle_snds_b_khk_f",
    "muzzle_snds_b_snd_f",
    "muzzle_snds_b",

    // Uhr
    "ItemWatch",
    "ACE_Altimeter",

    // Items
    // ### Lampe
    "ACE_Chemlight_Shield",
    "ACE_Flashlight_KSF1",
    // ### Items
    "ACE_RangeTable_82mm",
    "ACE_MapTools",
    "ACE_CableTie",
    "ACE_HuntIR_monitor",
    "ACE_EntrenchingTool",
    "ACE_SpareBarrel",
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
    "BWA3_DM51A1",
    "BWA3_DM25",
    "BWA3_DM32_Blue",
    "BWA3_DM32_Yellow",
    "BWA3_DM32_Green",
    "BWA3_DM32_Orange",
    "BWA3_DM32_Red",
    "BWA3_DM32_Purple",
    "ACE_M84",
    // ### Spreng
    "AMP_Breaching_Charge_Mag"
];

private _allgemein_gewehre = [
    "BWA3_G36A1",
    "BWA3_G36A1_tan",
    "BWA3_G36A2",
    "BWA3_G36A2_tan",
    "BWA3_G36A3",
    "BWA3_G36A3_tan",
    "BWA3_G38",
    "BWA3_G38_tan"
];

private _allgemein_magazine = [
    "BWA3_30Rnd_556x45_G36_Tracer",
    "BWA3_30Rnd_556x45_G36_Tracer_Dim",
    "BWA3_30Rnd_556x45_G36",
    "BWA3_30Rnd_556x45_G36_SD"
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
    "BWA3_optic_ZO4x30",
    "bwa3_optic_zo4x30i",
    "bwa3_optic_zo4x30i_microt2",
    "BWA3_optic_NSV600" //  Zusatz zum ZO4x30
];

private _allgemein_befestigungsschiene = [
    "BWA3_acc_VarioRay_irlaser",
    "bwa3_acc_varioray_irlaser_black",
    "BWA3_acc_VarioRay_laser",
    "BWA3_acc_VarioRay_flash",
    "BWA3_acc_LLM01_irlaser",
    "BWA3_acc_LLM01_laser",
    "BWA3_acc_LLM01_flash",
    "ACE_acc_pointer_green",
    "ACE_acc_pointer_green_IR"
];

private _allgemein_zweibein = [
    "bwa3_bipod_harris",
    "bwa3_bipod_atlas",
    "bwa3_bipod_mg3"
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
    // ### Munition
    "BWA3_1Rnd_Flare_Singlestar_White",
    "BWA3_1Rnd_Flare_Singlestar_Green",
    "BWA3_1Rnd_Flare_Singlestar_Red",
    "BWA3_1Rnd_Flare_Illum",
    "BWA3_1Rnd_Flare_Multistar_White",
    "BWA3_1Rnd_Flare_Multistar_Green",
    "BWA3_1Rnd_Flare_Multistar_Red",
    "BWA3_15Rnd_9x19_P8",
    // ### Befestigungsschiene
    "BWA3_acc_LLM01_irlaser",
    "BWA3_acc_LLM01_laser",
    "BWA3_acc_LLM01_flash",
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
    "BWA3_OpsCore_Fleck_Camera",
    "BWA3_OpsCore_Fleck_Patch",
    "BWA3_OpsCore_Fleck",
    "BWA3_OpsCore_Tropen_Camera",
    "BWA3_OpsCore_Tropen_Patch",
    "BWA3_OpsCore_Tropen"
];

private _grenadier_gewehr = [
    "BWA3_G36A3_AG40",
    "BWA3_G36A3_AG40_tan",
    "BWA3_G38_AG40",
    "BWA3_G38_AG40_tan"
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
    "BWA3_20Rnd_762x51_G28", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_Tracer", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_Tracer_Dim", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_AP", //G27 und G28 Patrol
    "BWA3_20Rnd_762x51_G28_SD" //G27 und G28 Patrol
];

private _mg_munition = [
    "BWA3_30Rnd_556x45_G36",
    "BWA3_30Rnd_556x45_G36_Tracer",
    "BWA3_200Rnd_556x45_Tracer",
    "BWA3_120Rnd_762x51",
    "BWA3_120Rnd_762x51_Tracer",
    "BWA3_120Rnd_762x51_soft",
    "BWA3_120Rnd_762x51_Tracer_soft"
];

private _pilot_munition = [
    "BWA3_40Rnd_46x30_MP7",
    "BWA3_40Rnd_46x30_MP7_SD"
];

private _sniper_munition = [
    "BWA3_10Rnd_127x99_G82_Raufoss",
    "BWA3_10Rnd_127x99_G82_Raufoss_Tracer_Dim"
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

private _lrFunken = [
    // ### LR-Funke
    "TFAR_rt1523g_big_bwmod",
    "TFAR_rt1523g_big_bwmod_tropen",
    "OPXT_blk_1523",    // schwarz
    "OPXT_aor1_1523",   // sand
    "OPXT_oga_1523",    // grün
    "OPXT_scorpion_1523",
    "OPXT_m81_1523",
    "OPXT_multicam_1523",
    "OPXT_at_au_1523",  // grau1
    "OPXT_ogag_1523",   //grau2
    "opxt_pen_grz_1523",
    "opxt_at_ix_1523",
    "opxt_ogao_1523"
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
// _lrFunken                         - LR Funken

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
    {
        _allgemein +
        _allgemein_gewehre +
        _allgemein_magazine +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
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
            "bwa3_vector",
            "ACE_MX2A",

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
        _allgemein_zweibein +
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
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _pilot_munition +
        [

            // Weste
            "BWA3_Vest_Medic_Tropen",
            "BWA3_Vest_Medic_Fleck",

            // Waffen
            "BWA3_MP7",

            

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
        _allgemein_zweibein +
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
        _allgemein_zweibein +
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
            // ### Visiere
            "BWA3_optic_PMII_ShortdotCC",   //x8
            "optic_ams",                    // x8.8 Vanilla

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
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        _gepaeck_mittel +
        [
            // Gewehr
            "BWA3_MG4",
            "BWA3_MG5_tan",
            "BWA3_MG5",
            "BWA3_MG3",

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
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        _grenadier_munition +
        _dmr_munition +
        _pilot_munition +
        _sniper_munition +
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
        _lrFunken +
        _allgemein_magazine +
        _pilot_munition +
        _mg_munition +
        _grenadier_munition +
        _dmr_munition +
        _pilot_munition +
        _sniper_munition +
        _aaat_munition +
        [
            // Weapons
            "BWA3_MP7",
            // ### Visiere
            "bwa3_optic_eotech552",
            // ### Geschützzubehör
            "BWA3_muzzle_snds_Rotex_II",
            "bwa3_acc_varioray_irlaser_black",

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
            "H_PilotHelmetFighter_B",

            // Gesichtsbedeckung
            //"G_Aviator",

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
        _allgemein_zweibein +
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
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_uniformen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _sniper_munition +
        _pilot_munition +
        [
            // Gewehre
            "BWA3_G82",
            "BWA3_MP7",
            // ### Geschützzubehör
            "BWA3_muzzle_snds_Rotex_II",

            // ### Visiere
            "bwa3_optic_m5xi_msr_microt2",
            "bwa3_optic_m5xi_msr",
            "bwa3_optic_hensoldt",
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
            "ace_vectorday",

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
        _allgemein_zweibein +
        _allgemein_uniformen +
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _lrFunken +
        _sniper_munition +
        _pilot_munition +
        _gepaeck_mittel +
        _allgemein_gewehre +
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
            "ace_vectorday",

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
            "bwa3_optic_carlgustav"
        ]
    };

    case "jtac":
    {
        _allgemein +
        _allgemein_magazine +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
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

            // Kopfbedeckung
            "BWA3_CrewmanKSK_Fleck_Headset",
            "BWA3_CrewmanKSK_Fleck",
            "BWA3_CrewmanKSK_Tropen_Headset",
            "BWA3_CrewmanKSK_Tropen",

            // Sprengstoff
            "DemoCharge_Remote_Mag",
            "satchelcharge_remote_mag",

            // Items
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
