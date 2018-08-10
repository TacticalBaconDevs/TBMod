class CfgPatches
{
    class TBMod_main
    {
        name = "TBMod Hauptmod";
        author = "shukari";
        authorUrl = "tacticalbacon.de";

        version = 1.1.0;
        versionStr = "1.1.0";
        versionAr[] = {1,1,0};
        versionDesc = "TBMod";
        versionAct = "";

        weapons[] = {};
        units[] = {
                "TB_flag_base",
                "TB_flag_rufnamen",
                "TB_flag_teleport",
                "TB_flag_fob",
                "TB_zeus_base",
                "TB_zeus_nachschubAbwurf",
                "TB_zeus_disableVCOM",
                "TB_zeus_activateALIVE"
            };
        ammo[] = {
                "FlareBase",
                "F_40mm_White",
                "F_20mm_White",
                "Flare_82mm_AMOS_White"
            };

        requiredVersion = 1.82;
        requiredAddons[] = {
            // Arma3
            "A3_Data_F_Tank_Loadorder",

            // CBA
            "cba_main",
            "cba_common",

            // ACE/ACEX
            "acex_main",
            "ace_common",
            "ace_main",

            // TFAR
            "tfar_core",

            // 3rd PartyMods
            "achilles_functions_f_achilles",
            "3denEnhanced"
        };
    };
};

class CfgSettings
{
    class CBA
    {
        class Versioning
        {
            // This registers MyMod with the versioning system and looks for version info at CfgPatches -> MyMod_main
            class TBMod
            {
                // Optional: Manually specify the Main Addon for this mod
                main_addon = "TBMod_main"; // Uncomment and specify this to manually define the Main Addon (CfgPatches entry) of the mod

                // Optional: Add a custom handler function triggered upon version mismatch
                //handler = "myMod_fnc_mismatch"; // Adds a custom script function that will be triggered on version mismatch. Make sure this function is compiled at a called preInit, not spawn/execVM

                // Optional: Dependencies
                class Dependencies
                {
                   CBA[] = {"cba_main", {3,8,0}, "(true)"};
                };

                // Optional: Removed addons Upgrade registry
                // Example: myMod_addon1 was removed and it's important the user doesn't still have it loaded
                removed[] = {"TBMod_ausbildung"};
            };
        };
    };
};

class CfgMods
{
    class Mod_Base;
    class TBMod : Mod_Base
    {
        author = "shukari";
        
        picture = "\TBMod_main\pics\logo.paa";
        logo = "\TBMod_main\pics\logo.paa";
		logoOver = "\TBMod_main\pics\logo.paa";
		logoSmall = "\TBMod_main\pics\logo.paa";
        
        dlcColor[] = {0,0,0,1};
		fieldManualTopicAndHint[] = {};
        
        hidePicture = 0;
        hideName = 0;
        
		tooltip = "TBMod";
		tooltipOwned = "TBMod";
		name = "TacticalBacon Mod";
		overview = "Mod of the Group of Tacticalbacon.de";
		
		dir = "TBMod";
        
        actionName = "Website";
        action = "http://tacticalbacon.de/";
        description = "TacticalBacon Mod";
    };
};

class Extended_PostInit_EventHandlers
{
    class TBMod_main
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_postClientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_postServerInit.sqf'";
    };
};

class Extended_PreInit_EventHandlers
{
    class TBMod_main
    {
        init = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_preInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_preServerInit.sqf'";
    };
};

#include "Extended_Init_EventHandlers.hpp"
//#include "Extended_DisplayLoad_EventHandlers.hpp"
#include "Cfg3DEN.hpp"
#include "CfgUnitInsignia.hpp"
#include "gcam\gcam_component.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgEditorSubcategories.hpp"
#include "CfgEditorCategories.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgAmmo.hpp"

class RscDisplayGarage;
class TB_RscDisplayGarage: RscDisplayGarage
{
    enableSimulation = 1;
    icon = "\A3\Ui_f\data\Logos\a_64_ca.paa";
    idd = -1;
    logo = "\A3\Ui_f\data\Logos\arsenal_1024_ca.paa";
    onLoad = "['onLoad',_this,'TB_RscDisplayGarage','GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
    onUnload = "['onUnload',_this,'TB_RscDisplayGarage','GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
    scriptName = "TB_RscDisplayGarage";
    scriptPath = "TB_Main";
};
class cfgScriptPaths
{
    TB_Main = "\TBMod_main\functions\";
};
