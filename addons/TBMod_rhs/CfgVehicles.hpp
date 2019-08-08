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
class CfgVehicles
{
    // ExtraSkin
    class RHS_UH60M;
    class TB_Vehicles_USA_UH60_MEV: RHS_UH60M
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

    // Skin FlaRak Kit
    class AA_01_base_F;
    class B_static_AA_F: AA_01_base_F
    {
        author = "Eron";
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\statics\TB_stationäre_Luftabwehr.paa","\TBMod_skins\pictures\statics\TB_stationäre_Luftabwehr.paa"};
    };

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
        magazines[] = {"168Rnd_CMFlare_Chaff_Magazine"}; // "240Rnd_CMFlare_Chaff_Magazine"
        nvScanner = 1; // 0
        radarTargetSize = 1.05; // 1
        radarType = 8; // 1
        weapons[] = {"rhsusf_weap_CMFlareLauncher"}; // "CMFlareLauncher"
    };

    class RHS_UH60_Base;
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
        magazines[] = {"300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"
        nvScanner = 1; // 0
        radarTargetSize = 1.25; // 1
        weapons[] = {"rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ212"}; // "rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ144"
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
        magazines[] = {"300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"
        radarTargetSize = 1.5; // 1.12
        radarType = 8; // 4
        weapons[] = {"rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ212"}; // "rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANAAQ24"
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
        magazines[] = {"300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"
        radarTargetSize = 1.65; // 1.12
        radarType = 8; // 4
    };

    class Heli_Transport_03_base_F;
    class B_Heli_Transport_03_F : Heli_Transport_03_base_F // Vanilla Stealth CH-47
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
        magazines[] = {"300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine"
        radarTargetSize = 0.41; // 1.2
        weapons[] = {"rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ212"}; // "CMFlareLauncher"
    };

    class Heli_Transport_01_base_F;
    class B_Heli_Transport_01_F : Heli_Transport_01_base_F // Vanilla Stealth UH-80
    {
        accuracy = 0.4; // 0.5
        armor = 45; // 40
        audible = 39; // 50
        camouflage = 78; // 100
        irTargetSize = 0.5; // 0.8
        LockDetectionSystem = "2 + 8 + 4"; // 8+4
        magazines[] = {"300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine"
        radarTargetSize = 0.33; // 0.7
        weapons[] = {"rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ212"}; // "CMFlareLauncher"
    };

    class Heli_Attack_01_dynamicLoadout_base_F;
    class B_Heli_Attack_01_dynamicLoadout_F : Heli_Attack_01_dynamicLoadout_base_F // Vanilla Stealth RAH-66
    {
        accuracy = 1.2; // 2.5
        accuracyDarkNightLightsOff = 0.0005; // 0.001
        accuracyNightLightsOff = 0.003; // 0.006
        accuracyNightLightsOn = 0.05; // 0.1
        audible = 24; // 50
        camouflage = 63; // 100
        camShakeCoef = 0.4; // 0
        irTargetSize = 0.48; // 0.8
        LockDetectionSystem = "2 + 8 + 4"; // 8+4
        magazines[] = {"168Rnd_CMFlare_Chaff_Magazine"}; // "240Rnd_CMFlare_Chaff_Magazine"
        nvScanner = 1; // 0
        radarTargetSize = 0.21; // 0.7
        weapons[] = {"rhsusf_weap_CMFlareLauncher"}; // "CMFlareLauncher"
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

    class Plane_Base_F;
    class Plane_CAS_01_base_F: Plane_Base_F
    {
        class Components;
    };
    class Plane_CAS_01_dynamicLoadout_base_F : Plane_CAS_01_base_F
    {
        class Components : Components
        {
            class TransportPylonsComponent
            {
                class Pylons
                {
                    class Pylons1;
                    class Pylons2 : Pylons1
                    {
                        maxweight = 5000; // 500
                    };
                    class Pylons3 : Pylons1
                    {
                        maxweight = 5000; // 500
                    };
                    class Pylons4 : Pylons1
                    {
                        maxweight = 5000; // 500
                    };
                    class Pylons5 : Pylons1
                    {
                        maxweight = 5000; // 500
                    };
                };
            };
        };
    };
    class B_Plane_CAS_01_dynamicLoadout_base_F : Plane_CAS_01_dynamicLoadout_base_F
    {
        accuracyDarkNightLightsOff = 0.005; // 0.001
        accuracyNightLightsOff = 0.03; // 0.006
        accuracyNightLightsOn = 0.5; // 0.1
        armor = 115; // 80
        audible = 210; // 60
        camouflage = 170; // 100
        camShakeCoef = 1.4; // 0
        irTargetSize = 1.65; // 1
        magazines[] = {"1000Rnd_Gatling_30mm_Plane_CAS_01_F","Laserbatteries","300Rnd_CMFlare_Chaff_Magazine"}; // "1000Rnd_Gatling_30mm_Plane_CAS_01_F","Laserbatteries","120Rnd_CMFlare_Chaff_Magazine"
        nvScanner = 1; // 0
        radarTargetSize = 1.05; // 1
        thrustCoef[] = {1.1,1.14,1.18,1.21,1.2,1.19,1.17,1.15,0.8,0.3,0.2,0,0,0,0}; // {1.1,1.14,1.18,1.21,1.2,1.19,1.17,1.15,1.13,1.1,1.04,0.6,0.1,0,0}
        weapons[] = {"Gatling_30mm_Plane_CAS_01_F","Laserdesignator_pilotCamera","rhsusf_weap_CMFlareLauncher"}; // "Gatling_30mm_Plane_CAS_01_F","Laserdesignator_pilotCamera","CMFlareLauncher"
    };

    class Plane_Fighter_01_Base_F;
    class B_Plane_Fighter_01_F : Plane_Fighter_01_Base_F // Vanilla F/A-181
    {
        accuracy = 0.25; // 0.02
        accuracyDarkNightLightsOff = 0.003; // 0.001
        accuracyNightLightsOff = 0.018; // 0.006
        accuracyNightLightsOn = 0.3; // 0.1
        armor = 65; // 60
        audible = 190; // 60
        camShakeCoef = 0.4; // 0
        camouflage = 150; // 100
        irScanRangeMin = 650; // 2000
        irTargetSize = 1.7; // 1
        magazines[] = {"magazine_Fighter01_Gun20mm_AA_x450","magazine_Fighter01_Gun20mm_AA_x450","Laserbatteries","300Rnd_CMFlare_Chaff_Magazine"}; // "magazine_Fighter01_Gun20mm_AA_x450","Laserbatteries","240Rnd_CMFlare_Chaff_Magazine"
        nvScanner = 1; // 0
        radarTargetSize = 0.7; // 0.8
        thrustCoef[] = {1.76,1.69,1.62,1.68,1.74,1.81,1.89,1.95,1.96,1.96,1.92,1.8,1.75,1.6,1.4,1.2}; // {1.76,1.69,1.62,1.68,1.74,1.81,1.89,1.95,1.96,1.96,1.92,1.4,0.4,0,0,0}
        weapons[] = {"weapon_Fighter_Gun20mm_AA","Laserdesignator_pilotCamera","rhsusf_weap_CMFlareLauncher"}; // "weapon_Fighter_Gun20mm_AA","Laserdesignator_pilotCamera","CMFlareLauncher_Singles"
    };

    class I_Plane_Fighter_03_dynamicLoadout_F;
    class TB_Vehicles_L159_Albatros : I_Plane_Fighter_03_dynamicLoadout_F // L-159 Albatros
    {
        accuracyDarkNightLightsOff = 0.002; // 0.001
        accuracyNightLightsOff = 0.015; // 0.006
        accuracyNightLightsOn = 0.26; // 0.1
        armor = 50; // 55
        audible = 180; // 60
        camShakeCoef = 0.9; // 0
        camouflage = 105; // 100
        irTargetSize = 1.4; // 0.8
        magazines[] = {"Laserbatteries","300Rnd_CMFlare_Chaff_Magazine"}; // "120Rnd_CMFlare_Chaff_Magazine"
        nvScanner = 1; // 0
        radarTargetSize = 1.2; // 0.8
        thrustCoef[] = {1.6,1.75,2,2.1,2.2,2.1,1.95,1.6,1.1,0,0,0,0,0,0,0,0}; // {1.42,1.38,1.34,1.3,1.25,1.2,1.19,1.18,1.17,1.17,1.16,1.16,0.1,0,0,0,0}
        weapons[] = {"Laserdesignator_pilotCamera","rhsusf_weap_CMFlareLauncher"}; // "CMFlareLauncher"
    };

    class UAV_01_base_F;
    class B_UAV_01_F : UAV_01_base_F // Vanilla AR-2 Darter
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
    class B_UAV_06_F : UAV_06_base_F // Vanilla AL-6 Pelican
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
        visualTargetSize = 0.2; // n.a.
    };

    class Quadbike_01_base_F;
    class B_Quadbike_01_F : Quadbike_01_base_F // Vanilla Quad
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
    class I_MRAP_03_F : MRAP_03_base_F // Vanilla Fennek
    {
        accuracy = 1.1; // 0.25
        audible = 2.25; // 5
        camouflage = 1.4; // 2
        irTargetSize = 0.3; // n.a.
        visualTargetSize = 0.3; // n.a.
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

    class Heli_light_03_base_F;
    class Heli_light_03_unarmed_base_F : Heli_light_03_base_F // Vanilla AW-159 Hellcat
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
        magazines[] = {"5000Rnd_762x51_Yellow_Belt","24Rnd_missiles","300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine"
        nvScanner = 1; // 0
        radarTargetSize = 1.2; // 1
        weapons[] = {"rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ212"}; // "CMFlareLauncher"
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F : Heli_Transport_02_base_F // Vanilla CH-49 Mohawk
    {
        armor = 55; // 40
        audible = 64; // 50
        camouflage = 95; // 100
        irTargetSize = 1; // 1.2
        magazines[] = {"300Rnd_CMFlare_Chaff_Magazine","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM","rhsusf_mag_DIRCM"}; // "168Rnd_CMFlare_Chaff_Magazine"
        radarTargetSize = 1; // 1.2
        weapons[] = {"rhsusf_weap_CMFlareLauncher","rhsusf_weap_ANALQ212"}; // "CMFlareLauncher"
    };

    class UAV_02_dynamicLoadout_base_F;
    class B_UAV_02_dynamicLoadout_F : UAV_02_dynamicLoadout_base_F // Vanilla MQ-4A Greyhawk (Predator)
    {
        accuracy = 0.6; // 0.1
        camouflage = 45; // 150
        fuelCapacity = 3000; // 1000
        irTargetSize = 0.3; // 0.5
        nvScanner = 1; // 0
        radarTargetSize = 0.3; // 0.5
        visualTargetSize = 0.6; // 0.7
    };

    class UAV_05_Base_F;
    class B_UAV_05_F : UAV_05_Base_F // Vanilla UCAV Sentinel
    {
        accuracy = 0.2; // 0.1
        fuelCapacity = 4000; // 1000
        nvScanner = 1; // 0
    };

    class Rubber_duck_base_F;
    class B_Boat_Transport_01_F : Rubber_duck_base_F // Vanilla Schlauchboot
    {
        accuracy = 1.25; // 0.5
        ace_cargo_space = 1; // 0
        armor = 19; // 10
        audible = 2.8; // 6
        camouflage = 1.15; // 2
    };

    class Boat_Armed_01_minigun_base_F;
    class B_Boat_Armed_01_minigun_F : Boat_Armed_01_minigun_base_F // Vanilla Schnellboot
    {
        accuracy = 0.9; // 1.5
        ace_cargo_space = 1; // 0
        armor = 250; // 400
        audible = 3.2; // 6
        camouflage = 1.45; // 2
        magazines[] = {"SmokeLauncherMag_boat","SmokeLauncherMag_boat","SmokeLauncherMag_boat"}; // "SmokeLauncherMag_boat"
    };

    class SDV_01_base_F;
    class B_SDV_01_F : SDV_01_base_F // Vanilla SDV (Seal Delivery Vehicle)
    {
        ace_cargo_space = 1; // 0
        audible = 0.1; // 6
        camouflage = 1; // 2
    };

    class APC_Tracked_03_base_F;
    class RHS_M2A2_Base : APC_Tracked_03_base_F // RHS M2 Bradley
    {
        armor = 460; // 290
        audible = 8; // 18
    };

    class rhsusf_caiman_base;
    class rhsusf_M1220_usarmy_d : rhsusf_caiman_base // RHS M1220 Serie
    {
        armor = 230; // 200
        audible = 5; // 9
    };

    class rhsusf_hmmwe_base;
    class rhsusf_m998_w_2dr : rhsusf_hmmwe_base // RHS Humvee Serie
    {
        armor = 95; // 80
        audible = 4; // 5
    };

    class MRAP_01_base_F;
    class B_MRAP_01_F : MRAP_01_base_F // Vanilla Hunter
    {
        armor = 210; // 200
    };

    class I_APC_Wheeled_03_base_F;
    class I_APC_Wheeled_03_cannon_F : I_APC_Wheeled_03_base_F // Vanilla Pandur II
    {
        armor = 460; // 480
        audible = 8; // 14
    };
};