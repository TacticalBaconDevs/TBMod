#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Poppy";

        author = "BaerMitUmlaut";

        units[] = {
            QGVAR(opfor_01),
            QGVAR(opfor_02),
            QGVAR(opfor_03),
            QGVAR(opfor_04),
            QGVAR(opfor_05),
            QGVAR(opfor_06),
            QGVAR(opfor_07),
            QGVAR(opfor_08),
            QGVAR(opfor_09),
            QGVAR(opfor_10),
            QGVAR(blufor_01),
            QGVAR(blufor_02),
            QGVAR(blufor_03),
            QGVAR(blufor_04),
            QGVAR(blufor_05),
            QGVAR(blufor_06),
            QGVAR(blufor_07),
            QGVAR(blufor_08),
            QGVAR(blufor_09),
            QGVAR(blufor_10),
            QGVAR(ind_01),
            QGVAR(ind_02),
            QGVAR(ind_03),
            QGVAR(ind_04),
            QGVAR(ind_05),
            QGVAR(ind_06),
            QGVAR(ind_07),
            QGVAR(ind_08),
            QGVAR(ind_09),
            QGVAR(ind_10)
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgLoadouts.hpp"
#include "configs\CfgGroups.hpp"
