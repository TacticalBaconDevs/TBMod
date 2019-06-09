/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_main
    {
        name = "TBMod Hauptmod";

        author = "TBMod-DevTeam";
        authors[] = {"shukari", "Eric Ruhland", "IDarky", "Eron", "mordl", "BenZockt"};
        url = "https://github.com/TacticalBaconDevs/TBMod";
        authorUrl = "https://github.com/TacticalBaconDevs/TBMod";
        license = "https://github.com/TacticalBaconDevs/TBMod/blob/master/LICENSE";

        version = 1.3.5;
        versionStr = "1.3.5";
        versionAr[] = {1,3,5};
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

        requiredVersion = 1.92;
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
            "3denEnhanced",
            "adv_aceCPR"
        };
    };
};

// Configs
#include "script_macros_common.hpp"
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
#include "configs\CfgWeapons.hpp"
#include "configs\ACE_Medical_Treatments.hpp"
#include "configs\ACE_detector.hpp"
#include "configs\CfgSounds.hpp"

// Other config stuff
#include "gcam\gcam_component.hpp"
