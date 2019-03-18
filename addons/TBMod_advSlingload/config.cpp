/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_advSlingload
    {
        name = "TBMod ErweiteresSlingload";

        author = "Eric Ruhland";

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "..\TBMod_main\script_macros_common.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
