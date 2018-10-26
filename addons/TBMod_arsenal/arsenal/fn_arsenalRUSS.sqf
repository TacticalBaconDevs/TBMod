/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari, mordl
*/
// Hier kommen alle Items rein die ALLE Rollen haben
_items = [
    // Uniform
    "rhs_uniform_flora_patchless",
    "rhs_uniform_mflora_patchless",


    // Head
    "rhs_6b26",
    "rhs_6b26_bala",
    "rhs_6b26_ess",
    "rhs_6b26_ess_bala",
    "rhs_6b27m_ml",
    "rhs_6b27m_ml_ess",
    "rhs_6b27m_ml_bala",
    "rhs_6b27m_ml_ess_bala",
    "rhs_6b27m_ml",
    "rhs_beret_mp2",
    "rhs_beret_vdv3",
    "rhs_beret_milp",
    
    
    //Googles
    "rhs_scarf",
    //Googles (vanilla)
    "G_Bandanna_shades",
    "G_Balaclava_oli",
    "G_Balaclava_blk",
    "G_Bandanna_tan",
    "G_Bandanna_beast",  

    // Items
    "ACE_CableTie",
    "ACE_acc_pointer_green",
    "ACE_acc_pointer_green_IR",
    "ACE_MapTools",
    "ItemWatch",
    "ItemCompass",
    "ItemMap",
    "TFAR_fadak",
    "ACE_SpraypaintBlue",
    "ACE_Flashlight_KSF1",
    "ACE_EntrenchingTool",
	"TB_building_item_Land_BagFence_Long_F",
    "TB_building_item_Land_BagFence_Round_F",

    // Vesten
    "rhs_6b23_ML_6sh92",
    "rhs_6b13_Flora_6sh92",
    "rhs_6b23_ML_6sh92_vog_headset",
    
    // Nachtsicht
    "rhs_1PN138",
    
    // Visiere
    "rhs_acc_1p78",
    "rhs_acc_2dpZenit",
    "rhs_acc_dtk",
    "rhs_acc_dtk4short",
    "rhs_acc_pkas",
    "rhs_acc_1p63",
    "rhs_acc_ekp1",

    // Gewehre
    "rhs_weap_ak74m_desert",
    "rhs_weap_ak74m_camo",
    "rhs_weap_ak74m",
    "rhs_weap_ak105",
    "rhs_weap_pya",
    "rhs_weap_makarov_pmm",
    "rhs_weap_ak74",
    "rhs_weap_ak74m_fullplum",
    
    // Raketenwerfer
    "rhs_weap_rpg26",
  
    // Backpacks
    "rhs_assault_umbts",
    
    // Mags
    "ACE_M84",
    "rhs_30Rnd_545x39_AK",
    "SmokeShell",
    "SmokeShellYellow",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellBlue",
    "rhs_mag_9x19_17",
    "rhs_mag_9x18_12_57N181S",
    "rhs_rpg26_mag",
    "rhs_30Rnd_762x39mm",
    // Neu
    "10Rnd_93x64_DMR_05_Mag",
    "rhs_30Rnd_762x39mm",
    "rhs_5Rnd_338lapua_t5000",
    
    // Mags Grena
    "rhs_VG40OP_white",
    "rhs_VG40OP_green",
    "rhs_VG40OP_red",
    "rhs_VOG25",
    "rhs_GRD40_White",
    "rhs_GRD40_Green",
    "rhs_GRD40_Red",
    
    // Mags dmr
    "rhs_acc_tgpv",
    "rhs_10Rnd_762x54mmR_7N1",
    
    // Mags mg
    "rhs_100Rnd_762x54mmR_green",
    "rhs_100Rnd_762x54mmR",
    
    // Mörser Rounds
    "ACE_1Rnd_82mm_Mo_HE",
    "ACE_1Rnd_82mm_Mo_Smoke",
    "ACE_1Rnd_82mm_Mo_Illum",
    
    // Mags aa/at
    "rhs_rpg7_PG7VL_mag",
    "rhs_mag_9k38_rocket",
    "rhs_rpg7_PG7VR_mag",
    "rhs_rpg7_OG7V_mag",
    "rhs_rpg7_TBG7V_mag"
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
            // Westen        
            "rhs_6b23_rifleman",
            "rhs_6b23_ML_rifleman",
            "rhs_6b23_6sh92_radio",				
            
            // Weapons
            "rhs_weap_ak74m_gp25",
            
            // Backpacks
			
			//Items
			"Binocular"
        ]
    };
    
    case "sani":
    {
        [
            // Westen
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",

            // Items
            "TB_Item_liveMonitor",
            
            // Backpacks
            "B_Kitbag_mcamo",
            "B_Kitbag_rgr"
        ]
    };
    
    case "arzt":
    {
        [
            // Westen
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",

            // Items
            "TB_Item_liveMonitor"
        ]
    };
    
    case "grena":
    {
        [
            "rhs_6b23_6sh92_radio",
            
            //Vesten
            "rhs_6b13_Flora_6sh92_vog",
            
            // Weapons
            "rhs_weap_ak74m_gp25",
            "rhs_weap_ak103_gp25",
            "rhs_weap_akm_gp25"
        ]
    };
    
    case "dmr":
    {
        [
            "rhs_acc_pso1m2",
            "rhs_6b27m_bala",
            "rhs_6b27m_ml_bala",
            "rhs_6b23_sniper",
            "rhs_6b23_ML_sniper",
            "rhs_acc_tgpv",
			
            // Weapons
            "rhs_weap_svdp",
            "rhs_weap_svdp_wd",
            "rhs_weap_svds"
        ]
    };
    
    case "mg":
    {
        [
            // Weapons
            "rhs_weap_pkp"
        ]
    };
    
    case "trag":
    {
        [
            "rhs_6b23_rifleman",
            "rhs_6b23_ML_rifleman"
        ]
    };
    
    case "pilot":
    {
        [
            // Stuff
            "rhs_tsh4_bala",
            "rhs_tsh4_ess",
            "rhs_tsh4_ess_bala",
            "rhs_vest_commander",
            "rhs_tsh4",       
            
            //uniformen
            "rhs_uniform_gorka_r_g",
            "rhs_uniform_gorka_r_y",
            
            // Items
            "ToolKit"
        ]
    };
    
    case "rifle":
    {
        [
            "rhs_6b23_rifleman",
            "rhs_6b23_ML_rifleman"
        ]
    };
    
    case "sniper":
    {
        [
            "V",
            "ACE_Tripod",
            "ACE_Kestrel4500",
            "ACE_ATragMX",
            "ACE_RangeCard",
            "ACE_Vector",
            
            //Neu
            "muzzle_snds_93mmg",
            "muzzle_snds_93mmg_tan",
            "rhs_acc_dh520x56",
            
            // Weapons
            "rhs_weap_t5000"
        ]
    };
    
    case "spotter":
    {
        [
            "ACE_ATragMX",
            "ACE_Tripod",
            "ACE_RangeTable_82mm",
            "ACE_SpottingScope",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Binocular",
            "ACE_Vector"
        ]
    };
    
    case "spreng":
    {
        [
		    "ACE_Clacker",
            "ACE_DefusalKit",
            "ToolKit",
            
            //Vesten
            "rhs_6b13_Flora_6sh92_vog",
            
            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",
            
            // Mags
            "rhs_mine_pmn2_mag",
            "rhs_mine_tm62m_mag"
        ]
    };
    
    case "aaat":
    {
        [
            // Weapons
            "rhs_weap_rpg7",
            "rhs_weap_igla"
        ]
    }; 
    
    case "pionier":
    {
        [
            // Items
            "MineDetector",
            //"MCC_multiTool",
            "ACE_DefusalKit",
            "ToolKit",
            
            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3"
        ]
    };
    
    default {hint "Schwerer Fehler #100"};
});

_items arrayIntersect _items
