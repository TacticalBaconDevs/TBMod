/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define EXCEPTIONS exceptions[] = {"notOnMap", "isNotInside", "isNotHandcuffed", "isNotSurrendering", "isNotSwimming", "isNotOnLadder"}

class CBA_Extended_EventHandlers_base;

class CfgVehicles
{
    class Man;
    class CAManBase : Man
    {
        class ACE_SelfActions
        {
            class ADDON
            {
                displayName = "TB Building";
                EXCEPTIONS;

                class GVAR(itemBuildPlaceables)
                {
                    displayName = "Plazierbare Items";
                    EXCEPTIONS;

                    #define ADD_VEHICLE_ITEM(OBJECT,ATT,ROTATE) class TB_placeItem_##OBJECT \
                        { \
                            displayName = $STR_PLACE_##OBJECT; \
                            condition = QUOTE('TB_building_item_##OBJECT' in (items ACE_player)); \
                            EXCEPTIONS; \
                            statement = QUOTE(['TB_building_item_##OBJECT', 'OBJECT', ATT, ROTATE] call FUNC(placePlaceables)); \
                        }

                    // Medic
                    ADD_VEHICLE_ITEM(Land_IntravenStand_01_2bags_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_Stretcher_01_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_PortableLight_double_F,-1,true);
                    ADD_VEHICLE_ITEM(Land_MedicalTent_01_white_generic_open_F,-1,true);    // muss noch als Medizinische Einrichtung gesetzt werden
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

                class GVAR(buildingsBuildPlaceables)
                {
                    displayName = "Plazierbare Gebäude";
                    EXCEPTIONS;
                    condition = "((ACE_player getVariable ['ACE_IsEngineer', 0]) in [true, 1, 2] || (ACE_player getVariable ['TB_rolle', '']) == 'pionier') && 'ToolKit' in ([ACE_player] call ace_common_fnc_uniqueItems)";

                    #define ADD_BIG_ITEM(BUILDING, DISPLAY, ZEIT, KOSTEN, KRAN, ROTATE) class TB_buildBig_##BUILDING \
                        { \
                            displayName = DISPLAY; \
                            EXCEPTIONS; \
                            statement = QUOTE(['BUILDING', [ZEIT, KOSTEN], KRAN, ROTATE] call FUNC(placePlaceablesBig)); \
                        }

                    class TB_cat_Wall
                    {
                        displayName = "Wände";

                        ADD_BIG_ITEM(Land_HBarrierWall4_F, "HescoMauer (75 Resourcen)", 10, 75, false, false);
                        ADD_BIG_ITEM(Land_HBarrier_5_F, "Hesco (50 Resourcen)", 15, 25, false, false);
                    };

                    class TB_cat_Bunker
                    {
                        displayName = "Bunker";

                        ADD_BIG_ITEM(Land_Cargo_Patrol_V1_F, "Militärturm (150 Resourcen)", 30, 150, true, true);
                        ADD_BIG_ITEM(Land_HBarrierTower_F, "HescoTurm (300 Resourcen)", 50, 300, true, true);
                        ADD_BIG_ITEM(Land_BagBunker_Small_F, "Bunker (klein) (100 Resourcen)", 15, 100, false, true);
                        ADD_BIG_ITEM(Land_BagBunker_Large_F, "Bunker (groß) (250 Resourcen)", 30, 250, true, true);
                        ADD_BIG_ITEM(Land_BagBunker_Tower_F, "Bunkerturm (275 Resourcen)", 35, 275, true, true);
                    };

                    class TB_cat_Roadblock
                    {
                        displayName = "Absperrungen";

                        ADD_BIG_ITEM(Land_CzechHedgehog_01_F, "Panzersperre (30 Resourcen)", 5, 30, false, true);
                        ADD_BIG_ITEM(Land_BarGate_F, "Schranke (75 Resourcen)", 8, 75, false, true);
                    };

                    class TB_cat_Support
                    {
                        displayName = "Support";

                        ADD_BIG_ITEM(TB_supply_base, "Vorratslager (750 Resourcen)", 50, 750, false, true);
                        ADD_BIG_ITEM(Land_Fuelstation_Feed_F, "Tankstation (80 Resourcen)", 7, 80, false, true);
                        ADD_BIG_ITEM(B_Slingload_01_Repair_F, "ReparaturContainer (80 Resourcen)", 10, 80, false, true);
                        ADD_BIG_ITEM(Land_Medevac_house_V1_F, "MedizinContainer (200 Resourcen)", 25, 200, true, false);
                    };

                    class TB_cat_Base
                    {
                        displayName = "Base";

                        ADD_BIG_ITEM(Land_HelipadSquare_F, "Heliport (10 Resourcen)", 3, 10, false, true);
                        ADD_BIG_ITEM(Land_MedicalTent_01_white_generic_open_F, "Sanizelt (100 Resourcen)", 15, 100, false, true);
                        ADD_BIG_ITEM(Land_Cargo_HQ_V3_F, "Hauptgebäude2 (200 Resourcen)", 50, 200, true, true);
                        ADD_BIG_ITEM(Land_Cargo_HQ_V1_F, "Hauptgebäude1 (200 Resourcen)", 50, 200, true, true);
                        ADD_BIG_ITEM(Land_FieldToilet_F, "Klo (10 Resourcen)", 5, 10, false, false);
                        ADD_BIG_ITEM(Land_CamoNetVar_NATO, "Tarnnetz (10 Resourcen)", 5, 10, false, true);
                        ADD_BIG_ITEM(TB_Land_TTowerSmall_1_F, "FUNK-Antenne (60 Resourcen)", 30, 60, true, true);
                        ADD_BIG_ITEM(Land_Cargo_House_V3_F, "Container (60 Resourcen)", 15, 60, true, false);
                    };

                    class GVAR(buildingsBuildPlaceablesUNS)
                    {
                        displayName = "Vietnam";
                        condition = "isClass (configfile >> 'CfgPatches' >> 'uns_main')";

                        class TB_cat_uns_bunkers
                        {
                            displayName = "Bunker";

                            ADD_BIG_ITEM(Land_Wood_Tower, "Wachturm (100 Resourcen)", 30, 100, true, true);
                            ADD_BIG_ITEM(Land_Wood_Tower2, "Wachturm (geschützt) (150 Resourcen)", 40, 150, true, true);
                            ADD_BIG_ITEM(LAND_CSJ_gunpit, "Sandsackstellung (150 Resourcen)", 30, 150, true, true);
                            ADD_BIG_ITEM(LAND_uns_weapon_pit, "Kampfstand (300 Resourcen)", 50, 300, true, true);
                            ADD_BIG_ITEM(LAND_sb_bunker_small, "Kleiner Bunker (50 Resourcen)", 15, 50, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_bunker2, "Großer Bunker (500 Resourcen)", 60, 500, true, true);
                        };

                        class TB_cat_uns_trench
                        {
                            displayName = "Sandsackgräben";

                            ADD_BIG_ITEM(LAND_t_sb_20, "Langer Graben (300 Resourcen)", 50, 300, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_20_half, "Langer Graben (Hälfte) (150 Resourcen)", 30, 150, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_5, "Kurzer Graben (100 Resourcen)", 20, 100, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_5_half, "Kurzer Graben (Hälfte) (50 Resourcen)", 15, 50, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_5_covered, "Kurzer Graben (Abgedeckt) (125 Resourcen)", 25, 125, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_45, "45 Grad Ecke (250 Resourcen)", 40, 250, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_45_half, "45 Grad Ecke (Hälfte) (250 Resourcen)", 25, 125, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_cnr, "90 Grad Ecke (250 Resourcen)", 40, 250, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_cnr_half, "90 Grad Ecke (Hälfte) (125 Resourcen)", 25, 125, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_pit2, "Endstück (Abgedeckt) (100 Resourcen)", 30, 100, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_pit3, "Endstück (Groß) (300 Resourcen)", 40, 300, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_Cross, "Kreuzung (350 Resourcen)", 50, 350, true, true);
                            ADD_BIG_ITEM(LAND_t_sb_Cross_half, "Kreuzung (Hälfte) (200 Resourcen)", 30, 200, true, true);
                        };
                    };
                };

                class GVAR(clearPlaceables)
                {
                    displayName = "Räumen";
                    EXCEPTIONS;

                    condition = QUOTE([cursorObject] call FUNC(canClearPlaceables));
                    statement = QUOTE([cursorObject] call FUNC(clearPlaceables));
                };
            };
        };
    };

    class Land_TTowerSmall_1_F;
    class TB_Land_TTowerSmall_1_F : Land_TTowerSmall_1_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "TBMod Funkantenne";
    };


    // ###################### ResourcenAbfrage && Flags ######################
    #define ADD_RESC_CHECK class ACE_Actions \
        { \
            class ACE_MainActions \
            { \
                modifierFunction = QUOTE([_this] call FUNC(modifierShowVehicleType)); \
                class truck_getType \
                { \
                    displayName = "Fahrzeugtyp abfragen"; \
                    condition = "alive _target"; \
                    EXCEPTIONS; \
                    statement = QUOTE([] call FUNC(getVehicleType)); \
                }; \
                class ResourceTruck_getLoad \
                { \
                    displayName = "Verbleibende Resourcen"; \
                    condition = QUOTE(alive _target && (_target getVariable [ARR_2(QQGVAR(resourcenCargo), -1)]) >= 0); \
                    EXCEPTIONS; \
                    statement = QUOTE(hint format ['Das Fahrzeug hat noch %1 Resourcen', (_target getVariable [ARR_2(QQGVAR(resourcenCargo), 0)]) max 0]); \
                }; \
                class truck_getFuel \
                { \
                    displayName = "Tank abfragen"; \
                    condition = "alive _target && locked _target < 2"; \
                    icon = "\z\ace\addons\refuel\ui\icon_refuel_interact.paa"; \
                    EXCEPTIONS; \
                    statement = QUOTE([_target] call FUNC(getFuel)); \
                }; \
                class ACE_Passengers \
                { \
                    displayName = "Insassen"; \
                    condition = "alive _target || (!alive _target && count ((crew _target) select {alive _x}) > 0)"; \
                    statement = ""; \
                    exceptions[] = {"isNotSwimming"}; \
                    insertChildren = "_this call ace_interaction_fnc_addPassengersActions"; \
                }; \
                class flags \
                { \
                    displayName = "Flaggen"; \
                    condition = "alive _target"; \
                    statement = "_target forceFlagTexture ''"; \
                    EXCEPTIONS; \
                    insertChildren = QUOTE(_this call EFUNC(main,insertChildrenFlaggen)); \
                }; \
            }; \
        }
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
    class EGVAR(zeus,base);
    class TB_zeus_ressourcenFahrzeug : EGVAR(zeus,base)
    {
        scopeCurator = 2;
        displayName = "Ressourcentruck setzen";
        function = QFUNC(moduleRessourcenFahrzeug);
        category = "TB_categorie_zeus_building";
    };
    class TB_zeus_kranFahrzeug : EGVAR(zeus,base)
    {
        scopeCurator = 2;
        displayName = "Krantruck setzen";
        function = QFUNC(moduleKranFahrzeug);
        category = "TB_categorie_zeus_building";
    };


    // ###################### XEH aktivieren ######################
    #define ACTIVE_XEH(CLASSE,PARENT) class CLASSE : PARENT \
        { \
            class EventHandlers \
            { \
                class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {}; \
            }; \
        }

    class Camping_base_F;
    ACTIVE_XEH(Land_MedicalTent_01_base_F,Camping_base_F);
    ACTIVE_XEH(Land_MedicalTent_01_floor_base_F,Camping_base_F);
};
