/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define ADD_VEHICLE_ITEM(OBJECT,ATT,ROTATE) class TB_placeItem_##OBJECT \
    { \
        displayName = $STR_PLACE_##OBJECT; \
        condition = QUOTE('TB_building_item_##OBJECT' in (items ACE_player)); \
        exceptions[] = {"notOnMap", "isNotInside", "isNotHandcuffed", "isNotSurrendering", "isNotSwimming", "isNotOnLadder"}; \
        statement = QUOTE(['TB_building_item_##OBJECT', 'OBJECT', ATT, ROTATE] call TB_fnc_placePlaceables); \
    }
#define ADD_BIG_ITEM(BUILDING_END,SIM,ATT,ZEIT,COSTEN,CRANE,ROTATE) class TB_buildBig_##BUILDING_END \
    { \
        displayName = $STR_PLACE_BIG_##BUILDING_END; \
        exceptions[] = {"notOnMap","isNotInside","isNotHandcuffed","isNotSurrendering","isNotSwimming","isNotOnLadder"}; \
        statement = QUOTE(['BUILDING_END', true, SIM, ATT, [ZEIT, COSTEN], CRANE, ROTATE] spawn TB_fnc_placePlaceablesBig); \
    }
#define ADD_RESC_CHECK class ACE_Actions \
        { \
            class ACE_MainActions \
            { \
                modifierFunction = "[_this] call TB_fnc_modifierShowVehicleType"; \
                class truck_getType \
                { \
                    displayName = "Fahrzeugtyp abfragen"; \
                    condition = "alive _target"; \
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
                    statement = "call TB_fnc_getVehicleType"; \
                }; \
                class ResourceTruck_getLoad \
                { \
                    displayName = "Verbleibende Resourcen"; \
                    condition = "alive _target && (_target getVariable ['TBMod_Building_PlaceablesCargo', -1]) >= 0"; \
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
                    statement = "hint format ['Das Fahrzeug hat noch %1 Resourcen', (_target getVariable ['TBMod_Building_PlaceablesCargo', 0]) max 0]"; \
                }; \
                class truck_getFuel \
                { \
                    displayName = "Tank abfragen"; \
                    condition = "alive _target && locked _target < 2"; \
                    icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa"; \
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap"}; \
                    statement = "[_target] call TB_fnc_getFuel"; \
                }; \
            }; \
        }

class CfgVehicles
{
    class Man;
    class CAManBase : Man
    {
        class ACE_SelfActions
        {
            class ACE_Equipment
            {
                class TB_itemBuildPlaceables
                {
                    displayName = $STR_PLACE_ItemBuildPlaceables;
                    exceptions[] = {"notOnMap","isNotInside","isNotHandcuffed","isNotSurrendering","isNotSwimming","isNotOnLadder"};
                    // condition = "(ACE_player getVariable ['ACE_IsEngineer', 0]) > 0 && (ACE_player getVariable ['TB_rolle', '']) == 'pionier'";

                    // ADD_VEHICLE_ITEM(OBJECT,ATT,ROTATE)

                    // Medic
                    ADD_VEHICLE_ITEM(Land_IntravenStand_01_2bags_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_Stretcher_01_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_PortableLight_double_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_MedicalTent_01_white_generic_open_F,-1,true);    //muss noch als Medizinische Einrichtung gesetzt werden
                    ADD_VEHICLE_ITEM(Land_MedicalTent_01_floor_light_F,-1,true);

                    // Zivil
                    ADD_VEHICLE_ITEM(RoadBarrier_F,-1,false);
                    // ADD_VEHICLE_ITEM(RoadBarrier_small_F,-1,false);
                    ADD_VEHICLE_ITEM(RoadCone_F,-1,false);
                    ADD_VEHICLE_ITEM(Land_PortableLight_single_F,-1,true);
                    // ADD_VEHICLE_ITEM(RoadCone_L_F,-1,false);
                    // ADD_VEHICLE_ITEM(TapeSign_F,-1,false);
                    // ADD_VEHICLE_ITEM(Target_F,-1,false);
                    // ADD_VEHICLE_ITEM(Land_Camping_Light_F,-1,false);
                    // ADD_VEHICLE_ITEM(Land_CampingChair_V1_F,-1,false);
                    // ADD_VEHICLE_ITEM(Campfire_F,-1,false);
                    // ADD_VEHICLE_ITEM(Land_CampingTable_F,-1,false);

                    // Militär
                    ADD_VEHICLE_ITEM(Land_Pallet_vertical_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_BagFence_Long_F,-1,false);
                    ADD_VEHICLE_ITEM(Land_BagFence_Round_F,-1,true);
                    ADD_VEHICLE_ITEM(ace_concertinawirecoil,-1,false);
                    ADD_VEHICLE_ITEM(Land_SandbagBarricade_01_hole_F,-1,false);
                };

                //-----------------------------------------------------------------------------------

                class TB_buildingsBuildPlaceables
                {
                    displayName = $STR_PLACE_BuildingsBuildPlaceables;
                    exceptions[] = {"notOnMap","isNotInside","isNotHandcuffed","isNotSurrendering","isNotSwimming","isNotOnLadder"};
                    condition = "(ACE_player getVariable ['ACE_IsEngineer', 0]) > 0 && (ACE_player getVariable ['TB_rolle', '']) == 'pionier'";

                    // ADD_BIG_ITEM(BUILDING_END,SIM,ATT,ZEIT,COSTEN,CRANE,ROTATE)

                    class TB_cat_Wall
                    {
                        displayName = "Wände";

                        ADD_BIG_ITEM(Land_HBarrierWall4_F,true,-1,10,75,false,false);
                        ADD_BIG_ITEM(Land_HBarrier_5_F,true,-1,15,25,false,false);
                    };

                    class TB_cat_Bunker
                    {
                        displayName = "Bunker";

                        ADD_BIG_ITEM(Land_Cargo_Patrol_V1_F,true,-1,30,150,true,true);
                        ADD_BIG_ITEM(Land_HBarrierTower_F,true,-1,50,300,true,true);
                        ADD_BIG_ITEM(Land_BagBunker_Small_F,true,-1,15,100,false,true);
                        ADD_BIG_ITEM(Land_BagBunker_Large_F,true,-1,30,250,true,true);
                        ADD_BIG_ITEM(Land_BagBunker_Tower_F,true,-1,35,275,true,true);
                    };

                    class TB_cat_Roadblock
                    {
                        displayName = "Absperrungen";

                        ADD_BIG_ITEM(Land_CzechHedgehog_01_F,true,-1,5,30,false,true);
                        ADD_BIG_ITEM(Land_BarGate_F,true,-1,8,75,false,true);
                    };

                    class TB_cat_Support
                    {
                        displayName = "Support";

                        ADD_BIG_ITEM(TB_supply_base,true,-1,50,750,false,true);
                        ADD_BIG_ITEM(Land_Fuelstation_Feed_F,true,-1,7,80,false,true);
                        ADD_BIG_ITEM(B_Slingload_01_Repair_F,true,-1,10,80,false,true);
                        ADD_BIG_ITEM(Land_Medevac_house_V1_F,true,-1,25,200,true,false);
                    };

                    class TB_cat_Base
                    {
                        displayName = "Base";

                        ADD_BIG_ITEM(Land_HelipadSquare_F,true,-1,3,10,false,true);
                        ADD_BIG_ITEM(Land_MedicalTent_01_white_generic_open_F,true,-1,15,100,false,true);
                        ADD_BIG_ITEM(Land_Cargo_HQ_V3_F,true,-1,50,200,true,true);
                        ADD_BIG_ITEM(Land_Cargo_HQ_V1_F,true,-1,50,200,true,true);
                        ADD_BIG_ITEM(Land_FieldToilet_F,true,-1,5,10,false,false);
                        ADD_BIG_ITEM(Land_CamoNetVar_NATO,true,-1,5,10,false,true);
                        ADD_BIG_ITEM(Land_TTowerSmall_1_F,true,-1,30,60,true,true);
                        ADD_BIG_ITEM(Land_Cargo_House_V3_F,true,-1,15,60,true,false);
                    };
                };
            };
        };
    };


    // ###################### ResourcenAbfrage ######################
    class LandVehicle;
    class Car: LandVehicle
    {
        ADD_RESC_CHECK;
    };

    class Tank: LandVehicle
    {
        ADD_RESC_CHECK;
    };

    class Motorcycle: LandVehicle {
        ADD_RESC_CHECK;
    };

    class Air;
    class Helicopter: Air
    {
        ADD_RESC_CHECK;
    };

    class Plane: Air {
        ADD_RESC_CHECK;
    };

    class Ship;
    class Ship_F: Ship
    {
        ADD_RESC_CHECK;
    };


    // ###################### Zeus Module ######################
    class TB_zeus_base;
    class TB_zeus_ressourcenFahrzeug : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Ressourcentruck setzen";
        function = "TB_fnc_moduleRessourcenFahrzeug";
        category = "TB_categorie_zeus_building";
    };
    class TB_zeus_kranFahrzeug : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Krantruck setzen";
        function = "TB_fnc_moduleKranFahrzeug";
        category = "TB_categorie_zeus_building";
    };
};
