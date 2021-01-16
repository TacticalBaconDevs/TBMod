/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgRecoils
{
    class TB_recoil_glock17
    {
        kickBack[] = {"0.03*1.4","0.06*1.4"};
        muzzleOuter[] = {"0.2*0.2","1*1","0.2*1","0.3*1"};
        permanent = "0.1*0.4";
        temporary = "0.03*1.2";
    };
    class TB_recoil_glock18
    {
        kickBack[] = {0.04,0.08};
        muzzleOuter[] = {0.05,0.45,0.2,0.2};
        permanent = 0.01;
        temporary = 0.005;
    };
};
