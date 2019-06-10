/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAmmo
{
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
        tracerEndTime = 2;
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
};
