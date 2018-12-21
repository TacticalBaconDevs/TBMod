class CfgPatches
{
    class TBMod_swop
    {
        name = "TBMod SWOP";

        requiredAddons[] = {
            "TBMod_nachschub",
            "SWOP_Main",
            "tfar_core"
        };
        addonRootClass = "TBMod_nachschub";
    };
};

// Configs
#include "CfgVehicles.hpp"
#include "CfgEditorSubcategories.hpp"
