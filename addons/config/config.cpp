#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Config";

        requiredAddons[] = {
            "TBMod_main"
        };

        vehicles[] = {
            "TB_Vehicles_L159_Albatros"
        };

        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\ACE_detector.hpp"
#include "configs\CBA_Stuff.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgCommands.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgFactionClasses.hpp"
#include "configs\CfgGesturesMale.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgMagazineWells.hpp"
#include "configs\CfgMovesBasic.hpp"
#include "configs\cfgScriptPaths.hpp"
#include "configs\CfgSounds.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\RscMapControl.hpp"
