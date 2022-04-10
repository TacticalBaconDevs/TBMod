#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Network";

        requiredAddons[] = {"TBMod_common"};
        addonRootClass = "TBMod_common";
    };
};

PRELOAD_ADDONS;

// Configs
#include "configs\ExtendedEventHandlers.hpp"
