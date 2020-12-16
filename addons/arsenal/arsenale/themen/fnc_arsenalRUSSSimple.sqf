/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Ansprechpartner: mordl
*/
// Hier kommen alle Items rein die ALLE Rollen haben
_items = [
    // Uniform
    "rhs_uniform_flora_patchless",
    "rhs_uniform_flora_patchless_alt",

   //Googles
    "rhs_scarf",
    "rhs_balaclava1_olive",
    "G_Bandanna_khk",
    "G_Bandanna_oli",

    // Items
    "ACE_CableTie",
    "ACE_acc_pointer_green",
    "ace_acc_pointer_red",
    "ACE_MapTools",
    "ItemWatch",
    "ItemCompass",
    "ItemMap",
    "TFAR_fadak",
    "ACE_SpraypaintBlue",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",

    // Nachtsicht
    "rhs_1PN138",

    // Muzzle Mods
    "rhs_acc_dtk",
    "rhs_acc_dtk4short",
    "rhs_acc_dtk1983",
    "rhs_acc_dtkakm",
    "rhs_acc_pgs64_74un",

    // Scopes
    "rhs_acc_pkas",
    "rhs_acc_ekp1",
    "rhs_acc_pbs4",

    // Pistolen
    "rhs_weap_6p53",
    //"rhs_weap_makarov_pmm", Munitionsbug
    "rhs_weap_pb_6p9",

    // Raketenwerfer
    "rhs_weap_rpg26",

    // Granaten
    "rhs_mag_zarya2",
    "rhs_mag_rgd5",
    "rhs_mag_rgn",
    "rhs_mag_rgo",
    "rhs_mag_rdg2_black",
    "rhs_mag_rdg2_white",

    // Mags Gewehre
    "rhs_30Rnd_545x39_7N22_plum_AK",
    "rhs_30Rnd_545x39_AK_plum_green",


    // Mags Pistolen
    "rhs_18rnd_9x21mm_7N29",
    "rhs_mag_9x18_8_57N181S",

    // Mags Grena
    "rhs_VG40OP_white",
    "rhs_VG40OP_green",
    "rhs_VG40OP_red",
    "rhs_VOG25",
    "rhs_GRD40_White",
    "rhs_GRD40_Green",
    "rhs_GRD40_Red",

    // Mags Marks
    "rhs_10Rnd_762x54mmR_7N1",
    "rhs_5Rnd_338lapua_t5000",

    // Mags mg
    "rhs_75Rnd_762x39mm",
    "rhs_75Rnd_762x39mm_tracer",

    // Mags mp
    "rhs_mag_9x19mm_7n31_44",

    // Mörser Rounds???
    "ACE_1Rnd_82mm_Mo_HE",
    "ACE_1Rnd_82mm_Mo_Smoke",
    "ACE_1Rnd_82mm_Mo_Illum",

    // Mags aa/at
    //"rhs_rpg7_PG7VL_mag",
    //"rhs_mag_9k38_rocket",
    //"rhs_rpg7_PG7VR_mag",
    //"rhs_rpg7_OG7V_mag",
    //"rhs_rpg7_TBG7V_mag", Antiinfantriemunition
    "rhs_rpg7_PG7V_mag"
];

private _front_kopfbedeckung = [
    // Head
    "rhs_6b26_green",
    "rhs_6b26_bala_green",
    "rhs_6b26_ess_green",
    "rhs_6b26_ess_bala_green",
    "rhs_6b27m_green",
    "rhs_6b27m_green_bala",
    "rhs_6b27m_green_ess",
    "rhs_6b27m_green_ess_bala",
    "rhs_beret_mp2",
    "rhs_beret_milp"
];

private _scopes_enhanced = [
    "rhs_acc_nita",
    "rhs_acc_1p78"
];
// #################################################################
// LAYOUTS
// Ab hier sind Items nur noch für die bestimmten Rollen
// #################################################################

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
    {
        _front_kopfbedeckung +
        _scopes_enhanced +
        [
            // Vests
            "rhs_6b23_ML_6sh92_radio",
            "rhs_6b23_6sh92_radio",

            // Weapons
            "rhs_weap_ak74n",

            // Backpacks
            "OPXT_multicamt_117",

            // Items
            "Binocular"
        ]
    };

    case "sani":
    {
        _front_kopfbedeckung +
        [
            // Vests
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",

            // Weapons
            "rhs_weap_aks74n",

            // Backpacks
            "B_TacticalPack_oli"
            //"OPXT_multicamt_117"
        ]
    };

    case "arzt":
    {
        _front_kopfbedeckung +
        [
            // Vests
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",

            // Weapons
            "rhs_weap_aks74un",

            // Backpacks
            "OPXT_multicamt_1523"
        ]
    };

    case "grena":
    {
        _front_kopfbedeckung +
        [
            // Backpacks
            "rhs_assault_umbts",

            // Vests
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog",

            // Weapons
            //"rhs_weap_aks74n_gp25",
            "rhs_weap_ak74n_gp25"
        ]
    };

    case "dmr":
    {
        _front_kopfbedeckung +
        [
            // Vests
            "rhs_6b23_sniper",
            "rhs_6b23_ML_sniper",

            // Waeapons
            "rhs_weap_svdp",
            "rhs_weap_svdp_wd",

            // Scopes
            "rhs_acc_pso1m2",

            // Backpacks
            "rhs_assault_umbts"
            //"OPXT_multicamt_117"
        ]
    };

    case "mg":
    {
        _front_kopfbedeckung +
        [
            // Vests
            "rhs_6b23_rifleman",
            "rhs_6b23_ML_rifleman",

            // Weapons
            "rhs_weap_pm63",

            // Backpacks
            "B_TacticalPack_oli"
        ]
    };

    case "trag":
    {
        _front_kopfbedeckung +
        [
            // Vests
            "rhs_6b23_vydra_3m",
            "rhs_6b23_ML_vydra_3m",

            // Weapons
            "rhs_weap_aks74un",

            // Backpacks
            "B_Carryall_oli"
            //"OPXT_multicamt_1523"
        ]
    };

    case "pilot":
    {
        [
            // Head
            "rhs_tsh4",
            "rhs_tsh4_bala",
            "rhs_tsh4_ess",
            "rhs_tsh4_ess_bala",

            // Vests
            "rhs_6sh92_vsr",
            "rhs_6sh92_digi",

            // Weapons
            "rhs_weap_pp2000",

            // Uniforms
            "rhs_uniform_gorka_r_g",
            "rhs_uniform_gorka_r_y",

            // Items
            "ToolKit",
            "Binocular",

            // Backpacks
            "rhs_sidor",
            "OPXT_ogao_210"
        ]
    };

    case "rifle":
    {
        _front_kopfbedeckung +
        _scopes_enhanced +
        [
            // Backpacks
            "rhs_assault_umbts",

            // Vests
            "rhs_6b23_rifleman",
            "rhs_6b23_ML_rifleman",

            // Weapons
            "rhs_weap_ak74n"

        ]
    };

    case "sniper":
    {
        [
            // Head
            "rhs_fieldcap_khk",
            "rhs_fieldcap_vsr",

            // Items
            "ACE_Tripod",
            "ACE_Kestrel4500",
            "ACE_ATragMX",
            "ACE_RangeCard",

            // Mods
            "muzzle_snds_93mmg",
            "muzzle_snds_93mmg_tan",
            "rhs_acc_dh520x56",

            // Vests
            "rhs_6sh92_vsr",
            "rhs_6sh92_digi",

            // Uniforms
            "rhs_uniform_gorka_r_y",
            "rhs_uniform_gorka_r_g",

            // Weapons
            "rhs_weap_t5000",

            // Backpacks
            "rhs_sidor"
        ]
    };

    case "spotter":
    {
        _scopes_enhanced +
        [
            // Head
            "rhs_fieldcap_khk",
            "rhs_fieldcap_vsr",

            // Uniforms
            "rhs_uniform_gorka_r_y",
            "rhs_uniform_gorka_r_g",

            // Vests
            "rhs_6sh92_vsr_headset",
            "rhs_6sh92_digi",

            // Weapons
            "rhs_weap_ak74n",

            // Items
            "ACE_ATragMX",
            "ACE_Tripod",
            "ACE_RangeTable_82mm",
            "ACE_SpottingScope",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Binocular",

            // Backpacks
            "OPXT_ogao_1523"
        ]
    };

    case "spreng":
    {
        _front_kopfbedeckung +
        _scopes_enhanced +
        [
            // Items
            "ACE_Clacker",
            "ACE_DefusalKit",

            // Vests
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog",

            // Weapons
            "rhs_weap_ak74n",

            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",

            // Explosives
            "DemoCharge_Remote_Mag",
            //"SatchelCharge_Remote_Mag",
            "ATMine_Range_Mag",
            "APERSTripMine_Wire_Mag",

            // Backpacks
            "B_TacticalPack_oli"
        ]
    };

    case "aaat":
    {
        _front_kopfbedeckung +
        [
            // Backpacks
            "rhs_rpg_empty",

            // Vests
            "rhs_6b23_vydra_3m",
            "rhs_6b23_ML_vydra_3m",

            // Weapons
            "rhs_weap_aks74n",

            // Launchers
            "rhs_weap_rpg7",
            //"rhs_weap_igla",

            // Scopes
            "rhs_acc_pgo7v"
        ]
    };

    case "pionier":
    {
        _front_kopfbedeckung +
        [
            // Backpacks
            "B_TacticalPack_oli",

            // Vests
            "rhs_6b23_engineer",
            "rhs_6b23_ML_engineer",

            // Weapons
            "rhs_weap_aks74n",

            // Items
            "ToolKit",
            "TB_building_item_Land_BagFence_Long_F",
            "TB_building_item_Land_BagFence_Round_F"

        ]
    };

    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
