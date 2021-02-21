/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/
class TB_supply_uk_ammo : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("Munition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_556_30Rnd,15);
        MACRO_ADDMAGAZINE(UK3CB_BAF_556_30Rnd_T,15);
        MACRO_ADDMAGAZINE(UK3CB_BAF_556_200Rnd_T,4);                              // MG 5,56
        MACRO_ADDMAGAZINE(UK3CB_BAF_762_200Rnd_T,4);                              // MG 7,62
        MACRO_ADDMAGAZINE(UK3CB_BAF_12G_Slugs,10);                                // Schrotflinte
        MACRO_ADDMAGAZINE(UK3CB_BAF_12G_Pellets,10);                              // Schrotflinte
    };
};

class TB_supply_uk_ammoSmall : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(30Rnd_9x21_Green_Mag,15);
        MACRO_ADDMAGAZINE(UK3CB_BAF_9_15Rnd,15);
        MACRO_ADDMAGAZINE(UK3CB_BAF_9_17Rnd,15);
        MACRO_ADDMAGAZINE(TB_mag_taser,7);
        MACRO_ADDMAGAZINE(rhsusf_mag_17Rnd_9x19_JHP,15);
    };
};

class TB_supply_uk_grena : WRAPPER_NAME(Box_IND_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,20);
        MACRO_ADDMAGAZINE(SmokeShellRed,7);
        MACRO_ADDMAGAZINE(SmokeShellBlue,7);

        MACRO_ADDMAGAZINE(rhs_mag_mk3a2,20);    // Offensivenade
        MACRO_ADDMAGAZINE(rhs_mag_mk84,10);      // Stannade
    };
};

class TB_supply_uk_unterlauf : WRAPPER_NAME(Box_IND_Support_F)
{
    PUBLIC_NAME_CAT("Unterlauf",UK);

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

class TB_supply_uk_praezision : WRAPPER_NAME(Box_East_Wps_F)
{
    PUBLIC_NAME_CAT("PräzisionswaffenMunition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_mag_10Rnd_STD_50BMG_M33,8);
        MACRO_ADDMAGAZINE(rhsusf_mag_10Rnd_STD_50BMG_mk211,8);

        // DMR7.62
        MACRO_ADDMAGAZINE(rhs_mag_20Rnd_SCAR_762x51_m80a1_epr,10);
    };
};

class TB_supply_uk_launcher : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Werfer",UK);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_M136,2);
        MACRO_ADDWEAPON(TB_rhs_weap_M136_CS,2);
        MACRO_ADDWEAPON(rhs_weap_M136_hedp,2);
        MACRO_ADDWEAPON(rhs_weap_m72a7,2);
    };
};

class TB_supply_uk_IglaAmmo : WRAPPER_NAME(Box_IND_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("IglaMunition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_fim92_mag,6);              // AA
    };

    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_igla,2);
    };
};

class TB_supply_uk_javlinAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("JavlinMunition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_fgm148_magazine_AT,4);
    };
};

class TB_supply_uk_MAAWSAmmo : WRAPPER_NAME(Box_East_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("MAAWSMunition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,5);
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HEDP,4);
        MACRO_ADDMAGAZINE(rhs_mag_maaws_HE,4);
    };
};

class TB_supply_uk_SMAWAmmo : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("SMAWMunition",UK);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_smaw_HEAA,6);
        MACRO_ADDMAGAZINE(rhs_mag_smaw_HEDP,6);
        MACRO_ADDMAGAZINE(rhs_mag_smaw_SR,6);
    };
};

class TB_supply_uk_notfall : WRAPPER_NAME(Box_NATO_Wps_F)
{
    PUBLIC_NAME_CAT("Notfall",UK);

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
        MACRO_ADDITEM(TB_med_thrombin,4);

        MACRO_ADDITEM(TFAR_anprc152,1);

        MACRO_ADDITEM(Binocular,1);
        MACRO_ADDITEM(ItemCompass,1);
        MACRO_ADDITEM(ItemMap,1);
    };
};

class TB_supply_uk_night : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",UK);

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportItems
    {
        MACRO_ADDITEM(UK3CB_ANPVS7,5);
        MACRO_ADDITEM(rhsusf_ANPVS_15,5);
        MACRO_ADDITEM(UK3CB_BAF_HMNVS,5);

        MACRO_ADDITEM(ACE_IR_Strobe_Item,20);
        MACRO_ADDITEM(ACE_Flashlight_KSF1,10);

        MACRO_ADDITEM(ACE_Chemlight_HiYellow,20);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,20);
    };
};

class TB_supply_uk_vehicles127 : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("9x Fahrzeug Magazine 12.7",UK);
    GVAR(directly2Inv) = 1;

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_127_100Rnd,5);
    };
};

class TB_supply_uk_vehicles762 : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("9x Fahrzeug Magazine 7.62",UK);
    GVAR(directly2Inv) = 1;

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_762_200Rnd_T,9);
    };
};

class TB_supply_uk_vehiclesGMG : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("5x Fahrzeug Magazine GMG",UK);
    GVAR(directly2Inv) = 1;

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_32Rnd_40mm_G_Box,5);
    };
};

class TB_supply_uk_warriorAPDS : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("9x Warrior Magazine APDS",UK);
    GVAR(directly2Inv) = 1;

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_6Rnd_30mm_L21A1_APDS,9);
    };
};

class TB_supply_uk_warriorHE : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("9x Warrior Magazine HE",UK);
    GVAR(directly2Inv) = 1;

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_6Rnd_30mm_L21A1_HE,9);
    };
};

class TB_supply_uk_warriorMG : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("2x Warrior Magazine 800 MG",UK);
    GVAR(directly2Inv) = 1;

    hiddenSelectionsTextures[] = {
        QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa),
        QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(UK3CB_BAF_762_800Rnd_T,2);
    };
};

