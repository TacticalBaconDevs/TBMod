/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgRecoils
{
    class TB_recoil_glock18
    {
        kickBack[] = {0.04,0.08};
        muzzleOuter[] = {0,0.45,0.2,0.2};
        permanent = 0.01;
        temporary = 0.005;
    };
    class TB_recoil_m249
    {
        kickBack[] = {0.005,0.01}; // {0.005,0.02}
        muzzleOuter[] = {0,0.4,0.35,0.1}; // {0.2,0.6,0.25,0.1}
        permanent = 0.04; // 0.06
        temporary = 0.01; // 0.02
    };
    class TB_recoil_m240
    {
        kickBack[] = {0.02,0.03}; // {0.02,0.08}
        muzzleOuter[] = {0,0.7,0.5,0.1}; // {0.5,1,0.7,0.3}
        permanent = 0.04; // 0.08
        temporary = 0.005; // 0.005
    };
    class TB_recoil_mk48
    {
        kickBack[] = {0.02,0.02}; // {0.01,0.03}
        muzzleOuter[] = {0,0.8,0.4,0.05}; // {0.1,0.3,0.2,0.2}
        permanent = 0.04; // "0.1*0.4"
        temporary = 0.0025; // 0.005
    };
    class TB_recoil_mk16
    {
        kickBack[] = {0.02,0.035};
        muzzleOuter[] = {0,0.6,0.2,0};
        permanent = 0.04;
        temporary = 0.02;
    };
    class TB_recoil_mk17
    {
        kickBack[] = {0.025,0.04};
        muzzleOuter[] = {0,0.7,0.3,0.1};
        permanent = 0.04;
        temporary = 0.02;
    };
};
