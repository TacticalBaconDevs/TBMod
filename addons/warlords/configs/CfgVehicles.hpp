/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// ###################### Makros ######################
#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
        name = #ITEM; \
        count = COUNT; \
    }
#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
        magazine = #MAGAZINE; \
        count = COUNT; \
    }
#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
        weapon = #WEAPON; \
        count = COUNT; \
    }
#define MACRO_ADDBACKPACK(BACKPACK,COUNT) class _xx_##BACKPACK { \
        backpack = #BACKPACK; \
        count = COUNT; \
    }
#define WRAPPER_NAME(CLASS_NAME) TB_##CLASS_NAME
#define PUBLIC_NAME(D_NAME) \
    displayName = D_NAME; \
    scope = 2; \
    scopeCurator = 2; \
    editorSubcategory = "EdSubcat_TB_Supply_WL"

class CfgVehicles
{
    class WRAPPER_NAME(Box_NATO_Ammo_F);
    class WRAPPER_NAME(Box_NATO_Wps_F);


    // ### USA
    class TB_WL_AR_AR_556mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Gewehre); // AR_556mm_USA_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_T1_high,1);
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG,2);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tan,2);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red,2);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red,2);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_m4,1);
            MACRO_ADDWEAPON(rhs_weap_m4_carryhandle,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_carryhandle,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_d,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_wd,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d10,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d10_LMT_d,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d10_LMT_wd,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d145,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d145_d,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d145_d_2,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d145_wd,1);
            MACRO_ADDWEAPON(rhs_weap_hk416d145_wd_2,1);
            MACRO_ADDWEAPON(rhs_weap_m27iar,1);
            MACRO_ADDWEAPON(rhs_weap_m16a4,1);
            MACRO_ADDWEAPON(rhs_weap_m16a4_carryhandle,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_carryhandle_mstock,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_bk,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_d,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_KAC,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_wd,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_mstock,1);
            MACRO_ADDWEAPON(rhs_weap_mk18,1);
            MACRO_ADDWEAPON(rhs_weap_mk18_bk,1);
            MACRO_ADDWEAPON(rhs_weap_mk18_d,1);
            MACRO_ADDWEAPON(rhs_weap_mk18_wd,1);
        };
    };
    class TB_WL_Mun_AR_USA : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(GewehrMunition); // Mun_AR_USA

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG,25);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red,25);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tan,25);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red,25);
        };
    };


    class TB_WL_GREN_556mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Grenadierwaffen); // GREN_556mm_USA_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_T1_high,1);
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG,2);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tan,2);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red,2);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red,2);
            MACRO_ADDMAGAZINE(rhs_mag_m714_White,3);
            MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,3);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_m16a4_carryhandle_M203,1);
            MACRO_ADDWEAPON(rhs_weap_m4_m203,1);
            MACRO_ADDWEAPON(rhs_weap_m4_m203S,1);
            MACRO_ADDWEAPON(rhs_weap_m4_m320,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_carryhandle_m203,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_carryhandle_m203S,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_M203_bk,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_M203_d,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_blockII_M203,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_m203,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_m203s,1);
            MACRO_ADDWEAPON(rhs_weap_m4a1_m320,1);
        };
    };
    class TB_WL_Mun_GREN_USA : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(GrenadierMunition); // Mun_GREN_USA

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_m714_White,25);
            MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,25);
        };
    };


    class TB_WL_MG_556mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(kleine MG-Waffen); // MG_556mm_USA_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_soft_pouch,1);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_mixed_soft_pouch,1);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_m249,1);
            MACRO_ADDWEAPON(rhs_weap_m249_pip_L,1);
            MACRO_ADDWEAPON(rhs_weap_m249_pip_S,1);
        };
    };
    class TB_WL_Mun_MG556_USA : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(kleine MG-WaffenMunition); // Mun_MG556_USA

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_soft_pouch,10);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_mixed_soft_pouch,10);
        };
    };


    class TB_WL_MG_762mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(große MG-Waffen); // MG_762mm_USA_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m62_tracer,1);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51,1);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_m240B,1);
        };
    };
    class TB_WL_Mun_MG762_USA : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(große MG-WaffenMunition); // Mun_MG762_USA

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m62_tracer,10);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51,10);
        };
    };


    class TB_WL_DMR_762mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(DMR-Waffen); // DMR_762mm_USA_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(optic_SOS,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_m118_special_Mag,2);
            MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_SR25_m118_special_Mag,2);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_sr25,1);
            MACRO_ADDWEAPON(rhs_weap_sr25_d,1);
            MACRO_ADDWEAPON(rhs_weap_sr25_ec,1);
            MACRO_ADDWEAPON(rhs_weap_sr25_ec_d,1);
            MACRO_ADDWEAPON(rhs_weap_sr25_ec_wd,1);
            MACRO_ADDWEAPON(rhs_weap_sr25_wd,1);
            MACRO_ADDWEAPON(rhs_weap_m14ebrri,1);
        };
    };
    class TB_WL_Mun_DMR762_USA : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(DMR-WaffenMunition); // Mun_DMR762_USA

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_m118_special_Mag,13);
            MACRO_ADDMAGAZINE(rhsusf_20Rnd_762x51_SR25_m118_special_Mag,13);
        };
    };


    class TB_WL_Werfer_USA_Leicht_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(EinmalRaketenwerfer); // Werfer_USA_Leicht_Kiste

        class TransportWeapons
        {
            MACRO_ADDWEAPON(TB_rhs_weap_M136_CS,4);
            MACRO_ADDWEAPON(rhs_weap_m72a7,4);
        };
    };


    class TB_WL_Werfer_USA_Schwer_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Raketenwerfer); // Werfer_USA_Schwer_Kiste

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HEDP,1);
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,1);
            MACRO_ADDMAGAZINE(rhs_fim92_mag,1);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_maaws_optic,1);
            MACRO_ADDWEAPON(rhs_weap_fim92,1);
        };
    };
    class TB_WL_Mun_Werfer_Schwer_USA : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(RaketenwerferMunition); // Mun_Werfer_Schwer_USA

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HEDP,5);
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,5);
            MACRO_ADDMAGAZINE(rhs_fim92_mag,5);
        };
    };



    // ### RUSS
    class TB_WL_AR_545mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Gewehre); // AR_545mm_RUS_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
            MACRO_ADDITEM(rhs_acc_pkas,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_AK_green,2);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N22_camo_AK,2);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N22_desert_AK,2);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N6_AK,2);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_ak105_zenitco01_npz_afg,4);
            MACRO_ADDWEAPON(rhs_weap_ak105_zenitco01_b33_afg,4);
            MACRO_ADDWEAPON(rhs_weap_ak74_3,2);
            MACRO_ADDWEAPON(rhs_weap_ak74_2,2);
            MACRO_ADDWEAPON(rhs_weap_ak74,2);
            MACRO_ADDWEAPON(rhs_weap_ak74m_npz,4);
            MACRO_ADDWEAPON(rhs_weap_ak74m_desert_npz,2);
            MACRO_ADDWEAPON(rhs_weap_ak74m_zenitco01_npz_afg,4);
            MACRO_ADDWEAPON(rhs_weap_ak74mr_afg,2);
            MACRO_ADDWEAPON(rhs_weap_ak74n_2_npz,2);
        };
    };
    class TB_WL_Mun_AR_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(GewehrMunition); // Mun_AR_RUS

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_AK_green,40);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N6_AK,15);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N10_camo_AK,15);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N10_desert_AK,15);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N6_green_AK,15);
        };
    };


    class TB_WL_GREN_545mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Grenadierwaffen); // GREN_545mm_RUS_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
            MACRO_ADDITEM(rhs_acc_pkas,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_AK_green,2);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N22_camo_AK,2);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N22_desert_AK,2);
            MACRO_ADDMAGAZINE(rhs_30Rnd_545x39_7N6_AK,2);
            MACRO_ADDMAGAZINE(rhs_GRD40_White,3);
            MACRO_ADDMAGAZINE(rhs_VOG25,3);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_ak74m_gp25_1p63,3);
            MACRO_ADDWEAPON(rhs_weap_ak74m_gp25_npz_dtk,3);
            MACRO_ADDWEAPON(rhs_weap_ak74mr_gp25,3);
            MACRO_ADDWEAPON(rhs_weap_ak74n_2_gp25_npz,3);
        };
    };
    class TB_WL_Mun_GREN_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(GrenadierMunition); // Mun_GREN_RUS

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_GRD40_White,25);
            MACRO_ADDMAGAZINE(rhs_VOG25,25);
        };
    };


    class TB_WL_MG_556mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(kleine MG-Waffen); // MG_556mm_RUS_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_acc_compm4,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_soft_pouch,1);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_mixed_soft_pouch,1);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_m249,1);
            MACRO_ADDWEAPON(rhs_weap_m249_pip_L,1);
            MACRO_ADDWEAPON(rhs_weap_m249_pip_S,1);
        };
    };
    class TB_WL_Mun_MG556_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(kleine MG-WaffenMunition); // Mun_MG556_RUS

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_soft_pouch,10);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_mixed_soft_pouch,10);
        };
    };


    class TB_WL_MG_762mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(große MG-Waffen); // MG_762mm_RUS_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(rhs_acc_ekp1,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_7BZ3,1);
            MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_green,1);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_pkp,1);
        };
    };
    class TB_WL_Mun_MG762_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(große MG-WaffenMunition); // Mun_MG762_RUS

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_7BZ3,10);
            MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_green,10);
        };
    };


    class TB_WL_DMR_762mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(DMR-Waffen); // DMR_762mm_RUS_Kiste

        class TransportItems
        {
            MACRO_ADDITEM(optic_SOS,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x39mm,4);
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x54mmR_7N1,4);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_ak103_zenitco01_npz_afg,1);
            MACRO_ADDWEAPON(rhs_weap_svds_npz,1);
        };
    };
    class TB_WL_Mun_DMR772_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(DMR-WaffenMunition); // Mun_DMR772_RUS

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x39mm,25);
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x54mmR_7N1,25);
        };
    };


    class TB_WL_Werfer_RUS_Leicht_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(EinmalRaketenwerfer); // Werfer_RUS_Leicht_Kiste

        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_rpg26,4);
            MACRO_ADDWEAPON(rhs_weap_rshg2,6);
        };
    };


    class TB_WL_Werfer_RUS_Schwer_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Raketenwerfer); // Werfer_RUS_Schwer_Kiste

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_rpg7_OG7V_mag,1);
            MACRO_ADDMAGAZINE(rhs_rpg7_PG7VL_mag,1);
            MACRO_ADDMAGAZINE(rhs_rpg7_PG7VR_mag,1);
            MACRO_ADDMAGAZINE(rhs_mag_9k38_rocket,1);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_rpg7_pgo,1);
            MACRO_ADDWEAPON(rhs_weap_igla,1);
        };
    };
    class TB_WL_Mun_Werfer_Schwer_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(RaketenwerferMunition); // Mun_Werfer_Schwer_RUS

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_rpg7_OG7V_mag,5);
            MACRO_ADDMAGAZINE(rhs_rpg7_PG7VL_mag,4);
            MACRO_ADDMAGAZINE(rhs_rpg7_PG7VR_mag,3);
            MACRO_ADDMAGAZINE(rhs_mag_9k38_rocket,5);
        };
    };
};
