class CfgPatches
{
    class TBMod_arsenal
    {
        name = "TBMod Arsenal";
        
        units[] = {
            "TB_arsenal_base",
            "TB_arsenal_usa",
            "TB_arsenal_vanilla",
            "TB_arsenal_bw",
            "TB_arsenal_russ",
            "TB_arsenal_themen",
            "TB_arsenal_predefined_custom"
        };
        
        requiredAddons[] = {
            "TBMod_main",
            "TBMod_Skins"
        };
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\Cfg3DEN.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgEditorSubcategories.hpp"
