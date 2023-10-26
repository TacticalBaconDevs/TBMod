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
        skipWhenMissingDependencies = 1;

        requiredAddons[] = {
            "TBMod_main",
            "rhsusf_main",
            "rhsusf_main_loadorder",
            "TBMod_skins"
        };

        vehicles[] = {
            "TB_Vehicles_MH6_SWAT"
        };

        addonRootClass = "TBMod_main";
        
        weapons[] = {
            "TB_rhs_weap_mk22_ASR"
        };
    };
};

PRELOAD_ADDONS;

// Configs
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgCloudlets.hpp"
#include "CfgWeapons.hpp"
