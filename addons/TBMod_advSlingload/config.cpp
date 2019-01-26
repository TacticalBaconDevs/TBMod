class CfgPatches
{
    class TBMod_advSlingload
    {
        name = "TBMod Erweiteres Slingload";
        
        author = "Eric Ruhland";
        
        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
