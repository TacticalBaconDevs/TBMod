/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_bw
    {
        name = "TBMod BW";

        requiredAddons[] = {
            "TBMod_main",
            "bwa3_g82",
            "ace_advanced_ballistics"
        };

        addonRootClass = "TBMod_main";
    };
};

#include "script_macros.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"