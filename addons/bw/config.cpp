#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod BW";

        requiredAddons[] = {
            "TBMod_main",
            "bwa3_g82",
            "bwa3_comp_ace"
        };

        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

// Configs
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
