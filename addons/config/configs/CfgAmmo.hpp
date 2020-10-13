/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAmmo
{
    class Cluster_155mm_AMOS;
    class ammo_ShipCannon_120mm_HE_cluster : Cluster_155mm_AMOS // Mk45 Hammer HE Cluster
    {
        submunitionAmmo[] = {"Mo_cluster_AP"}; // {"Mo_cluster_AP",0.93,"Mo_cluster_AP_UXO_deploy",0.07}
        submunitionConeType[] = {"poissondisccenter",25}; // "randomcenter",35
        triggerDistance = 300; // 200
    };

    class AT_Mine_155mm_AMOS_range;
    class ammo_ShipCannon_120mm_AT_mine : AT_Mine_155mm_AMOS_range // Mk45 Hammer AT Minen Cluster
    {
        submunitionAmmo = "Mo_ATMineRange"; // "Mo_ATMineRange"
        submunitionConeAngle = 15; // 30
        submunitionConeType[] = {"poissondisccenter",22}; // "randomcenter",12
    };

    class MineBase;
    class ATMine_Range_Ammo : MineBase // Mk45 Hammer AT Minen Cluster Submunition Minen
    {
        indirectHitRange = 2; // 1
    };

    class Smoke_120mm_AMOS_White;
    class ammo_ShipCannon_120mm_smoke : Smoke_120mm_AMOS_White // Mk45 Hammer Rauchwand
    {
        submunitionConeAngle = 19; // 10
        submunitionConeType[] = {"poissondisc",26}; // "poissondisc",5
    };

    class Mine_155mm_AMOS_range;
    class ammo_ShipCannon_120mm_mine : Mine_155mm_AMOS_range // Mk45 Hammer HE Minen Cluster
    {
        submunitionConeAngle = 25; // 30
        submunitionConeType[] = {"poissondisccenter",38}; // "randomcenter",24
    };

    class ShotDeployBase;
    class Mo_ClassicMineRange : ShotDeployBase // Mk45 Hammer HE Minen Cluster Submunition
    {
        submunitionAmmo = "APERSBoundingMine_Range_Ammo"; // "APERSMine_Range_Ammo"
    };

    class ammo_Bomb_LaserGuidedBase;
    class Bomb_04_F : ammo_Bomb_LaserGuidedBase // GBU-12 HE
    {
        cameraViewAvailable = 1; // 0
        indirectHitRange = 32; // 12
        trackOversteer = 0.95; // 1
    };

    class BombCluster_01_Ammo_F : Bomb_04_F // CBU-85 HE Mines Cluster
    {
        submunitionAmmo[] = {"Mo_ClassicMineRange"}; // {"Mo_cluster_Bomb_01_F",0.93,"BombCluster_01_UXO_deploy",0.07}
        submunitionConeType[] = {"poissondisccenter",50}; // "randomcenter",85
    };

    class BombCluster_02_Ammo_F : BombCluster_01_Ammo_F // RBK-500F AT Mines Cluster
    {
        submunitionAmmo[] = {"Mo_ATMineRange"}; // {"Mo_cluster_Bomb_02_F",0.93,"BombCluster_02_UXO_deploy",0.07}
        submunitionConeType[] = {"poissondisccenter",50}; // "randomcenter",45
    };

    class BombCluster_03_Ammo_F : BombCluster_01_Ammo_F // BL-778 HE Cluster
    {
        submunitionAmmo[] = {"Mo_cluster_Bomb_03_F"}; // "Mo_cluster_Bomb_03_F",0.93,"BombCluster_03_UXO_deploy",0.07
        submunitionConeAngle = 22; // 10
        submunitionConeType[] = {"random",70}; // "randomcenter",50
    };

    class Mo_cluster_Bomb_01_F;
    class Mo_cluster_Bomb_03_F : Mo_cluster_Bomb_01_F // BL-778 HE Cluster Submunition
    {
        aiAmmoUsageFlags = "64 + 128"; // "64 + 128 + 256"
        airFriction = -0.00005; // -0.0005
        caliber = 0.5; // 34
        hit = 25; // 70
        indirectHit = 19; // 12
        indirectHitRange = 10; // 6
        suppressionRadiusHit = 65; // 30
    };

    class BombCore;
    class Bo_Mk82 : BombCore // Mk-82 Airburst
    {
        cameraViewAvailable = 1; // 0
        indirectHit = 70; // 1100
        indirectHitRange = 75; // 12
        suppressionRadiusHit = 210; // 100
    };

    class ammo_Bomb_SmallDiameterBase;
    class ammo_Bomb_SDB : ammo_Bomb_SmallDiameterBase // SDB Bomb
    {
        cameraViewAvailable = 1; // 0
    };

    class ammo_Penetrator_Base;
    class ammo_Penetrator_AGM_02 : ammo_Penetrator_Base // AGM-65 L Penetrator
    {
        caliber = 145; // 66.7
        indirectHit = 350; // 85
        indirectHitRange = 2; // 8
    };

    class M_Scalpel_AT;
    class ACE_Hellfire_AGM114K : M_Scalpel_AT // AGM-114K
    {
        cameraViewAvailable = 1; // 0
        indirectHitRange = 1; // 4
        trackOversteer = 0.95; // 1

        class CamShakeExplode {
            distance = 300;
            duration = 1.5;
            frequency = 18;
            power = 16;
        };
        class CamShakeFire {
            distance = 150;
            duration = 1.5;
            frequency = 18;
            power = 4;
        };
        class CamShakeHit {
            distance = 1;
            duration = 0.6;
            frequency = 20;
            power = 60;
        };
        class CamShakePlayerFire {
            distance = 1;
            duration = 0.1;
            frequency = 20;
            power = 2;
        };
    };

    class B_45ACP_Ball;
    class TB_45_FMJ : B_45ACP_Ball // 45. FMJ Munition
    {
        hit = 21; // 8
        caliber = 1.4; // 1
    };

    class B_30mm_HE;
    class B_40mm_GPR : B_30mm_HE // 40mm GPR
    {
        hit = 40; // 70
    };

    class B_30mm_APFSDS;
    class B_40mm_APFSDS : B_30mm_APFSDS // 40mm APFSDS
    {
        hit = 100; // 150
    };

    class PipeBombBase;
    class APERSMineDispenser_Ammo : PipeBombBase // APERSMineDispenser
    {
        submunitionConeType[] = {"randomupcone",18}; // "randomupcone",14
        submunitionInitSpeed = 18; // 8
    };

    class APERSMine_Range_Ammo;
    class APERSMineDispenser_Mine_Ammo : APERSMine_Range_Ammo // Submunition APERSMineDispenser
    {
        hit = 15; // 7
    };

    class B_12Gauge_Pellets_Submunition;
    class B_12Gauge_HD_Pellets_Submunition : B_12Gauge_Pellets_Submunition // Demining UGV Pelter
    {
        submunitionConeAngle = 0.5; // 1.3
        submunitionConeType[] = {"poissondisc",16}; // {"poissondisc",9};
    };

    class ammo_Missile_ShortRangeAABase;
    class ammo_Missile_AA_R73 : ammo_Missile_ShortRangeAABase
    {
        cmimmunity = 0.82; // 0.92
    };

    class ammo_Missile_BIM9X : ammo_Missile_ShortRangeAABase
    {
        cmimmunity = 0.82; // 0.92
    };

    class ammo_Missile_MediumRangeAABase;
    class ammo_Missile_AA_R77 : ammo_Missile_MediumRangeAABase
    {
        cmimmunity = 0.85; // 0.95
    };

    class ammo_Missile_AMRAAM_C : ammo_Missile_MediumRangeAABase
    {
        cmimmunity = 0.85; // 0.95
    };

    class ammo_Missile_AMRAAM_D : ammo_Missile_MediumRangeAABase
    {
        cmimmunity = 0.86; // 0.96
    };

    class ammo_Missile_mim145;
    class ammo_Missile_s750 : ammo_Missile_mim145
    {
        cmimmunity = 0.85; // 0.95
    };

    class CMflare_Chaff_Ammo;
    class TB_ammo_CMFlare_Chaff : CMflare_Chaff_Ammo
    {
        timeToLive = 5;
    };

    class TB_ammo_CMFlare_Chaff_Burst : CMflare_Chaff_Ammo
    {
        timeToLive = 5;
    };

    class TB_ammo_LWIRCM_60 : CMflare_Chaff_Ammo // LWIRCM 60
    {
        airFriction = -0.1;
        audibleFire = 0;
        effectsSmoke = "EmptyEffect";
        thrustTime = 1;
        timeToLive = 5;
        visibleFire = 0;
        weaponLockSystem = "2";
    };

    class TB_ammo_LWIRCM_45 : CMflare_Chaff_Ammo // LWIRCM 45
    {
        airFriction = -0.1;
        audibleFire = 0;
        effectsSmoke = "EmptyEffect";
        thrustTime = 1;
        timeToLive = 5;
        visibleFire = 0;
        weaponLockSystem = "2";
    };

    class TB_ammo_LWIRCM_30 : CMflare_Chaff_Ammo // LWIRCM 30
    {
        airFriction = -0.1;
        audibleFire = 0;
        effectsSmoke = "EmptyEffect";
        thrustTime = 1;
        timeToLive = 5;
        visibleFire = 0;
        weaponLockSystem = "2";
    };

    // ###################### Unterlauf-IR Granate ######################
    class B_IRStrobe;
    class TB_rhs_40mm_IR_Grenade : B_IRStrobe
    {
        cost = 0; // 5000
        dangerRadiusHit = 0; // -1
        deflecting = 0; // 30
        hit = 0; // 5
        indirectHit = 0; // 2
        indirectHitRange = 0; // 0.2
        model = "\A3\Weapons_f\Data\bullettracer\tracer_yellow"; // \A3\Weapons_F_EPB\Ammo\B_IRstrobe_F.p3d
        timeToLive = 120; // 300
        tracerColor[] = {0.9,0.9,0.1,1}; // {0.7,0.7,0.5,0.04};
        tracerColorR[] = {0.9,0.9,0.1,1}; // {0.7,0.7,0.5,0.04};
        visibleFire = 0; // 2

        // in Reference und Original nicht vorhanden - https://community.bistudio.com/wiki/Arma_3_Targeting_config_reference
        visualTarget = 1;
        visualTargetSize = 2;
        irTarget = 1;
        irTargetSize = 2;
        laserTarget = 1;

        // in Reference und Original nicht vorhanden - https://community.bistudio.com/wiki/Weapons_settings
        tracerEndTime = 6;
        tracerScale= 1.2;
        tracerStartTime = 0.04;
    };

    // ###################### FlareOverride ######################
    class FlareCore;
    class FlareBase: FlareCore
    {
        intensity = 250000;
        flareSize = 12;
        timeToLive = 180;
    };

    class F_20mm_White: FlareBase
    {
        intensity = 800000;
        brightness = 1000000;

        //flareSize = 12;
        useFlare = 1;
        timeToLive = 250;
        coefGravity = 0.5;
    };

    class F_40mm_White: FlareBase
    {
        intensity = 1500000;
        brightness = 2000000;

        //flareSize = 12;
        useFlare = 1;
        timeToLive = 400;
        coefGravity = 0.5;
    };

    class Flare_82mm_AMOS_White: FlareCore
    {
        intensity = 4000000;
        brightness = 3000000;

        flareSize = 20;
        timeToLive = 600;
        coefGravity = 0.3;
    };


    // ###################### AIM-Smokes ######################
    # define ADD_PRECISE_SMOKE(TYPE) class TYPE; \
        class TYPE##_precise : TYPE \
        { \
            simulation = "shotSmoke"; \
            deflecting = 0; \
            deflectionSlowDown = 0.1; \
            deflectionDirDistribution = 0; \
            timeToLive = 120; \
        }
    ADD_PRECISE_SMOKE(G_40mm_Smoke);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeBlue);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeGreen);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeOrange);
    // ADD_PRECISE_SMOKE(G_40mm_SmokePurple);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeRed);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeYellow);

    // Smoke für Fahrzeuge, benötigt ClassEventhandler aus PreInit
    class TB_G_40mm_Smoke : G_40mm_Smoke
    {
        simulation = "shotShell";
        deflecting = 0;
        deflectionSlowDown = 0.1;
        deflectionDirDistribution = 0;
        timeToLive = 100;
        explosiontime = 0;
        typicalspeed = 200;
        airfriction = -0.001;
        caliber = 2;
    };
};
