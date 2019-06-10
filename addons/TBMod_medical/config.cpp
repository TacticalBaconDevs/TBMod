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

#include "script_macros.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\ACE_Medical_Treatments.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
