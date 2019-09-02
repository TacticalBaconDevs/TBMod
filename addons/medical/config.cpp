#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_medical
    {
        name = "TBMod Medical";

        requiredAddons[] = {
            "TBMod_main"
        };

        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\ACE_Medical_Treatments.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\ExtendedEventHandlers.hpp"
