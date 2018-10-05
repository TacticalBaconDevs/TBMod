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
        displayName = "Vorratslager";
        author = "shukari";
        
        scope = 2;
        scopeCurator = 2;
        
        disableInventory = 1;
        
        ace_cargo_canLoad = 0;
        ace_cargo_size = -1;
        
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";
        
        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportBackpacks {};
        
        class ACE_Actions
        {
            class ACE_MainActions
            {
                displayName = "TB-Nachschub";
                modifierFunction = "[_this] call TB_fnc_modifierSupplyMain";
                distance = 7;
                
                class allgemein
                {
                    displayName = "Allgemein";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    
                    ADD_SUPPLY(LeereKiste,TB_supply_empty);
                    ADD_SUPPLY(Sanikiste,TB_supply_all_medic);
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
                    ADD_SUPPLY(BauKiste,TB_supply_all_building);
                    ADD_SUPPLY(MP5Muni,TB_supply_all_mp5);
                    ADD_SUPPLY(Minenkiste,TB_supply_all_mines);
                };
        
                class usa
                {
                    displayName = "USA";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    
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
                    ADD_SUPPLY(NotfallM4,TB_supply_usa_notfallm4);
                    ADD_SUPPLY(NachtKiste,TB_supply_usa_night);
                };
        
                class bw
                {
                    displayName = "BW";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    
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
                
                class packBack
                {
                    displayName = "Kiste zurückpacken";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    insertChildren = "_this call TB_fnc_insertChildrenDeleteBox";
                };
            };
        };
    };
    
    
    // ###################### KISTEN #########################
    WRAPPER(Box_NATO_Support_F);
    WRAPPER(Box_NATO_Ammo_F);
    WRAPPER(Box_NATO_Wps_F);
    WRAPPER(Box_NATO_Equip_F); // sehr groß
    WRAPPER(Box_NATO_WpsLaunch_F);
    WRAPPER(Box_NATO_Grenades_F);
    WRAPPER(Box_NATO_AmmoOrd_F);
    WRAPPER(Box_NATO_WpsSpecial_F);
    
    class TB_supply_empty: WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("Leere Kiste");
    };
    
    class TB_supply_all_medic: WRAPPER_NAME(Box_NATO_Support_F)
    {
        PUBLIC_NAME("Sanikiste");
        
        class TransportItems
        {
            MACRO_ADDITEM(ACE_quikclot,40);
            MACRO_ADDITEM(ACE_elasticBandage,40);
            MACRO_ADDITEM(ACE_fieldDressing,10);
            
            MACRO_ADDITEM(ACE_tourniquet,10);
            
            MACRO_ADDITEM(ACE_salineIV_500,10);
            MACRO_ADDITEM(ACE_salineIV,5);
            
            MACRO_ADDITEM(ACE_morphine,20);
            MACRO_ADDITEM(ACE_epinephrine,10);
            MACRO_ADDITEM(ACE_atropine,5);
            
            MACRO_ADDITEM(ACE_personalAidKit,3);
            MACRO_ADDITEM(ACE_surgicalKit,1);
            MACRO_ADDITEM(ACE_bodyBag,2);
        };
    };
    
    class TB_supply_all_funk : WRAPPER_NAME(Box_NATO_Equip_F)
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
    
    class TB_supply_all_mortar : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
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
    
    class TB_supply_all_mortarAmmo : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("MörserMunition");
        
        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE,8);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Smoke,4);
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Illum,2);
            //MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE_Guided,3);
            //MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE_LaserGuided,2);
        };
    };
    
    class TB_supply_all_mortarAmmoHE : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("MörserMunitionHE");
        
        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_HE,15);
        };
    };
    
    class TB_supply_all_mortarAmmoSmoke : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("MörserMunitionRauch");
        
        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Smoke,15);
        };
    };
    
    class TB_supply_all_mortarAmmoFlare : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("MörserMunitionFlare");
        
        class TransportItems
        {
            MACRO_ADDITEM(ACE_1Rnd_82mm_Mo_Illum,15);
        };
    };
    
    class TB_supply_all_hmg : WRAPPER_NAME(Box_NATO_WpsSpecial_F)
    {
        PUBLIC_NAME("HMGKit");
        
        class TransportBackpacks
        {
            MACRO_ADDBACKPACK(RHS_M2_Gun_Bag,1);
            MACRO_ADDBACKPACK(RHS_M2_Tripod_Bag,1);
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
            MACRO_ADDITEM(ACE_MapTools,5);
            
            MACRO_ADDITEM(Binocular,2);
            MACRO_ADDITEM(ItemGPS,2);
            MACRO_ADDITEM(ItemCompass,2);
        };
    };
    
    class TB_supply_all_building : WRAPPER_NAME(Box_NATO_Equip_F)
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
    
    class TB_supply_all_mp5 : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("MP5Muni");

        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(hlc_30Rnd_9x19_B_MP5,20);
            MACRO_ADDMAGAZINE(hlc_30Rnd_9x19_GD_MP5,20);
            MACRO_ADDMAGAZINE(hlc_30Rnd_9x19_SD_MP5,10);
            MACRO_ADDMAGAZINE(hlc_30Rnd_10mm_B_MP5,10);
            MACRO_ADDMAGAZINE(hlc_30Rnd_10mm_JHP_MP5,20);
        };
    };

    class TB_supply_all_mines : WRAPPER_NAME(Box_NATO_Ammo_F)
    {
        PUBLIC_NAME("Minenkiste");
    
        class TransportItems
        {
            MACRO_ADDITEM(DemoCharge_Remote_Mag,10);
            MACRO_ADDITEM(SatchelCharge_Remote_Mag,10);
            MACRO_ADDITEM(AMP_Breaching_Charge_Mag,10);

            MACRO_ADDITEM(SLAMDirectionalMine_Wire_Mag,5);
            MACRO_ADDITEM(APERSBoundingMine_Range_Mag,5);
            MACRO_ADDITEM(APERSMine_Range_Mag,5);
            MACRO_ADDITEM(ACE_M26_Clacker,5);
            MACRO_ADDITEM(IEDLandBig_Remote_Mag,2);
        };
    };

    // ###################### USA #########################
    #include "CfgVehicles_USA.hpp"
    
    // ###################### BW #########################
    #include "CfgVehicles_BW.hpp"
};
