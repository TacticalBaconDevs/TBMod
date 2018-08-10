class CfgPatches
{
    class TBMod_nachschub
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {};
        units[] = {};
        
        requiredVersion = 1.82;
        requiredAddons[] = {
            "A3_Data_F_Tank_Loadorder",
            "ace_main",
            "cba_main",
            "acex_main",
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"
