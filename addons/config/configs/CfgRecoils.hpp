/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgRecoils
{
    class TB_recoil_glock18
    {
        kickBack[] = {0.04,0.08};
        muzzleOuter[] = {0.05,0.45,0.2,0.2};
        permanent = 0.01;
        temporary = 0.005;
    };
    class TB_recoil_m249 // noch unverändert
    {
        kickBack[] = {0.005,0.02}; // {0.005,0.02}
        muzzleOuter[] = {0.2,0.6,0.25,0.1}; // {0.2,0.6,0.25,0.1}
        permanent = 0.06; // 0.06
        temporary = 0.02; // 0.02
    };
};
