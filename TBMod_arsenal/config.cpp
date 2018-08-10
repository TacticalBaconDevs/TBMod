class CfgPatches
{
    class TBMod_arsenal
    {
        addonRootClass = "TBMod_main";
        requiredAddons[] = {"TBMod_main"};

        units[] = {
            "TB_arsenal_base",
            "TB_arsenal_usa",
            "TB_arsenal_vanilla",
            "TB_arsenal_bw",
            "TB_arsenal_russ",
            "TB_arsenal_predefined_custom"
        };
    };
};

#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\Cfg3DEN.hpp"
#include "configs\ExtendedEventHandlers.hpp"
