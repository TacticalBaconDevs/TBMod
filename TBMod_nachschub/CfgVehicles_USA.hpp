class TB_supply_usa_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Munition",USA);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_Stanag,30);    // Standart GewehrMag
        MACRO_ADDMAGAZINE(rhs_200rnd_556x45_M_SAW,2);                // MGMag5.56
        MACRO_ADDMAGAZINE(rhsusf_50Rnd_762x51,4);                    // MGMag7.62
        MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_m118_special_Mag,4);    // DMR7.62
        MACRO_ADDMAGAZINE(rhsusf_5Rnd_762x51_m118_special_Mag,4);    // DMR7.62
        MACRO_ADDMAGAZINE(rhsusf_10Rnd_762x51_m118_special_Mag,4);    // DMR7.62
    };
};

class TB_supply_usa_ammoSmall : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",USA);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_mag_17Rnd_9x19_JHP,15);
        MACRO_ADDMAGAZINE(rhsusf_mag_7x45acp_MHP,15);
        MACRO_ADDMAGAZINE(rhsusf_mag_15Rnd_9x19_JHP,15);
        MACRO_ADDMAGAZINE(hlc_12Rnd_357SIG_JHP_P226,15);
    };
};

class TB_supply_usa_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",USA);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,20);
        MACRO_ADDMAGAZINE(SmokeShellRed,10);
        MACRO_ADDMAGAZINE(SmokeShellBlue,10);
        
        MACRO_ADDMAGAZINE(rhs_mag_m67,5);        // Splitternade
        MACRO_ADDMAGAZINE(rhs_mag_mk3a2,10);    // Offensivenade
        MACRO_ADDMAGAZINE(rhs_mag_mk84,3);        // Stannade
    };
};

class TB_supply_usa_unterlauf : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
{
    PUBLIC_NAME_CAT("Unterlauf",USA);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,15);
        MACRO_ADDMAGAZINE(1Rnd_Smoke_Grenade_shell,10);
        MACRO_ADDMAGAZINE(UGL_FlareWhite_F,3);
    };
};

class TB_supply_usa_spezial : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("SpezialwaffenMunition",USA);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(5Rnd_127x108_Mag,10);
        MACRO_ADDMAGAZINE(5Rnd_127x108_APDS_Mag,5);
        
        MACRO_ADDMAGAZINE(rhsusf_8Rnd_00Buck,15);
        MACRO_ADDMAGAZINE(rhsusf_8Rnd_Slug,5);
        MACRO_ADDMAGAZINE(rhsusf_8Rnd_FRAG,5);
    };
};

class TB_supply_usa_launcher : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Werfer",USA);
    
    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_M136_hp,1);
        MACRO_ADDWEAPON(rhs_weap_M136_hedp,3);
    };
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_m136_hp_mag,1);
        MACRO_ADDMAGAZINE(rhs_m136_hedp_mag,3);
    };
};

class TB_supply_usa_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",USA);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_fgm148_magazine_AT,1);    // Javlin
        MACRO_ADDMAGAZINE(rhs_fim92_mag,1);                // AA
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,2);        // MAAWS
        MACRO_ADDMAGAZINE(rhs_mag_smaw_HEAA,2);                // AA
    };
};

class TB_supply_usa_notfallm4 : WRAPPER_NAME(Box_NATO_Wps_F)
{
    PUBLIC_NAME_CAT("NotfallM4",USA);
    
    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_m4,4);
    };
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_Mk318_Stanag,20);
    };
};

class TB_supply_usa_night : WRAPPER_NAME(Box_NATO_Equip_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",USA);
    
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
