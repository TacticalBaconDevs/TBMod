/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_rhs
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {"rhs_weap_m4a1_changeMode1","rhs_weap_m4a1_changeMode2","rhs_weap_m4a1_weaponRecoil1", "rhs_weap_m4a1_sway1"};
        units[] = {};
        ammo[] = {"G_40mm_Smoke","G_40mm_SmokeBlue","G_40mm_SmokeRed"};
        
        requiredVersion = 1.84;
        requiredAddons[] = {
            "TBMod_main",
            "rhsusf_main"
        };
        
        addonRootClass = "TBMod_main";
    };
};

#include "CfgVehicles.hpp"
