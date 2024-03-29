#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Hauptmod";

        author = "TBMod-DevTeam";
        authors[] = {"shukari", "Eric Ruhland", "IDarky", "Eron", "mordl", "BenZockt"};
        url = "https://github.com/TacticalBaconDevs/TBMod";
        authorUrl = "https://github.com/TacticalBaconDevs/TBMod";
        license = "https://github.com/TacticalBaconDevs/TBMod/blob/master/LICENSE";

        VERSION_CONFIG;

        versionDesc = "TBMod";
        versionAct = "";

        units[] = {
            "TB_flag_rufnamen",
            "TB_flag_teleport",
            "TB_spezial_fobBase",
            "TB_editor_gBriefing",
            "TB_editor_kBriefing",
            "TB_UGV_01_rcws_F"
        };

        addonRootClass = "TBMod_common";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "TBMod_common",

            // Arma3
            "A3_Data_F_Oldman_Loadorder",
            "A3_Data_F_Mod_Loadorder",

            // CBA
            "cba_accessory",
            "cba_ai",
            "cba_arrays",
            "cba_common",
            "cba_diagnostic",
            "cba_disposable",
            "cba_ee",
            "cba_events",
            "cba_hashes",
            "cba_help",
            "cba_jam",
            "cba_jr",
            "cba_keybinding",
            "cba_main",
            "cba_main_a3",
            "cba_modules",
            "cba_music",
            "cba_network",
            "cba_optics",
            "cba_settings",
            "cba_statemachine",
            "cba_strings",
            "cba_ui",
            "cba_vectors",
            "cba_versioning",
            "cba_xeh",

            // TFAR
            "tfar_ai_hearing",
            "tfar_antennas",
            "tfar_backpacks",
            "tfar_core",
            "tfar_handhelds",
            "tfar_static_radios",
            // Reskins
            //"OPXT_TFAR",
            //"opxt_tfar_backpacks",
            //"OPXT_TFAR_ITEMS",

            // 3rd PartyMods
            "zen_main",
            //"3denEnhanced",
            //"adv_aceCPR",
            //"WarFXPE", // Blastcore ist clientside,
        
            // ACE3
            "ace_field_rations",
            "ace_headless",
            "ace_intelitems",
            "ace_sitting",
            "ace_viewrestriction",
            "ace_volume",
            "ace_advanced_ballistics",
            "ace_advanced_fatigue",
            "ace_advanced_throwing",
            "ace_ai",
            "ace_aircraft",
            "ace_apl",
            "ace_arsenal",
            "ace_artillerytables",
            "ace_atragmx",
            "ace_attach",
            "ace_backpacks",
            "ace_ballistics",
            "ace_captives",
            "ace_cargo",
            "ace_chemlights",
            "ace_common",
            "ace_concertina_wire",
            "ace_cookoff",
            "ace_csw",
            "ace_dagr",
            "ace_disarming",
            "ace_disposable",
            "ace_dogtags",
            "ace_dragging",
            "ace_dragon",
            "ace_explosives",
            "ace_fastroping",
            "ace_fcs",
            "ace_finger",
            "ace_flashlights",
            "ace_flashsuppressors",
            "ace_fonts",
            "ace_frag",
            "ace_gestures",
            "ace_gforces",
            "ace_goggles",
            "ace_grenades",
            "ace_gunbag",
            "ace_hearing",
            "ace_hellfire",
            "ace_hitreactions",
            "ace_hot",
            "ace_huntir",
            "ace_interaction",
            "ace_interact_menu",
            "ace_inventory",
            "ace_javelin",
            "ace_kestrel4500",
            "ace_laser",
            "ace_laserpointer",
            "ace_logistics_uavbattery",
            "ace_logistics_wirecutter",
            "ace_magazinerepack",
            "ace_main",
            "ace_map",
            "ace_maptools",
            "ace_map_gestures",
            "ace_markers",
            "ace_maverick",
            "ace_medical",
            "ace_medical_ai",
            "ace_medical_blood",
            "ace_medical_damage",
            "ace_medical_engine",
            "ace_medical_feedback",
            "ace_medical_gui",
            "ace_medical_statemachine",
            "ace_medical_status",
            "ace_medical_treatment",
            "ace_medical_vitals",
            "ace_metis",
            "ace_microdagr",
            "ace_minedetector",
            "ace_missileguidance",
            "ace_missionmodules",
            "ace_mk6mortar",
            "ace_modules",
            "ace_movement",
            "ace_mx2a",
            "ace_nametags",
            "ace_nightvision",
            "ace_nlaw",
            "ace_noidle",
            "ace_noradio",
            "ace_norearm",
            "ace_optics",
            "ace_optionsmenu",
            "ace_overheating",
            "ace_overpressure",
            "ace_parachute",
            "ace_pylons",
            "ace_quickmount",
            "ace_rangecard",
            "ace_realisticnames",
            "ace_realisticweights",
            "ace_rearm",
            "ace_recoil",
            "ace_refuel",
            "ace_reload",
            "ace_reloadlaunchers",
            "ace_repair",
            "ace_respawn",
            "ace_safemode",
            "ace_sandbag",
            "ace_scopes",
            "ace_slideshow",
            "ace_smallarms",
            "ace_spectator",
            "ace_spottingscope",
            "ace_switchunits",
            "ace_tacticalladder",
            "ace_tagging",
            "ace_thermals",
            "ace_trenches",
            "ace_tripod",
            "ace_ui",
            "ace_vector",
            "ace_vehiclelock",
            "ace_vehicles",
            "ace_viewdistance",
            "ace_weaponselect",
            "ace_weather",
            "ace_winddeflection",
            "ace_yardage450",
            "ace_zeus"
        };
    };
};

PRELOAD_ADDONS;

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgMods.hpp"
#include "configs\CfgSettings.hpp"
#include "configs\CfgUnitInsignia.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"

// Other config stuff
#include "gcam\gcam_component.hpp"
#include "configs\TB_RscHTML.hpp"
