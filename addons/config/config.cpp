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

        weapons[] = {
            "TB_weap_CMLauncher",
            "TB_weap_LWIRCM",
            "TB_SmokeLauncher_Heli"
        };

        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

// Configs
#include "configs\ACE_detector.hpp"
#include "configs\CBA_Stuff.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgCloudlets.hpp"
#include "configs\CfgCommands.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgFactionClasses.hpp"
//#include "configs\CfgGesturesMale.hpp" // TFAR Funkanim, siehe miscStuff
#include "configs\CfgMagazines.hpp"
#include "configs\CfgMagazineWells.hpp"
//#include "configs\CfgMovesBasic.hpp" // TFAR Funkanim, siehe miscStuff
#include "configs\CfgRecoils.hpp"
#include "configs\cfgScriptPaths.hpp"
#include "configs\CfgSounds.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeaponHandling.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\RscMapControl.hpp"
