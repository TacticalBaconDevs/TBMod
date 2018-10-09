class CfgPatches
{
    class TBMod_main
    {
        name = "TBMod Hauptmod";
        
        author = "shukari";
        authorUrl = "tacticalbacon.de";

        version = 1.1.2;
        versionStr = "1.1.2";
        versionAr[] = {1,1,2};
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
            "TB_zeus_disablePath",
            "TB_zeus_prioSichtbarkeit",
            "TB_zeus_handleAsPlayerMedical",
            "TB_zeus_applyLoadout",
            "TB_zeus_handleAsPlayerMedical"
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
            "achilles_language_f",
            "achilles_data_f_ares",
            "achilles_data_f_achilles",
            "achilles_functions_f_achilles",
            "achilles_settings_f",
            "3denEnhanced"
        };
    };
};

// Configs
#include "configs\Animations.hpp"
#include "configs\Cfg3DEN.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgFactionClasses.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgMagazineWells.hpp"
#include "configs\CfgMods.hpp"
#include "configs\CfgSettings.hpp"
#include "configs\CfgUnitInsignia.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"

// Other config stuff
#include "gcam\gcam_component.hpp"

// CBA STUFF
cba_settings_whitelist[] = {"76561198029318101", "admin"};
enableTargetDebug = 1;
enableDebugConsole[] = {"76561198029318101"};

class cfgScriptPaths
{
    TB_Main = "\TBMod_main\functions\";
    TB_replacement = "\TBMod_main\replacement\";
};

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

class RscDisplayCurator
{
    idd = 312;
    onLoad = "[_this select 0] call Achilles_fnc_onDisplayCuratorLoad;";
    onUnload = "[_this select 0] call Achilles_fnc_onDisplayCuratorUnload;";
    scriptName = "RscDisplayCurator";
    scriptPath = "TB_replacement";
};
