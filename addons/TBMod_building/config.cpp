class CfgPatches
{
    class TBMod_building
    {
        name = "TBMod Bauen";
        
        weapons[] = {};
        units[] = {
            "TB_zeus_ressourcenFahrzeug",
            "TB_zeus_kranFahrzeug"
        };
        ammo[] = {};
        
        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\CfgEden.hpp"
