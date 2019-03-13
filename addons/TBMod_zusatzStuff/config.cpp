class CfgPatches
{
    class TBMod_zusatzStuff
    {
        name = "TBMod ZusätzlicherStuff";

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "..\TBMod_main\script_macros_common.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\Cfg3DEN.hpp"
