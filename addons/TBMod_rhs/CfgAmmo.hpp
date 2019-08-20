/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define ADD_PRECISE_SMOKE(TYPE) class TYPE; \
    class TYPE##_precise : TYPE \
    { \
        simulation = "shotSmoke"; \
        deflecting = 0; \
        deflectionSlowDown = 0.1; \
        deflectionDirDistribution = 0; \
        timeToLive = 120; \
    }

class CfgAmmo
{
    // RHS
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_green);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_red);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_white);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_yellow);

    class rhs_g_vog25;
    class rhs_g_vg40sz : rhs_g_vog25 // Unterlauf-Stungrenade
    {
        deflection = 0;
        fuseDistance = 10;
        ExplosionEffects = "RHS_flashbang_20"; // RHS_flashbang_10
    };

    class rhsusf_40mm_HE;
    class TB_rhsusf_40mm_HET : rhsusf_40mm_HE // Unterlauf-HE
    {
        caliber = 0.15; // 2
        deflecting = 0; // 5 - 100 = HET Wert
        fuseDistance = 10; // 15
        hit = 9; // 20
        indirectHit = 8.5; // 5
        indirectHitRange = 12; // 10.7

        class HitEffects
        {
            hitMetal = "RHS_m397_hit";
            hitMetalPlate = "RHS_m397_hit";
            hitBuilding = "RHS_m397_hit";
            hitConcrete = "RHS_m397_hit";
            hitGroundSoft = "RHS_m397_hit";
            hitGroundHard = "RHS_m397_hit";
            default_mat = "RHS_m397_hit";
            hitFoliage = "RHS_m397_hit";
            hitGlass = "RHS_m397_hit";
            hitGlassArmored = "RHS_m397_hit";
            hitWood = "RHS_m397_hit";
            hitPlastic = "RHS_m397_hit";
            hitRubber = "RHS_m397_hit";
            hitMan = "RHS_m397_hit";
            hitWater = "RHS_m397_hit";
            hitVirtual = "RHS_m397_hit";
        };
    };

    class rhsusf_40mm_HEDP;
    class TB_rhs_40mm_HEDP : rhsusf_40mm_HEDP // Unterlauf-HEDP - hat gewollt kaum Wirkung gegen KPz
    {
        ace_frag_enabled = 0;
        ace_frag_force = 0;
        deflecting = 0; // 5
        hit = 70; // 20
        indirectHit = 65; // 5
        indirectHitRange = 0.9; // 3.6
    };

    class rhs_ammo_12g_slug;
    class TB_rhs_ammo_40mm_Slugshot : rhs_ammo_12g_slug // Unterlauf-Slug
    {
        caliber = 2; // 0.3048;
        deflecting = 0; // 30
        hit = 25; // 34.51
    };

    // Flare Time2Life
    #define CHANGETIMETOLIFE(NAME) class NAME; class TB_##NAME : NAME {timeToLive = 180;}
    CHANGETIMETOLIFE(rhsusf_40mm_white);
    CHANGETIMETOLIFE(rhsusf_40mm_green);
    CHANGETIMETOLIFE(rhsusf_40mm_red);

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
        caliber = 2; // 34
        hit = 6; // 35
        indirectHit = 6; // 25
        indirectHitRange = 20; // 8
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

    class M_Mo_120mm_AT_LG;
    class M_Mo_155mm_AT_LG : M_Mo_120mm_AT_LG // Mk45 Hammer AT Laserguided Submunition
    {
        caliber = 145; // 1
    };

    class ammo_Bomb_LaserGuidedBase;
    class Bomb_04_F : ammo_Bomb_LaserGuidedBase // GBU-12 HE
    {
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
        submunitionConeAngle = 12; // 10
        submunitionConeType[] = {"random",70}; // "randomcenter",50
    };

    class Mo_cluster_Bomb_01_F;
    class Mo_cluster_Bomb_03_F : Mo_cluster_Bomb_01_F // BL-778 HE Cluster Submunition
    {
        aiAmmoUsageFlags = "64 + 128"; // "64 + 128 + 256"
        airFriction = -0.00005; // -0.0005
        caliber = 0.5; // 34
        hit = 9; // 70
        indirectHit = 7; // 12
        indirectHitRange = 10; // 6
    };

    class BombCore;
    class Bo_Mk82 : BombCore // Mk-82 Airburst
    {
        indirectHit = 70; // 1100
        indirectHitRange = 75; // 12
        suppressionRadiusHit = 210; // 100
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
        caliber = 45; // 56.6
        hit = 500; // 900
    };

    class ammo_Penetrator_PG_AT : ammo_Penetrator_Base // DAGR Submunition
    {
        caliber = 45; // 20
        hit = 500; // 450
    };

    class ammo_Penetrator_Rocket_04_AP : ammo_Penetrator_Base // Hydra 7x AP Submunition
    {
        caliber = 45; // 20
        hit = 500; // 435
    };

    class M_Scalpel_AT;
    class ACE_Hellfire_AGM114K : M_Scalpel_AT // AGM-114K
    {
        indirectHitRange = 1; // 4
        trackOversteer = 0.95; // 1
    };

    class ACE_Hellfire_AGM114N : ACE_Hellfire_AGM114K // AGM-114N
    {
        hit = 300; // 200
        indirectHit = 120; // 200
        indirectHitRange = 10; // 12
        trackOversteer = 0.95; // 1
    };

    class rhs_ammo_agm65;
    class rhs_ammo_agm65h : rhs_ammo_agm65 // AGM-65H CCD
    {
        indirectHitRange = 3; // 10.5
        lockSeekRadius = 1000; // 2000
    };

    class rhsusf_ammo_basic_penetrator;
    class rhs_ammo_agm65_penetrator : rhsusf_ammo_basic_penetrator // AGM-65H CCD Submunition
    {
        caliber = 145; // 73.3
        hit = 1500; // 320
        submunitionAmmo = ""; // "rhs_ammo_spall"
    };

    class B_127x99_Ball;
    class rhsusf_ammo_127x99_M33_Ball : B_127x99_Ball // 50.cal Long-Range Sniper
    {
        ACE_ballisticCoefficients[] = {2}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.35
        deflecting = 0; // 15
        explosive = 0.1; // 0
        explosionEffects = "RHS_ExploSmallAmmoExplosion"; // "ExplosionEffects"
        tracerEndTime = 8; // 3
        tracerStartTime = 0.85; // 0.05
    };

    class rhsusf_ammo_127x99_mk211 : rhsusf_ammo_127x99_M33_Ball // 50.cal HEIAP-T
    {
        ACE_ballisticCoefficients[] = {2}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.4
        caliber = 12.3; // 2.05761
        hit = 39.7; // 24.8085
        indirectHit = 24.8; // 4
        indirectHitRange = 0.9; // 2.76
    };

    class B_762x51_Ball;
    class ACE_762x51_Ball_M993_AP : B_762x51_Ball // 7.62mm Long-Range Sniper
    {
        ACE_ballisticCoefficients[] = {2}; // {0.359}
        tracerEndTime = 6; // 2.15957
    };

    class ACE_762x51_Ball_Subsonic : B_762x51_Ball // 7.62mm SDLV
    {
        ACE_ballisticCoefficients[] = {1.439}; // {0.235}
        audibleFire = 5; // 45
        dangerRadiusBulletClose = 1; // 8
        dangerRadiusHit = 1; // 12
        visibleFire = 0.5; // 3
        visibleFireTime = 0.5; // 2
    };

    class B_762x51_Minigun_Tracer_Red_splash : B_762x51_Ball // 7.62mm Miniguns Helis
    {
        caliber = 5.04; // 3.6
        explosionEffects = "RHS_ExploSmallAmmoExplosion"; // "ExplosionEffects"
        explosive = 0.2; // 0
        hit = 4.64; // 11.6
        indirectHit = 3.24; // 1.2
        indirectHitRange = 3.6; // 2
        tracerScale = 0.4; // 1.2
    };

    class M_PG_AT;
    class M_AT : M_PG_AT // Hydra 12x HE
    {
        hit = 100; // 300
        indirectHit = 20; // 50
        indirectHitRange = 18; // 8
        trackOversteer = 0.95; // 1
    };

    class MissileBase;
    class Rocket_04_HE_F : MissileBase // Hydra 7x HE
    {
        hit = 100; // 210
        indirectHit = 20; // 55
        indirectHitRange = 18; // 15
        trackOversteer = 0.95; // 1
    };

    class Rocket_04_AP_F : Rocket_04_HE_F // Hydra 7x AP
    {
        hit = 300; // 95
        indirectHit = 50; // 25
        trackOversteer = 0.95; // 1
    };

    class BulletBase;
    class Gatling_30mm_HE_Plane_CAS_01_F : BulletBase // A-10 GAU-8
    {
        caliber = 19; // 1.4
        indirectHit = 35; // 12
        indirectHitRange = 4.5; // 3
    };

    class rhs_ammo_762x51_M80_Ball : BulletBase // 100rnd 7.62x51mm + 100rnd 7.62x51mm Tracer
    {
        ACE_ballisticCoefficients[] = {0.9}; // {0.2}
        caliber = 1.25; // 1
        hit = 16; // 8
        indirectHit = 8; // 0
        indirectHitRange = 0.9; // 0
        suppressionRadiusBulletClose = 7; // 2
        suppressionRadiusHit = 12; // 4
    };

    class rhs_ammo_762x51_M61_AP : rhs_ammo_762x51_M80_Ball // 100rnd 7.62x51mm Tracer AP
    {
        caliber = 9.5; // 0.79
        indirectHit = 0;
        indirectHitRange = 0;
    };

    class B_556x45_Ball;
    class rhs_ammo_556x45_M855_Ball : B_556x45_Ball // 200rnd 5.56x45mm
    {
        caliber = 0.5; // 0.44
        indirectHit = 6; // 0
        indirectHitRange = 0.9; // 0
        suppressionRadiusBulletClose = 7; // 6
        suppressionRadiusHit = 12; // 8
    };

    class rhs_ammo_556x45_M855A1_Ball;
    class rhs_ammo_556x45_M855A1_Ball_Red : rhs_ammo_556x45_M855A1_Ball // 200rnd 5.56x45mm Tracer
    {
        caliber = 0.5; // 0.65
        indirectHit = 6; // 0
        indirectHitRange = 0.9; // 0
        suppressionRadiusBulletClose = 7; // 6
        suppressionRadiusHit = 12; // 8
    };
};
