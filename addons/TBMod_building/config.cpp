class CfgPatches
{
    class TBMod_building
    {
        name = "TBMod Bauen";

        units[] = {
            "TB_zeus_ressourcenFahrzeug",
            "TB_zeus_kranFahrzeug"
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "..\TBMod_main\script_macros_common.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\CfgEden.hpp"
#include "configs\ExtendedEventHandlers.hpp"
