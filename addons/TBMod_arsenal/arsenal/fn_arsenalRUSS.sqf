/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari, mordl
*/
// Hier kommen alle Items rein die ALLE Rollen haben
_items = [
    // Uniform
    "rhs_uniform_flora_patchless",
    "rhs_uniform_flora_patchless_alt",


    // Head
    "rhs_6b26",
    "rhs_6b26_bala",
    "rhs_6b26_ess",
    "rhs_6b26_ess_bala",
    "rhs_6b27m_green",
    "rhs_6b27m_green_bala",
    "rhs_6b27m_green_ess",
    "rhs_6b27m_green_ess_bala",
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
    
    // Nachtsicht
    "rhs_1PN138",

	// Mods
    "rhs_acc_dtk",
    "rhs_acc_dtk4short",
    "rhs_acc_pkas",
    "rhs_acc_ekp1",
	"rhs_acc_pgs64_74un",
	"rhs_acc_dtkakm",
	"rhs_acc_1p78",
	"rhs_acc_ekp8_02",
	"rhs_acc_nita",
	"rhs_acc_pbs4",
	
	// Pistolen
	//"rhs_weap_6p53",
    "rhs_weap_makarov_pmm",
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
  
    // Backpacks
    "rhs_assault_umbts",
    
    // Mags Gewehre
	"rhs_30Rnd_545x39_7N22_plum_AK",
    "rhs_30Rnd_545x39_AK_plum_green",

	
	// Mags Pistolen
	//"rhs_18rnd_9x21mm_7N29",
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
            // Vests        
            "rhs_6b23_ML_6sh92_radio",
            "rhs_6b23_6sh92_radio",				
            
            // Weapons
            "rhs_weap_aks74un",
			
			// Backpacks
		    "OPXT_multicamt_117",
			
			// Items
			"Binocular"
        ]
    };
    
    case "sani":
    {
        [
            // Vests
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",
			
			// Weapons
			"rhs_weap_aks74n",
			"rhs_weap_ak74n",

            // Items
            "TB_Item_liveMonitor",
            
            // Backpacks
            "B_Kitbag_mcamo",
            "B_Kitbag_rgr"
			//"OPXT_multicamt_117"
        ]
    };
    
    case "arzt":
    {
        [		 
            // Vests
            "rhs_6b23_medic",
            "rhs_6b23_ML_medic",
			
			// Weapons
			"rhs_weap_aks74u",

            // Items
            "TB_Item_liveMonitor",
			
			// Backpacks
			"OPXT_multicamt_1523"
        ]
    };
    
    case "grena":
    {
        [          
            // Vests
            "rhs_6b23_6sh92_vog",
            "rhs_6b23_ML_6sh92_vog",			
            
            // Weapons
            "rhs_weap_aks74_gp25",
			"rhs_weap_ak74_gp25"
			
			// Backpacks
        ]
    };
    
    case "dmr":
    {
        [
            // Vests
            "rhs_6b23_sniper",
            "rhs_6b23_ML_sniper",

            // Waffen
            "rhs_weap_svdp",
            "rhs_weap_svdp_wd",
            "rhs_weap_svds",
			
			// Mods
			"rhs_acc_pso1m2"
			
			// Backpacks
			//"OPXT_multicamt_117"
        ]
    };
    
    case "mg":
    {
        [
		    // Vests
			"rhs_6b23_rifleman",
			"rhs_6b23_ML_rifleman",
		
            // Weapons
            "rhs_weap_pm63"
        ]
    };
    
    case "trag":
    {
        [
		    // Vests
            "rhs_6b23_vydra_3m",
            "rhs_6b23_ML_vydra_3m"
			
			// Backpacks
			//"OPXT_multicamt_1523"
        ]
    };
    
    case "pilot":
    {
        [
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
			
			// Backpacks
			"OPXT_ogao_210",
			"OPXT_oga_210"			
        ]
    };
    
    case "rifle":
    {
        [
		    // Vests
            "rhs_6b23_rifleman",
            "rhs_6b23_ML_rifleman"
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
            "rhs_weap_t5000"
        ]
    };
    
    case "spotter":
    {
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
		
		    // Items
            "ACE_ATragMX",
            "ACE_Tripod",
            "ACE_RangeTable_82mm",
            "ACE_SpottingScope",
            "ACE_Kestrel4500",
            "ACE_RangeCard",
            "Binocular",
			
			// Backpacks
            "OPXT_oga_1523",
			"OPXT_ogao_1523"
        ]
    };
    
    case "spreng":
    {
        [   
		    // Items
		    "ACE_Clacker",
            "ACE_DefusalKit",
            "ToolKit",
            
            // Vests
            "rhs_6b23_6sh92_vog",
			"rhs_6b23_ML_6sh92_vog",
            
            // Minensucher
            "ACE_VMH3",
            "ACE_VMM3",
            
            // Explosives
            "rhs_mine_pmn2_mag",
            "rhs_mine_tm62m_mag"
			
			// Backpacks
        ]
    };
    
    case "aaat":
    {
        [
		    // Vests
			"rhs_6b23_vydra_3m",
			"rhs_6b23_ML_vydra_3m",
			
            // Weapons
            "rhs_weap_rpg7",
            "rhs_weap_igla"
        ]
    }; 
    
    case "pionier":
    {
        [
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
