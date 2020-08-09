#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Arsenal";

        units[] = {
            "TB_arsenal_base",
            "TB_arsenal_usa",
            "TB_arsenal_uk",
            "TB_arsenal_vanilla",
            "TB_arsenal_bw",
            "TB_arsenal_russ",
            "TB_arsenal_themen",
            "TB_arsenal_predefined_custom"
        };

        requiredAddons[] = {
            "TBMod_main",
            "TBMod_skins"
        };
        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\Cfg3DEN.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgEditorSubcategories.hpp"
