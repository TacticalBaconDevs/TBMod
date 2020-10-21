/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAmmo
{
    class BWA3_B_127x99_Ball;
    class BWA3_B_127x99_Ball_Raufoss : BWA3_B_127x99_Ball // 50.cal Long-Range Sniper BW
    {
        caliber = 2.5; // 5.2
        explosive = 0.1; // 0
        hit = 24; // 31.5
        indirectHit = 30; // 0
        indirectHitRange = 0.6; // 0
        tracerEndTime = 8; // 3
        tracerStartTime = 0.5; // 0.05
    };

    class BWA3_B_127x99_Ball_Raufoss_Tracer_Dim : BWA3_B_127x99_Ball_Raufoss // 50.cal HEIAP-T BW
    {

        caliber = 2.8; // 2.6
        hit = 35; // 30
        indirectHit = 30; // 12
        indirectHitRange = 0.6; // 0.3
    };

    class B_338_Ball;
    class BWA3_B_86x70_Ball : B_338_Ball // G29
    {
        ACE_ballisticCoefficients[] = {0.675}; // {0.322} BWMod hat falschen BC verwendet
        hit = 20; // 16
    };
};
