class CfgPatches
{
    class TBMod_ADVSlingload
    {
        name = "TBMod Arsenal";
        
        author = "Eric Ruhland";
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
