/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class TB_supply_bw_ammo : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("Munition",BW);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(BWA3_200Rnd_556x45_Tracer,4);
        MACRO_ADDMAGAZINE(BWA3_10Rnd_762x51_G28,5);        //G27 Munition
        MACRO_ADDMAGAZINE(BWA3_20Rnd_762x51_G28,5);
        MACRO_ADDMAGAZINE(BWA3_30Rnd_556x45_G36_Tracer,15);
        MACRO_ADDMAGAZINE(BWA3_30Rnd_556x45_G36,15);
    };
};

class TB_supply_bw_ammoSmall : WRAPPER_NAME(Box_East_Grenades_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",BW);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(BWA3_15Rnd_9x19_P8,15);
        MACRO_ADDMAGAZINE(TB_mag_45_FMJ,15);
    };
};

class TB_supply_bw_grena : WRAPPER_NAME(Box_IND_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",BW);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,20);
        MACRO_ADDMAGAZINE(SmokeShellRed,10);
        MACRO_ADDMAGAZINE(SmokeShellBlue,10);

        MACRO_ADDMAGAZINE(BWA3_DM51A1,10);        // Splitternade
        MACRO_ADDMAGAZINE(rhs_mag_mk84,5);        // Stannade
    };
};

class TB_supply_bw_unterlauf : WRAPPER_NAME(Box_IND_Support_F)
{
    PUBLIC_NAME_CAT("Unterlauf",BW);

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

class TB_supply_bw_spezial : WRAPPER_NAME(Box_East_Wps_F)
{
    PUBLIC_NAME_CAT("SpezialwaffenMunition",BW);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(BWA3_10Rnd_127x99_G82,10);
        MACRO_ADDMAGAZINE(BWA3_10Rnd_127x99_G82_AP,5);
    };
};

class TB_supply_bw_launcher : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Werfer",BW);
    hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_4.paa), QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)};

    class TransportWeapons
    {
        MACRO_ADDWEAPON(BWA3_RGW90,5);
        MACRO_ADDWEAPON(BWA3_CarlGustav,1);
        MACRO_ADDWEAPON(BWA3_Fliegerfaust,1);
    };
};

class TB_supply_bw_launcherAmmo : WRAPPER_NAME(Box_IND_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",BW);
    hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_4.paa), QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)};

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(BWA3_CarlGustav_HEAT,5);
        MACRO_ADDMAGAZINE(BWA3_CarlGustav_HEDP,3);
        MACRO_ADDMAGAZINE(BWA3_CarlGustav_HE,3);
        MACRO_ADDMAGAZINE(BWA3_CarlGustav_Smoke,3);
        MACRO_ADDMAGAZINE(BWA3_CarlGustav_Illum,1);
        MACRO_ADDMAGAZINE(BWA3_Fliegerfaust_Mag,2);
    };
};

class TB_supply_bw_notfallg36 : WRAPPER_NAME(Box_East_AmmoOrd_F)
{
    PUBLIC_NAME_CAT("NotfallG36",BW);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(BWA3_G36A3,4);
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(BWA3_30Rnd_556x45_G36_Tracer,10);
        MACRO_ADDMAGAZINE(BWA3_30Rnd_556x45_G36,10);
    };
};

class TB_supply_bw_night : WRAPPER_NAME(Box_NATO_Equip_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",BW);

    class TransportItems
    {
        MACRO_ADDITEM(ACE_NVG_Gen4,10);

        MACRO_ADDITEM(ACE_IR_Strobe_Item,10);
        MACRO_ADDITEM(ACE_Flashlight_KSF1,10);

        MACRO_ADDITEM(ACE_Chemlight_HiYellow,10);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
    };
};
