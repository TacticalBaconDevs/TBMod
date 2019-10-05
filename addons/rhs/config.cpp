#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod RHS";

        requiredAddons[] = {
            "TBMod_main",
            "rhsusf_main",
            "rhsusf_main_loadorder",
            "TBMod_skins",
            "ace_advanced_ballistics",
            "ace_compat_rhs_usf3"
        };

        addonRootClass = "TBMod_main";
    };
};

// Ccnfigs
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgCloudlets.hpp"
#include "CfgWeapons.hpp"