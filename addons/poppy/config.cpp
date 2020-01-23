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
            QGVAR(poppy_01),
            QGVAR(poppy_02),
            QGVAR(poppy_03),
            QGVAR(poppy_04),
            QGVAR(poppy_05),
            QGVAR(poppy_06),
            QGVAR(poppy_07),
            QGVAR(poppy_08),
            QGVAR(poppy_09),
            QGVAR(poppy_10)
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgLoadouts.hpp"
