/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: IDarky
*/
private _allgemein = [
    // Gesichtsbedeckung
    "G_Balaclava_blk",
    "G_Balaclava_TI_blk_F",
    "G_Bandanna_beast",

    // Pistolen + Munition
    "tb_weap_taser",
    "TB_mag_taser",

    // Rucksäcke
    "B_LegStrapBag_black_F",
    // ### LR-Funke
    "OPXT_blk_1523", // schwarz

    // Attachments
    "acc_flashlight_pistol",
    "acc_pointer_ir",
    "ace_optic_mrco_2d",
    "bipod_01_f_blk",

    // Items
    "ACE_NVG_Gen4",
    "ACE_CableTie",
    "ACE_Altimeter",
    "ACE_MapTools",
    "ACE_RangeTable_82mm",
    "Binocular",
    "ItemGPS",
    "ItemWatch",
    "ItemCompass",
    "ItemMap",
    "ACE_HuntIR_monitor",
    "ACE_UAVBattery",
    "ACE_HuntIR_M203",
    "ACE_ConcertinaWireCoil",
    "AMP_Breaching_Charge_Mag",

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
    "optic_holosight_khk_f",
    "optic_holosight",
    "optic_yorris",

    // Granaten
    "SmokeShell",
    "SmokeShellGreen",
    "SmokeShellBlue",
    "ACE_M84",

    // SR-Funke
    "TFAR_anprc152"
];

private _allgemein_Uniform = [
    "TB_Uniform_Kommissar_U",
    "TB_Uniform_Sek_U"
];

private _allgemein_Westen = [
    "V_PlateCarrier1_blk"
];

private _allgemein_Helm = [
    "H_HelmetSpecB_blk"
];

private _allgemein_Waffen = [
    "srifle_EBR_F",
    "arifle_SPAR_01_blk_F"
];

private _allgemein_Magazine = [
    "20Rnd_762x51_Mag",
    "30Rnd_556x45_Stanag_Tracer_Green"
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
        _allgemein_Waffen +
        [
            // Items
            "B_UavTerminal",
            "ACE_UAVBattery",
            "Laserdesignator",
            "Laserbatteries"
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
        [
            "B_Messenger_Black_F"
        ]
    };

    case "dmr":
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Magazine +
        _allgemein_Waffen +
        [
            // Attachments
            "optic_DMS"
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

    case "pilot":
    {
        _allgemein +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Head
            "H_PilotHelmetHeli_B",

            // Items
            "ToolKit"
        ]
    };

    default {hint "Falsche Klasse. Schwerer Fehler #100"};
});

_items arrayIntersect _items
