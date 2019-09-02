/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/
class TB_supply_ldf_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_msbs_mag,15);
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_msbs_mag_Tracer,15);
        MACRO_ADDMAGAZINE(200Rnd_65x39_cased_Box_Tracer,4);
        MACRO_ADDMAGAZINE(200Rnd_65x39_cased_Box_Red,4);
    };
};

class TB_supply_ldf_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,20);
        MACRO_ADDMAGAZINE(SmokeShellRed,10);
        MACRO_ADDMAGAZINE(SmokeShellBlue,10);
        MACRO_ADDMAGAZINE(SmokeShellOrange,10);

        MACRO_ADDMAGAZINE(HandGrenade,10);        // Splitternade
        MACRO_ADDMAGAZINE(ACE_M84,10);            // Blendgranate
    };
};

class TB_supply_ldf_unterlauf : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
{
    PUBLIC_NAME_CAT("Unterlauf",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,15);
        MACRO_ADDMAGAZINE(3Rnd_Smoke_Grenade_shell_precise,5);
        MACRO_ADDMAGAZINE(UGL_FlareWhite_F,5);
        MACRO_ADDMAGAZINE(UGL_FlareRed_F,5);
        MACRO_ADDMAGAZINE(ACE_HuntIR_M203,5);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Pellets,6);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Slug,6);
    };
};

class TB_supply_ldf_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(RPG32_F,5);
        MACRO_ADDMAGAZINE(RPG32_HE_F,3);
    };
};

class TB_supply_ldf_ED : WRAPPER_NAME(Box_EAF_Uniforms_F)
{
    PUBLIC_NAME_CAT("ED-1D Drohne",NATO);

    class TransportBackpacks
    {
        MACRO_ADDBACKPACK(B_UGV_02_Demining_backpack_F,2);
    };
};

class TB_supply_ldf_night : WRAPPER_NAME(Box_NATO_Equip_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",NATO);

    class TransportItems
    {
        MACRO_ADDITEM(O_NVGoggles_grn_F,10);

        MACRO_ADDITEM(ACE_IR_Strobe_Item,10);
        MACRO_ADDITEM(ACE_Flashlight_KSF1,10);

        MACRO_ADDITEM(ACE_Chemlight_HiYellow,10);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
    };
};
