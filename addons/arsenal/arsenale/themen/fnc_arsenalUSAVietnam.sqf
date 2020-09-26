/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

private _allgemein = [
    // Gepäck
    "UNS_BA22_Para",

    // Gesichtsbedeckung
    "UNS_Bandana_A",
    "UNS_Bullets",
    "UNS_Ear",
    "UNS_Finger",
    "UNS_Peace",
    "UNS_Scarf_1stCav",
    "UNS_Scarf_BK",
    "UNS_Scarf_OD",
    "UNS_Scarf_BK_W",
    "UNS_Scarf_Blue",
    "UNS_Scarf_GR",
    "UNS_Scarf_PL",
    "UNS_Scarf_Red",
    "UNS_Scarf_ARVN",
    "UNS_Band_H",
    // ### Vanilla
    //"G_Aviator",
    "G_Tactical_Clear",

    // Karte
    "ItemMap",

    // Navigation
    "ItemCompass",

    // Uhr
    "ItemWatch",

    // Items
    // ### Items
    "ACE_MapTools",
    "ACE_CableTie",
    "ACE_EntrenchingTool",
    "ACE_SpareBarrel",
    // ### Granaten
    "uns_m18white",
    "uns_m18red",
    "uns_f1gren",
    "uns_m308gren",
    "uns_mk40gren"
];

private _allgemein_magazine = [
    "uns_30Rnd_556x45_Stanag",
    "uns_30Rnd_556x45_Stanag_T",
    "uns_thompsonmag_20",
    "uns_thompsonmag_20_NT",
    "uns_thompsonmag_20_T",
    "uns_m1carbinemag_NT",
    "uns_m1carbinemag",
    "uns_m1carbinemag_T",

    // Schrot
    "uns_12gaugemag_6",
    "uns_12gaugemag_6f"
];

private _allgemein_gewehre = [
    "uns_m16",
    "uns_m16_camo",
    "uns_M16A1",
    "uns_m16A1_camo",
    "uns_xm177e1",
    "uns_xm177e2",
    "uns_model12",
    "uns_m1897",
    "uns_thompson",
    "uns_m1carbine"
];
_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [

];

private _allgemein_befestigungsschiene = [
    "uns_b_m7",
    "uns_b_m4"
];

private _allgemein_geschuetzzubehoer = [

];

private _allgemein_zweibein = [

];

private _allgemein_raketenwerfer = [
    "uns_m72",
    "uns_m127a1_flare",
    // ### Munition
    "uns_m72rocket",
    "uns_1Rnd_M127_mag"
];

private _allgemein_handfeuerwaffen = [
    "uns_m1911",
    "uns_bhp",
    // ### Munition
    "uns_m1911mag"
];

private _allgemein_uniformen = [
    "UNS_ARMY_BDU_101stAB65pv1",
    "UNS_ARMY_BDU_101stAB66OG107pv1",
    "UNS_ARMY_BDU_11thacrSubdpv1",
    "UNS_ARMY_BDU_1stCavpv1"
];

private _allgemein_westen = [
    "UNS_M1956_A11",
    "UNS_M1956_A12",
    "UNS_M1956_A5",
    "UNS_M1956_A8",
    "UNS_M1956_M3",
    "UNS_M1956_M9"
];

private _allgemein_kopfbedeckung = [
    "UNS_M1_1A",
    "UNS_M1_2A",
    "UNS_M1_3A",
    "UNS_M1_4A",
    "UNS_M1_6A",
    "UNS_M1_7A",
    "UNS_M1_1B",
    "UNS_M1_9A",
    "UNS_M1_10_vkm",
    "UNS_M1_6_nyg",
    "UNS_M1_6_Outnow",
    "UNS_M1_7_lby",
    "UNS_M1_7_baby",
    "UNS_M1_PBR"
];

private _grenadier_gewehr = [
    "uns_m16_xm148",
    "uns_m16_xm148_camo",
    "uns_m16_m203",
    "uns_m16a1_m203",
    "uns_xm177e2_m203",
    "uns_m79",
    "uns_ex41",

    // ohne UGL
    "uns_m16_bc",
    "uns_m16A1_camo",
    // ### Handfeuerwaffe
    "uns_m79p"
];

private _grenadier_munition = [
    "uns_1Rnd_AB_M397",
    "uns_ex41mag",
    "Uns_1Rnd_HE_M406",

    // Flares
    "uns_40mm_white",
    "uns_40mm_green",

    // Smoke
    "uns_1Rnd_Smoke_40mm",
    "uns_1Rnd_SmokeRed_40mm",
    "uns_1Rnd_SmokeGreen_40mm"
];

private _dmr_munition = [
    "uns_springfieldmag",
    "uns_springfieldmag_T",
    "uns_m1garandmag",
    "uns_m1garandmag_T"
];

private _mg_munition = [
    "uns_barmag_NT",
    "uns_barmag",
    "uns_barmag_T",
    "uns_100Rnd_m1919",
    "uns_m60mag"
];

private _pilot_munition = [
    "uns_m1carbinemag_NT",
    "uns_m1carbinemag",
    "uns_m1carbinemag_T"
];

private _sniper_munition = [

];

private _aaat_munition = [
    "uns_M28A2_mag",
    "uns_M30_smoke_mag"
];

private _gepaeck_mittel = [
    // Gepäck
    "UNS_Alice_3",
    "UNS_Alice_5",
    "UNS_Alice_6",
    "UNS_Alice_F1",
    "UNS_Alice_F2",
    "UNS_TROP_R3",
    "UNS_USMC_E4",
    "UNS_USMC_R1",
    "UNS_BA22_Para"
];

private _gepaeck_lr = [
    // ### LR-Funke
    "UNS_SF_RTO",
    "UNS_ARMY_RTO",
    "UNS_ARMY_RTO2",
    "UNS_Alice_FR",
    "UNS_USMC_RTO",
    "UNS_USMC_RTO2"
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
// _gepaeck_mittel                    - rucksäcke
// _gepaeck_lr                   - LRs

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
        _gepaeck_lr +
        [
            // Kopfbedeckung
            "UNS_Beret_5",
            "UNS_Beret_4",
            "UNS_Beret_3",
            "UNS_Beret_B",
            "UNS_Beret_AVAB",

            // Uniform
            "UNS_ARMY_BDU_USA_BDU_Earlymaj",

            // Weste
            "UNS_M1956_S3",

            // Kommunikation
            //"uns_ItemRadio_PRC25_TFAR",

            // Ferngläser
            "uns_binocular_army"
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
            // Rucksack
            "UNS_ARMY_MED",

            // Weste
            "UNS_M1956_S2",

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
            // Rucksack
            "UNS_ARMY_MED",

            // Weste
            "UNS_M1956_S2",

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
            "UNS_NVA_GR"
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
            "uns_m1garand",
            "uns_m1903",
            // ### Visiere
            "uns_o_unertl8x",
            "uns_o_m84",
            // Befestigungsschiene
            "uns_b_m1",

            // Ferngläser
            "uns_binocular_army"
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
            "uns_bar",
            "uns_m1919a6",
            "uns_m60grip",
            "uns_m60support",
            "uns_m60",

            // Weste
            "UNS_M1956_M15"
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
        _gepaeck_lr +
        [
            // Weste
            "UNS_M1956_LRRP1",

            // Rucksack
            "UNS_Alice_LRP1"
        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _pilot_munition +
        _gepaeck_lr +
        [
            // Gewehr
            "uns_m2carbine_shorty_p",

            // Kopfbedeckung
            "UNS_HP_Helmet",
            "UNS_HP_Helmet_1AC",
            "UNS_HP_Helmet_11AC",
            "UNS_HP_Helmet_17AC",
            "UNS_HP_Helmet_1MD",
            "UNS_HP_Helmet_OG",
            "UNS_HP_Helmet_TIGER",

            // Uniform
            "UNS_Pilot_BDU",

            // Weste
            "UNS_FLAK",

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
            "ACE_M26_Clacker",
            "ACE_DeadManSwitch",
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter",
            "UNS_TrapKit",
            // ### Minen
            "uns_mine_AV_mag",
            "uns_mine_AT_mag",
            "uns_mine_m14_mag",
            "uns_M118_mag_remote"
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
        [
            // Raketenwerfer
            "uns_m20_bazooka"
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
            "UNS_TrapKit",

            // Rucksack
            "UNS_Alice_LRP2"
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
