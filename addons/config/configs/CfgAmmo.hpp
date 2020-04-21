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
        submunitionConeType[] = {"poissondisccenter",5}; // "randomcenter",35
        triggerDistance = 150; // 200
    };

    class ShellBase;
    class Mo_cluster_AP : ShellBase // Mk45 Hammer HE Cluster Submunition
    {
        caliber = 4; // 34
        hit = 25; // 35
        indirectHit = 19; // 25
        indirectHitRange = 18; // 8
        suppressionRadiusHit = 65; // 30
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

    class Sh_155mm_AMOS;
    class ammo_ShipCannon_120mm_HE : Sh_155mm_AMOS // Mk45 Hammer HE
    {
        caliber = 4; // 10
        hit = 300; // 340
        indirectHit = 250; // 125
        indirectHitRange = 17; // 30

        class CamShakeExplode {
            distance = 900; // 339.599
            duration = 2; // 2.4
            frequency = 15; //20
            power = 28; // 31
        };
        class CamShakeFire {
            distance = 700; // 99.5992;
            duration = 2; // 2.4
            frequency = 10; // 20
            power = 8; // 3.52844
        };
        class CamShakeHit {
            distance = 1;
            duration = 0.8;
            frequency = 20;
            power = 155;
        };
        class CamShakePlayerFire {
            distance = 1;
            duration = 0.1;
            frequency = 20;
            power = 0.01;
        };
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

        class CamShakeExplode {
            distance = 1500;
            duration = 0.75;
            frequency = 10;
            power = 35;
        };
        class CamShakeFire {
            distance = 1200;
            duration = 0.75;
            frequency = 10;
            power = 18;
        };
        class CamShakeHit {
            distance = 1;
            duration = 0.35;
            frequency = 40;
            power = 180;
        };
        class CamShakePlayerFire {
            distance = 1;
            duration = 0.1;
            frequency = 20;
            power = 0.01;
        };
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

    class ammo_Penetrator_Scalpel : ammo_Penetrator_Base // AGM-114K Penetrator
    {
        cameraViewAvailable = 1; // 0
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

    class BulletBase;
    class Gatling_30mm_HE_Plane_CAS_01_F : BulletBase // A-10 GAU-8
    {
        caliber = 19; // 1.4
        indirectHit = 35; // 12
        indirectHitRange = 4.5; // 3
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

    class DirectionalBombBase;
    class ClaymoreDirectionalMine_Remote_Ammo : DirectionalBombBase // Claymore
    {
        indirectHit = 50; // 40
        indirectHitRange = 80; // 30
        /*mineTrigger = {"RemoteTrigger","TimeTrigger","ACE_MagneticTrigger","IRTrigger"};*/
        mineTrigger = "IRTrigger";
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
        hit = 9; // 7
        indirectHitRange = 10; // 3
        suppressionRadiusHit = 32; // 16
    };

};
