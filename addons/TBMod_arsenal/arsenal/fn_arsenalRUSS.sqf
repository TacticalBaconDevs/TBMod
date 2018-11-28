/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
// Hier kommen alle Items rein die ALLE Rollen haben
_items = [
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
    "rhs_beret_milp",

    // Googles
    "rhs_scarf",
    "rhs_balaclava1_olive",
    "rhs_balaclava",

    // Goggles Vanilla
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

    // Uniform
    "rhs_uniform_flora_patchless",
    "rhs_uniform_flora_patchless_alt",
    "rhs_uniform_msv_emr",
    "rhs_uniform_vdv_emr",
    "rhs_uniform_emr_des_patchless",
    "rhs_uniform_mflora_patchless",
    "rhs_uniform_gorka_r_g",
    "rhs_uniform_gorka_r_y",

    // Vests 
    "rhs_6b13_Flora_6sh92",
    "rhs_6b13_EMR_6sh92",
    "rhs_6b13_6sh92",
    "rhs_6b23_6sh92",
    "rhs_6b23_digi_6sh92",
    "rhs_6b23_ML_6sh92",


    // Backpacks 
    "rhs_assault_umbts",
    
    // Waffen 
    "rhs_weap_ak74n",
    "rhs_weap_ak74n_npz",
    "rhs_weap_ak74n_2_npz",
    "rhs_weap_ak74mr",
    "rhs_weap_ak74m_npz",
    "rhs_weap_ak74m",

    // Pistolen
    "rhs_weap_6p53",
    "rhs_weap_pb_6p9",
    "rhs_weap_makarov_pm",
    
    // Raketenwerfer
    "rhs_weap_rpg26",
    "rhs_weap_rshg2",

    // Magazine 
    "rhs_30Rnd_545x39_AK_plum_green",
    "rhs_30Rnd_545x39_AK_green",
    "rhs_30Rnd_545x39_7U1_AK",
    "rhs_30Rnd_545x39_7N22_plum_AK",
    "rhs_30Rnd_545x39_7N22_AK",
    "rhs_30Rnd_545x39_7N22_desert_AK",
    "rhs_mag_9x18_8_57N181S",
    "rhs_mag_9x19_17",

    // Unterlaufgranaten + Granaten 
    "rhs_VOG25",
    "rhs_GRD40_Red",
    "rhs_GRD40_White",
    "rhs_GRD40_Green",
    "rhs_GDM40",
    "rhs_mag_mk3a2",
    "rhs_mag_rdg2_black",
    "rhs_mag_rdg2_white",


    // Visire
    "rhs_acc_pkas",
    "rhs_acc_ekp1",
    "rhs_acc_1p87",
    "rhs_acc_rakurspm",

    // Attachments 
    "rhs_acc_dtk3",
    "rhs_acc_dtk4short",
    "rhs_acc_dtk1983",
    "rhs_acc_perst3",
    "rhs_acc_perst3_top",
    "rhs_acc_perst3_2dp_light_h",
    "rhs_acc_perst1ik",
    "rhs_acc_2dpzenit",
    "ths_acc_grip_ffg2",
    
    // Items
    "ACE_CableTie",
    "ACE_acc_pointer_green",
    "ACE_acc_pointer_green_IR",
    "ACE_MapTools",
    "ACE_Altimeter",
    "ItemWatch",
    "ItemCompass",
    "ItemGPS",
    "ItemMap",
    "TFAR_fadak",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",
    
    // Nachtsicht
    "rhs_1PN138"

];    
// #################################################################
// LAYOUTS
// Ab hier sind Items nur noch für die bestimmten Rollen
// #################################################################

_items append (switch (ACE_player getVariable ["TB_rolle", ""]) do
{
    case "lead":
    {   
        
        [   
            // Vests        
            "rhs_6b23_ML_6sh92_radio",
            "rhs_6b23_6sh92_radio",
            "rhs_6b23_digi_6sh92_radio",
            "rhs_6b13_6sh92_vog_headset",
            "rhs_6b13_Flora_6sh92_radio",
            "rhs_6b13_6sh92_radio",               
            
            // Weapons
            "rhs_weap_ak74mr_gp25",
            "rhs_weap_ak74m_gp25",
            "rhs_weap_ak74n_gp25_npz",

            // Backpacks
            "OPXT_pen_grz_1523",
            "OPXT_pen_bad_1523",
            "OPXT_m81_1523",
            "OPXT_at_ix_1523",
            "OPXT_multicamt_1523",

            // Items
            "Binocular",
            "rhs_pdu4"
        ]
    };
    
    case "sani":
    {
        [
            // Vests
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",          

            // Items
            "TB_Item_liveMonitor"          
            
        ]
    };
    
    case "arzt":
    {
        [         
            // Vests
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",

            // Items
            "TB_Item_liveMonitor",
            
            // Backpacks
            "OPXT_pen_grz_1523",
            "OPXT_pen_bad_1523",
            "OPXT_m81_1523",
            "OPXT_at_ix_1523",
            "OPXT_multicamt_1523"
        ]
    };
    
    case "grena":
    {
        [          
            // Backpacks 
            "rhs_assault_umbts",
            
            // Vests
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog",
            "rhs_6b13_EMR_6sh92_vog",            
            "rhs_6b13_6sh92_vog",

            // Weapons
            "rhs_weap_ak74mr_gp25",
            "rhs_weap_ak74m_gp25",
            "rhs_weap_ak74n_gp25_npz"
        ]
    };
    
    case "dmr":
    {
        [
            // Vests
            "rhs_6b23_sniper",
            "rhs_6b23_ML_sniper",

            // Waeapons
            "rhs_weap_svdp",
            "rhs_weap_svdp_wd",
            
            // Scopes
            "rhs_acc_pso1m2",
            "rhs_acc_pso1m21",

            //Munition
            "rhs_10Rnd_763x54mmR_7N14",
            "rhs_10Rnd_763x54mmR_7N1"

        ]
    };
    
    case "mg":
    {
        [
            // Vests
            "rhs_6b23_6sh116_vog_od",
            "rhs_6b23_6sh116_vog",
            "rhs_6b23_6sh116_vog_flora",
        
            // Weapons
            "rhs_weap_pm63",
            "rhs_weap_ak103_zenitco01_b33",

            // Munition
            "rhs_75Rnd_762x39mm_tracer",
            "rhs_75Rnd_762x39mm"
        ]
    };
    
    case "trag":
    {
        [
            // Vests
            "rhs_6b23_6sh116_vog_od",
            "rhs_6b23_6sh116_vog",
            "rhs_6b23_6sh116_vog_flora",

            // Zusatzmuni
            "rhs_75Rnd_762x39mm_tracer",
            "rhs_75Rnd_762x39mm",
            "rhs_10Rnd_763x54mmR_7N14",
            "rhs_10Rnd_763x54mmR_7N1",
            "rhs_rpg7_type69_airburst_mag",
            "rhs_rpg7_TBG7V_mag",
            "rhs_rpg7_PG7VR_mag",
            "rhs_rpg7_PG7V_mag",
            "rhs_rpg7_PG7VL_mag",
            "rhs_mag_9k38_rocket",

            // Backpacks
            "B_Carryall_oli",
            "B_Carryall_khk"
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
            "rhs_zsh7a_mike_alt",
            "rhs_zsh7a_mike_",
            "rhs_zsh7a",
            "rhs_zsh7a_alt",

            //Uniform 
            "rhs_uniform_df15_tan",
            "rhs_uniform_df15",
        
            // Vests
            "rhs_6sh92_vsr_headset",
            "rhs_6sh92_digi",       
            
            // Weapons
            "rhs_weap_pp2000",

            // Munition
            "rhs_mag_9x19mm_7n31_44",
            "rhs_mag_9x19mm_7n31_20",

            // Items
            "ToolKit",
            "Binocular",            
            
            // Backpacks
            "OPXT_pen_grz_1523",
            "OPXT_pen_bad_1523",
            "OPXT_m81_1523",
            "OPXT_at_ix_1523",
            "OPXT_multicamt_1523",
            "OPXT_wht_1523",
            "OPXT_blk_1523"
        ]
    };
    
    case "rifle":
    {
        [   
        
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
                        
            // Attachments
            "rhs_acc_harris_swivel",            
            
            // Vests
            "rhs_6sh92_vsr",
            "rhs_6sh92_digi",
                     
            // Weapons
            "rhs_weap_t5000",
            
            // Backpacks
            "OPXT_pen_grz_1523",
            "OPXT_pen_bad_1523",
            "OPXT_m81_1523",
            "OPXT_at_ix_1523",
            "OPXT_multicamt_1523"
        ]
    };
    
    case "spotter":
    {
        [
            // Head
            "rhs_fieldcap_khk",
            "rhs_fieldcap_vsr",
            
            // Vests
            "rhs_6sh92_vsr_headset",
            "rhs_6sh92_digi",

            // Items
            "ACE_ATragMX",
            "ACE_Tripod",
            "ACE_RangeTable_82mm",
            "ACE_SpottingScope",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Binocular",
            
            // Backpacks
            "OPXT_pen_grz_1523",
            "OPXT_pen_bad_1523",
            "OPXT_m81_1523",
            "OPXT_at_ix_1523",
            "OPXT_multicamt_1523"
        ]
    };
    
    case "spreng":
    {
        [   
            // Items
            "ACE_Clacker",
            "ACE_DefusalKit",
            
            // Vests
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog",
            
            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",
            
            // Explosives
            "DemoCharge_Remote_Mag",
            "SatchelCharge_Remote_Mag",
            "ATMine_Range_Mag",
            "APERSTripMine_Wire_Mag",
            
            // Backpacks
            "B_TacticalPack_oli"
        ]
    };
    
    case "aaat":
    {
        [
            // Backpacks
            "rhs_rpg_empty",
            
            // Vests
            "rhs_6b23_vydra_3m",
            "rhs_6b23_ML_vydra_3m", 
            
            // Launchers
            "rhs_weap_rpg7",
            "rhs_weap_igla",

            // Werfer Muniton
            "rhs_rpg7_type69_airburst_mag",
            "rhs_rpg7_TBG7V_mag",
            "rhs_rpg7_PG7VR_mag",
            "rhs_rpg7_PG7V_mag",
            "rhs_rpg7_PG7VL_mag",
            "rhs_mag_9k38_rocket",

            // Scopes
            "rhs_acc_pgo7v3"
        ]
    }; 
    
    case "pionier":
    {
        [
            // Backpacks
            "B_TacticalPack_oli",
            
            // Vests
            "rhs_6b23_engineer",
            "rhs_6b23_ML_engineer",
            
            // Items
            "ToolKit",
            "TB_building_item_Land_BagFence_Long_F",
            "TB_building_item_Land_BagFence_Round_F"            
            
        ]
    };
    
    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
