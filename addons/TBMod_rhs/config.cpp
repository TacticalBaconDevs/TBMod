/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
class CfgPatches
{
    class TBMod_rhs
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {};
        units[] = {};
        
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
