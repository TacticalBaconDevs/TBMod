/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBModExt_statstracker
    {
        name = "TBModExt Statstracker";

        requiredAddons[] = {
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

#include "ExtendedEventHandlers.hpp"
