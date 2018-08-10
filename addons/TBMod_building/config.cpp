class CfgPatches
{
    class TBMod_building
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {};
        units[] = {"TB_zeus_ressourcenFahrzeug", "TB_zeus_kranFahrzeug"};
        
        requiredVersion = 1.82;
        requiredAddons[] = {
            "A3_Data_F_Tank_Loadorder",
            "ace_main",
            "cba_main",
            "acex_main",
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgEden.hpp"
