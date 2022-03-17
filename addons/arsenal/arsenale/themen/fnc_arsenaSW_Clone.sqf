/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: shukari
*/
private _allgemein = [
    // Gesichtsbedeckung
    "SWOP_Clones_HUD",

    // Nachtsichtgeräte
    "SWOP_NVChipClean",
    "SWOP_NVChip",
    "SWOP_NVChip2",

    // Ferngläser
    "ElectroBinocularsB_F",
    "ElectroBinocularsD_F",
    "ElectroBinocularsG_F",
    "ElectroBinocularsW_F",

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
    "ACE_Flashlight_KSF1",
    // ### Items
    "ACE_MapTools",
    "ACE_CableTie",
    "ACE_EntrenchingTool",
    "ACE_SpareBarrel",
    "ACE_wirecutter",
    //"ACE_IR_Strobe_Item",
    // ### BuildingItems
    "TB_building_item_Land_BagFence_Long_F",
    "TB_building_item_Land_BagFence_Round_F",
    "TB_building_item_ace_concertinawirecoil",
    // ### Granaten
    "swop_SmokeShell",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellBlue",
    "B_IR_Grenade",
    "SWOP_bacta_G",
    "SWOP_BCCKtermimploder_G",
    "SWOP_BCCKstermDet_G",
    "swop_termDetDT_G",
    "SWOP_termDet_G",
    "SWOP_termDet_Gm",
    "SWOP_SCAR_DioxisGM",
    "SWOP_SCAR_EMP_GrenadeGM",
    "swop_mag_flashbang",
    "swop_mag_gimpact",
    "swop_mag_incendiary",
    "SW_halfshield_Mag",
    "SW_PersonalShield_Mag",
    "B_IR_Grenade",
    "B_IR_Grenade",
    "B_IR_Grenade",
    "B_IR_Grenade",
    // ### Sprengstoff
    "AMP_Breaching_Charge_Mag",
    // ### Fallschirme
    "B_Parachute",
    // ### ITC Tablet
    "itc_land_tablet_rover"
];

private _allgemein_magazine = [
    // DC-15A
    "SWOP_DC15ABlasterRifle_Full_Mag",
    "SWOP_DC15ABlasterRifle_Mag",
    "SWOP_DC15ABlasterRifle_Low_Mag",
    "DCStun_Mag",
    "SWOP_DC15_Mag"
];

private _allgemein_gewehre = [
    "SWOP_DC15ABlasterRifle",
    "SWOP_DC15"
];
_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "swop_dc15a_holoscope",
    "swop_dc15s_holoscope"
];

private _allgemein_befestigungsschiene = [

];

private _allgemein_geschuetzzubehoer = [

];

private _allgemein_zweibein = [

];

private _AT_raketenwerfer = [

];

private _HEDP_raketenwerfer = [

];

private _allgemein_handfeuerwaffen = [
    "SWOP_DC17Pistol",
    // ### Munition
    "SWOP_DC17Pistol_Mag"
];

private _allgemein_uniformen = [
    "SWOP_Clonetrooper_501_F_CombatUniform",
    "SWOP_Clonetrooper_501tup_F_CombatUniform",
    "SWOP_Clonetrooper_501kix_F_CombatUniform",
    "SWOP_Clonetrooper_501dogma_F_CombatUniform",
    "SWOP_Clonetrooper_501cadet_F_CombatUniform",
    "SWOP_Clonetrooper_212waxer_boil_F_CombatUniform",
    "SWOP_Clonetrooper_212cody_F_CombatUniform"
];

private _allgemein_westen = [
    "SWOP_Clonetrooper_501_armor",
    "SWOP_Clonetrooper_501jesse_armor",
    "SWOP_Clonetrooper_501dogma_armor",
    "SWOP_Clonetrooper_212_armor",
    "SWOP_Clonetrooper_212waxer_boil_armor"
];

private _allgemein_kopfbedeckung = [
    "SWOP_Clonetrooper_501_helmet",
    "SWOP_Clonetrooper_501_vethelmet",
    "SWOP_Clonetrooper_501_seashelmet",
    "SWOP_Clonetrooper_501kix_helmet",
    "SWOP_Clonetrooper_501_exphelmet",
    "SWOP_Clonetrooper_501appo_helmet",
    "SWOP_Clonetrooper_212_helmet",
    "SWOP_Clonetrooper_212hoax_helmet",
    "SWOP_Clonetrooper_212sharp_helmet"
];

private _grenadier_gewehr = [
    "SWOP_DC15AGL"
];

private _grenadier_munition = [
    "5Rnd_HE_Grenade_DC15A"
];

private _dmr_munition = [
    // DISABLED
];

private _rifle_munition = [
    "SWOP_dc15xBlasterRifle_Mag"
];

private _mg_munition = [
    "300Rnd_BlasterLaser_Belt"
];

private _pilot_munition = [

];

private _sniper_munition = [
    // DISABLED
];

private _aaat_munition = [
    "RocketRPS6HEATFF_Mag"//,
    //"RocketRPS6_F"
];

private _gepaeck_klein = [
    "CAA_InvisBag",
    "SWOP_B_CloneBackpack"
];
private _gepaeck_mittel = _gepaeck_klein;
private _gepaeck_gross = _gepaeck_klein;

private _gepaeck_sehrgross = _gepaeck_klein;

private _lrFunken = [
    "SWOP_B_CloneDV"
];

private _moerser_munition = [];

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
            "SWOP_Clonetrooper_501_armor_pauldronsARC",
            "SWOP_Clonetrooper_212_armor_pauldronsARC",

            // Waffen

            // Handwaffen

            // Ferngläser
            "scoutElectroBinoculars_F",

            // Sprengstoffe
            "SW_SquadShield_magCARGA",

            // Nachtsichtgeräte
            "SWOP_rangeARC",
            "SWOP_cosir1",
            "SWOP_cosir2",
            "SWOP_cosir1f",
            "SWOP_cosir2f",
            "SWOP_cosir1a",
            "SWOP_cosir2a",
            "SWOP_cosir4a",

            // Items
            // ### Granaten
            "SW_SquadShield_Mag",
            "SW_DropTurret_Mag"
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
            "SWOP_Clonetrooper_501med_armor",
            "SWOP_Clonetrooper_501kix_armor",
            "SWOP_Clonetrooper_212med_armor",

            // Kopfbedeckung

            // Gepäck
            "SWOP_B_CloneBackpack_med"
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

            // Schrotflinte
            // ### Munition
            // ### Visiere
            // ### Geschützzubehör

            // Westen
            "SWOP_Clonetrooper_501med_armor",
            "SWOP_Clonetrooper_501kix_armor",
            "SWOP_Clonetrooper_212med_armor",

            // Kopfbedeckung

            // Gepäck
            "SWOP_B_CloneBackpack_med"
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

            // Items
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
            "SWOP_Z6Blaster",

            // Westen

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

            // Ferngläser
            "scoutElectroBinoculars_F"

            // Waffen
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
            "SWOP_DC15",
            // ### Visiere
            "swop_dc15s_holoscope",

            // Kopfbedeckung
            "SWOP_Clonetrooper_pilot_helmet501",
            "SWOP_Clonetrooper_pilot_helmet501raven",
            "SWOP_Clonetrooper_pilot_helmet501hawk",
            "SWOP_Clonetrooper_pilot_helmet",

            // Uniform
            "SWOP_Clonetrooper_501_F_CombatUniform",
            "SWOP_Clonetrooper_501tup_F_CombatUniform",
            "SWOP_Clonetrooper_501kix_F_CombatUniform",
            "SWOP_Clonetrooper_501dogma_F_CombatUniform",
            "SWOP_Clonetrooper_501cadet_F_CombatUniform",
            "SWOP_Clonetrooper_212waxer_boil_F_CombatUniform",
            "SWOP_Clonetrooper_212cody_F_CombatUniform",

            // Westen
            "SWOP_Clonetrooper_501_armor",
            "SWOP_Clonetrooper_501jesse_armor",
            "SWOP_Clonetrooper_501dogma_armor",
            "SWOP_Clonetrooper_212_armor",
            "SWOP_Clonetrooper_212waxer_boil_armor",

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
            "SWOP_dc15xBlasterRifle",
            // ### Geschützzubehör

            // ### Visiere

            // Weste

            // Nachtsicht
            "SWOP_visor_w",
            "SWOP_visor_antenna",

            // Binocular
            "scoutElectroBinoculars_F"
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
            // DISABLED
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
            // DISABLED
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

            // Items
            "ACE_M26_Clacker",
            "ACE_DefusalKit",
            "ToolKit",
            "TB_MineDetector",
            // ### Minen
            "TermMine_Mag",
            "TermMineC_Mag",
            "swop_EMP_Remote_Mag",
            // ### Granaten
            "SWOPthrowablectype",
            "SWOPthrowableExplosive",

            // Gepäck
            "SWOP_B_CloneBackpack_dem"
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
            "RocketRPS6_F"

            // Vesten
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
            // DISABLED
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
            // DISABLED
        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
