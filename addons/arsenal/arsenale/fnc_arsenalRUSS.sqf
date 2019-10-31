/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: mordl, Darky, Nikuga
*/
private _allgemein = [
    // Gepäck
    "rhs_sidor",        // maximumLoad = 129; mass = 20; Quotient = 6,45
    

    // Gesichtsbedeckung
    "rhs_scarf",
    "rhs_balaclava1_olive",
    "rhs_balaclava",
    // ### Vanilla
    "G_Aviator",

    // Nachtsichtgeräte
    "rhs_1PN138",

    // Ferngläser
    "Binocular",

    // Karte
    "ItemMap",

    // Terminal
    "ItemGPS",

    // Kommunikation
    "TFAR_fadak",

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
    "ACE_IR_Strobe_Item",
    // ### Chemlights
    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_IR",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_HiWhite",
    "ACE_Chemlight_HiBlue",
    "ACE_Chemlight_HiGreen",
    "ACE_Chemlight_UltraHiOrange",
    // ### BuildingItems
    "TB_building_item_Land_BagFence_Long_F",
    "TB_building_item_Land_BagFence_Round_F",
    "TB_building_item_ace_concertinawirecoil",
    // ### Granaten
    "rhs_mag_rgn",
    "rhs_mag_rgo",
    "rhs_mag_zarya2",       // Stunnade
    "rhs_mag_rdg2_black",
    "rhs_mag_rdg2_white",
    "rhs_mag_nspd",         // orange smoke
    // ### Sprengstoff
    "AMP_Breaching_Charge_Mag"
];

private _allgemein_magazine = [
    "rhs_30Rnd_545x39_7N6_AK",
    "rhs_30Rnd_545x39_AK_green",
    "rhs_30Rnd_545x39_AK_plum_green",
    "rhs_30Rnd_545x39_7N22_AK",
    "rhs_30Rnd_545x39_7N22_camo_AK",

    // für Spetznas Mission
    "rhs_20rnd_9x39mm_SP5"
];

private _allgemein_gewehre = [
    "rhs_weap_ak74n",
    "rhs_weap_ak74n_npz",
    "rhs_weap_ak74n_2_npz",
    "rhs_weap_ak74mr",
    "rhs_weap_ak74m_npz",
    "rhs_weap_ak74m",
    "rhs_weap_ak74m_camo",
    "rhs_weap_ak74m_zenitco01_b33",

    // für Spetznas Mission 
    "rhs_weap_asval_grip"
];
_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "rhs_acc_pkas",
    "rhs_acc_ekp8_02",
    "rhs_acc_1p78",
    "rhs_acc_1p87",
    "rhs_acc_rakurspm",
    "rhsusf_acc_g33_xps3",
    "rhsusf_acc_g33_t1",
    "ACE_optic",
    "optic_MRCO_MRCO_2D"
];

private _allgemein_befestigungsschiene = [
    "rhs_acc_2dpzenit",
    "rhs_acc_perst1ik"
];

private _allgemein_geschuetzzubehoer = [
    "rhs_acc_tgpa",
    "rhs_acc_dtk1983"
];

private _allgemein_zweibein = [
    "rhs_acc_grip_ffg2"
];

private _allgemein_raketenwerfer = [
    "rhs_weap_rpg26",   // Light-Anti-tank 
    "rhs_weap_rshg2"    // Thermobaric (HE) launcher 
];

private _allgemein_handfeuerwaffen = [
    "rhs_weap_6p53",
    "rhs_weap_pb_6p9",
    "rhs_weap_pya",
    "rhs_weap_makarov_pm",
    "tb_weap_taser",
    // ### Geschützzubehör
    "rhs_acc_6p9_suppressor",
    // ### Munition
    "rhs_18rnd_9x21mm_7BT3",
    "rhs_mag_9x18_8_57N181S",
    "rhs_mag_9x19_17",
    "TB_mag_taser"
];

private _allgemein_uniformen = [
    "rhs_uniform_emr_patchless",
    //"rhs_uniform_vdv_emr",
    "rhs_uniform_emr_des_patchless",
    "rhs_uniform_flora_patchless"
    //"rhs_uniform_flora_patchless_alt",
    //"rhs_uniform_mflora_patchless",
    //"rhs_uniform_gorka_r_g",
    //"rhs_uniform_gorka_r_y"
];

private _allgemein_westen = [
    "rhs_6b13_EMR_6sh92",
    "rhs_6b23_digi_6sh92",
    "rhs_6b13_Flora_6sh92",
    "rhs_6b23_6sh92",
    "rhs_6b23_ML_6sh92"
];

private _allgemein_kopfbedeckung = [
    "rhs_beanie_green",
    "rhs_beanie",
    "rhs_Booniehat_digi",
    "rhs_Booniehat_flora",
    "rhs_fieldcap_digi",
    "rhs_fieldcap_khk",
    "rhs_fieldcap",
    "rhs_6b27m_digi",
    "rhs_6b27m_digi_ess",
    "rhs_6b27m",
    "rhs_6b27m_ess",
    "rhs_6b27m_ml",
    "rhs_6b27m_ml_ess",
    "rhs_6b47",
    "rhs_6b47_ess"
];

private _grenadier_gewehr = [
    "rhs_weap_ak74mr_gp25",
    "rhs_weap_ak74m_gp25",
    "rhs_weap_ak74n_gp25_npz"
];

private _grenadier_munition = [
    "rhs_GDM40",
    "rhs_GRD40_Green",
    "rhs_GRD40_Red",
    "rhs_GRD40_White",
    "rhs_VG40SZ",       // flashbang
    "rhs_VG40TB",       // thermobaric grenade (dead zone is 3 m wide, after safe)
    "rhs_VOG25",        // HE
    "rhs_VOG25P"        // HE jumping grenade
];

private _mg_munition = [
    "rhs_100Rnd_762x54mmR_green",
    "rhs_100Rnd_762x54mmR_7N26"
];

private _pilot_munition = [
    "rhs_mag_9x19mm_7n31_44",
    "rhs_mag_9x19mm_7n31_20"
];

private _sniper_munition = [
    "rhs_5Rnd_338lapua_t5000",
    "rhs_10Rnd_762x54mmR_7N14",
    "ACE_10Rnd_762x54_Tracer_mag"
];

private _aaat_munition = [
    //"rhs_rpg7_type69_airburst_mag",// schlechter Effekt
    "rhs_rpg7_OG7V_mag",
    //"rhs_rpg7_TBG7V_mag",         // kein deutlich besserer Effekt, vll zuviel des guten
    "rhs_rpg7_PG7VR_mag",
    //"rhs_rpg7_PG7V_mag",          // schlechte PG7VL Variante
    "rhs_rpg7_PG7VL_mag",
    "rhs_mag_9k38_rocket"           // AA-Rocket
];

private _gepaeck_mittel = [
    "rhs_assault_umbts"    // maximumLoad = 140; mass = 20; Quotient = 7
];

private _gepaeck_gross = [
    "B_Carryall_cbr",       // maximumLoad = 320; mass = 60; Quotient = 5,3
    "B_Carryall_oli",
    "B_Carryall_khk"
];

private _rifle_munition = [
    "rhs_30Rnd_762x39mm_polymer",
    "rhs_30Rnd_762x39mm_polymer_tracer"
];

private _LR =[
    "OPXT_ogao_117",
    "OPXT_pen_bad_117",
    "OPXT_multicamt_117"
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
        _allgemein_gewehre +
        _allgemein_magazine +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _gepaeck_mittel +
        _allgemein_kopfbedeckung +
        _grenadier_munition +
        _LR +
        [
            // Handfeuerwaffen

            // Weste
            "rhs_6b13_EMR_6sh92_radio",
            "rhs_6b23_digi_6sh92_radio",
            "rhs_6b13_Flora_6sh92_radio",
            "rhs_6b23_6sh92_radio",
            "rhs_6b23_ML_6sh92_radio",

            // Ferngläser
            "rhs_pdu4"
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
            // Weste
            "rhs_6b23_digi_medic",
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic"
        ]
    };

    case "arzt":
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
        _gepaeck_mittel +
        _LR +
        [
            // Uniform
            "rhs_uniform_df15",
            "rhs_uniform_df15_tan",

            // Weste
            "rhs_6b23_digi_medic",
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic"
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
        _gepaeck_mittel +
        _allgemein_kopfbedeckung +
        _grenadier_gewehr +
        _grenadier_munition +
        [

            // Weste
            "rhs_6b13_EMR_6sh92_vog",
            "rhs_6b23_6sh116_vog",
            "rhs_6b13_Flora_6sh92_vog",
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog"
        ]
    };

    case "dmr": 
    {
        []
        
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
        _gepaeck_mittel +
        _gepaeck_gross +
        _allgemein_kopfbedeckung +
        _mg_munition +
        [
            // Gewehr
            "rhs_weap_pkp",
            "rhs_weap_pkm",

            // Weste
            "rhs_6b13_EMR_6sh92_vog",
            "rhs_6b23_6sh116_vog",
            "rhs_6b13_Flora_6sh92_vog",
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog"
        ]
    };

    case "trag":
    {
        _allgemein +
        _allgemein_magazine +
        _allgemein_gewehre +
        _allgemein_visiere +
        _allgemein_befestigungsschiene +
        _allgemein_handfeuerwaffen +
        _allgemein_zweibein +
        _allgemein_geschuetzzubehoer +
        _allgemein_zweibein +
        _allgemein_raketenwerfer +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _mg_munition +
        _grenadier_munition +
        _dmr_munition +
        _pilot_munition +
        _sniper_munition +
        _aaat_munition +
        _rifle_munition +
        _gepaeck_gross +
        [
            // Weste
            "rhs_6b13_EMR_6sh92_vog",
            "rhs_6b23_6sh116_vog",
            "rhs_6b13_Flora_6sh92_vog",
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
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
            "rhs_weap_pp2000",

            // Kopfbedeckung
            "rhs_tsh4",
            "rhs_tsh4_bala",
            "rhs_tsh4_ess",
            "rhs_tsh4_ess_bala",
            "rhs_zsh7a_mike_alt",
            "rhs_zsh7a_mike_",
            "rhs_zsh7a",
            "rhs_zsh7a_alt",

            // Uniform
            "rhs_uniform_df15",
            "rhs_uniform_df15_tan",

            // Weste
            "rhs_vest_commander",
            "rhs_vest_pistol_holster",
            "rhs_6sh46",

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
        _rifle_munition +
        _gepaeck_mittel +
        [
            // Gewehre
            "rhs_weap_svdp",
            "rhs_weap_svdp_wd",
            "rhs_weap_akms",         // 7,62 keine Visierung möglich
            // ### Visiere
            "rhs_acc_pso1m2",
            "rhs_acc_pso1m21",
            // ### Geschützzubehör
            "rhs_acc_tgpv",
            "rhs_acc_tgpv2",

            // Weste
            "rhs_6b23_digi_sniper",
            "rhs_6b23_sniper",

            // Spetznas 
            "rhs_weap_vss",
            "rhs_10rnd_9x39mm_SP6"
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
        _gepaeck_mittel +
        _allgemein_kopfbedeckung +
        _sniper_munition +
        [
            // Gewehr
            "rhs_weap_t5000",
            "rhs_weap_svdp",
            "rhs_weap_svdp_wd",
            // ### Zweibein
            "rhs_acc_harris_swivel",
            // ### Visier 
            "rhs_acc_dh520x56",
            "rhs_acc_pso1m2",
            "rhs_acc_tgpv2",
            // ### Kopfbedeckung
            "rhs_fieldcap_khk",
            "rhs_fieldcap_vsr",

            // Weste
            "rhs_6b23_digi_sniper",
            "rhs_6b23_sniper",

            // Items
            "ACE_Tripod",
            "ACE_Kestrel4500",
            "ACE_ATragMX",
            "ACE_RangeCard"
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
        _allgemein_handfeuerwaffen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _sniper_munition +
        _gepaeck_mittel +
        _grenadier_gewehr +
        _grenadier_munition +
        [
            // Kopfbedeckung
            "rhs_fieldcap_khk",
            "rhs_fieldcap_vsr",

            // Weste
            "rhs_6b23_digi_sniper",
            "rhs_6b23_sniper",

            // Items
            "ACE_ATragMX",
            "ACE_Tripod",
            "ACE_SpottingScope",
            "ACE_Kestrel4500",
            "ACE_RangeCard"
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

            // Weste
            "rhs_6b13_EMR_6sh92_vog",
            "rhs_6b23_6sh116_vog",
            "rhs_6b13_Flora_6sh92_vog",
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog",

            // Gepäck
            "rhs_assault_umbts_engineer_empty",

            // Items
            "ACE_Clacker",
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ACE_DeadManSwitch",
            "ToolKit",
            "ACE_wirecutter",
            // ### Minen
            "DemoCharge_Remote_Mag",
            "SatchelCharge_Remote_Mag",
            "ATMine_Range_Mag",
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
            // Weste
            "rhs_6b23_digi_vydra_3m",
            "rhs_6b23_vydra_3m",
            "rhs_6b23_ML_vydra_3m",

            // Gepäck
            "rhs_rpg_empty",

            // Raketenwerfer
            "rhs_weap_rpg7",
            "rhs_weap_igla",
            // ### Visier
            "rhs_acc_pgo7v3"
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
        [
            // Weste
            "rhs_6b13_EMR_6sh92_headset_mapcase",
            "rhs_6b23_digi_6sh92_headset_mapcase",
            "rhs_6b13_Flora_6sh92_headset_mapcase",
            "rhs_6b23_6sh92_headset_mapcase",
            "rhs_6b23_ML_6sh92_headset_mapcase",

            // Gepäck
            "O_UAV_01_backpack_F",

            // Ferngläser
            "lerca_1200_black",
            "lerca_1200_tan",
            "Laserdesignator",

            // Items
            "O_UavTerminal",
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
        _allgemein_raketenwerfer +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        _LR +
        [
            // Handfeuerwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Weste
            "rhs_6b23_digi_engineer",
            "rhs_6b23_engineer",
            "rhs_6b23_ML_engineer",

            // Gepäck
            "rhs_assault_umbts_engineer_empty",

            // Items
            "ACE_DefusalKit",
            "ACE_wirecutter",
            "ToolKit"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
