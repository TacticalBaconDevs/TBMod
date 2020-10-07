/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAmmo
{
    class BWA3_B_127x99_Ball;
    class BWA3_B_127x99_Ball_Raufoss : BWA3_B_127x99_Ball // 50.cal Long-Range Sniper BW
    {
        ACE_ballisticCoefficients[] = {1.34}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.35
        caliber = 1.02533; // 5.2
        deflecting = 0; // 15
        explosive = 0.1; // 0
        hit = 25.3075; // 31.5
        tracerEndTime = 8; // 3
        tracerStartTime = 0.85; // 0.05
    };

    class BWA3_B_127x99_Ball_Raufoss_Tracer_Dim : BWA3_B_127x99_Ball_Raufoss // 50.cal HEIAP-T BW
    {
        ACE_ballisticCoefficients[] = {1.34}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.35
        caliber = 3.4; // 2.6
        hit = 50; // 30
        indirectHit = 24.8; // 12
        indirectHitRange = 0.9; // 0.3
        nvgOnly = 0; // 1
    };

    class B_338_Ball;
    class BWA3_B_86x70_Ball : B_338_Ball // G29
    {
        ACE_ballisticCoefficients[] = {0.718}; // {0.322}
        hit = 24; // 16
    };
};
