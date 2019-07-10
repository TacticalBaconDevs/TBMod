/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_persistence
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
#include "script_component.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
