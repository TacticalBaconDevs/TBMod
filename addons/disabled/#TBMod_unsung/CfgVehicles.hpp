/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    // ###################### Fries ######################
    class Helicopter;
    class uns_UH1D_base : Helicopter
    {
        ace_fastroping_enabled = 1;
        ace_fastroping_onCut = "ace_fastroping_fnc_onCutCommon";
        ace_fastroping_onPrepare = "ace_fastroping_fnc_onPrepareCommon";
        ace_fastroping_ropeOrigins[] = {{1.166, 0.79, -0.01}, {-1.166, 0.79, -0.01}};
    };


    // ###################### TFAR ######################
    // class ReammoBox;
    // class TFAR_Bag_Base : ReammoBox
    // {
        // tf_range = 2000;
    // };
    // class UNS_Alice_F1;
    // class UNS_ARMY_RTO : UNS_Alice_F1
    // {
        // tf_range = 2000;
    // };
    // class UNS_Alice_FR : UNS_Alice_F1
    // {
        // tf_range = 2000;
    // };

    // class TFAR_anarc210: TFAR_Bag_Base
    // {
        // tf_range = 4000;
    // };
    // class Land;
    // class LandVehicle: Land
    // {
        // tf_range = 4000;
    // };


    // ###################### Makros ######################
    #define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
            weapon = #WEAPON; \
            count = COUNT; \
        }
    #define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
            name = #ITEM; \
            count = COUNT; \
        }
    #define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
            magazine = #MAGAZINE; \
            count = COUNT; \
        }
    #define MACRO_ADDBACKPACK(BACKPACK,COUNT) class _xx_##BACKPACK { \
            backpack = #BACKPACK; \
            count = COUNT; \
        }
    #define ADD_SUPPLY(NAME,ITEM) class ITEM \
        { \
            displayName = #NAME; \
            condition = "!('ITEM' in (_target getVariable ['TBMod_Nachschub_blacklist', []])) && _target getVariable ['TBMod_Nachschub_kisten', 1] > 0"; \
            statement = "[_target, 'ITEM'] spawn TB_fnc_createSupply"; \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
        }
    #define WRAPPER(CLASS_NAME) class CLASS_NAME; \
    class TB_##CLASS_NAME : CLASS_NAME \
    { \
        author = "shukari"; \
        ace_cargo_canLoad = 1; \
        ace_cargo_size = 1; \
        ace_dragging_canCarry = 1; \
        ace_dragging_canDrag = 1; \
        editorCategory = "EdCat_TB_MainCat_supply"; \
        editorSubcategory = "EdSubcat_TB_Supply_ALL"; \
        scope = 1; \
        scopeCurator = 1; \
        class TransportItems {}; \
        class TransportWeapons {}; \
        class TransportBackpacks {}; \
        class TransportMagazines {}; \
    }
    #define WRAPPER_NAME(CLASS_NAME) TB_##CLASS_NAME
    #define PUBLIC_NAME(D_NAME) \
        displayName = D_NAME; \
        scope = 2; \
        scopeCurator = 2
    #define PUBLIC_NAME_CAT(D_NAME, CATO) \
        displayName = D_NAME; \
        scope = 2; \
        scopeCurator = 2; \
        editorSubcategory = "EdSubcat_TB_Supply_##CATO"
    #define SUB_CAT(NAME) EdSubcat_TB_Supply_##NAME


    // ###################### VORRATSLAGER #########################
    class Box_NATO_AmmoVeh_F;
    class TB_supply_base: Box_NATO_AmmoVeh_F
    {
        class ACE_Actions
        {
            class ACE_MainActions
            {
                class allgemein
                {
                    displayName = "Allgemein";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_SUPPLY(LeereKiste,TB_supply_empty);
                    ADD_SUPPLY(Sanikiste,TB_supply_all_medic);
                    ADD_SUPPLY(Ersatzreifen,ACE_Wheel);
                    ADD_SUPPLY(Ersatzkette,ACE_Track);
                    ADD_SUPPLY(Moerserkit,TB_supply_all_mortar);
                    ADD_SUPPLY(MoerserMunnition,TB_supply_all_mortarAmmo);
                    ADD_SUPPLY(MoerserMunnitionHE,TB_supply_all_mortarAmmoHE);
                    ADD_SUPPLY(MoerserMunnitionRauch,TB_supply_all_mortarAmmoSmoke);
                    ADD_SUPPLY(MoerserMunnitionFlare,TB_supply_all_mortarAmmoFlare);
                    ADD_SUPPLY(BauKiste,TB_supply_all_building);

                    delete TB_supply_all_funk;
                    delete TB_supply_all_misc;
                    delete TB_supply_all_mp5;
                    delete TB_supply_all_mines;
                    delete TB_supply_all_hmg;
                };
                delete usa;
                delete bw;

                class themen_usaVietnam
                {
                    displayName = "Themen USA-Vietnam";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_SUPPLY(Munition,TB_supply_themen_usaVietnam_ammo);
                    ADD_SUPPLY(KleinMunition,TB_supply_themen_usaVietnam_ammoSmall);
                    ADD_SUPPLY(Granaten,TB_supply_themen_usaVietnam_grena);
                    ADD_SUPPLY(Unterlauf,TB_supply_themen_usaVietnam_unterlauf);
                    ADD_SUPPLY(MGMunition,TB_supply_themen_usaVietnam_mgammo);
                    ADD_SUPPLY(Werfer,TB_supply_themen_usaVietnam_launcher);
                    // ADD_SUPPLY(WerferMunition,TB_supply_bw_launcherAmmo);
                    // ADD_SUPPLY(NotfallG36,TB_supply_bw_notfallg36);
                    // ADD_SUPPLY(NachtKiste,TB_supply_bw_night);
                };

                class packBack;
            };
        };
    };

    // #################### Nachschub #######################
    WRAPPER(uns_trap_box);          // sehr kleine Munitionskiste
    WRAPPER(uns_medcrate);          // Medickarton
    WRAPPER(uns_resupply_crate_NVA);// große grüne Munitionskiste
    //WRAPPER(uns_81mmammobox_US);  // mittlere Munitionskiste - NUR MODEL
    WRAPPER(uns_HMGammobox_US);     // mini Munitionsbox
    WRAPPER(uns_US_Ordnance);       // längliche Munitionskiste
    WRAPPER(uns_HiddenAmmoBox_small1);// flache Munitionskiste

    // ################### OVERRIDES ########################

    class WRAPPER_NAME(Box_NATO_Ammo_F);
    class WRAPPER_NAME(Box_NATO_Support_F);
    class WRAPPER_NAME(Box_NATO_WpsSpecial_F);
    class WRAPPER_NAME(Box_NATO_Equip_F);

    class TB_supply_empty: WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        model = "\uns_ammo\US\uns_US_Launchers.p3d";
    };

    class TB_supply_all_medic : WRAPPER_NAME(Box_NATO_Support_F)
    {
        model = "\uns_ammo\US\uns_US_medical.p3d";
    };

    class TB_supply_all_mortar : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    class TB_supply_all_mortarAmmo : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    class TB_supply_all_mortarAmmoHE : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    class TB_supply_all_mortarAmmoSmoke : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    class TB_supply_all_mortarAmmoFlare : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    class TB_supply_all_hmg : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    class TB_supply_all_building : WRAPPER_NAME(Box_NATO_Equip_F)
    {
        model = "\uns_ammo\VC\uns_VC_ammo2.p3d";
    };

    // ######################################################

    class TB_supply_themen_usaVietnam_ammo : WRAPPER_NAME(uns_resupply_crate_NVA)
    {
        PUBLIC_NAME_CAT("Munition",Themen_USAVietnam);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(uns_30Rnd_556x45_Stanag_T,30);
            MACRO_ADDMAGAZINE(uns_thompsonmag_20_T,20);
            MACRO_ADDMAGAZINE(uns_m1carbinemag_T,20);
            MACRO_ADDMAGAZINE(uns_12gaugemag_6f,15);
        };
    };

    class TB_supply_themen_usaVietnam_ammoSmall : WRAPPER_NAME(uns_HiddenAmmoBox_small1)
    {
        PUBLIC_NAME_CAT("HandwaffenMunition",Themen_USAVietnam);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(uns_m1911mag,30);
        };
    };

    class TB_supply_themen_usaVietnam_grena : WRAPPER_NAME(uns_trap_box)
    {
        PUBLIC_NAME_CAT("Granaten",Themen_USAVietnam);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(uns_m18white,10);
            MACRO_ADDMAGAZINE(uns_m18red,10);

            MACRO_ADDMAGAZINE(uns_f1gren,20);
            MACRO_ADDMAGAZINE(uns_m308gren,10);
            MACRO_ADDMAGAZINE(uns_mk40gren,10);
        };
    };

    class TB_supply_themen_usaVietnam_unterlauf : WRAPPER_NAME(uns_resupply_crate_NVA) // model von uns_81mmammobox_US
    {
        PUBLIC_NAME_CAT("Unterlauf",Themen_USAVietnam);
        model = "\uns_ammo\US\uns_US_ammo_Mortar.p3d";

        class TransportMagazines
        {
            // Explosiv
            MACRO_ADDMAGAZINE(uns_1Rnd_AB_M397,6);
            MACRO_ADDMAGAZINE(uns_ex41mag,6);
            MACRO_ADDMAGAZINE(Uns_1Rnd_HE_M406,6);

            // Smokes
            MACRO_ADDMAGAZINE(uns_1Rnd_Smoke_40mm,8);
            MACRO_ADDMAGAZINE(uns_1Rnd_SmokeRed_40mm,4);
            MACRO_ADDMAGAZINE(uns_1Rnd_SmokeGreen_40mm,4);

            // Flares
            MACRO_ADDMAGAZINE(uns_40mm_white,8);
            MACRO_ADDMAGAZINE(uns_40mm_green,4);
        };
    };

    class TB_supply_themen_usaVietnam_mgammo : WRAPPER_NAME(uns_resupply_crate_NVA)
    {
        PUBLIC_NAME_CAT("MG Munnition",Themen_USAVietnam);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(uns_barmag_T,20);
            MACRO_ADDMAGAZINE(uns_100Rnd_m1919,4);
            MACRO_ADDMAGAZINE(uns_m60mag,4);
        };
    };

    class TB_supply_themen_usaVietnam_launcher : WRAPPER_NAME(uns_US_Ordnance)
    {
        PUBLIC_NAME_CAT("Werfer",Themen_USAVietnam);

        class TransportWeapons
        {
            MACRO_ADDWEAPON(uns_m72,2);
        };

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(uns_m72rocket,2);
            MACRO_ADDMAGAZINE(uns_M30_smoke_mag,10);
        };
    };

};
