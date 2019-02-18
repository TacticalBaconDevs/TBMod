/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_main
    {
        name = "TBMod Hauptmod";

        author = "shukari";
        authorUrl = "tacticalbacon.de";

        version = 1.2.10;
        versionStr = "1.2.10";
        versionAr[] = {1,2,10};
        versionDesc = "TBMod";
        versionAct = "";

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

        requiredVersion = 1.88;
        requiredAddons[] = {
            // Arma3
            "A3_Data_F_Sams_Loadorder",

            // CBA
            "cba_main",
            "cba_common",

            // ACE/ACEX
            "acex_main",
            "ace_common",
            "ace_main",

            // TFAR
            "tfar_core",
            // Reskins
            "OPXT_TFAR",
            "opxt_tfar_backpacks",

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
#include "configs\CBA_Stuff.hpp"
#include "configs\CfgMisc.hpp"
#include "configs\ACE_Medical_Treatments.hpp"

// Other config stuff
#include "gcam\gcam_component.hpp"
