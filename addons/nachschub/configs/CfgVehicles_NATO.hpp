/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/

class TB_supply_nato_ammo_556 : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("5,56 Munition",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(30Rnd_556x45_Stanag_Tracer_Yellow,40);
        MACRO_ADDMAGAZINE(30Rnd_556x45_Stanag,40);
    };
};

class TB_supply_nato_ammo_65 : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("6,5 Munition",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_mag,40);
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_mag_Tracer,40);
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
        MACRO_ADDMAGAZINE(3Rnd_Smoke_Grenade_shell_precise,15);
        MACRO_ADDMAGAZINE(UGL_FlareWhite_F,5);
        MACRO_ADDMAGAZINE(ACE_HuntIR_M203,5);
        MACRO_ADDMAGAZINE(6rnd_HE_Mag_lxWS,10);
        MACRO_ADDMAGAZINE(6rnd_Smoke_Mag_lxWS,10);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Slug,10);
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

class TB_supply_nato_ED : WRAPPER_NAME(Box_EAF_Uniforms_F)
{
    PUBLIC_NAME_CAT("ED-1D Drohne",NATO);

    class TransportBackpacks
    {
        MACRO_ADDBACKPACK(B_UGV_02_Demining_backpack_F,2);
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
class TB_supply_nato_ammo_zafir : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Zafir 7,62",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(150Rnd_762x54_Box,10);
        MACRO_ADDMAGAZINE(150Rnd_762x54_Box_Tracer,10);
    };
};

class TB_supply_nato_ammo_mk200 : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("MK 200 5,56",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(200Rnd_65x39_cased_Box_Red,10);
        MACRO_ADDMAGAZINE(200Rnd_65x39_cased_Box_Tracer,10);
    };
};
class TB_supply_nato_ammo_minimi : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("FN Minimi 5,56",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(200Rnd_556x45_Box_Tracer_F,10);
        MACRO_ADDMAGAZINE(200Rnd_556x45_Box_F,10);
    };
};
class TB_supply_nato_ammo_big : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("MX/HK/XMS große Magazine",NATO);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(75Rnd_556x45_Stanag_lxWS,20);
        MACRO_ADDMAGAZINE(150Rnd_556x45_Drum_Mag_Tracer_F,20);
        MACRO_ADDMAGAZINE(100Rnd_65x39_caseless_mag_Tracer,20);
    };
};
