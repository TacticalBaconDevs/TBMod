class CfgPatches
{
    class TBMod_liveMonitor
    {
        name = "TBMod LiveMonitor";
        
        author = "Chris";
        
        weapons[] = {"TB_liveMonitor_monitor"};
        
        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\RscTitles.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\ExtendedEventHandlers.hpp"
