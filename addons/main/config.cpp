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

        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
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
            "OPXT_TFAR",
            "opxt_tfar_backpacks",
            "OPXT_TFAR_ITEMS",

            // 3rd PartyMods
            "zen_main",
            "3denEnhanced",
            //"adv_aceCPR", // TODO: wird mit ACE 3.13.* nicht mehr unterstützt
            "acex_main",
            "WarFXPE",

            // ACE3
            "ace_advanced_ballistics",
            "ace_advanced_fatigue",
            "ace_advanced_throwing",
            "ace_ai",
            "ace_aircraft",
            "ace_apl",
            "ace_arsenal",
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
            "ace_dagr",
            "ace_disarming",
            "ace_disposable",
            "ace_dogtags",
            "ace_dragging",
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
            /*"ace_medical_damage", // NEW Ace Version
            "ace_medical_engine",
            "ace_medical_feedback",
            "ace_medical_gui",
            "ace_medical_statemachine",
            "ace_medical_status",
            "ace_medical_treatment",
            "ace_medical_vitals",*/
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

// Configs
#include "configs\Animations.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgFactionClasses.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgMagazineWells.hpp"
#include "configs\CfgMods.hpp"
#include "configs\CfgSettings.hpp"
#include "configs\CfgUnitInsignia.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CBA_Stuff.hpp"
#include "configs\CfgMisc.hpp"
#include "configs\ACE_detector.hpp"
#include "configs\CfgSounds.hpp"
#include "configs\CfgWeapons.hpp"

// Other config stuff
#include "gcam\gcam_component.hpp"
#include "configs\TB_RscHTML.hpp"

// TODO: Test, setzt das ACE3 nicht schon?!? und was sind Vanilla Werte?
// ACE MircoDagr: https://github.com/acemod/ACE3/blob/e5a15d200f44df5fccc0bc5575d18d80b35538dd/addons/microdagr/gui_controls.hpp#L48
// ACE Maps: https://github.com/acemod/ACE3/blob/e5a15d200f44df5fccc0bc5575d18d80b35538dd/addons/map/config.cpp#L39
class RscMapControl
{
    maxSatelliteAlpha = 0.5; // 0.85;
    colorBackground[] = {0.89999998,0.89999998,0.89999998,1}; // {0.969,0.957,0.949,1};
    colorCountlines[] = {0.64999998,0.52999997,0.30000001,1}; // {0.572,0.354,0.188,0.25};
    colorMainCountlines[] = {0.85000002,0,0}; // {0.572,0.354,0.188,0.5};
    colorLevels[] = {0,0,0,1}; // {0.286,0.177,0.094,0.5};
    sizeExLevel = 0.029999999; // 0.02;
    colorTracks[] = {1,0,0,1}; // {0.84,0.76,0.65,0.15};
    colorTracksFill[] = {1,1,0,1}; // {0.84,0.76,0.65,1};
    colorRoads[] = {0,0,0,1}; // {0.7,0.7,0.7,1};
    colorRoadsFill[] = {1,1,0,1}; // {1,1,1,1};
    colorMainRoads[] = {0,0,0,1}; // {0.9,0.5,0.3,1};
    colorMainRoadsFill[] = {1,0.60000002,0.40000001,1}; // {1,0.6,0.4,1};
};

class CfgCommands
{
    allowedHTMLLoadURIs[] += {
        "http://tacticalbacon.de*",
        "https://tacticalbacon.de*"
    };
};
