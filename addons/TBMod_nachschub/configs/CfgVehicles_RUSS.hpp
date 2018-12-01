/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari, IDarky
*/
class TB_supply_russ_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Munition",RUSS);
    
    class TransportMagazines
    { 
        MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N6_AK,30);    // Standard GewehrMag
        MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_AK_green,20);  // Standard GewehrMag
        MACRO_ADDMAGAZINE(rhs_10Rnd_763x54mmR_7N14,6);    // DMR
        MACRO_ADDMAGAZINE(rhs_10Rnd_763x54mmR_7N1,6);     // DMR
        MACRO_ADDMAGAZINE(rhs_75Rnd_762x39mm_tracer,10);  // MG
        MACRO_ADDMAGAZINE(rhs_5Rnd_338lapua_t5000,10);    // Sniper
    };
};

class TB_supply_russ_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",RUSS);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,20);
        MACRO_ADDMAGAZINE(SmokeShellRed,10);
        MACRO_ADDMAGAZINE(SmokeShellBlue,10);
        
        MACRO_ADDMAGAZINE(rhs_mag_m67,5);       // Splitternade
        MACRO_ADDMAGAZINE(rhs_mag_mk3a2,10);    // Offensivenade
        MACRO_ADDMAGAZINE(rhs_mag_mk84,3);      // Stannade
    };
};

class TB_supply_russ_unterlauf : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
{
    PUBLIC_NAME_CAT("Unterlauf",RUSS);
    
    class TransportMagazines
    {
        // Explosiv
        MACRO_ADDMAGAZINE(rhs_VG40SZ,5);
        MACRO_ADDMAGAZINE(rhs_VG40TB,5);
        MACRO_ADDMAGAZINE(rhs_VOG25,3);
        MACRO_ADDMAGAZINE(rhs_VOG25P,3);
        
        // Smokes
        MACRO_ADDMAGAZINE(rhs_GDM40,4);
        MACRO_ADDMAGAZINE(rhs_GRD40_Green,3);
        MACRO_ADDMAGAZINE(rhs_GRD40_Red,3);
        MACRO_ADDMAGAZINE(rhs_GRD40_White,3);
        
        // Flares
        MACRO_ADDMAGAZINE(rhs_VG40OP_green,3);
        MACRO_ADDMAGAZINE(rhs_VG40OP_white,3);
        MACRO_ADDMAGAZINE(rhs_VG40OP_red,3);
    };
};

class TB_supply_russ_Einweg : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("EinwegWerfer",RUSS);
    
    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_rshg2,4);
        MACRO_ADDWEAPON(rhs_weap_rpg26,4);
    };
};

class TB_supply_russ_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",RUSS);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_rpg7_type69_airburst_mag,1);
        MACRO_ADDMAGAZINE(rhs_rpg7_TBG7V_mag,1);  
        MACRO_ADDMAGAZINE(rhs_rpg7_PG7VR_mag,3);
        MACRO_ADDMAGAZINE(rhs_rpg7_PG7V_mag,3);
        MACRO_ADDMAGAZINE(rhs_rpg7_PG7VL_mag,3);
        MACRO_ADDMAGAZINE(rhs_mag_9k38_rocket,3);
    };
};

class TB_supply_russ_night : WRAPPER_NAME(Box_NATO_Equip_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",RUSS);
    
    class TransportItems
    {
        MACRO_ADDITEM(rhsusf_ANPVS_14,5);
        MACRO_ADDITEM(rhsusf_ANPVS_15,5);
        
        MACRO_ADDITEM(ACE_IR_Strobe_Item,10);
        MACRO_ADDITEM(ACE_Flashlight_KSF1,10);
        
        MACRO_ADDITEM(ACE_Chemlight_HiYellow,10);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
    };
};