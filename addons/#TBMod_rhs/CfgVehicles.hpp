/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    
};

class CfgWeapons
{
    class rhs_weap_m4_Base;
    class rhs_weap_m4a1 : rhs_weap_m4_Base
    {
        class Single;
        class FullAuto;
    };
    
    class rhs_weap_m4a1_changeMode1 : rhs_weap_m4a1
    {
        recoil = "recoil_mxm";
        recoilProne = "assaultRifleBase";
        
        class Single : Single
        {
            recoil = "recoil_single_primary_1outof10";
            recoilProne = "recoil_single_primary_prone_1outof10";
        };
        class FullAuto : FullAuto
        {
            recoil = "recoil_auto_primary_1outof10";
            recoilProne = "recoil_auto_primary_prone_1outof10";
        };
    };
    
    class rhs_weap_m4a1_changeMode2 : rhs_weap_m4a1
    {
        recoil = "recoil_mxm";
        recoilProne = "assaultRifleBase";
        
        class Single : Single
        {
            recoil = "recoil_single_primary_10outof10";
            recoilProne = "recoil_single_primary_prone_10outof10";
        };
        class FullAuto : FullAuto
        {
            recoil = "recoil_auto_primary_10outof10";
            recoilProne = "recoil_auto_primary_prone_10outof10";
        };
    };
    
    class rhs_weap_m4a1_weaponRecoil1 : rhs_weap_m4a1
    {
        recoil = "recoil_tb";
        recoilProne = "assaultRifleBase";
    };
    
    class rhs_weap_m4a1_sway1 : rhs_weap_m4a1
    {
        swayDecaySpeed = 0.25;
        maxRecoilSway = 0.325;
    };
};

class CfgAmmo
{
    class SmokeShell;
    class G_40mm_Smoke : SmokeShell
    {
        simulation = "shotSmoke";
        deflecting = 0;
        deflectionSlowDown = 0.1;
        deflectionDirDistribution = 0;
    };
    
    class G_40mm_SmokeBlue : G_40mm_Smoke
    {
        simulation = "shotSmoke";
        deflecting = 0;
        deflectionSlowDown = 0.01;
        deflectionDirDistribution = 0;
    };
    
    class G_40mm_SmokeRed : G_40mm_Smoke
    {
        simulation = "shotSmoke";
        deflecting = 0;
        deflectionSlowDown = 1;
        deflectionDirDistribution = 0;
    };
};

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
