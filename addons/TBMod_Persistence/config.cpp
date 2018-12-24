class CfgPatches
{
    class TBMod_persistence
    {
        name = "TBMod Persistence";
        
        author = "Eric";
        
        

        requiredAddons[] = {"TBMod_main",
                            "TBMod_building"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"