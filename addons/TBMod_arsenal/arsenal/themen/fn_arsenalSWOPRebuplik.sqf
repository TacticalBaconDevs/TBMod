/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: Jojo
*/

private _allgemein = [
    // Gepäck
    "SWOP_B_CloneBackpack",
    "SWOP_InvisBag",
    // ### LR-Funke
    "SWOP_B_CloneDVa",

    // Gesichtsbedeckung
    "SWOP_Clones_HUD",

    // Nachtsichtgeräte
    "SWOP_visor_w",
    "SWOP_visor_antenna",

    // Ferngläser
    "ElectroBinocularsW_F",

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

    // Items
    // ### Items
    "ACE_MapTools",
    "ACE_CableTie",
    "ACE_EntrenchingTool",
    "ACE_SpareBarrel",
    // ### Granaten
    "SWOP_termDet_G",
    "SWOP_SCAR_EMP_GrenadeGM",
    "swop_SmokeShell",
    "swop_mag_flashbang",
    "swop_mag_gimpact",
    "swop_mag_incendiary"
];

private _allgemein_magazine = [
    "SWOP_DC15_Mag",
    "SWOP_DC15ABlasterRifle_Full_Mag",
    "SWOP_DC15ABlasterRifle_Mag",
    "SWOP_DC15ABlasterRifle_Low_Mag",
    "swop_RepShotgun_Mag"
];

private _allgemein_gewehre = [
    "SWOP_DC15",
    "SWOP_DC15ABlasterRifle",
    "swop_RepShotgun"
];
_allgemein_gewehre append _allgemein_magazine;

private _allgemein_visiere = [
    "swop_dc15s_holoscope",
    "swop_dc15a_holoscope"
];

private _allgemein_befestigungsschiene = [

];

private _allgemein_geschuetzzubehoer = [

];

private _allgemein_zweibein = [

];

private _allgemein_raketenwerfer = [

];

private _allgemein_handfeuerwaffen = [
    // "SWOP_DC15_sh",     // Shield
    "SWOP_DC15SAPistol",
    "SWOP_DC17Pistol",
    // ### Munition
    "SWOP_DC15SAPistol_Mag",
    "SWOP_DC17Pistol_Mag"
];

private _allgemein_uniformen = [
    "SWOP_Clonetrooper_501_F_CombatUniform",
    "SWOP_Clonetrooper_212_F_CombatUniform",
    "SWOP_Clonetrooper_74_F_CombatUniform"
];

private _allgemein_westen = [
    "SWOP_Clonetrooper_501_armor",
    "SWOP_Clonetrooper_212_armor",
    "SWOP_Clonetrooper_74_armor"
];

private _allgemein_kopfbedeckung = [
    "SWOP_Cloneofficer_capM",
    "SWOP_Clonetrooper_501_helmet",
    "SWOP_Clonetrooper_212_helmet",
    "SWOP_Clonetrooper_74_helmet"
];

private _grenadier_gewehr = [
    "SWOP_DC15AGL"
];

private _grenadier_munition = [
    "5Rnd_HE_Grenade_DC15A"
];

private _dmr_munition = [
    "SWOP_dc15xBlasterRifle_Mag"
];

private _mg_munition = [
    "300Rnd_BlasterLaser_Belt"
];

private _pilot_munition = [

];

private _sniper_munition = [

];

private _aaat_munition = [
    "Rocket_F"
];

private _gepaeck_mittel = [

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
            // Kopfbedeckung
            "SWOP_Clonetrooper_501appo_helmet",
            "SWOP_Clonetrooper_212cody_helmet",
            "SWOP_Clonetrooper_74cad_helmet",

            // Uniform
            "SWOP_Clonetrooper_501sargeant_F_CombatUniform",
            "SWOP_Clonetrooper_212cody_F_CombatUniform",
            "SWOP_Clonetrooper_74sage_F_CombatUniform",

            // Weste
            "SWOP_Clonetrooper_501_armor_pauldrons2",
            "SWOP_Clonetrooper_212_armor_pauldrons2",
            "SWOP_Clonetrooper_74_armor_kama",

            // Nachtsichtgeräte
            "SWOP_cosir1",
            "SWOP_cosir2",
            "SWOP_cosir5",
            "SWOP_cosir1f",
            "SWOP_cosir4f",
            "SWOP_cosir5f",
            "SWOP_cosir2f",
            "SWOP_cosir1a",
            "SWOP_cosir2a",
            "SWOP_cosir5a",
            "SWOP_rangeARC",
            "SWOP_range",

            // Items
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
        _allgemein_raketenwerfer +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _allgemein_kopfbedeckung +
        _gepaeck_mittel +
        [
            // Weste
            "SWOP_Clonetrooper_501med_armor",
            "SWOP_Clonetrooper_501kix_armor",
            "SWOP_Clonetrooper_212med_armor",
            "SWOP_Clonetrooper_74med_armor",

            // Rucksack
            "SWOP_B_CloneBackpack_med",

            // Items
            "SW_SquadShield_Mag",
            // ### Granate
            "SWOP_bacta_G"
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
            // Weste
            "SWOP_Clonetrooper_501med_armor",
            "SWOP_Clonetrooper_501kix_armor",
            "SWOP_Clonetrooper_212med_armor",
            "SWOP_Clonetrooper_74med_armor",

            // Rucksack
            "SWOP_B_CloneBackpack_med",

            // Items
            "SW_SquadShield_Mag",
            // ### Granate
            "SWOP_bacta_G"
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
            "SWOP_Clonetrooper_501_armor_grenade",
            "SWOP_Clonetrooper_212_armor_grenade",
            "SWOP_Clonetrooper_74_armor_grenade"
        ]
    };

    case "dmr":
    {
        _allgemein +
        _allgemein_magazine +
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
            // Westen
            "SWOP_Clonetrooper_212waxer_boil_armor",
            "SWOP_Clonetrooper_501jesse_armor",
            "SWOP_Clonetrooper_74jang_armor",

            // Gewehre
            "SWOP_dc15xBlasterRifle",
            "SWOP_DC15ABlasterRifle_mod1",
            "SWOP_DC15ABlasterRifle_mod0",
            // ### Visiere
            "swop_dc15a_zoomscopex10range",
            "swop_dc15a_zoomscopex8",
            "swop_dc15a_zoomscope",

            // Nachtsichtgeräte
            "SWOP_range"
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
            // Westen
            "SWOP_Clonetrooper_212_armor_recon",
            "SWOP_Clonetrooper_501_armor_recon",
            "SWOP_Clonetrooper_74_armor_recon",

            // Gewehre
            "SWOP_Z6Blaster"
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
        [

        ]
    };

    case "pilot":
    {
        _allgemein +
        _allgemein_magazine +
        _allgemein_handfeuerwaffen +
        _allgemein_uniformen +
        _allgemein_westen +
        _pilot_munition +
        [
            // Gewehr
            "SWOP_DC15",

            // Kopfbedeckung
            "SWOP_Clonetrooper_pilot_helmet",
            "SWOP_Clonetrooper_pilot_helmet501hawk",
            "SWOP_Clonetrooper_pilot_helmet501raven",
            "SWOP_Clonetrooper_pilot_helmet501",
            "SWOP_Clonetrooper_pilot_helmet74",

            // Items
            "ToolKit"
        ]
    };

    case "rifle": // JETPack
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
            // Westen
            "SWOP_Clonetrooper_501hardcase_armor",
            "SWOP_Clonetrooper_212waxer_boil_armor",
            "SWOP_Clonetrooper_74jang_armor",

            // Handwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Gepäck
            "SWOP_B_CloneBackpack_dem",

            // Items
            "ACE_Clacker",
            "ACE_M26_Clacker",
            "ACE_DeadManSwitch",
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter",
            // ### Sprengstoffe
            "swop_EMP_Remote_Mag",
            "TermMine_Mag",
            "TermMineB_Mag",
            "TermMineC_Mag",
            // ### Granaten
            "SWOP_termDet_Gm"
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
            // Westen
            "SWOP_Clonetrooper_212_armor_grenade",
            "SWOP_Clonetrooper_501_armor_grenade",
            "SWOP_Clonetrooper_74_armor_grenade",

            // Raketenwerfer
            "RocketL_F"
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
            // Gepäck
            "Recon_Droid_Bag"
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
            // Handwaffen
            "ACE_VMH3",
            "ACE_VMM3",

            // Westen
            "SWOP_Clonetrooper_501hardcase_armor",
            "SWOP_Clonetrooper_212waxer_boil_armor",
            "SWOP_Clonetrooper_74jang_armor",

            // Gepäck
            "SWOP_B_CloneBackpack_dem",

            // Items
            "ACE_Clacker",
            "ACE_M26_Clacker",
            "ACE_DeadManSwitch",
            "ACE_DefusalKit",
            "ToolKit",
            "ACE_wirecutter",
            // ### Sprengstoffe
            "swop_EMP_Remote_Mag",
            "TermMine_Mag",
            "TermMineB_Mag",
            "TermMineC_Mag",
            // ### Granaten
            "SWOP_termDet_Gm"
        ]
    };

    default {hint "Schwerer Fehler #100"; []};
});

_items arrayIntersect _items
