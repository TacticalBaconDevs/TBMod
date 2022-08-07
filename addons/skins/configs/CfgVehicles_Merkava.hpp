class TB_Vehicles_Wueste_Merkava : B_MBT_01_TUSK_F // Merkava Mk4
    {
        displayName = "Merkava Mk4";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_2.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Merkava.jpg);

        class TextureSources : TextureSources
        {
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_1.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_2.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
                };
            };
            class Olive
            {
                displayName = "Oliv";
                textures[] =
                {
                    "A3\Armor_F_Exp\MBT_01\data\MBT_01_body_olive_CO.paa",
                    "A3\Armor_F_Exp\MBT_01\data\MBT_01_tow_olive_CO.paa",
                    "A3\Armor_F_Exp\MBT_01\data\mbt_addons_olive_CO.paa",
                    "a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
                };
            };
            class Sand
            {
                displayName = "Sand";
                textures[] =
                {
                    "A3\armor_f_gamma\MBT_01\Data\MBT_01_body_CO.paa",
                    "A3\armor_f_gamma\MBT_01\Data\MBT_01_tow_CO.paa",
                    "a3\armor_f_epc\mbt_01\data\mbt_addons_co.paa",
                    "a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
                };
            };
        };
        class AnimationSources : AnimationSources
        {
            class showBags
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Rucksäcke anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showCamonetHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                forceAnimate[] = {"showCamonetPlates1",1,"showCamonetPlates2",1};
                forceAnimate2[] = {"showCamonetPlates1",0,"showCamonetPlates2",0};
                forceAnimatePhase = 1;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showCamonetCannon
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetPlates1
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetPlates2
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetTurret
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                forceAnimate[] = {"showCamonetCannon",1};
                forceAnimate2[] = {"showCamonetCannon",0};
                forceAnimatePhase = 1;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
        };
        class Components : Components
        {
            class SensorsManagerComponent
            {
                class Components
                {
                    class ManSensorComponent : SensorTemplateMan
                    {
                        aimDown = 22.5; // 0
                        angleRangeHorizontal = 360; // 60
                        angleRangeVertical = 67.5; // 60
                        color[] = {1,0,0,1}; // {1,0.5,1,1};
                        maxTrackableSpeed = 400; // 1e+010;
                        typeRecognitionDistance = 40; // 0

                        #ifdef GroundTarget
                            class GroundTarget : GroundTarget
                        #else
                            class GroundTarget // Problem mit StarWars, deswegen ohne Parent
                        #endif
                        {
                            maxRange = 40; // 500
                            minRange = 40; // 500
                        };
                        delete AirTarget;
                    };
                    class DataLinkSensorComponent: SensorTemplateDataLink
                    {
                        aimDown = 0;
                        class AirTarget
                        {
                            maxRange = 8000;
                            minRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        allowsMarking = 1;
                        angleRangeHorizontal = 360;
                        angleRangeVertical = 360;
                        animDirection = "";
                        color[] = {1,1,1,0};
                        componentType = "DataLinkSensorComponent";
                        groundNoiseDistanceCoef = -1;
                        class GroundTarget
                        {
                            maxRange = 8000;
                            minRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        maxGroundNoiseDistance = -1;
                        maxSpeedThreshold = 0;
                        maxTrackableATL = 1e+10;
                        maxTrackableSpeed = 1e+10;
                        minSpeedThreshold = 0;
                        minTrackableATL = -1e+10;
                        minTrackableSpeed = -1e+10;
                        typeRecognitionDistance = 0;
                    };
                    class LaserSensorComponent: SensorTemplateLaser
                    {
                        aimDown = 22.5;
                        class AirTarget
                        {
                            maxRange = 8000;
                            minRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        allowsMarking = 1;
                        angleRangeHorizontal = 45;
                        angleRangeVertical = 67.5;
                        animDirection = "mainTurret";
                        color[] = {1,1,1,0};
                        componentType = "LaserSensorComponent";
                        groundNoiseDistanceCoef = -1;
                        class GroundTarget
                        {
                            maxRange = 8000;
                            minRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        maxGroundNoiseDistance = -1;
                        maxSpeedThreshold = 0;
                        maxTrackableATL = 1e+10;
                        maxTrackableSpeed = 1e+10;
                        minSpeedThreshold = 0;
                        minTrackableATL = -1e+10;
                        minTrackableSpeed = -1e+10;
                        typeRecognitionDistance = 0;
                    };
                };
            };
            class VehicleSystemsDisplayManagerComponentLeft : VehicleSystemsTemplateLeftDriver
            {
                class Components : Components
                {
                    class SensorDisplay
                    {
                        componentType = "SensorsDisplayComponent";
                        range[] = {40};
                        resource = "RscCustomInfoSensors";
                    };
                    class MinimapDisplay : MinimapDisplay
                    {
                        resource = "RscCustomInfoMiniMap";
                    };
                };
            };
            class VehicleSystemsDisplayManagerComponentRight : VehicleSystemsTemplateRightDriver
            {
                class Components : Components
                {
                    class SensorDisplay
                    {
                        componentType = "SensorsDisplayComponent";
                        range[] = {40};
                        resource = "RscCustomInfoSensors";
                    };
                    class MinimapDisplay : MinimapDisplay
                    {
                        resource = "RscCustomInfoMiniMap";
                    };
                };
            };
        };
        class Turrets : Turrets
        {
            class MainTurret : MainTurret
            {
                weapons[] = {"cannon_120mm","ACE_LMG_coax_MAG58_mem3"};

                discreteDistance[] =
                {
                    100,200,300,400,500,600,700,800,900,1000,
                    1100,1200,1300,1400,1500,1600,1700,1800,
                    1900,2000,2100,2200,2300,2400,2500,2600,
                    2700,2800,2900,3000,3100,3200,3300,3400,
                    3500,3600,3700,3800,3900,4000
                };
                magazines[] =
                {
                    "24Rnd_120mm_APFSDS_shells_Tracer_Red",
                    "12Rnd_120mm_HE_shells_Tracer_Red",
                    "8Rnd_120mm_HEAT_MP_T_Red",
                    "4Rnd_120mm_LG_cannon_missiles",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    "200Rnd_762x51_Belt_Red",
                    
                };

                class OpticsIn : Optics_Gunner_MBT_01
                {
                    class Wide : Wide
                    {
                        thermalMode[] = {0,1};
                    };
                    class Medium : Medium
                    {
                        thermalMode[] = {0,1};
                    };
                    class Narrow : Narrow
                    {
                        thermalMode[] = {0,1};
                    };
                };
                class Components : Components
                {
                    class VehicleSystemsDisplayManagerComponentLeft: VehicleSystemsTemplateLeftGunner
					{
						class Components: components
						{
							class VehicleMissileDisplay
							{
								componentType = "TransportFeedDisplayComponent";
								source = "Missile";
							};
							class SensorDisplay
							{
								componentType = "SensorsDisplayComponent";
								range[] = {2000,4000,8000};
								resource = "RscCustomInfoSensors";
							};
						};
					};
					class VehicleSystemsDisplayManagerComponentRight: VehicleSystemsTemplateRightGunner
					{
						defaultDisplay = "SensorDisplay";
						class Components: components
						{
							class VehicleMissileDisplay
							{
								componentType = "TransportFeedDisplayComponent";
								source = "Missile";
							};
							class SensorDisplay
							{
								componentType = "SensorsDisplayComponent";
								range[] = {2000,4000,8000};
								resource = "RscCustomInfoSensors";
							};
						};
					};
                };
                class Turrets : Turrets
                {
                    class CommanderOptics : CommanderOptics
                    {
                        magazines[] =
                        {
                            "200Rnd_127x99_mag_Tracer_Red","200Rnd_127x99_mag_Tracer_Red",
                            "200Rnd_127x99_mag_Tracer_Red","200Rnd_127x99_mag_Tracer_Red",
                            "SmokeLauncherMag","Laserbatteries"
                        };
                        weapons[] = {"SmokeLauncher","Laserdesignator_vehicle","HMG_127_MBT"};
                        class OpticsIn: Optics_Commander_01
                            {
                            class Wide: Wide
                            {
                                thermalMode[] = {0,1};
                            };
                            class Medium: Medium
                            {
                                thermalMode[] = {0,1};
                            };
                            class Narrow: Narrow
                            {
                                thermalMode[] = {0,1};
                            };
                        };
                        class Components
                        {
                            class VehicleSystemsDisplayManagerComponentLeft : VehicleSystemsTemplateLeftCommander
                            {
                                class Components : Components
                                {
                                    class SensorDisplay
                                    {
                                        componentType = "SensorsDisplayComponent";
                                        range[] = {2000,4000,8000};
                                        resource = "RscCustomInfoSensors";
                                    };
                                    class MinimapDisplay : MinimapDisplay
                                    {
                                        resource = "RscCustomInfoMiniMap";
                                    };
                                };
                            };
                            class VehicleSystemsDisplayManagerComponentRight : VehicleSystemsTemplateRightCommander
                            {
                                class Components : Components
                                {
                                    class SensorDisplay
                                    {
                                        componentType = "SensorsDisplayComponent";
                                        range[] = {2000,4000,8000};
                                        resource = "RscCustomInfoSensors";
                                    };
                                    class MinimapDisplay : MinimapDisplay
                                    {
                                        resource = "RscCustomInfoMiniMap";
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };

        // ### ArmaInventar selber gemacht, deswegen Löschung standardmäßig umgehen
        EGVAR(main,disableCargoCleanup) = 1;

        class TransportItems
        {
            MACRO_ADDITEM(ACE_quikclot, 20);
            MACRO_ADDITEM(ACE_salineIV, 4);
            MACRO_ADDITEM(ToolKit, 1);
            MACRO_ADDITEM(ACE_EntrenchingTool, 1);
            MACRO_ADDITEM(ACE_wirecutter, 1);
            MACRO_ADDITEM(ACE_UAVBattery, 1);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m62_tracer, 8);
            MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote, 4);
            MACRO_ADDMAGAZINE(TB_mag_100Rnd_338_LS_Tracer, 8);
            MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red, 30);
            MACRO_ADDMAGAZINE(rhs_mag_mk3a2, 8);
            MACRO_ADDMAGAZINE(SmokeShell, 8);
            MACRO_ADDMAGAZINE(ACE_HuntIR_M203, 2);
            MACRO_ADDMAGAZINE(AMP_Breaching_Charge_Mag, 4);
            MACRO_ADDMAGAZINE(Laserbatteries, 1);
            MACRO_ADDMAGAZINE(rhs_fim92_mag, 2);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(TB_rhs_weap_M136_CS, 2);
            MACRO_ADDWEAPON(rhs_weap_fim92, 1);
        };
    };

    class TB_Vehicles_Wald_Merkava : TB_Vehicles_Wueste_Merkava // Merkava Mk4
    {
        displayName = "Merkava Mk4";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            "A3\Armor_F_Exp\MBT_01\data\MBT_01_body_olive_CO.paa",
            "A3\Armor_F_Exp\MBT_01\data\MBT_01_tow_olive_CO.paa",
            "A3\Armor_F_Exp\MBT_01\data\mbt_addons_olive_CO.paa",
            "a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Merkava_2.jpg);
    };