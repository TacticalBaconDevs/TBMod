/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class TB_supply_usa_ammo : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("Munition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red,40);      // Standard GewehrMag
        MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_M855_soft_pouch_coyote,2);       // MGMag5.56
        MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote,2); // MGMag5.56 Tracer
        MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m62_tracer,3);                   // MGMag7.62 AP Tracer
        MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m61_ap,3);                       // MGMag7.62 AP
        MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_SR25_m62_Mag,14);                 // DMRMag7.62
        MACRO_ADDMAGAZINE(rhsusf_8Rnd_00Buck,7);                                // Schrotflinte
        MACRO_ADDMAGAZINE(rhsusf_8Rnd_Slug,7);                                  // Schrotflinte
        MACRO_ADDMAGAZINE(rhsusf_5Rnd_00Buck,7);                                // Schrotflinte
        MACRO_ADDMAGAZINE(rhsusf_5Rnd_Slug,7);                                  // Schrotflinte
    };
};

class TB_supply_usa_ammoSmall : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_mag_17Rnd_9x19_JHP,15);
        MACRO_ADDMAGAZINE(rhsusf_mag_7x45acp_MHP,15);
        MACRO_ADDMAGAZINE(rhsusf_mag_15Rnd_9x19_JHP,15);
    };
};

class TB_supply_usa_grena : WRAPPER_NAME(Box_IND_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,15);
        MACRO_ADDMAGAZINE(SmokeShellRed,5);
        MACRO_ADDMAGAZINE(SmokeShellBlue,5);

        MACRO_ADDMAGAZINE(rhs_mag_m67,10);       // Splitternade
        MACRO_ADDMAGAZINE(rhs_mag_mk3a2,10);    // Offensivenade
        MACRO_ADDMAGAZINE(rhs_mag_mk84,10);      // Stannade
    };
};

class TB_supply_usa_unterlauf : WRAPPER_NAME(Box_IND_Support_F)
{
    PUBLIC_NAME_CAT("Unterlauf",USA);

    class TransportMagazines
    {
        // Explosiv
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_HE,25);
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_HEDP,15);

        // AIM Smokes
        MACRO_ADDMAGAZINE(3Rnd_Smoke_Grenade_shell_precise,4);
        MACRO_ADDMAGAZINE(rhs_mag_m714_White_precise,4);
        MACRO_ADDMAGAZINE(rhs_mag_m713_Red_precise,2);
        MACRO_ADDMAGAZINE(rhs_mag_m715_Green_precise,2);
        MACRO_ADDMAGAZINE(rhs_mag_m716_Yellow_precise,2);

        // Flares
        MACRO_ADDMAGAZINE(TB_rhs_mag_M585_white,4);
        MACRO_ADDMAGAZINE(TB_rhs_mag_m661_green,1);
        MACRO_ADDMAGAZINE(TB_rhs_mag_m662_red,1);

        // IR + Slug
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_IR_Grenade,2);
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_Slugshot,6);
        MACRO_ADDMAGAZINE(ACE_HuntIR_M203,6);
    };
};

class TB_supply_usa_spezial : WRAPPER_NAME(Box_East_Wps_F)
{
    PUBLIC_NAME_CAT("SpezialwaffenMunition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_mag_10Rnd_STD_50BMG_M33,8);
        MACRO_ADDMAGAZINE(rhsusf_mag_10Rnd_STD_50BMG_mk211,8);

        // DMR7.62
        MACRO_ADDMAGAZINE(rhs_mag_20Rnd_SCAR_762x51_mk316_special_LRS,8);
        MACRO_ADDMAGAZINE(rhs_mag_20Rnd_SCAR_762x51_m80a1_epr,8);
        MACRO_ADDMAGAZINE(rhsusf_5Rnd_300winmag_xm2010,32);
    };
};

class TB_supply_usa_launcher : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Werfer",USA);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_M136_hp,1);
        MACRO_ADDWEAPON(TB_rhs_weap_M136_CS,2);
        MACRO_ADDWEAPON(rhs_weap_M136_hedp,2);
        MACRO_ADDWEAPON(rhs_weap_m72a7,2);
    };
};

class TB_supply_usa_launcherAmmo : WRAPPER_NAME(Box_IND_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_fgm148_magazine_AT,1);    // Javlin
        MACRO_ADDMAGAZINE(rhs_fim92_mag,4);             // AA
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,2);        // MAAWS
        MACRO_ADDMAGAZINE(rhs_mag_smaw_HEAA,2);         // HEAA
    };
};

class TB_supply_usa_javlinAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("JavlinMunition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_fgm148_magazine_AT,4);
    };
};

class TB_supply_usa_MAAWSAmmo : WRAPPER_NAME(Box_East_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("MAAWSMunition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,5);
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HEDP,4);
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HE,4);
    };
};

class TB_supply_usa_SMAWAmmo : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("SMAWMunition",USA);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_smaw_HEAA,6);
        MACRO_ADDMAGAZINE(rhs_mag_smaw_HEDP,6);
        MACRO_ADDMAGAZINE(rhs_mag_smaw_SR,4);
    };
};

class TB_supply_usa_notfall : WRAPPER_NAME(Box_NATO_Wps_F)
{
    PUBLIC_NAME_CAT("Notfall",USA);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_mk17_CQC,2);
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan,12);
        MACRO_ADDMAGAZINE(SmokeShellBlue,1);
        MACRO_ADDMAGAZINE(SmokeShell,2);
    };

    class TransportItems
    {
        MACRO_ADDITEM(ACE_IR_Strobe_Item,2);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,2);

        MACRO_ADDITEM(ACE_quikclot,20);
        MACRO_ADDITEM(ACE_tourniquet,8);
        MACRO_ADDITEM(ACE_adenosine,4);

        MACRO_ADDITEM(TFAR_anprc152,1);

        MACRO_ADDITEM(Binocular,1);
        MACRO_ADDITEM(ItemCompass,1);
        MACRO_ADDITEM(ItemMap,1);
    };
};

class TB_supply_usa_night : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",USA);
    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportItems
    {
        MACRO_ADDITEM(rhsusf_ANPVS_14,20);
        MACRO_ADDITEM(rhsusf_ANPVS_15,20);

        MACRO_ADDITEM(ACE_IR_Strobe_Item,20);
        MACRO_ADDITEM(ACE_Flashlight_KSF1,20);

        MACRO_ADDITEM(ACE_Chemlight_HiYellow,40);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,40);
    };
};

class TB_supply_all_commandMortarAmmo : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME("vz99 MörserMunition");

    class TransportItems
    {
        MACRO_ADDITEM(TB_vz99_HE_multi,10);
        MACRO_ADDITEM(TB_vz99_HE,8);
        MACRO_ADDITEM(TB_vz99_smokeWhite,3);
        MACRO_ADDITEM(TB_vz99_smokeRed,3);
        MACRO_ADDITEM(TB_vz99_flare,2);
    };
};

class TB_supply_all_commandMortarAmmoHE : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME("vz99 MörserMunitionHE");

    class TransportItems
    {
        MACRO_ADDITEM(TB_vz99_HE_multi,20);
        MACRO_ADDITEM(TB_vz99_HE,15);
    };
};
