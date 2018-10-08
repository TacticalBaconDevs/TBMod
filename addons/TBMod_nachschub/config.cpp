class CfgPatches
{
    class TBMod_nachschub
    {
        name = "TBMod Nachschub";
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
