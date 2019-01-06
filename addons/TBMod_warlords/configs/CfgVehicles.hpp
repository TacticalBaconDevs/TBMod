// units[] = {"ModuleWLInit_F","ModuleWLSector_F"};

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
        PUBLIC_NAME(AR_556mm_USA_Kiste);

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
        PUBLIC_NAME(Mun_AR_USA);

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
        PUBLIC_NAME(GREN_556mm_USA_Kiste);

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
        PUBLIC_NAME(Mun_GREN_USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_m714_White,25);
            MACRO_ADDMAGAZINE(1Rnd_HE_Grenade_shell,25);
        };
    };


    class TB_WL_MG_556mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(MG_556mm_USA_Kiste);

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
        PUBLIC_NAME(Mun_MG556_USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_soft_pouch,10);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_mixed_soft_pouch,10);
        };
    };


    class TB_WL_MG_762mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(MG_762mm_USA_Kiste);

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
        PUBLIC_NAME(Mun_MG762_USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m62_tracer,10);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51,10);
        };
    };


    class TB_WL_DMR_762mm_USA_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(DMR_762mm_USA_Kiste);

        class TransportItems
        {
            MACRO_ADDITEM(optic_SOS,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(20Rnd_762x51_Mag,3);
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
        PUBLIC_NAME(Mun_DMR762_USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(20Rnd_762x51_Mag,18);
        };
    };


    class TB_WL_Werfer_USA_Leicht_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Werfer_USA_Leicht_Kiste);

        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_M136,4);
            MACRO_ADDWEAPON(rhs_weap_m72a7,4);
        };
    };


    class TB_WL_Werfer_USA_Schwer_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Werfer_USA_Schwer_Kiste);

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
        PUBLIC_NAME(Mun_Werfer_Schwer_USA);

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
        PUBLIC_NAME(AR_545mm_RUS_Kiste);

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
        PUBLIC_NAME(Mun_AR_RUS);

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
        PUBLIC_NAME(GREN_545mm_RUS_Kiste);

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
        PUBLIC_NAME(Mun_GREN_RUS);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_GRD40_White,25);
            MACRO_ADDMAGAZINE(rhs_VOG25,25);
        };
    };


    class TB_WL_MG_556mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(MG_556mm_RUS_Kiste);

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
        PUBLIC_NAME(Mun_MG556_RUS);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_soft_pouch,10);
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_M855_mixed_soft_pouch,10);
        };
    };


    class TB_WL_MG_762mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(MG_762mm_RUS_Kiste);

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
        PUBLIC_NAME(Mun_MG762_RUS);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_7BZ3,10);
            MACRO_ADDMAGAZINE(rhs_100Rnd_762x54mmR_green,10);
        };
    };


    class TB_WL_DMR_762mm_RUS_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(DMR_762mm_RUS_Kiste);

        class TransportItems
        {
            MACRO_ADDITEM(optic_SOS,1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x39mm,2);
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x54mmR_7N1,2);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_ak103_zenitco01_npz_afg,1);
            MACRO_ADDWEAPON(rhs_weap_svds_npz,1);
        };
    };
    class TB_WL_Mun_DMR772_RUS : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME(Mun_DMR772_RUS);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x39mm,25);
            MACRO_ADDMAGAZINE(rhs_10Rnd_762x54mmR_7N1,25);
        };
    };


    class TB_WL_Werfer_RUS_Leicht_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Werfer_RUS_Leicht_Kiste);

        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_rpg26,4);
            MACRO_ADDWEAPON(rhs_weap_rshg2,6);
        };
    };


    class TB_WL_Werfer_RUS_Schwer_Kiste : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME(Werfer_RUS_Schwer_Kiste);

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
        PUBLIC_NAME(Mun_Werfer_Schwer_RUS);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_rpg7_OG7V_mag,5);
            MACRO_ADDMAGAZINE(rhs_rpg7_PG7VL_mag,4);
            MACRO_ADDMAGAZINE(rhs_rpg7_PG7VR_mag,3);
            MACRO_ADDMAGAZINE(rhs_mag_9k38_rocket,5);
        };
    };


    // ###### WL OVERRIDES
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
            class Units;
        };
        class ModuleDescription
        {
            class AnyBrain;
        };
    };
    class ModuleWLTemplate_F: Module_F
    {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleWLTemplate_F";
        scope = 0;
        category = "Warlords";
        isTriggerActivated = 0;
        isDisposable = 0;
    };

    class ModuleWLInit_F: ModuleWLTemplate_F
    {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleWLInit_F";
        scope = 2;
        icon = "A3\Data_F_Warlords\Data\wl_module_i_ca.paa";
        displayName = "$STR_A3_WL_module_init_name";
        function = "BIS_fnc_WLInit";
        isGlobal = 2;
        class Attributes: AttributesBase
        {
            class Progress: Combo
            {
                property = "ModuleWLInit_F_Progress";
                displayName = "$STR_A3_WL_param1_title";
                tooltip = "$STR_A3_WL_param1_desc";
                typeName = "NUMBER";
                defaultValue = "1";
                class Values
                {
                    class Progress_0
                    {
                        name = "$STR_special_none";
                        value = 1;
                    };
                    class Progress_1
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_1";
                        value = 2;
                    };
                    class Progress_2
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_2";
                        value = 3;
                    };
                    class Progress_3
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_3";
                        value = 4;
                    };
                    class Progress_4
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_4";
                        value = 5;
                    };
                    class Progress_5
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_5";
                        value = 6;
                    };
                    class Progress_6
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_6";
                        value = 7;
                    };
                    class Progress_7
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_7";
                        value = 8;
                    };
                    class Progress_8
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_8";
                        value = 9;
                    };
                    class Progress_9
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_9";
                        value = 10;
                    };
                    class Progress_10
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_10";
                        value = 11;
                    };
                    class Progress_11
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_11";
                        value = 12;
                    };
                    class Progress_12
                    {
                        name = "$STR_A3_WL_forcedProgress_perc_12";
                        value = 13;
                    };
                };
            };
            class TimeAcceleration: Combo
            {
                property = "ModuleWLInit_F_TimeAcceleration";
                displayName = "$STR_A3_WL_param2_title";
                tooltip = "";
                typeName = "NUMBER";
                defaultValue = "16";
                class Values
                {
                    class TimeAcc_0
                    {
                        name = "$STR_special_none";
                        value = 1;
                    };
                    class TimeAcc_2
                    {
                        name = "x2";
                        value = 2;
                    };
                    class TimeAcc_4
                    {
                        name = "x4";
                        value = 4;
                    };
                    class TimeAcc_6
                    {
                        name = "x6";
                        value = 6;
                    };
                    class TimeAcc_8
                    {
                        name = "x8";
                        value = 8;
                    };
                    class TimeAcc_10
                    {
                        name = "x10";
                        value = 10;
                    };
                    class TimeAcc_12
                    {
                        name = "x12";
                        value = 12;
                    };
                    class TimeAcc_14
                    {
                        name = "x14";
                        value = 14;
                    };
                    class TimeAcc_16
                    {
                        name = "x16";
                        value = 16;
                        default = 1;
                    };
                    class TimeAcc_18
                    {
                        name = "x18";
                        value = 18;
                    };
                    class TimeAcc_20
                    {
                        name = "x20";
                        value = 20;
                    };
                    class TimeAcc_22
                    {
                        name = "x22";
                        value = 22;
                    };
                    class TimeAcc_24
                    {
                        name = "x24";
                        value = 24;
                    };
                };
            };
            delete FTEnabled;
            // class FTEnabled: Combo
            // {
            //     property = "ModuleWLInit_F_FTEnabled";
            //     displayName = "$STR_A3_fastravel1";
            //     tooltip = "$STR_A3_WL_param3_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "0";
            //     class Values
            //     {
            //         class Enabled
            //         {
            //             name = "$STR_A3_WL_param3_value1";
            //             value = 1;
            //         };
            //         class Disabled
            //         {
            //             name = "$STR_A3_WL_param3_value2";
            //             value = 0;
            //         };
            //         class DisabledAI
            //         {
            //             name = "$STR_A3_WL_param3_value3";
            //             value = 2;
            //         };
            //         class DisabledPlayers
            //         {
            //             name = "$STR_A3_WL_param3_value4";
            //             value = 3;
            //         };
            //         class OwnedOnly
            //         {
            //             name = "$STR_A3_WL_param3_value5";
            //             value = 4;
            //         };
            //     };
            // };
            delete ScanEnabled;
            // class ScanEnabled: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_ScanEnabled";
            //     displayName = "$STR_A3_WL_param4_title";
            //     tooltip = "$STR_A3_WL_param4_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "1";
            // };
            delete AIVoting;
            // class AIVoting: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_AIVoting";
            //     displayName = "$STR_A3_WL_param5_title";
            //     tooltip = "$STR_A3_WL_param5_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "0";
            // };
            delete ArsenalEnabled;
            // class ArsenalEnabled: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_ArsenalEnabled";
            //     displayName = "$STR_A3_Arsenal";
            //     tooltip = "$STR_A3_WL_param6_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "1";
            // };
            delete VotingResetEnabled;
            // class VotingResetEnabled: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_VotingResetEnabled";
            //     displayName = "$STR_A3_WL_menu_resetvoting";
            //     tooltip = "$STR_A3_WL_menu_resetvoting_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "0";
            // };
            class MarkersTransparency: Combo
            {
                property = "ModuleWLInit_F_MarkersTransparency";
                displayName = "$STR_A3_WL_param7_title";
                tooltip = "$STR_A3_WL_param7_desc";
                typeName = "NUMBER";
                defaultValue = "2";
                class Values
                {
                    class T1
                    {
                        name = "$STR_A3_WL_param7_value1";
                        value = 4;
                    };
                    class T2
                    {
                        name = "$STR_A3_WL_markerAlpha_perc_1";
                        value = 3;
                    };
                    class T3
                    {
                        name = "$STR_A3_WL_markerAlpha_perc_2";
                        value = 2;
                    };
                    class T4
                    {
                        name = "$STR_A3_WL_markerAlpha_perc_3";
                        value = 1;
                    };
                    class T5
                    {
                        name = "$STR_A3_WL_param7_value2";
                        value = 0;
                    };
                };
            };
            class PlayersTransparency: Combo
            {
                property = "ModuleWLInit_F_PlayersTransparency";
                displayName = "$STR_A3_WL_param8_title";
                tooltip = "$STR_A3_WL_param8_desc";
                typeName = "NUMBER";
                defaultValue = "2";
                class Values
                {
                    class T1
                    {
                        name = "$STR_A3_WL_param7_value1";
                        value = 4;
                    };
                    class T2
                    {
                        name = "$STR_A3_WL_markerAlpha_perc_1";
                        value = 3;
                    };
                    class T3
                    {
                        name = "$STR_A3_WL_markerAlpha_perc_2";
                        value = 2;
                    };
                    class T4
                    {
                        name = "$STR_A3_WL_markerAlpha_perc_3";
                        value = 1;
                    };
                    class T5
                    {
                        name = "$STR_A3_WL_param7_value2";
                        value = 0;
                    };
                };
            };
            delete FatigueEnabled;
            // class FatigueEnabled: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_FatigueEnabled";
            //     displayName = "$STR_A3_fatigue1";
            //     tooltip = "$STR_A3_WL_param9_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "1";
            // };
            delete Music;
            // class Music: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_Music";
            //     displayName = "$STR_A3_rscattributemusic_title";
            //     tooltip = "$STR_A3_WL_param10_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "1";
            // };
            delete Voice;
            // class Voice: CheckboxNumber
            // {
            //     property = "ModuleWLInit_F_Voice";
            //     displayName = "$STR_A3_orange_faction_idap_cfgidentities_expo_name";
            //     tooltip = "$STR_A3_WL_param11_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "1";
            // };
            class StartCP: Combo
            {
                property = "ModuleWLInit_F_StartCP";
                displayName = "$STR_A3_WL_param12_title";
                tooltip = "$STR_A3_WL_param12_desc";
                typeName = "NUMBER";
                defaultValue = "0";
                class Values
                {
                    class CP1
                    {
                        name = "0";
                        value = 0;
                        default = 1;
                    };
                    class CP2
                    {
                        name = "100";
                        value = 100;
                    };
                    class CP3
                    {
                        name = "250";
                        value = 250;
                    };
                    class CP4
                    {
                        name = "500";
                        value = 500;
                    };
                    class CP5
                    {
                        name = "1000";
                        value = 750;
                    };
                    class CP6
                    {
                        name = "2500";
                        value = 2500;
                    };
                    class CP7
                    {
                        name = "5000";
                        value = 5000;
                    };
                };
            };
            class CPMultiplier: Combo
            {
                property = "ModuleWLInit_F_CPMultiplier";
                displayName = "$STR_A3_WL_param13_title";
                tooltip = "$STR_A3_WL_param13_desc";
                typeName = "NUMBER";
                defaultValue = "1";
                class Values
                {
                    class CP05
                    {
                        name = "0.5x";
                        value = 0.5;
                    };
                    class CP1
                    {
                        name = "1x";
                        value = 1;
                        default = 1;
                    };
                    class CP2
                    {
                        name = "2x";
                        value = 2;
                    };
                    class CP3
                    {
                        name = "3x";
                        value = 3;
                    };
                    class CP4
                    {
                        name = "4x";
                        value = 4;
                    };
                    class CP5
                    {
                        name = "5x";
                        value = 5;
                    };
                };
            };
            delete VotingTimeout;
            // class VotingTimeout: Combo
            // {
            //     property = "ModuleWLInit_F_VotingTimeout";
            //     displayName = "$STR_A3_WL_param14_title";
            //     tooltip = "$STR_A3_WL_param14_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "15";
            //     class Values
            //     {
            //         class TO1
            //         {
            //             name = "5";
            //             value = 5;
            //         };
            //         class TO2
            //         {
            //             name = "10";
            //             value = 10;
            //         };
            //         class TO3
            //         {
            //             name = "15";
            //             value = 15;
            //         };
            //         class TO4
            //         {
            //             name = "20";
            //             value = 20;
            //         };
            //         class TO5
            //         {
            //             name = "25";
            //             value = 25;
            //         };
            //         class TO6
            //         {
            //             name = "30";
            //             value = 30;
            //         };
            //     };
            // };
            delete VehicleSpan;
            // class VehicleSpan: Combo
            // {
            //     property = "ModuleWLInit_F_VehicleSpan";
            //     displayName = "$STR_A3_WL_param15_title";
            //     tooltip = "$STR_A3_WL_param15_desc";
            //     typeName = "NUMBER";
            //     defaultValue = "3600";
            //     class Values
            //     {
            //         class TO1
            //         {
            //             name = "15";
            //             value = 900;
            //         };
            //         class TO2
            //         {
            //             name = "30";
            //             value = 1800;
            //         };
            //         class TO3
            //         {
            //             name = "60";
            //             value = 3600;
            //         };
            //         class TO4
            //         {
            //             name = "90";
            //             value = 5400;
            //         };
            //         class TO5
            //         {
            //             name = "120";
            //             value = 7200;
            //         };
            //         class TO6
            //         {
            //             name = "$STR_A3_WL_param15_value1";
            //             value = 1000000;
            //         };
            //     };
            // };
            class FactionBLUFOR: Edit
            {
                property = "ModuleWLInit_F_FactionBLUFOR";
                displayName = "$STR_A3_WL_param16_title";
                tooltip = "$STR_A3_WL_param16_desc";
                typeName = "STRING";
                defaultValue = """BLU_F""";
            };
            class FactionOPFOR: Edit
            {
                property = "ModuleWLInit_F_FactionOPFOR";
                displayName = "$STR_A3_WL_param17_title";
                tooltip = "$STR_A3_WL_param16_desc";
                typeName = "STRING";
                defaultValue = """OPF_F""";
            };
            class FactionIndep: Edit
            {
                property = "ModuleWLInit_F_FactionIndep";
                displayName = "$STR_A3_WL_param18_title";
                tooltip = "$STR_A3_WL_param16_desc";
                typeName = "STRING";
                defaultValue = """IND_F""";
            };
            class AssetList: Edit
            {
                property = "ModuleWLInit_F_AssetList";
                displayName = "$STR_A3_WL_param19_title";
                tooltip = "$STR_A3_WL_param19_desc";
                defaultValue = """['TB_RHS']""";
            };
            class MissionEnd: CheckboxNumber
            {
                property = "ModuleWLInit_F_MissionEnd";
                displayName = "$STR_A3_WL_param20_title";
                tooltip = "$STR_A3_WL_param20_desc";
                typeName = "NUMBER";
                defaultValue = "1";
            };
            class DebriefingWinBLUFOR: Edit
            {
                property = "ModuleWLInit_F_DebriefingWinBLUFOR";
                displayName = "$STR_A3_WL_param21_title";
                tooltip = "$STR_A3_WL_param21_desc";
                typeName = "STRING";
                defaultValue = """BIS_WLVictoryWEST""";
            };
            class DebriefingFailBLUFOR: Edit
            {
                property = "ModuleWLInit_F_DebriefingFailBLUFOR";
                displayName = "$STR_A3_WL_param22_title";
                tooltip = "$STR_A3_WL_param21_desc";
                typeName = "STRING";
                defaultValue = """BIS_WLDefeatWEST""";
            };
            class DebriefingWinOPFOR: Edit
            {
                property = "ModuleWLInit_F_DebriefingWinOPFOR";
                displayName = "$STR_A3_WL_param23_title";
                tooltip = "$STR_A3_WL_param21_desc";
                typeName = "STRING";
                defaultValue = """BIS_WLVictoryEAST""";
            };
            class DebriefingFailOPFOR: Edit
            {
                property = "ModuleWLInit_F_DebriefingFailOPFOR";
                displayName = "$STR_A3_WL_param24_title";
                tooltip = "$STR_A3_WL_param21_desc";
                typeName = "STRING";
                defaultValue = """BIS_WLDefeatEAST""";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description = "$STR_A3_WL_moduleDesc_init";
        };
    };

    class ModuleWLSector_F: ModuleWLTemplate_F
    {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleWLSector_F";
        scope = 2;
        icon = "A3\Data_F_Warlords\Data\wl_module_s_ca.paa";
        displayName = "$STR_A3_WL_module_sector_name";
        function = "";
        isGlobal = 2;
        class Attributes: AttributesBase
        {
            class Name: Edit
            {
                property = "ModuleWLSector_F_Name";
                displayName = "$STR_A3_combatpatrol_modules_4";
                tooltip = "$STR_A3_WL_param25_desc";
                defaultValue = """""";
            };
            class LocationName: Checkbox
            {
                property = "ModuleWLSector_F_LocationName";
                displayName = "$STR_A3_WL_param36_title";
                tooltip = "$STR_A3_WL_param36_desc";
                typeName = "BOOL";
                defaultValue = "TRUE";
            };
            class Side: Combo
            {
                property = "ModuleWLSector_F_Side";
                displayName = "$STR_eval_typeside";
                tooltip = "$STR_A3_WL_param26_desc_b";
                typeName = "NUMBER";
                defaultValue = "0";
                class Values
                {
                    class Default
                    {
                        name = "$STR_disp_default";
                        value = 0;
                    };
                    class BLUFOR
                    {
                        name = "$STR_west";
                        value = 2;
                    };
                    class OPFOR
                    {
                        name = "$STR_east";
                        value = 1;
                    };
                };
            };
            class Size: Edit
            {
                property = "ModuleWLSector_F_Size";
                displayName = "$STR_A3_mp_groundsupport_modulemptypegroundsupportbase_size";
                tooltip = "$STR_A3_WL_param27_desc";
                typeName = "NUMBER";
                defaultValue = "250";
            };
            class Funds: Edit
            {
                property = "ModuleWLSector_F_Funds";
                displayName = "$STR_A3_WL_param28_title";
                tooltip = "$STR_A3_WL_param28_desc";
                typeName = "NUMBER";
                defaultValue = "25";
            };
            class SeizingTime: Edit
            {
                property = "ModuleWLSector_F_SeizingTime";
                displayName = "$STR_A3_WL_param29_title";
                tooltip = "$STR_A3_WL_param29_desc";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class Service_Harbour: Checkbox
            {
                property = "ModuleWLSector_F_Service_Harbour";
                displayName = "$STR_A3_WL_param30_title";
                tooltip = "$STR_A3_WL_param30_desc";
                typeName = "BOOL";
                defaultValue = "FALSE";
            };
            class Service_Helipad: Checkbox
            {
                property = "ModuleWLSector_F_Service_Helipad";
                displayName = "$STR_A3_WL_module_service_helipad";
                tooltip = "$STR_A3_WL_param31_desc";
                typeName = "BOOL";
                defaultValue = "FALSE";
            };
            class Service_Runway: Checkbox
            {
                property = "ModuleWLSector_F_Service_Runway";
                displayName = "$STR_A3_WL_param32_title";
                tooltip = "$STR_A3_WL_param32_desc";
                typeName = "BOOL";
                defaultValue = "FALSE";
            };
            class FastTravelEnabled: Checkbox
            {
                property = "ModuleWLSector_F_FastTravelEnabled";
                displayName = "$STR_A3_fastravel1";
                tooltip = "$STR_A3_WL_param33_desc";
                typeName = "BOOL";
                defaultValue = "FALSE";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description = "$STR_A3_WL_moduleDesc_sector";
            position = 1;
            duplicate = 1;
        };
    };
};
