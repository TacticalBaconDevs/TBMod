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
            "rhsusf_main",
            "TBMod_skins",
            "ace_advanced_ballistics",
            "ace_compat_rhs_usf3"
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
#include "CfgWeapons.hpp"
