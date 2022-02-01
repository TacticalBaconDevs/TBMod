/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/
class TB_supply_ldf_ammo : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_msbs_mag,20);
        MACRO_ADDMAGAZINE(30Rnd_65x39_caseless_msbs_mag_Tracer,20);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Pellets,15);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Slug,15);

    };
};

class TB_supply_ldf_ammo_mg : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("MG-Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(200Rnd_556x45_Box_Tracer_F,5);
        MACRO_ADDMAGAZINE(130Rnd_338_Mag,5);
        MACRO_ADDMAGAZINE(200Rnd_65x39_cased_Box_Tracer,5);
    };
};

class TB_supply_ldf_ammo_small : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("MP/Pistolen Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(50Rnd_570x28_SMG_03,10);
        MACRO_ADDMAGAZINE(30Rnd_9x21_Mag_SMG_02_Tracer_Red,10);
        MACRO_ADDMAGAZINE(30Rnd_45ACP_Mag_SMG_01_Tracer_Green,10);
        MACRO_ADDMAGAZINE(30Rnd_9x21_Red_Mag,10);
        MACRO_ADDMAGAZINE(11Rnd_45ACP_Mag,10);
        MACRO_ADDMAGAZINE(9Rnd_45ACP_Mag,10);
        MACRO_ADDMAGAZINE(TB_mag_6Rnd_500_FMJ,10);
    };
};

class TB_supply_ldf_ammo_spezial : WRAPPER_NAME(Box_East_Wps_F)
{
    PUBLIC_NAME_CAT("Spezial Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(ACE_7Rnd_408_305gr_Mag,10);
        MACRO_ADDMAGAZINE(TB_mag_7Rnd_M200_Tracer,10);
        MACRO_ADDMAGAZINE(ACE_5Rnd_127x99_Mag,10);
        MACRO_ADDMAGAZINE(ACE_5Rnd_127x99_AMAX_Mag,10);
        MACRO_ADDMAGAZINE(ACE_5Rnd_127x99_API_Mag,10);
        MACRO_ADDMAGAZINE(ACE_20Rnd_762x51_Mag_Tracer,15);
        MACRO_ADDMAGAZINE(ACE_20Rnd_762x51_Mag_Tracer_Dim,15);
    };
};

class TB_supply_ldf_grena : WRAPPER_NAME(Box_IND_Grenades_F)
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

class TB_supply_ldf_unterlauf : WRAPPER_NAME(Box_IND_Support_F)
{
    PUBLIC_NAME_CAT("Unterlauf",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,25);
        MACRO_ADDMAGAZINE(3Rnd_Smoke_Grenade_shell_precise,10);
        MACRO_ADDMAGAZINE(UGL_FlareWhite_F,5);
        MACRO_ADDMAGAZINE(UGL_FlareRed_F,5);
        MACRO_ADDMAGAZINE(ACE_HuntIR_M203,5);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Pellets,6);
        MACRO_ADDMAGAZINE(6Rnd_12Gauge_Slug,6);
    };
};

class TB_supply_nato_launcher_rpg : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("RPG-32 Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(RPG32_F,5);
        MACRO_ADDMAGAZINE(RPG32_HE_F,3);
    };
};

class TB_supply_nato_launcher_maaws : WRAPPER_NAME(Box_East_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("MAAWS Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(MRAWS_HEAT_F,5);
        MACRO_ADDMAGAZINE(MRAWS_HE_F,3);
    };
};

class TB_supply_nato_launcher_mentis : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("Mentis-M Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(Vorona_HEAT,5);
        MACRO_ADDMAGAZINE(Vorona_HE,3);
    };
};

class TB_supply_nato_launcher_titan_aa : WRAPPER_NAME(Box_IND_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Titan-AA Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(Titan_AA,7);
    };
};

class TB_supply_nato_launcher_titan_at : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Titan AT/AP Munition",LDF);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(Titan_AT,5);
        MACRO_ADDMAGAZINE(Titan_AP,2);
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

class TB_supply_ldf_shotgun : WRAPPER_NAME(Box_NATO_Wps_F)
{
    PUBLIC_NAME_CAT("Notfall Shotgun",NATO);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(sgun_HunterShotgun_01_F,2);
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(2Rnd_12Gauge_Pellets,50);
        MACRO_ADDMAGAZINE(2Rnd_12Gauge_Slug,50);
    };
};

class TB_supply_ldf_night : WRAPPER_NAME(Box_East_Support_F)
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
