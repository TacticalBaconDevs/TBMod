class CfgPatches
{
    class TBMod_persistence
    {
        name = "TBMod Persistence";
        
        author = "Eric";
        
        requiredAddons[] = {
            "TBMod_main",
            "TBMod_building"
        };

        units[] = {
            "TB_zeus_persistence",
            "TB_eden_persistence"
        };

        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
