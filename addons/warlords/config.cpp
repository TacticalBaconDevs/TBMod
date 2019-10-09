#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Warlords";

        units[] = {
            "ModuleWLInit_F",
            "ModuleWLSector_F"
        };

        requiredAddons[] = {
            "TBMod_main",
            "TBMod_nachschub",
            "A3_Data_F_Warlords",
            "A3_Modules_F_Warlords",
            "A3_Functions_F_Warlords"
        };
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgWLRequisitionPresets.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgEditorSubcategories.hpp"
