/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgCloudlets
{
    class Default;

    class HeavyGunCartridge1;
    class TB_cloudlets_40mm_FV510 : HeavyGunCartridge1
    {
        bounceOnSurface = 0.2; // 0.1
        bounceOnSurfaceVar = 0.15; // 0.12
        moveVelocity[] = {"directionX*1","directionY*1","directionZ*9"}; // {"directionX/2","directionY/2","directionZ/2"};
        size[] = {5}; // {4}
    };
};

class TB_cloudlets_40mm_FV510
{
    class TB_cloudlets_40mm_FV510
    {
        simulation = "particles";
        type = "TB_cloudlets_40mm_FV510";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 0.05;
        qualityLevel = 2;
    };
}; 