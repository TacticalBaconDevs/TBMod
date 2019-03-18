/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAmmo
{
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
        timeToLive = 500;
        coefGravity = 0.5;
    };

    class F_40mm_White: FlareBase
    {
        intensity = 1500000;
        brightness = 2000000;

        //flareSize = 12;
        useFlare = 1;
        timeToLive = 600;
        coefGravity = 0.5;
    };

    class Flare_82mm_AMOS_White: FlareCore
    {
        intensity = 4000000;
        brightness = 3000000;

        flareSize = 20;
        timeToLive = 1000;
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
