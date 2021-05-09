/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/
class TB_supply_sog_ammo : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("Munition",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red,35);  // Standard GewehrMag
        MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_SR25_m62_Mag,9);                  // DMR Mag
        MACRO_ADDMAGAZINE(rhsusf_8Rnd_00Buck,7);                                // Schrotflinte
    };
};

class TB_supply_sog_ammo_m60 : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("M60 Munition",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_M855_soft_pouch_coyote,12);       // MG Mag
    };
};

class TB_supply_sog_ammoSmall : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_mag_17Rnd_9x19_JHP,15);
        MACRO_ADDMAGAZINE(rhsusf_mag_7x45acp_MHP,15);
        MACRO_ADDMAGAZINE(rhsusf_mag_15Rnd_9x19_JHP,15);
        MACRO_ADDMAGAZINE(TB_mag_45_FMJ,15);
    };
};

class TB_supply_sog_grena : WRAPPER_NAME(Box_IND_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(SmokeShell,15);

    };
};

class TB_supply_sog_unterlauf : WRAPPER_NAME(Box_IND_Support_F)
{
    PUBLIC_NAME_CAT("Unterlauf",SOG);

    class TransportMagazines
    {
        // Unterlauf
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_HE,25);
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_HEDP,15);

        // Rauch
        MACRO_ADDMAGAZINE(3Rnd_Smoke_Grenade_shell_precise,4);

        // Gewehrgranaten
        MACRO_ADDMAGAZINE(TB_rhs_mag_M585_white,4);

    };
};

class TB_supply_sog_praezision : WRAPPER_NAME(Box_East_Wps_F)
{
    PUBLIC_NAME_CAT("Präzisionswaffen Munition",SOG);

    class TransportMagazines
    {
        // 12.7
        MACRO_ADDMAGAZINE(rhsusf_mag_10Rnd_STD_50BMG_M33,8);
        MACRO_ADDMAGAZINE(rhsusf_mag_10Rnd_STD_50BMG_mk211,8);

        // 8.6
        MACRO_ADDMAGAZINE(TB_mag_10Rnd_338_LS_Tracer,8);
        MACRO_ADDMAGAZINE(TB_mag_10Rnd_338_LS_DIM,8);

        // DMR7.62
        MACRO_ADDMAGAZINE(rhs_mag_20Rnd_SCAR_762x51_m80a1_epr,8);
        MACRO_ADDMAGAZINE(rhsusf_5Rnd_762x51_m118_special_Mag,16);
    };
};

class TB_supply_sog_9K32_Strela : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
{
    PUBLIC_NAME_CAT("2 Stinger + Munition",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(vn_sa7b_mag,6);
    };

    class TransportWeapons
    {
        MACRO_ADDWEAPON(vn_sa7b,2);
    };
};

class TB_supply_sog_oneUse_AT : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("6 x O-U M72 LAW",SOG);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(vn_m72,6);
    };
};