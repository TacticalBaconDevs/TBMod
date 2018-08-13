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
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredVersion = 1.84;
        requiredAddons[] = {
            "TBMod_main",
            "rhsusf_main"
        };
        
        addonRootClass = "TBMod_main";
    };
};

#include "CfgVehicles.hpp"
