/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

class TB_Vehicles_AW159_Wildcat : I_Heli_light_03_dynamicLoadout_F // AW159 Wildcat
{
    addCategoryBLU(Fluggeraete);
    armor = 50; // 40
    author = "TBMod";
    backRotorForceCoef = 0.75; // 1
    backRotorSpeed = 4.5; // 3
    camouflage = 84; // 100
    displayName = "AW159 Wildcat";
    editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_BW_Hellcat_2.jpg);
    hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_AW159_Wildcat.paa)};
    irTargetSize = 0.8; // 1
    LockDetectionSystem = "2 + 4 + 8";
    magazines[] = {"TB_mag_6000Rnd_762x51_Red_Tracer"}; // +"168Rnd_CMFlare_Chaff_Magazine"
    MainRotorSpeed = 0.9; // -0.5
    maxFordingDepth = 0.9; // 0.7
    normalSpeedForwardCoef = 0.95; // 0.85
    nvScanner = 1; // 0
    startDuration = 30; // 20
    weapons[] = {"M134_minigun","CMFlareLauncher"};
    class Components : Components
    {
        class TransportPylonsComponent
        {
            uiPicture = "\A3\Air_F_EPB\Heli_Light_03\data\UI\Heli_Light_03_3DEN_CA.paa";
            class pylons
            {
                class PylonLeft1
                {
                    attachment = "";
                    hardpoints[] = {"RHS_HP_HELLFIRE_RACK","RHS_HP_FFAR_USMC","B_ASRRAM_EJECTOR","UNI_SCALPEL"}; // "DAR","DAGR","B_SHIEKER","20MM_TWIN_CANNON"
                    priority = 5;
                    UIposition[] = {0.07,0.4};
                };
                class PylonRight1: PylonLeft1
                {
                    attachment = "";
                    hardpoints[] = {"RHS_HP_HELLFIRE_RACK","RHS_HP_FFAR_USMC","B_ASRRAM_EJECTOR","UNI_SCALPEL"}; // "DAR","DAGR","B_SHIEKER","20MM_TWIN_CANNON"
                    mirroredMissilePos = 1;
                    UIposition[] = {0.64,0.4};
                };
                class cmDispenser
                {
                    attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                    hardpoints[] = {"TB_cm_dispenser_AW159_1"};
                    maxweight = 800;
                    priority = 1;
                    UIposition[] = {0.21,0.1};
                };
                class cmDispenser2 : cmDispenser
                {
                    attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                    hardpoints[] = {"TB_cm_dispenser_AW159_2"};
                    maxweight = 800;
                    priority = 2;
                    UIposition[] = {0.5,0.1};
                };
            };
        };
            class SensorsManagerComponent
        {
            class Components
            {
                class ManSensorComponent : SensorTemplateMan
                {
                    aimDown = 0;
                    angleRangeHorizontal = 30;
                    angleRangeVertical = 180;
                    animDirection = "obsTurret";
                    color[] = {1,0,0,1};
                    maxTrackableSpeed = 400;
                    typeRecognitionDistance = 500;
                    class GroundTarget : GroundTarget
                    {
                        maxRange = 500;
                        minRange = 500;
                    };
                    delete AirTarget;
                };
                class NVSensorComponent : SensorTemplateNV
                {
                    aimDown = 0;
                    allowsMarking = 1;
                    angleRangeHorizontal = 30;
                    angleRangeVertical = 180;
                    animDirection = "obsTurret";
                    color[] = {1,1,1,0};
                    componentType = "NVSensorComponent";
                    groundNoiseDistanceCoef = -1;
                    maxFogSeeThrough = 0.995;
                    maxGroundNoiseDistance = -1;
                    maxSpeedThreshold = 0;
                    maxTrackableATL = 1e+10;
                    maxTrackableSpeed = 400;
                    minSpeedThreshold = 0;
                    minTrackableATL = -1e+10;
                    minTrackableSpeed = -1e+10;
                    typeRecognitionDistance = 2000;
                    class AirTarget
                    {
                        maxRange = 8000;
                        minRange = 8000;
                        objectDistanceLimitCoef = -1;
                        viewDistanceLimitCoef = 1;
                    };
                    class GroundTarget
                    {
                        maxRange = 8000;
                        minRange = 8000;
                        objectDistanceLimitCoef = 1;
                        viewDistanceLimitCoef = 1;
                    };
                };
                class IRSensorComponent : SensorTemplateIR
                {
                    aimDown = 0;
                    allowsMarking = 1;
                    angleRangeHorizontal = 30;
                    angleRangeVertical = 180;
                    animDirection = "obsTurret";
                    color[] = {1,0,0,1};
                    componentType = "IRSensorComponent";
                    groundNoiseDistanceCoef = -1;
                    maxFogSeeThrough = 0.995;
                    maxGroundNoiseDistance = -1;
                    maxSpeedThreshold = 0;
                    maxTrackableATL = 1e+10;
                    maxTrackableSpeed = 400;
                    minSpeedThreshold = 0;
                    minTrackableATL = -1e+10;
                    minTrackableSpeed = -1e+10;
                    typeRecognitionDistance = 2000;
                    class AirTarget
                    {
                        maxRange = 8000;
                        minRange = 8000;
                        objectDistanceLimitCoef = -1;
                        viewDistanceLimitCoef = 1;
                    };
                    class GroundTarget
                    {
                        maxRange = 8000;
                        minRange = 8000;
                        objectDistanceLimitCoef = 1;
                        viewDistanceLimitCoef = 1;
                    };
                };
                class DataLinkSensorComponent: SensorTemplateDataLink
                {
                    aimDown = 0;
                    class AirTarget
                    {
                        maxRange = 16000;
                        minRange = 16000;
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
                        maxRange = 16000;
                        minRange = 16000;
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
                    aimDown = 0;
                    class AirTarget
                    {
                        maxRange = 8000;
                        minRange = 8000;
                        objectDistanceLimitCoef = -1;
                        viewDistanceLimitCoef = -1;
                    };
                    allowsMarking = 1;
                    angleRangeHorizontal = 30;
                    angleRangeVertical = 180;
                    animDirection = "obsTurret";
                    color[] = {1,0,0,1};
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
                class ActiveRadarSensorComponent: SensorTemplateActiveRadar
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
                        angleRangeHorizontal = 30;
                        angleRangeVertical = 180;
                        animDirection = "obsTurret";
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
                class PassiveRadarSensorComponent: SensorTemplatePassiveRadar
                {
                    aimDown = 0;
                    class AirTarget
                    {
                        maxRange = 16000;
                        minRange = 16000;
                        objectDistanceLimitCoef = -1;
                        viewDistanceLimitCoef = -1;
                    };
                    allowsMarking = 0;
                    angleRangeHorizontal = 360;
                    angleRangeVertical = 360;
                    animDirection = "mainTurret";
                    color[] = {0.5,1,0.5,0.75};
                    componentType = "PassiveRadarSensorComponent";
                    groundNoiseDistanceCoef = -1;
                    class GroundTarget
                    {
                        maxRange = 16000;
                        minRange = 16000;
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
            };
        };
        class VehicleSystemsDisplayManagerComponentLeft : DefaultVehicleSystemsDisplayManagerLeft
        {
            class Components
            {
                class EmptyDisplay
                {
                    componentType = "EmptyDisplayComponent";
                };
                class MinimapDisplay
                {
                    componentType = "MinimapDisplayComponent";
                    resource = "RscCustomInfoMiniMap";
                };
                class SensorDisplay
                {
                    componentType = "SensorsDisplayComponent";
                    range[] = {16000,8000,4000,2000};
                    resource = "RscCustomInfoSensors";
                };
                class SlingLoadDisplay
                {
                    componentType = "SlingLoadDisplayComponent";
                    resource = "RscCustomInfoSlingLoad";
                };
                class VehiclePrimaryGunnerDisplay
                {
                    componentType = "TransportFeedDisplayComponent";
                    source = "PrimaryGunner";
                };
                class UAVDisplay
                {
                    componentType = "UAVFeedDisplayComponent";
                };
                class CrewDisplay {
                    componentType = "CrewDisplayComponent";
                    resource = "RscCustomInfoCrew";
                };
            };
        };
        class VehicleSystemsTemplateLeftPilot : DefaultVehicleSystemsDisplayManagerLeft
        {
            class Components
            {
                class EmptyDisplay
                {
                    componentType = "EmptyDisplayComponent";
                };
                class MinimapDisplay
                {
                    componentType = "MinimapDisplayComponent";
                    resource = "RscCustomInfoMiniMap";
                };
                class SensorDisplay
                {
                    componentType = "SensorsDisplayComponent";
                    range[] = {16000,8000,4000,2000};
                    resource = "RscCustomInfoSensors";
                };
                class SlingLoadDisplay
                {
                    componentType = "SlingLoadDisplayComponent";
                    resource = "RscCustomInfoSlingLoad";
                };
                class VehiclePrimaryGunnerDisplay
                {
                    componentType = "TransportFeedDisplayComponent";
                    source = "PrimaryGunner";
                };
                class UAVDisplay
                {
                    componentType = "UAVFeedDisplayComponent";
                };
                class CrewDisplay {
                    componentType = "CrewDisplayComponent";
                    resource = "RscCustomInfoCrew";
                };
            };
        };
        class VehicleSystemsDisplayManagerComponentRight : DefaultVehicleSystemsDisplayManagerRight
        {
            class Components
            {
                class EmptyDisplay
                {
                    componentType = "EmptyDisplayComponent";
                };
                class MinimapDisplay
                {
                    componentType = "MinimapDisplayComponent";
                    resource = "RscCustomInfoMiniMap";
                };
                class SensorDisplay
                {
                    componentType = "SensorsDisplayComponent";
                    range[] = {16000,8000,4000,2000};
                    resource = "RscCustomInfoSensors";
                };
                class SlingLoadDisplay
                {
                    componentType = "SlingLoadDisplayComponent";
                    resource = "RscCustomInfoSlingLoad";
                };
                class VehiclePrimaryGunnerDisplay
                {
                    componentType = "TransportFeedDisplayComponent";
                    source = "PrimaryGunner";
                };
                class UAVDisplay
                {
                    componentType = "UAVFeedDisplayComponent";
                };
                class CrewDisplay {
                    componentType = "CrewDisplayComponent";
                    resource = "RscCustomInfoCrew";
                };
            };
        };
        class VehicleSystemsTemplateRightPilot : DefaultVehicleSystemsDisplayManagerRight
        {
            class Components
            {
                class EmptyDisplay
                {
                    componentType = "EmptyDisplayComponent";
                };
                class MinimapDisplay
                {
                    componentType = "MinimapDisplayComponent";
                    resource = "RscCustomInfoMiniMap";
                };
                class SensorDisplay
                {
                    componentType = "SensorsDisplayComponent";
                    range[] = {16000,8000,4000,2000};
                    resource = "RscCustomInfoSensors";
                };
                class SlingLoadDisplay
                {
                    componentType = "SlingLoadDisplayComponent";
                    resource = "RscCustomInfoSlingLoad";
                };
                class VehiclePrimaryGunnerDisplay
                {
                    componentType = "TransportFeedDisplayComponent";
                    source = "PrimaryGunner";
                };
                class UAVDisplay
                {
                    componentType = "UAVFeedDisplayComponent";
                };
                class CrewDisplay {
                    componentType = "CrewDisplayComponent";
                    resource = "RscCustomInfoCrew";
                };
            };
        };
    };
    class Turrets : Turrets
    {
        class MainTurret : MainTurret
        {
            minElev= -33; // -40;
            maxElev= 30; // 20;
            initElev= 0;
            minTurn= -100; // -120;
            maxTurn= 100; // 120;
            maxHorizontalRotSpeed = 1.75; // 1.2
            maxVerticalRotSpeed = 1.75; //1.2
            class OpticsIn
            {
                class Wide
                {
                    gunnerOpticsModel="\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
                    initAngleX = 0;
                    initAngleY = 0;
                    initFov = 0.75; // 0.466
                    maxAngleX = 30;
                    maxAngleY = 100;
                    maxFov = 0.75; // 0.466
                    minAngleX = -30;
                    minAngleY = -100;
                    minFov = 0.75; // 0.466
                    opticsDisplayName = "W";
                    thermalMode[] = {0,1};
                    visionMode[] = {"Normal","Ti"};
                    directionStabilized = 1;
                };
                class Medium : Wide
                {
                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_medium_F";
                    initAngleX = 0;
                    initAngleY = 0;
                    initFov = 0.093;
                    maxAngleX = 30;
                    maxAngleY = 100;
                    maxFov = 0.093;
                    minAngleX = -30;
                    minAngleY = -100;
                    minFov = 0.093;
                    opticsDisplayName = "M";
                    thermalMode[] = {0,1};
                    visionMode[] = {"Normal","Ti"};
                    directionStabilized = 1;
                };
                class Narrow : Wide
                {
                    gunnerOpticsModel="\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_narrow_F";
                    initAngleX = 0;
                    initAngleY = 0;
                    initFov = 0.029;
                    maxAngleX = 30;
                    maxAngleY = 100;
                    maxFov = 0.029;
                    minAngleX = -30;
                    minAngleY = -100;
                    minFov = 0.029;
                    opticsDisplayName = "N";
                    thermalMode[] = {0,1};
                    visionMode[] = {"Normal","Ti"};
                    directionStabilized = 1;
                };
            };
        };
    };

    // ### ArmaInventar selber gemacht, deswegen Löschung standardmäßig umgehen
    EGVAR(main,disableCargoCleanup) = 1;

    class TransportItems
    {
        MACRO_ADDITEM(ACE_quikclot, 20);
        MACRO_ADDITEM(ACE_elasticBandage, 20);
        MACRO_ADDITEM(ACE_packingBandage, 20);
        MACRO_ADDITEM(ACE_morphine, 4);
        MACRO_ADDITEM(ACE_salineIV, 8);
        MACRO_ADDITEM(ToolKit, 1);
    };
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red, 20);
        MACRO_ADDMAGAZINE(rhs_mag_mk3a2, 8);
        MACRO_ADDMAGAZINE(SmokeShell, 8);
        MACRO_ADDMAGAZINE(AMP_Breaching_Charge_Mag, 4);
    };
    class TransportWeapons
    {
        MACRO_ADDWEAPON(TB_rhs_weap_M136_CS, 2);
    };
};