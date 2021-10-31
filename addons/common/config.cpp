#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Common";

        author = "TBMod-DevTeam";
        authors[] = {"shukari", "Eric Ruhland", "IDarky", "Eron", "mordl", "BenZockt"};
        url = "https://github.com/TacticalBaconDevs/TBMod";
        authorUrl = "https://github.com/TacticalBaconDevs/TBMod";
        license = "https://github.com/TacticalBaconDevs/TBMod/blob/master/LICENSE";

        VERSION_CONFIG;

        versionDesc = "TBMod";
        versionAct = "";

        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            // Arma3
            "A3_Data_F_Oldman_Loadorder",
            "A3_Data_F_Mod_Loadorder",

            // CBA
            "cba_common",
            "cba_main",
            "cba_main_a3",

            // ACE3
            "ace_common",
            "ace_main"
        };
    };
};

PRELOAD_ADDONS;
