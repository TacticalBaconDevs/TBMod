#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Persistence";

        author = "Eric";

        units[] = {
            "TB_zeus_persistence",
            "TB_eden_persistence"
        };

        requiredAddons[] = {
            "TBMod_main",
            "TBMod_building"
        };
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
