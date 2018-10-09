class CfgPatches
{
    class TBMod_zusatzStuff
    {
        name = "TBMod ZusätzlicherStuff";
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\Cfg3DEN.hpp"
