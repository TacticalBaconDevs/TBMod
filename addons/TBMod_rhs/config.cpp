/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_rhs
    {
        name = "TBMod RHS";

        requiredAddons[] = {
            "TBMod_main",
            "rhsusf_main"
        };

        addonRootClass = "TBMod_main";
    };
};

#include "script_macros.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgCloudlets.hpp"
