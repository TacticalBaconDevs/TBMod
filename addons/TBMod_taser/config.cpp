class CfgPatches
{
    class TBMod_taser
    {
        author = "Eric Ruhland";
        authorUrl = "tacticalbacon.de";
        
        weapons[] =
        {
            "TB_weap_taser"
        };
        units[] = {};
        ammo[] = {};
        
        requiredVersion = 1.84;
        requiredAddons[] = {"TBMod_main"};
        
        addonRootClass = "TBMod_main";
    };
};

class Extended_PostInit_EventHandlers
{
    class TBMod_taser
    {
        init = "call compile preprocessFileLineNumbers '\TBMod_taser\XEH_postInit.sqf'";
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
