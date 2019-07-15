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
            "TBMod_skins"
        };

        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgCloudlets.hpp"
#include "CfgWeapons.hpp"
