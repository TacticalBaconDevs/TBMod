/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_rhs
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";

        requiredVersion = 1.84;
        requiredAddons[] = {
            "TBMod_main",
            "rhsusf_main"
        };

        addonRootClass = "TBMod_main";
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazineWells.hpp"
// #include "CfgWeapons.hpp"
// #include "CfgRecoils.hpp"
