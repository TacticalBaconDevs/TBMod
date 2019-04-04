/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
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

    class TB_supply_usa_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME_CAT("Munition",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(SWOP_DC15ABlasterRifle_Mag,30);       // Gewehr
            MACRO_ADDMAGAZINE(SWOP_DC15_Mag,10);                    // Karabiner
            MACRO_ADDMAGAZINE(swop_RepShotgun_Mag,5);               // Schotgun
            MACRO_ADDMAGAZINE(SWOP_dc15xBlasterRifle_Mag,10);       // DMRMag7.62
        };
    };

    class TB_supply_usa_ammoSmall : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME_CAT("HandwaffenMunition",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(SWOP_DC15SAPistol_Mag,20);
            MACRO_ADDMAGAZINE(SWOP_DC17Pistol_Mag,20);
        };
    };

    class TB_supply_usa_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
    {
        PUBLIC_NAME_CAT("Granaten",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(SWOP_termDet_G,15);       // Splitternade
            MACRO_ADDMAGAZINE(swop_mag_gimpact,10);     // Offensivenade
            MACRO_ADDMAGAZINE(swop_mag_flashbang,4);    // Stannade

            MACRO_ADDMAGAZINE(SWOP_SCAR_EMP_GrenadeGM,10);
            MACRO_ADDMAGAZINE(swop_mag_incendiary,4);
            MACRO_ADDMAGAZINE(swop_SmokeShell,4);
        };
    };

    class TB_supply_usa_unterlauf : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
    {
        PUBLIC_NAME_CAT("Unterlauf",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(5Rnd_HE_Grenade_DC15A,30);
        };
    };

    class TB_supply_usa_spezial : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
    {
        PUBLIC_NAME_CAT("SpezialwaffenMunition",USA);

        class TransportMagazines
        {
            // MACRO_ADDMAGAZINE(,10);
            // MACRO_ADDMAGAZINE(,5);
        };
    };

    class TB_supply_usa_launcher : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
    {
        PUBLIC_NAME_CAT("Werfer",USA);

        class TransportWeapons
        {
            // MACRO_ADDWEAPON(,1);
        };

        class TransportMagazines
        {
            // MACRO_ADDMAGAZINE(,1);
        };
    };

    class TB_supply_usa_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
    {
        PUBLIC_NAME_CAT("WerferMunition",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_fgm148_magazine_AT,1);    // Javlin
            MACRO_ADDMAGAZINE(rhs_fim92_mag,1);             // AA
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,3);        // MAAWS
            MACRO_ADDMAGAZINE(rhs_mag_smaw_HEAA,3);         // HEAA
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

    class TB_supply_usa_MAAWSAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
    {
        PUBLIC_NAME_CAT("MAAWSMunition",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HEAT,10);
            MACRO_ADDMAGAZINE(rhs_mag_maaws_HE,4);
        };
    };

    class TB_supply_usa_SMAWAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
    {
        PUBLIC_NAME_CAT("SMAWMunition",USA);

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_smaw_HEAA,6);
            MACRO_ADDMAGAZINE(rhs_mag_smaw_HEDP,2);
            MACRO_ADDMAGAZINE(rhs_mag_smaw_SR,5);
        };
    };

    class TB_supply_usa_notfall : WRAPPER_NAME(Box_NATO_Wps_F)
    {
        PUBLIC_NAME_CAT("NotfallWaffen",USA);

        class TransportWeapons
        {
            MACRO_ADDWEAPON(rhs_weap_m4,4);
        };

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red,20);
        };
    };

    class TB_supply_usa_night : WRAPPER_NAME(Box_NATO_Equip_F)
    {
        PUBLIC_NAME_CAT("Nachtkiste",USA);

        class TransportItems
        {
            MACRO_ADDITEM(rhsusf_ANPVS_14,5);
            MACRO_ADDITEM(rhsusf_ANPVS_15,5);

            MACRO_ADDITEM(ACE_IR_Strobe_Item,10);
            MACRO_ADDITEM(ACE_Flashlight_KSF1,10);

            MACRO_ADDITEM(ACE_Chemlight_HiYellow,10);
            MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
        };
    };

};
