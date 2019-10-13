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
            condition = QUOTE(!('ITEM' in (_target getVariable ['TBMod_Nachschub_blacklist', []])) && _target getVariable ['TBMod_Nachschub_kisten', 1] > 0); \
            statement = QUOTE([_target, 'ITEM'] spawn FUNC(createSupply)); \
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
    #define WRAPPER_SKIN(CLASS_NAME,SKIN) WRAPPER_SKIN2(CLASS_NAME, SKIN, "")
    #define WRAPPER_SKIN2(CLASS_NAME,SKIN1,SKIN2) class CLASS_NAME; \
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
            hiddenSelectionsTextures[] = {SKIN1,SKIN2}; \
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
        editorSubcategory = EdSubcat_TB_Supply_##CATO
    #define SUB_CAT(NAME) EdSubcat_TB_Supply_##NAME


    // ###################### VORRATSLAGER #########################
    class Box_NATO_AmmoVeh_F;
    class TB_supply_base: Box_NATO_AmmoVeh_F
    {
        displayName = "Vorratslager";
        author = "shukari";

        scope = 2;
        scopeCurator = 2;

        disableInventory = 1;

        ace_rearm_defaultSupply = -1; // 1200
        ace_cargo_canLoad = 0;
        ace_cargo_size = -1;

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";

        // hiddenSelections[] = {"Camo_Signs","Camo"};
        hiddenSelectionsTextures[] = {"", QPATHTOEF(skins,pictures\statics\TB_vorratslager.paa)};

        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportBackpacks {};

        class ACE_Actions
        {
            class ACE_MainActions
            {
                displayName = "TB-Nachschub";
                modifierFunction = QUOTE([_this] call FUNC(modifierSupplyMain));
                distance = 7;

                class allgemein
                {
                    displayName = "Allgemein";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_SUPPLY(LeereKiste,TB_supply_empty);
                    ADD_SUPPLY(Sanikiste,TB_supply_all_medic);
                    ADD_SUPPLY(Arztkiste,TB_supply_all_arzt);
                    ADD_SUPPLY(Ersatzreifen,ACE_Wheel);
                    ADD_SUPPLY(Ersatzkette,ACE_Track);
                    ADD_SUPPLY(Funkgeräte,TB_supply_all_funk);
                    ADD_SUPPLY(EquipmentKiste,TB_supply_all_misc);
                    ADD_SUPPLY(Moerserkit,TB_supply_all_mortar);
                    ADD_SUPPLY(MoerserMunnition,TB_supply_all_mortarAmmo);
                    ADD_SUPPLY(MoerserMunnitionHE,TB_supply_all_mortarAmmoHE);
                    ADD_SUPPLY(MoerserMunnitionRauch,TB_supply_all_mortarAmmoSmoke);
                    ADD_SUPPLY(MoerserMunnitionFlare,TB_supply_all_mortarAmmoFlare);
                    ADD_SUPPLY(HMGKit,TB_supply_all_hmg);
                    ADD_SUPPLY(GMGKit,TB_supply_all_gmg);
                    ADD_SUPPLY(TOWKit,TB_supply_all_tow);
                    ADD_SUPPLY(FlaRakKit,TB_supply_all_flarak);
                    ADD_SUPPLY(BauKiste,TB_supply_all_building);
                    ADD_SUPPLY(SaniBaukiste,TB_supply_all_medicbuilding);
                    ADD_SUPPLY(Sprengstoff,TB_supply_all_mines);
                };

                class usa
                {
                    displayName = "USA";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    condition = "!((entities [['TB_arsenal_usa', 'TB_arsenal_predefined_custom'], []]) isEqualTo [])";

                    ADD_SUPPLY(Munition,TB_supply_usa_ammo);
                    ADD_SUPPLY(KleinMunition,TB_supply_usa_ammoSmall);
                    ADD_SUPPLY(Granaten,TB_supply_usa_grena);
                    ADD_SUPPLY(Unterlauf,TB_supply_usa_unterlauf);
                    ADD_SUPPLY(SpezialMunition,TB_supply_usa_spezial);
                    ADD_SUPPLY(Werfer,TB_supply_usa_launcher);
                    ADD_SUPPLY(WerferMunition,TB_supply_usa_launcherAmmo);
                    ADD_SUPPLY(JavlinMunition,TB_supply_usa_javlinAmmo);
                    ADD_SUPPLY(MAAWSMunition,TB_supply_usa_MAAWSAmmo);
                    ADD_SUPPLY(SMAWMunition,TB_supply_usa_SMAWAmmo);
                    ADD_SUPPLY(Notfall,TB_supply_usa_notfall);
                    ADD_SUPPLY(NachtKiste,TB_supply_usa_night);
                    ADD_SUPPLY(vz99 MörserMunition,TB_supply_all_commandMortarAmmo);
                    ADD_SUPPLY(vz99 MörserMunitionHE,TB_supply_all_commandMortarAmmoHE);
                };

                class bw
                {
                    displayName = "BW";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    condition = "!((entities [['TB_arsenal_bw', 'TB_arsenal_predefined_custom'], []]) isEqualTo []) && isClass (configFile >> 'CfgPatches' >> 'bwa3_common')";

                    ADD_SUPPLY(Munition,TB_supply_bw_ammo);
                    ADD_SUPPLY(KleinMunition,TB_supply_bw_ammoSmall);
                    ADD_SUPPLY(Granaten,TB_supply_bw_grena);
                    ADD_SUPPLY(Unterlauf,TB_supply_bw_unterlauf);
                    ADD_SUPPLY(SpezialMunition,TB_supply_bw_spezial);
                    ADD_SUPPLY(Werfer,TB_supply_bw_launcher);
                    ADD_SUPPLY(WerferMunition,TB_supply_bw_launcherAmmo);
                    ADD_SUPPLY(NotfallG36,TB_supply_bw_notfallg36);
                    ADD_SUPPLY(NachtKiste,TB_supply_bw_night);
                };

                class nato
                {
                    displayName = "NATO";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    condition = "!((entities [['TB_arsenal_vanilla', 'TB_arsenal_predefined_custom'], []]) isEqualTo [])";

                    ADD_SUPPLY(Munition,TB_supply_nato_ammo);
                    ADD_SUPPLY(Granaten,TB_supply_nato_grena);
                    ADD_SUPPLY(Unterlauf,TB_supply_nato_unterlauf);
                    ADD_SUPPLY(WerferMunition,TB_supply_nato_launcherAmmo);
                    ADD_SUPPLY(ED-1D Drohne,TB_supply_nato_ED);
                    ADD_SUPPLY(NachtKiste,TB_supply_nato_night);
                };

                class ldf
                {
                    displayName = "LDF";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    condition = "!((entities [['TB_arsenal_themen', 'TB_arsenal_predefined_custom'], []]) isEqualTo [])";

                    ADD_SUPPLY(Munition,TB_supply_ldf_ammo);
                    ADD_SUPPLY(Granaten,TB_supply_ldf_grena);
                    ADD_SUPPLY(Unterlauf,TB_supply_ldf_unterlauf);
                    ADD_SUPPLY(WerferMunition,TB_supply_ldf_launcherAmmo);
                    ADD_SUPPLY(ED-1D Drohne,TB_supply_ldf_ED);
                    ADD_SUPPLY(NachtKiste,TB_supply_ldf_night);
                };

                class russ
                {
                    displayName = "RUSS";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    condition = "!((entities [['TB_arsenal_russ', 'TB_arsenal_predefined_custom'], []]) isEqualTo [])";

                    ADD_SUPPLY(Munition,TB_supply_russ_ammo);
                    ADD_SUPPLY(KleinMunition,TB_supply_russ_ammoSmall);
                    ADD_SUPPLY(Granaten,TB_supply_russ_grena);
                    ADD_SUPPLY(Unterlauf,TB_supply_russ_unterlauf);
                    ADD_SUPPLY(SpezialMunition,TB_supply_russ_spezial);
                    ADD_SUPPLY(Werfer,TB_supply_russ_launcher);
                    ADD_SUPPLY(WerferMunition,TB_supply_russ_launcherAmmo);
                    ADD_SUPPLY(NotfallWaffen,TB_supply_russ_notfall);
                    ADD_SUPPLY(NachtKiste,TB_supply_russ_night);
                };

                class packBack
                {
                    displayName = "Kiste zurückpacken";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    insertChildren = QUOTE(_this call FUNC(insertChildrenDeleteBox));
                };
            };
        };
    };


    // ###################### KISTEN #########################
    #define SKIN_GRP1 QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_3.paa), QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    #define SKIN_GRP2 QPATHTOEF(skins,pictures\statics\Land_PlasticCase_01_medium_F_0.paa)
    #define SKIN_GRP3 QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_2.paa), QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    #define SKIN_GRP4 QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa), QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    #define SKIN_GRP5 QPATHTOEF(skins,pictures\statics\AmmoBox_signs_CA_0_1.paa), QPATHTOEF(skins,pictures\statics\Box_T_East_Wps_F_co_1.paa)
    #define SUPPORT_SKIN QPATHTOEF(skins,pictures\statics\equipment_box_blufor_ca_1.paa)

    // WRAPPER(Box_NATO_Support_F); // nicht benutzt
    WRAPPER(Box_NATO_Equip_F);
    WRAPPER(Box_EAF_Uniforms_F);
    WRAPPER_SKIN2(Box_NATO_Ammo_F, SKIN_GRP1);
    WRAPPER_SKIN2(Box_NATO_Wps_F, SKIN_GRP1);
    WRAPPER_SKIN2(Box_IDAP_Equip_F, QPATHTOEF(skins,pictures\statics\equipment_box_idap_co_1.paa), SUPPORT_SKIN);
    WRAPPER_SKIN2(Box_NATO_WpsLaunch_F, SKIN_GRP1);
    WRAPPER_SKIN2(Box_NATO_Grenades_F, SKIN_GRP1);
    WRAPPER_SKIN2(Box_NATO_AmmoOrd_F, SKIN_GRP1);
    WRAPPER_SKIN2(Box_NATO_WpsSpecial_F, SKIN_GRP1);
    WRAPPER_SKIN(Land_PlasticCase_01_small_F, SKIN_GRP2);
    WRAPPER_SKIN(Land_PlasticCase_01_medium_F, SKIN_GRP2);
    WRAPPER_SKIN2(Box_IND_Ammo_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_IND_WpsSpecial_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_NATO_Uniforms_F, QPATHTOEF(skins,pictures\statics\uniforms_box_blufor_co_0.paa), SUPPORT_SKIN);
    WRAPPER_SKIN2(Box_IND_AmmoOrd_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_IND_Support_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_IND_Wps_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_East_Wps_F, SKIN_GRP4);
    WRAPPER_SKIN2(Box_EAST_WpsLaunch_F, SKIN_GRP5);
    WRAPPER_SKIN2(Box_IND_Grenades_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_IND_WpsLaunch_F, SKIN_GRP3);
    WRAPPER_SKIN2(Box_East_WpsSpecial_F, SKIN_GRP5);
    WRAPPER_SKIN2(Box_East_Support_F, SKIN_GRP1);
    WRAPPER_SKIN2(Box_East_Grenades_F, SKIN_GRP5);
    WRAPPER_SKIN2(Box_East_AmmoOrd_F, SKIN_GRP4);

    class TB_supply_empty: WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("Leere Kiste");
    };

    class TB_supply_all_medic: WRAPPER_NAME(Land_PlasticCase_01_small_F)
    {
        PUBLIC_NAME("Sanikiste");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_quikclot,30);
            MACRO_ADDITEM(ACE_elasticBandage,30);
            MACRO_ADDITEM(ACE_fieldDressing,60);
            MACRO_ADDITEM(ACE_packingBandage,30);

            MACRO_ADDITEM(ACE_tourniquet,4);

            MACRO_ADDITEM(ACE_plasmaIV_250,8);
            MACRO_ADDITEM(ACE_plasmaIV_500,4);
            MACRO_ADDITEM(ACE_plasmaIV,2);
            MACRO_ADDITEM(ACE_salineIV_500,4);
            MACRO_ADDITEM(ACE_salineIV,2);

            MACRO_ADDITEM(ACE_morphine,8);
            MACRO_ADDITEM(ACE_epinephrine,16);
            MACRO_ADDITEM(ACE_atropine,20);
            MACRO_ADDITEM(ACE_adenosine,16);

            MACRO_ADDITEM(ACE_surgicalKit,2);
        };
    };

    class TB_supply_all_arzt: WRAPPER_NAME(Land_PlasticCase_01_medium_F)
    {
        PUBLIC_NAME("Arztkiste");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_quikclot,50);
            MACRO_ADDITEM(ACE_elasticBandage,50);
            MACRO_ADDITEM(ACE_fieldDressing,90);
            MACRO_ADDITEM(ACE_packingBandage,50);

            MACRO_ADDITEM(ACE_tourniquet,4);

            MACRO_ADDITEM(ACE_bloodIV_250,8);
            MACRO_ADDITEM(ACE_bloodIV_500,4);
            MACRO_ADDITEM(ACE_bloodIV,2);
            MACRO_ADDITEM(ACE_plasmaIV_250,16);
            MACRO_ADDITEM(ACE_plasmaIV_500,8);
            MACRO_ADDITEM(ACE_plasmaIV,4);
            MACRO_ADDITEM(ACE_salineIV_500,8);
            MACRO_ADDITEM(ACE_salineIV,4);

            MACRO_ADDITEM(ACE_morphine,10);
            MACRO_ADDITEM(ACE_epinephrine,20);
            MACRO_ADDITEM(ACE_atropine,20);
            MACRO_ADDITEM(ACE_adenosine,16);

            MACRO_ADDITEM(ACE_surgicalKit,5);
        };
    };

    class TB_supply_all_funk : WRAPPER_NAME(Box_IND_Ammo_F)
    {
        PUBLIC_NAME("Funkkiste");

        class TransportItems
        {
            MACRO_ADDITEM(TFAR_anprc152,10);
        };

        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(TFAR_rt1523g_big,2);
            MACRO_ADDBACKPACK(TFAR_rt1523g_big_rhs,2);
        };
    };

    class TB_supply_all_mortar : WRAPPER_NAME(Box_IND_WpsSpecial_F)
    {
        PUBLIC_NAME("MörserKit");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_RangeTable_82mm,2);
            MACRO_ADDITEM(ACE_Altimeter,2);
            MACRO_ADDITEM(ACE_MapTools,2);
            MACRO_ADDITEM(ACE_microDAGR,2);

            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE,5);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Smoke,3);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Illum,2);
        };

        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(B_Mortar_01_weapon_F,1);
            MACRO_ADDBACKPACK(B_Mortar_01_support_F,1);
        };
    };

    class TB_supply_all_mortarAmmo : WRAPPER_NAME(Box_NATO_Grenades_F)
    {
        PUBLIC_NAME("MörserMunition");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE,8);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Smoke,4);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Illum,2);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE_LaserGuided,4);
            //MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE_Guided,3);
        };
    };

    class TB_supply_all_mortarAmmoHE : WRAPPER_NAME(Box_NATO_Grenades_F)
    {
        PUBLIC_NAME("MörserMunitionHE");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE,15);
        };
    };

    class TB_supply_all_mortarAmmoSmoke : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
    {
        PUBLIC_NAME("MörserMunitionRauch");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Smoke,15);
        };
    };

    class TB_supply_all_mortarAmmoFlare : WRAPPER_NAME(Box_NATO_AmmoOrd_F)
    {
        PUBLIC_NAME("MörserMunitionFlare");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Illum,15);
        };
    };

    class TB_supply_all_hmg : WRAPPER_NAME(Land_PlasticCase_01_medium_F)
    {
        PUBLIC_NAME("HMGKit");
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\statics\uniforms_box_blufor_co_0.paa)};

        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(RHS_M2_Gun_Bag,1);
            MACRO_ADDBACKPACK(RHS_M2_Tripod_Bag,1);
        };
    };

    class TB_supply_all_tow : WRAPPER_NAME(Land_PlasticCase_01_medium_F)
    {
        PUBLIC_NAME("TOWKit");
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\statics\uniforms_box_blufor_co_0.paa)};

        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(rhs_Tow_Gun_Bag,1);
            MACRO_ADDBACKPACK(rhs_TOW_Tripod_Bag,1);
        };
    };

    class TB_supply_all_gmg : WRAPPER_NAME(Land_PlasticCase_01_medium_F)
    {
        PUBLIC_NAME("GMGKit");
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\statics\uniforms_box_blufor_co_0.paa)};

        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(RHS_Mk19_Gun_Bag,1);
            MACRO_ADDBACKPACK(RHS_Mk19_Tripod_Bag,1);
        };
    };

    class TB_supply_all_flarak : WRAPPER_NAME(Land_PlasticCase_01_medium_F)
    {
        PUBLIC_NAME("FlaRakKit");
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\statics\uniforms_box_blufor_co_0.paa)};

        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(B_AA_01_weapon_F,1);
            MACRO_ADDBACKPACK(B_HMG_01_support_F,1);
        };
    };

    class TB_supply_all_misc : WRAPPER_NAME(Box_NATO_Equip_F)
    {
        PUBLIC_NAME("EquipmentKiste");

        class TransportItems
        {
            MACRO_ADDITEM(ACE_CableTie,10);
            MACRO_ADDITEM(ACE_EntrenchingTool,5);
            MACRO_ADDITEM(ACE_HuntIR_monitor,2);
            MACRO_ADDITEM(ACE_SpraypaintGreen,5);

            MACRO_ADDITEM(ACE_wirecutter,2);
            MACRO_ADDITEM(ToolKit,2);
            MACRO_ADDITEM(ACE_MapTools,5);

            MACRO_ADDITEM(Binocular,2);
            MACRO_ADDITEM(ItemGPS,2);
            MACRO_ADDITEM(ItemCompass,2);
        };
    };

    class TB_supply_all_building : WRAPPER_NAME(Box_NATO_Uniforms_F)
    {
        PUBLIC_NAME("BauKiste");

        class TransportItems
        {
            MACRO_ADDITEM(TB_building_item_RoadBarrier_F,6);
            MACRO_ADDITEM(TB_building_item_RoadCone_F,12);
            MACRO_ADDITEM(TB_building_item_Land_PortableLight_single_F,4);
            MACRO_ADDITEM(TB_building_item_Land_Pallet_vertical_F,4);
            MACRO_ADDITEM(TB_building_item_Land_BagFence_Long_F,6);
            MACRO_ADDITEM(TB_building_item_Land_BagFence_Round_F,4);
            MACRO_ADDITEM(TB_building_item_ace_concertinawirecoil,10);
            MACRO_ADDITEM(TB_building_item_Land_SandbagBarricade_01_hole_F,4);
        };
    };

    class TB_supply_all_medicbuilding : WRAPPER_NAME(Box_IDAP_Equip_F)
    {
        PUBLIC_NAME("SaniBauKiste");

        class TransportItems
        {
            MACRO_ADDITEM(TB_building_item_Land_MedicalTent_01_white_generic_open_F,1);
            MACRO_ADDITEM(TB_building_item_Land_MedicalTent_01_floor_light_F,1);
            MACRO_ADDITEM(TB_building_item_Land_Stretcher_01_F,6);
            MACRO_ADDITEM(TB_building_item_Land_IntravenStand_01_2bags_F,6);
            MACRO_ADDITEM(TB_building_item_Land_PortableLight_DOUBLES_F,2);
        };
    };

    class TB_supply_all_mines : WRAPPER_NAME(Box_IND_AmmoOrd_F)
    {
        PUBLIC_NAME("Sprengstoff");

        class TransportItems
        {
            MACRO_ADDITEM(DemoCharge_Remote_Mag,10);
            MACRO_ADDITEM(SatchelCharge_Remote_Mag,5);
            MACRO_ADDITEM(AMP_Breaching_Charge_Mag,10);

            MACRO_ADDITEM(SLAMDirectionalMine_Wire_Mag,5);
            MACRO_ADDITEM(APERSBoundingMine_Range_Mag,5);
            MACRO_ADDITEM(APERSMine_Range_Mag,5);
            MACRO_ADDITEM(ACE_M26_Clacker,5);
            MACRO_ADDITEM(IEDLandBig_Remote_Mag,2);
        };
    };

    // ###################### Fraktionskisten ########################
    #include "CfgVehicles_USA.hpp"
    #include "CfgVehicles_BW.hpp"
    #include "CfgVehicles_NATO.hpp"
    #include "CfgVehicles_LDF.hpp"
    #include "CfgVehicles_RUSS.hpp"
};
