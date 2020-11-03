/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/
class TB_supply_russ_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Munition",RUSS);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_AK_green,50);    // Standard GewehrMag
        MACRO_ADDMAGAZINE(rhs_10Rnd_762x54mmR_7N14,15);     // DMR
        MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_green,10);   // MG
    };
};

class TB_supply_russ_ammoSmall : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",RUSS);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_18rnd_9x21mm_7BT3,15);
        MACRO_ADDMAGAZINE(rhs_mag_9x18_8_57N181S,15);
        MACRO_ADDMAGAZINE(rhs_mag_9x19_17,15);
    };
};

class TB_supply_russ_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",RUSS);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_rgo,5);       // Splitternade
        MACRO_ADDMAGAZINE(rhs_mag_rgn,10);      // Offensivenade
        MACRO_ADDMAGAZINE(rhs_mag_zarya2,3);    // Stannade

        MACRO_ADDMAGAZINE(rhs_mag_rdg2_white,30);
        MACRO_ADDMAGAZINE(rhs_mag_nspd,10);
        MACRO_ADDMAGAZINE(rhs_mag_rdg2_black,5);
    };
};

class TB_supply_russ_unterlauf : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
{
    PUBLIC_NAME_CAT("Unterlauf",RUSS);

    class TransportMagazines
    {
        // Explosiv
        MACRO_ADDMAGAZINE(rhs_VOG25,10);
        MACRO_ADDMAGAZINE(rhs_VOG25P,4);
        MACRO_ADDMAGAZINE(rhs_VG40TB,4);
        MACRO_ADDMAGAZINE(rhs_VG40SZ,2);    // stun

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

class TB_supply_russ_spezial : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("PräzisionswaffenMunition",RUSS);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_5Rnd_338lapua_t5000,20);    // Sniper
    };
};

class TB_supply_russ_launcher : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Werfer",RUSS);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_rpg26,6);
        MACRO_ADDWEAPON(rhs_weap_rshg2,2);
    };
};

class TB_supply_russ_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("WerferMunition",RUSS);

    class TransportMagazines
    {
        // MACRO_ADDMAGAZINE(rhs_rpg7_type69_airburst_mag,1);
        // MACRO_ADDMAGAZINE(rhs_rpg7_TBG7V_mag,1);
        // MACRO_ADDMAGAZINE(rhs_rpg7_PG7V_mag,3);
        MACRO_ADDMAGAZINE(rhs_rpg7_OG7V_mag,3);
        MACRO_ADDMAGAZINE(rhs_rpg7_PG7VL_mag,6);
        MACRO_ADDMAGAZINE(rhs_rpg7_PG7VR_mag,2);
        MACRO_ADDMAGAZINE(rhs_mag_9k38_rocket,4);
    };
};

class TB_supply_russ_notfall : WRAPPER_NAME(Box_NATO_Wps_F)
{
    PUBLIC_NAME_CAT("NotfallWaffen",RUSS);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(rhs_weap_ak74n,4);
    };

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_AK_green,20);
    };
};

class TB_supply_russ_night : WRAPPER_NAME(Box_NATO_Equip_F)
{
    PUBLIC_NAME_CAT("Nachtkiste",RUSS);

    class TransportItems
    {
        MACRO_ADDITEM(rhs_1PN138,10);

        MACRO_ADDITEM(ACE_IR_Strobe_Item,10);
        MACRO_ADDITEM(ACE_Chemlight_Shield,10);

        MACRO_ADDITEM(ACE_Chemlight_UltraHiOrange,10);
        MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
    };
};
