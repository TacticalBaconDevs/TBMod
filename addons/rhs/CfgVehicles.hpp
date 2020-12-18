/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define addCategory(EDITORSUB) editorCategory = "EdCat_TB_skins"; \
            editorSubcategory = EdSubcat_TB_skins_##EDITORSUB; \
            faction = "BLU_F"; \
            side = 1;\
            scope = 2;\
            scopeCurator = 2

class SensorTemplateDataLink;
class SensorTemplatePassiveRadar;
class SensorTemplateIR;
class SensorTemplateLaser;
class SensorTemplateNV;
class DefaultVehicleSystemsDisplayManagerLeft;
class DefaultVehicleSystemsDisplayManagerRight;

class CfgVehicles
{
    // accuracy: 3.5 = sniper, 1.5 = soldier, 0.9 = truck, 0.5 = small vehicle 0.2 = building
    // armor: 3 = soldier, 20 = car, 150 = building, 150-300 = bmp, 300 = boat, 400-900 = tank, 10000 = ship
    // audible: 0.05 = soldier, 3 = motorcycle, 6 = tank, 18 = vanilla merkava/rhs tank
    // camouflage: 1 = soldier, 4 = truck, 8 = tank
    // radarTargetSize: 0.1 = fully stealth, 0.7 = small aircraft/semi-stealth, 1 = mid sized aircraft/car, 1.2 = tank/truck, 2 = large bomber (max value)
    class Helicopter_Base_H;
    class RHS_MELB_base : Helicopter_Base_H // RHS AH/MH/UH-6
    {
        accuracy = 1.1; // 0.5
        accuracyDarkNightLightsOff = 0.0005; // 0.001
        accuracyNightLightsOff = 0.003; // 0.006
        accuracyNightLightsOn = 0.05; // 0.1
        armor = 25; // 35
        audible = 48; // 50
        camouflage = 45; // 100
        camShakeCoef = 0.8; // 0
        incomingMissileDetectionSystem = 16; // 0
        irTargetSize = 0.31; // 0.7
        LockDetectionSystem = "2 + 8 + 4"; // 0
        nvScanner = 1; // 0
        radarTargetSize = 0.65; // 0.8
    };

    class RHS_MELB_MH6M : RHS_MELB_base
    {
        class Components;
    };
    class TB_Vehicles_MH6 : RHS_MELB_MH6M
    {
        displayName = "MH-6M MELB";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";
        scope = 2;
        scopeArsenal = 2;
        scopeCurator = 2;

        class Components : Components
        {
            class TransportPylonsComponent
            {
                uiPicture = "\A3\Air_F\Heli_Light_01\Data\UI\Heli_Light_01_3DEN_CA.paa";
                class pylons
                {
                    class cmDispenser
                    {
                        attachment = "TB_mag_LWIRCM_144_60";
                        hardpoints[] = {"TB_cm_dispenser_MH_6_1"};
                        maxweight = 800;
                        priority = 2;
                        UIposition[] = {0.20,0.1};
                    };
                    class cmDispenser2 : cmDispenser
                    {
                        attachment = "TB_mag_LWIRCM_144_60";
                        hardpoints[] = {"TB_cm_dispenser_MH_6_2"};
                        maxweight = 800;
                        priority = 1;
                        UIposition[] = {0.46,0.1};
                    };
                };
            };

            class SensorsManagerComponent
            {
                class Components
                {
                    class NVSensorComponent : SensorTemplateNV
                    {
                        aimDown = 22.5;
                        allowsMarking = 1;
                        angleRangeHorizontal = 90;
                        angleRangeVertical = 67.5;
                        animDirection = "mainTurret";
                        color[] = {1,0,0,1};
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
                            maxRange = 4000;
                            minRange = 4000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = 1;
                        };
                        class GroundTarget
                        {
                            maxRange = 4000;
                            minRange = 4000;
                            objectDistanceLimitCoef = 1;
                            viewDistanceLimitCoef = 1;
                        };
                    };
                    class IRSensorComponent : SensorTemplateIR
                    {
                        aimDown = 22.5;
                        allowsMarking = 1;
                        angleRangeHorizontal = 45;
                        angleRangeVertical = 67.5;
                        animDirection = "mainTurret";
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
                            maxRange = 4000;
                            minRange = 4000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = 1;
                        };
                        class GroundTarget
                        {
                            maxRange = 4000;
                            minRange = 4000;
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
                        aimDown = 22.5;
                        class AirTarget
                        {
                            maxRange = 4000;
                            minRange = 4000;
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
                            maxRange = 4000;
                            minRange = 4000;
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
                        range[] = {8000,4000,2000};
                        resource = "RscCustomInfoSensors";
                    };
                    class SlingLoadDisplay
                    {
                        componentType = "SlingLoadDisplayComponent";
                        resource = "RscCustomInfoSlingLoad";
                    };
                    class VehicleDriverDisplay {
                        componentType = "TransportFeedDisplayComponent";
                        source = "PrimaryGunner";
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
                        range[] = {8000,4000,2000};
                        resource = "RscCustomInfoSensors";
                    };
                    class SlingLoadDisplay
                    {
                        componentType = "SlingLoadDisplayComponent";
                        resource = "RscCustomInfoSlingLoad";
                    };
                    class VehicleDriverDisplay {
                        componentType = "TransportFeedDisplayComponent";
                        source = "PrimaryGunner";
                    };
                };
            };
        };
    };

    // Skin
    class TB_Vehicles_MH6_SWAT : RHS_MELB_MH6M
    {
        displayName = "MH-6 S.W.A.T.";
        author = "Eron";
        addCategory(Fluggeraete);
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\vehicles\TB_Vehicles_MH_6_SWAT.paa)};
    };

    class Heli_Attack_01_base_F;
    class RHS_AH64_base : Heli_Attack_01_base_F // RHS AH-64
    {
        accuracy = 0.44; // 0.5
        accuracyDarkNightLightsOff = 0.0015; // 0.001
        accuracyNightLightsOff = 0.009; // 0.006
        accuracyNightLightsOn = 0.15; // 0.1
        armor = 95; // 50
        audible = 62; // 50
        camouflage = 86; // 100
        incomingMissileDetectionSystem = 16; // 0
        irTargetSize = 0.84; // 0.9
        LockDetectionSystem = "2 + 8 + 4"; // 0
        nvScanner = 1; // 0
        radarTargetSize = 1.05; // 1
        radarType = 8; // 1
    };

    class Heli_Transport_01_base_F;
    class RHS_UH60_Base : Heli_Transport_01_base_F
    {
        class Components;
    };
    class RHS_UH60M_base : RHS_UH60_Base // RHS UH-60
    {
        accuracy = 0.42; // 0.5
        accuracyDarkNightLightsOff = 0.002; // 0.001
        accuracyNightLightsOff = 0.012; // 0.006
        accuracyNightLightsOn = 0.2; // 0.1
        armor = 55; // 40
        audible = 64; // 50
        camouflage = 88; // 100
        incomingMissileDetectionSystem = 16; // 0
        irTargetSize = 0.86; // 0.9
        LockDetectionSystem = "2 + 8 + 4"; // 0
        nvScanner = 1; // 0
        radarTargetSize = 1.25; // 1

        class Components : Components
        {
            class TransportPylonsComponent
            {
                class pylons
                {
                    class cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd"; // attachment = "rhsusf_M130_CMFlare_Chaff_Magazine_x2";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_1"}; // hardpoints[] = {"RHSUSF_cm_M130","RHSUSF_cm_M130_x2"};
                        maxweight = 800;
                        priority = 4; // priority = 1;
                        UIposition[] = {0.20,0.1}; // UIposition[] = {0.33,0};
                    };

                    class cmDispenser2 : cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_2"};
                        maxweight = 800;
                        priority = 3;
                        UIposition[] = {0.46,0.1};
                    };

                    class cmDispenser3 : cmDispenser
                    {
                        attachment = "TB_mag_LWIRCM_144_45";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_3"};
                        maxweight = 800;
                        priority = 2;
                        UIposition[] = {0.20,0.15};
                    };

                    class cmDispenser4 : cmDispenser
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
    };

    class RHS_UH60M_US_base;
    class RHS_UH60M : RHS_UH60M_US_base
    {
        class Components;
    };
    class RHS_UH60M_MEV : RHS_UH60M
    {
        class Components : Components
        {
            class TransportPylonsComponent
            {
                class pylons
                {
                    class cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd"; // attachment = "rhsusf_M130_CMFlare_Chaff_Magazine_x2";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_1"}; // hardpoints[] = {"RHSUSF_cm_M130","RHSUSF_cm_M130_x2"};
                        maxweight = 800;
                        priority = 2; // priority = 1;
                        UIposition[] = {0.20,0.1}; // UIposition[] = {0.33,0};
                    };

                    class cmDispenser2 : cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_2"};
                        maxweight = 800;
                        priority = 1;
                        UIposition[] = {0.46,0.1};
                    };
                };
            };
        };
    };

    class RHS_UH60M_MEV2 : RHS_UH60M_MEV
    {
        class Components : Components
        {
            class TransportPylonsComponent
            {
                class pylons
                {
                    class cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd"; // attachment = "rhsusf_M130_CMFlare_Chaff_Magazine_x2";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_1"}; // hardpoints[] = {"RHSUSF_cm_M130","RHSUSF_cm_M130_x2"};
                        maxweight = 800;
                        priority = 2; // priority = 1;
                        UIposition[] = {0.20,0.1}; // UIposition[] = {0.33,0};
                    };

                    class cmDispenser2 : cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_2"};
                        maxweight = 800;
                        priority = 1;
                        UIposition[] = {0.46,0.1};
                    };
                };
            };
        };
    };

    class TB_Vehicles_USA_UH60_MEV : RHS_UH60M // ExtraSkin
    {
        displayName = "UH-60 MEV";
        author = "Eron";
        addCategory(Fluggeraete);
        hiddenSelectionsTextures[] = {
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_fuselage_mev_co.paa",
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_engine_mev_co.paa",
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\default_co.paa",
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_dust_filter_co.paa"
        };
    };

    class RHS_UH60M2 : RHS_UH60M
    {
        class Components;
    };
    class RHS_UH60M_ESSS : RHS_UH60M2
    {
        class Components : Components
        {
            class TransportPylonsComponent
            {
                class pylons
                {
                    class cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd"; // attachment = "rhsusf_M130_CMFlare_Chaff_Magazine_x2";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_1"}; // hardpoints[] = {"RHSUSF_cm_M130","RHSUSF_cm_M130_x2"};
                        maxweight = 800;
                        priority = 2; // priority = 1;
                        UIposition[] = {0.20,0.1}; // UIposition[] = {0.33,0};
                    };

                    class cmDispenser2 : cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_2"};
                        maxweight = 800;
                        priority = 1;
                        UIposition[] = {0.46,0.1};
                    };
                };
            };
        };
    };
    class RHS_UH60M_ESSS2 : RHS_UH60M_ESSS
    {
        class Components : Components
        {
            class TransportPylonsComponent
            {
                class pylons
                {
                    class cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd"; // attachment = "rhsusf_M130_CMFlare_Chaff_Magazine_x2";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_1"}; // hardpoints[] = {"RHSUSF_cm_M130","RHSUSF_cm_M130_x2"};
                        maxweight = 800;
                        priority = 1;
                        UIposition[] = {0.20,0.1}; // UIposition[] = {0.33,0};
                    };

                    class cmDispenser2 : cmDispenser
                    {
                        attachment = "TB_mag_CMFlare_Chaff_72Rnd";
                        hardpoints[] = {"TB_cm_dispenser_UH_60_2"};
                        maxweight = 800;
                        priority = 2;
                        UIposition[] = {0.46,0.1};
                    };
                };
            };
        };
    };

    class rhsusf_CH53E_USMC;
    class rhsusf_CH53E_USMC_D : rhsusf_CH53E_USMC // RHS CH-53
    {
        accuracy = 0.3; // 0.5
        accuracyDarkNightLightsOff = 0.003; // 0.001
        accuracyNightLightsOff = 0.018; // 0.006
        accuracyNightLightsOn = 0.3; // 0.1
        armor = 70; // 40
        audible = 70; // 50
        camouflage = 130; // 100
        incomingMissileDetectionSystem = 16; // 2+8+16
        irTargetSize = 1.24; // 1.2
        LockDetectionSystem = "2 + 8 + 4"; // 8
        radarTargetSize = 1.5; // 1.12
        radarType = 8; // 4
    };

    class RHS_CH_47F_base;
    class RHS_CH_47F : RHS_CH_47F_base // RHS CH-47
    {
        accuracy = 0.35; // 0.5
        accuracyDarkNightLightsOff = 0.003; // 0.001
        accuracyNightLightsOff = 0.018; // 0.006
        accuracyNightLightsOn = 0.3; // 0.1
        armor = 75; // 30
        audible = 74; // 50
        camouflage = 120; // 100
        irTargetSize = 1.14; // 1.2
        radarTargetSize = 1.65; // 1.12
        radarType = 8; // 4
    };

    class RHS_AH1Z_base;
    class RHS_AH1Z : RHS_AH1Z_base // RHS AH-1Z
    {
        accuracy = 0.7; // 5
        accuracyDarkNightLightsOff = 0.0011; // 0.001
        accuracyNightLightsOff = 0.007; // 0.006
        accuracyNightLightsOn = 0.12; // 0.1
        armor = 55; // 50
        camouflage = 63; // 100
        incomingMissileDetectionSystem = 16; // 0
        irTargetSize = 0.74; // 0.9
        LockDetectionSystem = "2 + 8 + 4"; // 0
        nvScanner = 1; // 0
        radarTargetSize = 0.8; // 1
    };

    class RHS_UH1_Base;
    class RHS_UH1Y_base : RHS_UH1_Base // RHS UH-1Y
    {
        accuracy = 0.55; // 1.5
        accuracyDarkNightLightsOff = 0.0007; // 0.001
        accuracyNightLightsOff = 0.004; // 0.006
        accuracyNightLightsOn = 0.09; // 0.1
        armor = 55; // 40
        audible = 52; // 50
        camouflage = 73; // 100
        irTargetSize = 0.84; // 0.9
        nvScanner = 1; // 0
        radarTargetSize = 0.9; // 1
        radarType = 8; // 0
    };

    class rhsusf_mrzr_base;
    class rhsusf_mrzr4_d : rhsusf_mrzr_base // RHS MRZR-4
    {
        accuracy = 1.25; // 0.25
        accuracyDarkNightLightsOff = 0.0005; // 0.001
        accuracyNightLightsOff = 0.003; // 0.006
        accuracyNightLightsOn = 0.05; // 0.1
        audible = 0.75; // 5
        camouflage = 1.15; // 2
        irTargetSize = 0.2; // n.a.
        maxOmega = 950; // 837.76
        visualTargetSize = 0.2; // n.a.
    };

    class RHS_C130J_Base;
    class RHS_C130J : RHS_C130J_Base // RHS C-130
    {
        accuracy = 0.1; // 0.15
        armor = 70; // 50
        audible = 210; // 60
        camouflage = 600; // 100
        irTargetSize = 1.8; // 1.2
        visualTargetSize = 1.95; // 1.5
        radarTargetSize = 1.95; // 1.5
    };

    class APC_Tracked_03_base_F;
    class RHS_M2A2_Base : APC_Tracked_03_base_F // RHS M2 Bradley
    {
        armor = 510; // 290
        audible = 17; // 18
    };

    class rhsusf_caiman_base;
    class rhsusf_M1220_usarmy_d : rhsusf_caiman_base // RHS M1220 Serie
    {
        armor = 220; // 200
        audible = 8; // 9
        maxOmega = 550; // 230.38
    };

    class rhsusf_hmmwe_base;
    class rhsusf_m998_w_2dr : rhsusf_hmmwe_base // RHS Humvee Serie
    {
        armor = 70; // 80
        maxOmega = 480; // 356.05
    };

    class MRAP_01_base_F;
    class rhsusf_RG33L_base : MRAP_01_base_F // RHS RG33L-Reihe
    {
        armor = 215; // 200
        audible = 6; // 5
    };

    class rhsusf_RG33_base : MRAP_01_base_F // RHS RG33-Reihe
    {
        armor = 225; // 200
        audible = 7; // 5
    };

    // ### RHS inheritance fix
    class rhs_uaz_spg9_base;
    class rhs_uaz_spg9_chdkz : rhs_uaz_spg9_base {};

    class Bag_Base;
    class B_AssaultPack_Base : Bag_Base // Assault Pack + Falcon-II Pack
    {
        mass = 12; // 20
        maximumLoad = 96; // 160
    };

    class B_FieldPack_Base : Bag_Base // Field Pack
    {
        mass = 12; // 30
        maximumLoad = 96; // 200
    };

    class B_Bergen_Base_F : Bag_Base // Bergen Pack
    {
        mass = 104; // 90
        maximumLoad = 500; // 480
    };

    class B_TacticalPack_Base : Bag_Base // Tactical Pack
    {
        mass = 12; // 40
        maximumLoad = 96; // 240
    };

    class rhsusf_assault_eagleaiii_ucp : B_AssaultPack_Base // Eagle A-III Pack
    {
        mass = 50; // 20
        maximumLoad = 280; // 160
    };

    class rhsusf_MATV_base : MRAP_01_base_F // RHS M-ATV-Reihe
    {
        armor = 220; // 100
        audible = 5; // 6
        maxOmega = 600; // 230.38
        maxSpeed = 115; // 105
        normalSpeedForwardCoef = 0.7; // 0.48
    };

    class rhsusf_Cougar_base : MRAP_01_base_F // RHS CGR-Reihe
    {
        armor = 220; // 200
        audible = 15; // 14
    };

    class rhsusf_stryker_base;
    class rhsusf_stryker_m1126_base : rhsusf_stryker_base // RHS Stryker-Reihe
    {
        armor = 220; // 120
        audible = 15; // 14
    };

    class Wheeled_Apc_F;
    class rhsusf_M1117_base : Wheeled_Apc_F // RHS M1117-Reihe
    {
        armor = 195; // 150
        audible = 13; // 14
        maxOmega = 550; // 230.38
    };
};
