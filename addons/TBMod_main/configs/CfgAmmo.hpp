# define ADD_PRECISE_SMOKE(TYPE) class TYPE; \
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
    class FlareCore;
    class FlareBase: FlareCore {
        intensity = 250000;
        flareSize = 12;
        timeToLive = 180;
    };
    
    class F_20mm_White: FlareBase {
        intensity = 800000;
        brightness = 1000000;
        
        //flareSize = 12;
        useFlare = 1;
        timeToLive = 500;
        coefGravity = 0.5;
    };

    class F_40mm_White: FlareBase {
        intensity = 1500000;
        brightness = 2000000;
        
        //flareSize = 12;
        useFlare = 1;
        timeToLive = 600;
        coefGravity = 0.5;
    };

    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 4000000;
        brightness = 3000000;
        
        flareSize = 20;
        timeToLive = 1000;
        coefGravity = 0.3;
    };

    class SmokeShell;
    class TB_SmokeShell: SmokeShell {
        smokeColor[] = {0.1183,0.1867,1,1};
        
        effectsSmoke = "TB_SmokeWhiteEffect";
       
    };
    
    // Vanilla
    ADD_PRECISE_SMOKE(G_40mm_Smoke);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeBlue);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeGreen);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeOrange);
    // ADD_PRECISE_SMOKE(G_40mm_SmokePurple);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeRed);
    // ADD_PRECISE_SMOKE(G_40mm_SmokeYellow);
};

class TB_SmokeWhiteEffect
{
   class TB_SmokeWhite
   {
        simulation = "particles";   //type of simulation - particles or light
        type = "Default";           //name of PE's class defined in CfgCloudlets or light's class defined in CfgLights
        position[] = {0, 0, 0};     //position related to the default position or memorypoint
        intensity = 1;
        angle = 0;
        angleVar = 360;
        animationSpeed[] = {1};
        animationSpeedCoef = 1;
        blockAIVisibility = 1;
        circleVelocity[] = {0,0,0};
        color[] = {[1,1,1,1],[1,1,1,0]};
        colorCoef[] = {"colorR","colorG","colorB","colorA"};
        colorVar[] = {0,0,0,0.35};
        interval = 0.14;
        lifeTime = 4;
        lifeTimeVar = 0.5;
        MoveVelocityVar[] = {0.2,0.2,0.2};
        rotationVelocityVar = 20;
        rubbing = 0.3;
        size[] = {0.3,3};
        sizeCoef = 1;
        sizeVar = 0.5;
        timerPeriod = 1;
        volume = 7.9;
        weight = 10.1;
    };
   class SmokeShell
   {
         simulation = "particles";   //type of simulation - particles or light
        type = "SmokeShellWhite";           //name of PE's class defined in CfgCloudlets or light's class defined in CfgLights
        position[] = {0, 0, 0};     //position related to the default position or memorypoint
        intensity = 1;
        angle = 0;
        angleVar = 360;
        animationSpeed[] = {1};
        animationSpeedCoef = 1;
        blockAIVisibility = 1;
        circleVelocity[] = {0,0,0};
        color[] = {[1,1,1,1],[1,1,1,0]};
        colorCoef[] = {"colorR","colorG","colorB","colorA"};
        colorVar[] = {0,0,0,0.35};
        interval = 0.14;
        lifeTime = 4;
        lifeTimeVar = 0.5;
        MoveVelocityVar[] = {0.2,0.2,0.2};
        rotationVelocityVar = 20;
        rubbing = 0.3;
        size[] = {0.3,3};
        sizeCoef = 1;
        sizeVar = 0.5;
        timerPeriod = 1;
        volume = 7.9;
        weight = 10.1;
   };
};