/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class SensorTemplateActiveRadar;
class SensorTemplatePassiveRadar;
class SensorTemplateVisual;
class SensorTemplateLaser;
class SensorTemplateNV;

class CfgVehicles
{
    class Heli_Transport_03_base_F;
    class B_Heli_Transport_03_F : Heli_Transport_03_base_F // Stealth CH-47
    {
        accuracy = 0.35; // 0.02
        accuracyDarkNightLightsOff = 0.0015; // 0.001
        accuracyNightLightsOff = 0.009; // 0.006
        accuracyNightLightsOn = 0.15; // 0.1
        armor = 65; // 40
        audible = 44; // 50
        camouflage = 110; // 100
        irTargetSize = 0.86; // 1.2
        LockDetectionSystem = "2 + 8 + 4"; // 8+4
        radarTargetSize = 0.41; // 1.2
    };

    class Heli_Transport_01_base_F;
    class B_Heli_Transport_01_F : Heli_Transport_01_base_F
    {
        class Components;
        class TextureSources;
    };
    class TB_MH_60_Silent_Hawk : B_Heli_Transport_01_F // UH-80
    {
        accuracy = 0.4; // 0.5
        displayName = "MH-60 Silent Hawk";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";
        armor = 45; // 40
        audible = 39; // 50
        camouflage = 78; // 100
        irTargetSize = 0.5; // 0.8
        LockDetectionSystem = "2 + 4 + 8"; // 8+4
        magazines[] = {}; // "168Rnd_CMFlare_Chaff_Magazine"
        radarTargetSize = 0.33; // 0.7
        scope = 2;
        scopeCurator = 2;
        weapons[] = {};

        class Components : Components
        {
            class TransportPylonsComponent
            {
                uiPicture = QPATHTOEF(skins,pictures\pylons\TB_Pylons_UH_80.paa);

                class pylons
                {
                    class cmDispenser1
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_1"};
                        maxweight = 800;
                        priority = 4;
                        UIposition[] = {0.20,0.1};
                    };

                    class cmDispenser2
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_2"};
                        maxweight = 800;
                        priority = 3;
                        UIposition[] = {0.46,0.1};
                    };

                    class cmDispenser3
                    {
                        attachment = "TB_mag_LWIRCM_144_45";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_3"};
                        maxweight = 800;
                        priority = 2;
                        UIposition[] = {0.20,0.15};
                    };

                    class cmDispenser4
                    {
                        attachment = "TB_mag_LWIRCM_144_45";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_4"};
                        maxweight = 800;
                        priority = 1;
                        UIposition[] = {0.46,0.15};
                    };
                };
            };
        };
        class TextureSources : TextureSources
        {
            class Black
            {
                displayName = "Schwarz";
                textures[] = {"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_CO.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_CO.paa"};
            };
            class Green {
                displayName = "Oliv";
                textures[] = {"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_BLUFOR_CO.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_BLUFOR_CO.paa"};
            };
            class Olive {
                displayName = "Oliv-Schwarz";
                textures[] = {"\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_tropic_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_tropic_CO.paa"};
            };
            class Sand {
                displayName = "Oliv-Sand";
                textures[] = {"\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_sand_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_sand_CO.paa"};
            };
        };
    };

    class Heli_Attack_01_dynamicLoadout_base_F;
    class B_Heli_Attack_01_dynamicLoadout_F : Heli_Attack_01_dynamicLoadout_base_F // Stealth RAH-66
    {
        accuracy = 1.2; // 2.5
        accuracyDarkNightLightsOff = 0.0005; // 0.001
        accuracyNightLightsOff = 0.003; // 0.006
        accuracyNightLightsOn = 0.05; // 0.1
        audible = 24; // 50
        camouflage = 63; // 100
        camShakeCoef = 0.2; // 0
        irTargetSize = 0.48; // 0.8
        LockDetectionSystem = "2 + 8 + 4"; // 8+4
        nvScanner = 1; // 0
        radarTargetSize = 0.21; // 0.7
    };

    class UAV_03_dynamicLoadout_base_F;
    class B_T_UAV_03_dynamicLoadout_F : UAV_03_dynamicLoadout_base_F // Falcon
    {
        fuelCapacity = 3500; // 100
    };

    class Plane_CAS_01_dynamicLoadout_base_F;
    class B_Plane_CAS_01_dynamicLoadout_F : Plane_CAS_01_dynamicLoadout_base_F // A-164 Wipeout
    {
        accuracyDarkNightLightsOff = 0.005; // 0.001
        accuracyNightLightsOff = 0.03; // 0.006
        accuracyNightLightsOn = 0.5; // 0.1
        armor = 115; // 80
        audible = 210; // 60
        camouflage = 170; // 100
        camShakeCoef = 0.2; // 0
        irTargetSize = 1.65; // 1
        nvScanner = 1; // 0
        radarTargetSize = 1.05; // 1
        thrustCoef[] = {1.1,1.14,1.18,1.21,1.2,1.19,1.17,1.15,0.8,0.3,0.2,0,0,0,0}; // {1.1,1.14,1.18,1.21,1.2,1.19,1.17,1.15,1.13,1.1,1.04,0.6,0.1,0,0}
    };

    class Plane_Fighter_01_Base_F;
    class B_Plane_Fighter_01_F : Plane_Fighter_01_Base_F // F/A-181
    {
        accuracy = 0.25; // 0.02
        accuracyDarkNightLightsOff = 0.003; // 0.001
        accuracyNightLightsOff = 0.018; // 0.006
        accuracyNightLightsOn = 0.3; // 0.1
        armor = 65; // 60
        audible = 190; // 60
        camShakeCoef = 0.2; // 0
        camouflage = 150; // 100
        irScanRangeMin = 650; // 2000
        irTargetSize = 1.7; // 1
        nvScanner = 1; // 0
        radarTargetSize = 0.7; // 0.8
        thrustCoef[] = {1.76,1.69,1.62,1.68,1.74,1.81,1.89,1.95,1.96,1.96,1.92,1.8,1.75,1.6,1.4,1.2}; // {1.76,1.69,1.62,1.68,1.74,1.81,1.89,1.95,1.96,1.96,1.92,1.4,0.4,0,0,0}
    };

    class I_Plane_Fighter_03_dynamicLoadout_F;
    class TB_Vehicles_L159_Albatros : I_Plane_Fighter_03_dynamicLoadout_F // L-159 Albatros
    {
        accuracyDarkNightLightsOff = 0.002; // 0.001
        accuracyNightLightsOff = 0.015; // 0.006
        accuracyNightLightsOn = 0.26; // 0.1
        armor = 50; // 55
        audible = 180; // 60
        camShakeCoef = 0.2; // 0
        irTargetSize = 1.4; // 0.8
        nvScanner = 1; // 0
        radarTargetSize = 1.2; // 0.8
        thrustCoef[] = {1.6,1.75,2,2.1,2.2,2.1,1.95,1.6,1.1,0,0,0,0,0,0,0,0}; // {1.42,1.38,1.34,1.3,1.25,1.2,1.19,1.18,1.17,1.17,1.16,1.16,0.1,0,0,0,0}
    };

    class UAV_01_base_F;
    class B_UAV_01_F : UAV_01_base_F // AR-2 Darter
    {
        accuracyDarkNightLightsOff = 0.00001; // 0.001
        accuracyNightLightsOff = 0.00006; // 0.006
        accuracyNightLightsOn = 0.001; // 0.1
        camouflage = 0.25; // 0.5
        fuelCapacity = 150; // 100
        irTargetSize = 0.01; // 1
        nvScanner = 1; // 0
        radarTargetSize = 0.05; // 0.1
        visualTargetSize = 0.05; // 0.1
    };

    class UAV_06_base_F;
    class B_UAV_06_F : UAV_06_base_F // AL-6 Pelican
    {
        accuracyDarkNightLightsOff = 0.0001; // 0.001
        accuracyNightLightsOff = 0.0006; // 0.006
        accuracyNightLightsOn = 0.01; // 0.1
        camouflage = 0.4; // 0.5
        fuelCapacity = 200; // 100
        irTargetSize = 0.08; // 1
        maximumLoad = 150; // 120
        radarTargetSize = 0.08; // 0.1
        visualTargetSize = 0.08; // 0.1
    };

    class Quadbike_01_base_F;
    class B_Quadbike_01_F : Quadbike_01_base_F // Quad
    {
        accuracy = 1.25; // 0.25
        accuracyDarkNightLightsOff = 0.0005; // 0.001
        accuracyNightLightsOff = 0.003; // 0.006
        accuracyNightLightsOn = 0.05; // 0.1
        audible = 0.35; // 5
        camouflage = 1.15; // 2
        irTargetSize = 0.1; // n.a.
        visualTargetSize = 0.15; // n.a.
    };

    class MRAP_03_base_F;
    class I_MRAP_03_F : MRAP_03_base_F // Fennek
    {
        accuracy = 1.1; // 0.25
        armor = 190; // 200
        audible = 2.25; // 5
        camouflage = 1.4; // 2
        irTargetSize = 0.3; // n.a.
        maxOmega = 420; // 320
        visualTargetSize = 0.3; // n.a.
    };

    class Heli_light_03_base_F;
    class Heli_light_03_unarmed_base_F : Heli_light_03_base_F // AW-159 Hellcat
    {
        accuracy = 0.42; // 1.5
        accuracyDarkNightLightsOff = 0.002; // 0.001
        accuracyNightLightsOff = 0.012; // 0.006
        accuracyNightLightsOn = 0.2; // 0.1
        armor = 50; // 40
        audible = 62; // 50
        camouflage = 84; // 100
        irTargetSize = 0.8; // 1
        LockDetectionSystem = "2 + 8 + 4"; // 0
        nvScanner = 1; // 0
        radarTargetSize = 1.2; // 1
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F : Heli_Transport_02_base_F // CH-49 Mohawk
    {
        armor = 55; // 40
        audible = 64; // 50
        camouflage = 95; // 100
        irTargetSize = 1; // 1.2
        radarTargetSize = 1; // 1.2
    };

    class UAV_02_dynamicLoadout_base_F;
    class B_UAV_02_dynamicLoadout_F : UAV_02_dynamicLoadout_base_F
    {
        class Components;
        class TextureSources;
    };
    class TB_MQ_9L_Sky_Guardian : B_UAV_02_dynamicLoadout_F // MQ-9L Sky Guardian
    {
        camouflage = 70;
        displayName = "MQ-9L Sky Guardian";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";
        fuelCapacity = 20000;
        hiddenSelectionsTextures[] = {"A3\Drones_F\Air_F_Gamma\UAV_02\Data\UAV_02_INDP_CO.paa"};
        scope = 2;
        scopeCurator = 2;

        class Components : Components
        {
            class SensorsManagerComponent
            {
                class Components
                {
                    class ActiveRadarSensorComponent: SensorTemplateActiveRadar
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
                        angleRangeHorizontal = 300;
                        angleRangeVertical = 67.5;
                        animDirection = "";
                        color[] = {0,1,1,1};
                        componentType = "ActiveRadarSensorComponent";
                        groundNoiseDistanceCoef = 0.2;
                        class GroundTarget
                        {
                            maxRange = 8000;
                            minRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        maxGroundNoiseDistance = 200;
                        maxSpeedThreshold = 27.7778;
                        maxTrackableATL = 1e+10;
                        maxTrackableSpeed = 1e+10;
                        minSpeedThreshold = 20.8333;
                        minTrackableATL = -1e+10;
                        minTrackableSpeed = -1e+10;
                        typeRecognitionDistance = 8000;
                    };
                    class IRSensorComponent: SensorTemplateIR
                    {
                        aimDown = 22.5;
                        class AirTarget
                        {
                            maxRange = 6000;
                            minRange = 6000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = 1;
                        };
                        allowsMarking = 1;
                        angleRangeHorizontal = 45;
                        angleRangeVertical = 67.5;
                        animDirection = "mainGun";
                        color[] = {1,0,0,1};
                        componentType = "IRSensorComponent";
                        groundNoiseDistanceCoef = -1;
                        class GroundTarget
                        {
                            maxRange = 6000;
                            minRange = 6000;
                            objectDistanceLimitCoef = 1;
                            viewDistanceLimitCoef = 1;
                        };
                        maxFogSeeThrough = 0.995;
                        maxGroundNoiseDistance = -1;
                        maxSpeedThreshold = 0;
                        maxTrackableATL = 1e+10;
                        maxTrackableSpeed = 50;
                        minSpeedThreshold = 0;
                        minTrackableATL = -1e+10;
                        minTrackableSpeed = -1e+10;
                        typeRecognitionDistance = 2000;
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
                        angleRangeHorizontal = 360;
                        angleRangeVertical = 67.5;
                        animDirection = "mainGun";
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
                    class NVSensorComponent: SensorTemplateNV
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
                        angleRangeHorizontal = 360;
                        angleRangeVertical = 67.5;
                        animDirection = "mainGun";
                        color[] = {1,1,1,0};
                        componentType = "NVSensorComponent";
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
                    class PassiveRadarSensorComponent: SensorTemplatePassiveRadar
                    {
                        aimDown = 0;
                        class AirTarget
                        {
                            maxRange = 8000;
                            minRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        allowsMarking = 0;
                        angleRangeHorizontal = 360;
                        angleRangeVertical = 360;
                        animDirection = "";
                        color[] = {0.5,1,0.5,0.5};
                        componentType = "PassiveRadarSensorComponent";
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
                        typeRecognitionDistance = 12000;
                    };
                    class VisualSensorComponent: SensorTemplateVisual
                    {
                        aimDown = 22.5;
                        class AirTarget
                        {
                            maxRange = 6000;
                            minRange = 6000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = 1;
                        };
                        allowsMarking = 1;
                        angleRangeHorizontal = 45;
                        angleRangeVertical = 67.5;
                        animDirection = "mainGun";
                        color[] = {1,1,0.5,0.8};
                        componentType = "VisualSensorComponent";
                        groundNoiseDistanceCoef = -1;
                        class GroundTarget
                        {
                            maxRange = 6000;
                            minRange = 6000;
                            objectDistanceLimitCoef = 1;
                            viewDistanceLimitCoef = 1;
                        };
                        maxFogSeeThrough = 0.94;
                        maxGroundNoiseDistance = -1;
                        maxSpeedThreshold = 0;
                        maxTrackableATL = 1e+10;
                        maxTrackableSpeed = 50;
                        minSpeedThreshold = 0;
                        minTrackableATL = -1e+10;
                        minTrackableSpeed = -1e+10;
                        nightRangeCoef = 0;
                        typeRecognitionDistance = 2000;
                    };
                };
            };
            class TransportPylonsComponent
            {
                class presets
                {
                    class Hellfire_K_N
                    {
                        attachment[] = {"PylonRack_4Rnd_ACE_Hellfire_AGM114K","PylonRack_4Rnd_ACE_Hellfire_AGM114N"};
                        displayName = "Hellfire K - N";
                    };
                    class Hellfire_L
                    {
                        attachment[] = {"PylonRack_4Rnd_ACE_Hellfire_AGM114L","PylonRack_4Rnd_ACE_Hellfire_AGM114L"};
                        displayName = "Hellfire L";
                    };
                    class Hellfire_GBU
                    {
                        attachment[] = {"PylonRack_4Rnd_ACE_Hellfire_AGM114L","PylonMissile_1Rnd_Bomb_04_F"};
                        displayName = "Hellfire L - GBU-12";
                    };
                    class GBU
                    {
                        attachment[] = {"PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F"};
                        displayName = "GBU-12";
                    };
                    class Air
                    {
                        attachment[] = {"rhs_mag_aim9m_2","rhs_mag_aim9m_2"};
                        displayName = "Air to Air";
                    };
                };
                class pylons
                {
                    class pylons1
                    {
                        attachment = "PylonRack_4Rnd_ACE_Hellfire_AGM114L";
                        hardpoints[] = {"TB_Pylon_MQ_9_Sky_Guardian"};
                        maxweight = 500;
                        priority = 2;
                        turret[] = {0};
                        UIposition[] = {0.33,0.4};
                    };
                    class pylons2: pylons1
                    {
                        attachment = "PylonRack_4Rnd_ACE_Hellfire_AGM114L";
                        hardpoints[] = {"TB_Pylon_MQ_9_Sky_Guardian"};
                        maxweight = 500;
                        mirroredMissilePos = 1;
                        priority = 1;
                        turret[] = {0};
                        UIposition[] = {0.33,0.15};
                    };
                };
                UIPicture = "\a3\Drones_F\Air_F_Gamma\UAV_02\data\ui\UAV_02_base_EDEN_F.paa";
            };
        };
        class TextureSources : TextureSources
        {
            class Grau
            {
                displayName = "Kachel";
                textures[] = {"A3\Drones_F\Air_F_Gamma\UAV_02\Data\UAV_02_INDP_CO.paa"};
            };
            class Hex
            {
                displayName = "Hex";
                textures[] = {"a3\Drones_F\Air_F_Gamma\UAV_02\Data\UAV_02_OPFOR_CO.paa"};
            };
        };
    };

    class UAV_05_Base_F;
    class B_UAV_05_F : UAV_05_Base_F // UCAV Sentinel
    {
        accuracy = 0.2; // 0.1
        fuelCapacity = 5000; // 1000
        nvScanner = 1; // 0
    };

    class Rubber_duck_base_F;
    class B_Boat_Transport_01_F : Rubber_duck_base_F // Schlauchboot
    {
        accuracy = 1.25; // 0.5
        ace_cargo_space = 1; // 0
        armor = 19; // 10
        audible = 2.8; // 6
        camouflage = 1.15; // 2
    };

    class Boat_Armed_01_minigun_base_F;
    class B_Boat_Armed_01_minigun_F : Boat_Armed_01_minigun_base_F // Schnellboot
    {
        accuracy = 0.9; // 1.5
        ace_cargo_space = 1; // 0
        armor = 250; // 400
        audible = 3.2; // 6
        camouflage = 1.45; // 2
        magazines[] = {"SmokeLauncherMag_boat","SmokeLauncherMag_boat","SmokeLauncherMag_boat"}; // "SmokeLauncherMag_boat"
    };

    class SDV_01_base_F;
    class B_SDV_01_F : SDV_01_base_F // SDV (Seal Delivery Vehicle)
    {
        ace_cargo_space = 1; // 0
        audible = 0.1; // 6
        camouflage = 1; // 2
    };

    class Tank;
    class Tank_F : Tank
    {
        class AnimationSources;
    };
    class LT_01_base_F : Tank_F // Wiesel 2 Baseclass
    {
        class AnimationSources : AnimationSources
        {
            class showSLATHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Slat-Käfig anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
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
            class showCamonetHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showTools
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Werkzeug anzeigen";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showBags
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Rucksäcke anzeigen (Rumpf)";
                forceAnimate[] = {"showBags2",1};
                forceAnimate2[] = {"showBags2",0};
                forceAnimatePhase = 1;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showBags2
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
        };
    };

    class UGV_02_Demining_Base_F;
    class B_UGV_02_Demining_F : UGV_02_Demining_Base_F // Demining UGV Pelter
    {
        armor = 50; // 30
        fuelCapacity = 4; // 2
    };

    // ###################### ACE Defuse ######################
    // class Items_base_F;
    // class ACE_DefuseObject: Items_base_F
    // {
        // class EventHandlers
        // {
            // class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        // };

        // author = "ACE-Team";
        // _generalMacro = "ACE_DefuseObject";
        // displayName = "ACE Defuse Helper";
        // model = "\A3\Weapons_f\dummyweapon.p3d";
        // scope = 1;

        // class ACE_Actions
        // {
            // class ACE_Defuse
            // {
                // distance = 2;
                // displayName = "Entschärfen";
                // condition = "";
                // statement = ";";
                // exceptions[] = {"isNotSwimming"};
                // icon = "";
            // };
        // };
    // };
    // class ACE_DefuseObject_Large: ACE_DefuseObject
    // {
        // class ACE_Actions: ACE_Actions
        // {
            // class ACE_Defuse: ACE_Defuse
            // {
                // distance = 3;
            // };
        // };
    // };


    // ###################### TFAR RADIOS leichter ######################
    #define ADD_OVERRIDE(NAME,PARENT,LOAD,MASSE) class NAME : PARENT \
        { \
            maximumLoad = LOAD; \
            mass = MASSE; \
        }
    class TFAR_Bag_Base;
    ADD_OVERRIDE(TFAR_rt1523g,TFAR_Bag_Base,129,25); // 50, 80 - 5,16 - Russen kleines LR
    ADD_OVERRIDE(tf_rt1523g,TFAR_rt1523g,129,25);
    ADD_OVERRIDE(OPXT_aor1_117,tf_rt1523g,129,25);

    ADD_OVERRIDE(TFAR_rt1523g_big,TFAR_rt1523g,160,30); // 160, 160 - 5,3 - USA großes LR
    ADD_OVERRIDE(tf_rt1523g_big,TFAR_rt1523g_big,160,30);
    ADD_OVERRIDE(OPXT_aor1_1523,tf_rt1523g_big,160,30);

    ADD_OVERRIDE(TFAR_rt1523g_sage,TFAR_rt1523g,160,30); // 100, 120 - 5,3
    ADD_OVERRIDE(tf_rt1523g_sage,TFAR_rt1523g_sage,160,30);

    // OPXT_aor1_210: tf_anarc210 - maximumLoad = 280; mass = 50;
    // OPXT_rf7800m: tf_anarc210 - maximumLoad = 300; mass = 60;


    // ###################### ACE-Minedetector ######################
    // TODO: CUP Abhängigkeit
    /*#define SET_DETECTABLE(PARENT,CLASSES) class CLASSES : PARENT {ace_minedetector_detectable = 1;}

    class Small_items_NoInteractive;
    class Items_base_F;
    class House_Small_F;
    class House;
    class Strategic;

    //SET_DETECTABLE(Small_items_NoInteractive, Explosive);
    SET_DETECTABLE(Items_base_F, Land_MetalBarrel_F);
    SET_DETECTABLE(House_Small_F, Land_MetalBarrel_empty_F);
    SET_DETECTABLE(House, Land_popelnice);
    SET_DETECTABLE(House, Land_Kontejner);
    SET_DETECTABLE(Strategic, Garbage_can);
    SET_DETECTABLE(Strategic, Garbage_container);*/


    // ###################### Rucksäcke ######################
    class Bag_Base;
    class B_AssaultPack_Base : Bag_Base
    {
        maximumLoad = 106;
        mass = 13;
    };


    // ###################### MISC ######################
    // UGV Stomper
    class Car_F;
    class UGV_01_base_F: Car_F
    {
        class Turrets;
    };

    class UGV_01_rcws_base_F: UGV_01_base_F
    {
        class Turrets: Turrets
        {
            class MainTurret;
        };
    };

    class B_UGV_01_rcws_F: UGV_01_rcws_base_F {};
    class TB_UGV_01_rcws_F: B_UGV_01_rcws_F
    {
        displayName = "TB UGV Stomper RCWS (Rauch)"; // UGV Stomper RCWS
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";
        scope = 2;
        scopeCurator = 2;

        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                magazines[] = {"200Rnd_127x99_mag_Tracer_Red","TB_Smoke_Grenades","TB_Smoke_Grenades"};
            };
        };
    };
};
