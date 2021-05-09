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
        MACRO_ADDMAGAZINE(vn_m16_30_t_mag,25);       // Standard GewehrMag
        MACRO_ADDMAGAZINE(vn_m63a_30_t_mag,25);
        MACRO_ADDMAGAZINE(vn_mat49_vc_mag,15);       // MP Mag
        MACRO_ADDMAGAZINE(vn_mat49_t_mag,15);
        MACRO_ADDMAGAZINE(vn_mc10_t_mag,15);
        MACRO_ADDMAGAZINE(vn_m1897_fl_mag,20);       // Schrotflinte
        MACRO_ADDMAGAZINE(vn_m1897_buck_mag,20);                          
    };
};

class TB_supply_sog_ammo_m60 : WRAPPER_NAME(Box_IND_Wps_F)
{
    PUBLIC_NAME_CAT("M60 Munition",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(vn_m60_100_mag,12);       // MG Mag
    };
};

class TB_supply_sog_ammoSmall : WRAPPER_NAME(Box_East_Support_F)
{
    PUBLIC_NAME_CAT("HandwaffenMunition",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(vn_m10_mag,15);
        MACRO_ADDMAGAZINE(vn_hp_mag,15);
        MACRO_ADDMAGAZINE(vn_izh54_so_mag,15);
        MACRO_ADDMAGAZINE(vn_m1895_mag,15);
        MACRO_ADDMAGAZINE(vn_m1911_mag,15);
        MACRO_ADDMAGAZINE(vn_m712_mag,15);
        MACRO_ADDMAGAZINE(vn_mk22_mag,15);
        MACRO_ADDMAGAZINE(vn_tt33_mag,15);
    };
};

class TB_supply_sog_grena : WRAPPER_NAME(Box_IND_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",SOG);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(vn_f1_grenade_mag,15);
        MACRO_ADDMAGAZINE(vn_m18_white_mag,15);
        MACRO_ADDMAGAZINE(vn_m18_red_mag,15);
        MACRO_ADDMAGAZINE(vn_m18_green_mag,15);
        MACRO_ADDMAGAZINE(vn_m34_grenade_mag,15);
        MACRO_ADDMAGAZINE(vn_m61_grenade_mag,15);
        MACRO_ADDMAGAZINE(ACE_M84,15);

    };
};

class TB_supply_sog_unterlauf : WRAPPER_NAME(Box_IND_Support_F)
{
    PUBLIC_NAME_CAT("Unterlauf",SOG);

    class TransportMagazines
    {
        // Unterlauf
        MACRO_ADDMAGAZINE(vn_40mm_m381_he_mag,25);
        MACRO_ADDMAGAZINE(vn_40mm_m397_ab_mag,15);
        MACRO_ADDMAGAZINE(vn_40mm_m433_hedp_mag,15);

        // Rauch
        MACRO_ADDMAGAZINE(vn_40mm_m680_smoke_w_mag,6);
        MACRO_ADDMAGAZINE(vn_40mm_m682_smoke_r_mag,6);

        // Gewehrgranaten
        MACRO_ADDMAGAZINE(vn_22mm_m9_heat_mag,8);
        MACRO_ADDMAGAZINE(vn_22mm_m22_smoke_mag,8);
        MACRO_ADDMAGAZINE(vn_22mm_m19_wp_mag,8);
        MACRO_ADDMAGAZINE(vn_22mm_m1a2_frag_mag,8);

    };
};

class TB_supply_sog_praezision : WRAPPER_NAME(Box_East_Wps_F)
{
    PUBLIC_NAME_CAT("Präzisionswaffen Munition",SOG);

    class TransportMagazines
    {
        // 7,62 x 33
        MACRO_ADDMAGAZINE(vn_carbine_30_t_mag,15);

        // 7,62 x 51
        MACRO_ADDMAGAZINE(vn_m14_mag,15);
        MACRO_ADDMAGAZINE(vn_m40a1_t_mag,15);
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