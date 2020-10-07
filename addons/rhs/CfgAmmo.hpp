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

    class rhs_ammo_agm65;
    class rhs_ammo_agm65h : rhs_ammo_agm65 // AGM-65H CCD
    {
        cameraViewAvailable = 1; // 0
    };

    class MissileBase;
    class RHS_Ammo_DAGR : MissileBase // DAGR RHS
    {
        maneuvrability = 22; // 14
    };

    class B_127x99_Ball;
    class rhsusf_ammo_127x99_M33_Ball : B_127x99_Ball // 50.cal Long-Range Sniper
    {
        ACE_ballisticCoefficients[] = {1.34}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.35
        deflecting = 0; // 15
        explosive = 0.1; // 0
        explosionEffects = "RHS_ExploSmallAmmoExplosion"; // "ExplosionEffects"
        tracerEndTime = 8; // 3
        tracerStartTime = 0.85; // 0.05
    };

    class rhsusf_ammo_127x99_mk211 : rhsusf_ammo_127x99_M33_Ball // 50.cal HEIAP-T
    {
        ACE_ballisticCoefficients[] = {1.34}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.4
        caliber = 3.4; // 2.05761
        hit = 50; // 24.8085
    };

    class rhs_ammo_762x51_M118_Special_Ball;
    class rhs_ammo_762x51_M118_Special_Ball_LRS : rhs_ammo_762x51_M118_Special_Ball // 7.62mm Long-Range Sniper
    {
        ACE_ballisticCoefficients[] = {0.718}; // {0.359}
        tracerEndTime = 6; // 1.5
    };

    class rhs_ammo_762x51_M80_Ball;
    class rhs_ammo_762x51_M80A1EPR_Ball : rhs_ammo_762x51_M80_Ball // 7.62mm SDLV
    {
        ACE_ballisticCoefficients[] = {0.4}; // {0.2}
        audibleFire = 5; // 18
        dangerRadiusBulletClose = 1; // 8
        dangerRadiusHit = 1; // 12
        explosionEffects = "ExplosionEffects";
        visibleFire = 0.5; // 22
        visibleFireTime = 0.5; // 3
    };

    class B_762x51_Ball;
    class B_762x51_Minigun_Tracer_Red_splash : B_762x51_Ball // 7.62mm Miniguns Helis
    {
        explosionEffects = "RHS_ExploSmallAmmoExplosion"; // "ExplosionEffects"
        explosive = 0.2; // 0
        hit = 4.64; // 11.6
        indirectHit = 3.24; // 1.2
        indirectHitRange = 3.6; // 2
        tracerScale = 0.4; // 1.2
    };

    class B_556x45_Ball;
    class rhs_ammo_556x45_M855_Ball : B_556x45_Ball // 200rnd 5.56x45mm
    {
        suppressionRadiusBulletClose = 4; // 6
        suppressionRadiusHit = 7; // 8
    };

    class rhs_ammo_762x51_M61_AP : rhs_ammo_762x51_M80_Ball // 100rnd M240 Box M61 AP
    {
        ACE_ballisticCoefficients[] = {0.35}; // {0.2}
        caliber = 0.8; // 0.65
        hit = 20; // 12.55
        suppressionRadiusBulletClose = 8; // 2
        suppressionRadiusHit = 14; // 4
    };

    class rhs_ammo_762x51_M62_tracer : rhs_ammo_762x51_M80_Ball // 100rnd M240 Box M62 AP Tracer
    {
        ACE_ballisticCoefficients[] = {0.35}; // {0.2}
        caliber = 0.8; // 0.45
        hit = 20; // 11
        suppressionRadiusBulletClose = 8; // 2
        suppressionRadiusHit = 14; // 4
    };

    class RocketBase;
    class rhs_ammo_maaws_HE : RocketBase // FFV441 HE MAAWS
    {
        indirectHitRange = 15; // 11
        suppressionRadiusHit = 65; // 30
    };

    class rhs_ammo_M136_rocket : RocketBase // M136 HEAT
    {
        hit = 20; // 235
    };

    class rhs_ammo_M136_hedp_rocket : rhs_ammo_M136_rocket // M136 HEDP
    {
        hit = 20; // 235
    };

    class rhsusf_ammo_basic_penetrator;
    class rhs_ammo_M136_penetrator : rhsusf_ammo_basic_penetrator // M136 HEAT CS Submunition
    {
        hit = 80; // 290
        caliber = 20; // 26.6667
    };

    class rhs_ammo_M136_hp_penetrator : rhs_ammo_M136_penetrator // M136 HEAT Submunition
    {
        hit = 90; // 290
        caliber = 20; // 36.6667
    };

    class rhs_ammo_M136_hedp_penetrator : rhs_ammo_M136_penetrator // M136 HEDP Submunition
    {
        hit = 70; // 235
    };

    class rhs_ammo_m72a7_rocket : rhs_ammo_M136_hedp_rocket // M72A7
    {
        CraterEffects = "ArtyShellCrater"; // "ATRocketCrater"
        explosionEffects = "MortarExplosion"; // "ATRocketExplosion"
        explosive = 1; // 0.65
        indirectHit = 30; // 19
        indirectHitRange = 8; // 4.1
        hit = 50; // 145
        submunitionAmmo = ""; // "rhs_ammo_M136_hedp_penetrator"
        suppressionRadiusHit = 65; // 30
    };

    class Missile_AA_04_F;
    class rhs_ammo_r27_base : Missile_AA_04_F // R27 Reihe
    {
        cmImmunity = 0.8; // 0.9 und 0.885
    };

    class rhs_ammo_r60_base : Missile_AA_04_F // R60 Reihe
    {
        cmImmunity = 0.8; // 0.9
    };

    class rhs_ammo_r73 : Missile_AA_04_F // R73 Reihe
    {
        cmImmunity = 0.8; // 0.9 und 0.92
    };

    class rhs_ammo_Sidewinder_AA : Missile_AA_04_F // AIM9
    {
        cmimmunity = 0.86; // 0.96
    };

    class rhs_ammo_aim120 : rhs_ammo_Sidewinder_AA // AIM120
    {
        cmimmunity = 0.82; // 0.92
    };

    class rhs_ammo_r77 : rhs_ammo_r73 // R77 Reihe
    {
        cmimmunity = 0.89; // 0.89 und 0.94
    };

    class rhs_ammo_r73m;
    class rhs_ammo_r74 : rhs_ammo_r73m // R74 Reihe
    {
        cmimmunity = 0.83; // 0.92
    };

    class rhs_ammo_9k32;
    class rhs_ammo_9k38 : rhs_ammo_9k32 // Igla
    {
        cmimmunity = 0.8; // 0.9
    };
};