#include "../../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _allgemein = [
    // Gesichtsbedeckung
    "G_Spectacles",
    "G_Spectacles_Tinted",

    // Attachments
    "rhsusf_acc_m952v",
    "acc_flashlight_pistol",

    // Items
    "ACE_CableTie",
    "ACE_Altimeter",
    "ACE_MapTools",
    "Binocular",
    "ItemGPS",
    "ItemWatch",
    "ItemCompass",
    "ItemMap",
    "ACE_ConcertinaWireCoil",
    "ARP_Objects_water_m",
    "ARP_Objects_passport_m",
    "ARP_Objects_card_gun_m",
    "ARP_Objects_clipboard_m",
    "rds_car_FirstAidKit",
    "ARP_Objects_Laptop_M",
    "UMI_Land_Camcorder_F",
    "ACE_Banana",
    "ARP_Objects_folder_m",

    // Visiere
    "rhsusf_acc_t1_high",
    "optic_mrd",

    // Granaten
    "ACE_Chemlight_HiWhite",
    "ACE_M84",

    // SR-Funke
    "TFAR_anprc152",

    // Sonstiges
    "ARP_Objects_moneya_m",
    "ARP_Objects_money_m",
    "ARP_Objects_passport_m",
    "ARP_Objects_smartphone_m"
];

private _allgemein_Uniform = [
    "TB_Uniform_Kommissar_U",
    "TB_Uniform_Sek_U"
];

private _allgemein_Westen = [
    "V_TacVest_blk_POLICE"
];

private _allgemein_Helm = [
    "H_Cap_police"
];

private _allgemein_Waffen = [
    "rhs_weap_M590_5RD",
    "rhsusf_weap_MP7A2",
    "SMG_05_F",
    "SMG_03C_black",
    "SMG_03C_TR_black",
    "rhs_weap_m4_carryhandle_mstock",
    "SMG_01_F",
    "rhsusf_weap_glock17g4",
    "tb_weap_taser",
    "rhsusf_weap_m9",
    "TB_weapon_rhino60"
];

private _allgemein_Magazine = [
    "30Rnd_45ACP_Mag_SMG_01",
    "rhs_mag_30Rnd_556x45_M855_Stanag",
    "50Rnd_570x28_SMG_03",
    "30Rnd_9x21_Mag_SMG_02",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_5Rnd_00Buck",
    "rhsusf_5Rnd_FRAG",
    "rhsusf_5Rnd_Slug",
    "TB_mag_taser",
    "rhsusf_mag_17Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "6Rnd_45ACP_Cylinder"
];

private _items = [];

// #################################################################
// LAYOUTS
// Ab hier sind Items nur noch für die bestimmten Rollen
// #################################################################

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead";
    case "sani": // Polizei
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Rucksack
            "B_AssaultPack_blk"
        ]
    };

    case "arzt";
    case "rifle": // SWAT
    {
        _allgemein +
        _allgemein_Helm +
        _allgemein_Uniform +
        _allgemein_Westen +
        _allgemein_Waffen +
        _allgemein_Magazine +
        [
            // Head
            "TB_helmet_SWAT_01",

            // Uniform
            "rhs_uniform_g3_blk",

            // Vest
            "TB_vest_SWAT",

            // Gesichtsbedeckung
            "rhs_ess_black",
            "rhs_googles_clear",
            "G_Balaclava_TI_blk_F",
            "rhs_balaclava",

            // NV
            "NVGoggles_OPFOR",

            // Waffen
            "rhs_weap_mk18",
            "rhs_weap_sr25",
            "rhs_weap_hk416d10",
            "rhs_weap_sr25_ec",

            // Magazine
            "rhs_mag_30Rnd_556x45_M855_Stanag",
            "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
            "rhsusf_20Rnd_762x51_SR25_m118_special_Mag",
            "rhsusf_20Rnd_762x51_SR25_m62_Mag",
            "rhsusf_20Rnd_762x51_SR25_m118_special_Mag",
            "rhsusf_20Rnd_762x51_SR25_m62_Mag",

            // Items
            "rhsusf_acc_nt4_black",
            "rhsusf_acc_anpeq15a",
            "rhsusf_acc_anpeq15_bk",
            "rhsusf_acc_sr25s",
            "ACE_personalAidKit",
            "ARP_Objects_passport_m",
            "rhsusf_acc_grip3",
            "ARP_Objects_card_gun2_m",
            "ARP_Objects_snakecam_M",
            "rds_car_FirstAidKit",
            "ARP_Objects_Laptop_M",
            "UMI_Land_Camcorder_F",
            "Binocular",

            // Visiere
            "rhsusf_acc_eotech_552",
            "rhsusf_acc_su230",
            "ace_optic_mrco_2d",

            // Granaten  etc
            "rhs_mag_mk84",
            "SmokeShell",
            "SmokeShellGreen",
            "SmokeShellRed",
            "ACE_Chemlight_HiRed",
            "B_IR_Grenade",
            "AMP_Breaching_Charge_Mag",
            "rhs_mag_m7a3_cs",

            // Rucksack
            "B_AssaultPack_blk"
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
            "ToolKit",

            // Uniform
            "U_B_PilotCoveralls",

            // Nightvision
            "ACE_NVG_Wide"
        ]
    };

    default {hint "Falsche Klasse. Schwerer Fehler #100"};
});

_items arrayIntersect _items
