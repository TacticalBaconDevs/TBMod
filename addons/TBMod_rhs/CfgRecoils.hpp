/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
class CfgRecoils
{
    class recoil_mxm;
    class recoil_tb : recoil_mxm
    {
        muzzleOuter[] = {"0.3*0.2","0.8*3","0.4*1","0.3*1"};
        permanent = "0.1*1";
        temporary = "0.01*3";
        kickBack[] = {"0.02*3","0.04*3"};
    };
};
