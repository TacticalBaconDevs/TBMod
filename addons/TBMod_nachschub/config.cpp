class CfgPatches
{
    class TBMod_nachschub
    {
        name = "TBMod Nachschub";
        
        requiredAddons[] = {
            "TBMod_main",
            "TBMod_Skins"
        };
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
