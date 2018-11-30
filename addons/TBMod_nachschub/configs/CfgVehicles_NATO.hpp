/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari, IDarky
*/

class TB_supply_nato_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Munition",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_mag,13);
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_mag_Tracer,13);
        MACRO_ADDMAGAZINE(30Rnd_556x45_Stanag_Tracer_Yellow,13);
        MACRO_ADDMAGAZINE(30Rnd_556x45_Stanag,13);
        MACRO_ADDMAGAZINE(200Rnd_556x45_Box_Tracer_Red_F,5);
        MACRO_ADDMAGAZINE(150Rnd_556x45_Drum_Mag_Tracer_F,5);
        MACRO_ADDMAGAZINE(20Rnd_762x51_Mag,13);
    };
};

class TB_supply_nato_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",NATO);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,20);
        MACRO_ADDMAGAZINE(SmokeShellRed,10);
        MACRO_ADDMAGAZINE(SmokeShellBlue,10);
        MACRO_ADDMAGAZINE(SmokeShellOrange,10);

        MACRO_ADDMAGAZINE(HandGrenade,10);        // Splitternade
        MACRO_ADDMAGAZINE(ACE_M84,10);        // Blendgranate
    };
};

class TB_supply_nato_unterlauf : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
{
    PUBLIC_NAME_CAT("Unterlauf",NATO);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,15);
        MACRO_ADDMAGAZINE(1Rnd_Smoke_Grenade_shell,15);
        MACRO_ADDMAGAZINE(UGL_FlareWhite_F,5);
        MACRO_ADDMAGAZINE(ACE_HuntIR_M203,5);
    };
};

class TB_supply_nato_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",NATO);
    
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(MRAWS_HEAT_F,4);
        MACRO_ADDMAGAZINE(Vorona_HEAT,4);
        MACRO_ADDMAGAZINE(Titan_AA,3);
        MACRO_ADDMAGAZINE(Titan_AT,2);
    };
};

class TB_supply_nato_night : WRAPPER_NAME(Box_NATO_Equip_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",NATO);
    
    class TransportItems
    {
        MACRO_ADDITEM(ACE_NVG_Gen4,10);
        
        MACRO_ADDITEM(ACE_IR_Strobe_Item,10);
        MACRO_ADDITEM(ACE_Flashlight_KSF1,10);
        
        MACRO_ADDITEM(ACE_Chemlight_HiYellow,10);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
    };
};
