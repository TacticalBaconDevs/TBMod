/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_eos
    {
        name = "TBMod EOS";

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "script_component.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgFunctions.hpp"
