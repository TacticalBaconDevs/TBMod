class CfgPatches
{
    class TBMod_unsung
    {
        name = "TBMod Unsung";
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredAddons[] = {
            "TBMod_nachschub",
            "uns_main"
        };
        addonRootClass = "TBMod_nachschub";
    };
};

// Configs
#include "CfgVehicles.hpp"
#include "CfgEditorSubcategories.hpp"
