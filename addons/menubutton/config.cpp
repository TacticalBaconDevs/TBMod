#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Original idea/code: http://killzonekid.com/farewell-my-arma-friends/
    Modified for Spotlight: https://github.com/ampersand38/Server-Spotlight
    see https://community.bistudio.com/wiki/Arma_3_Main_Menu#Configuration_2
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod MenuButton";

        requiredAddons[] = {
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay
{
    class Spotlight
    {
        class TB_missionServer
        {
            text = "";
            textIsQuote = 0;
            picture = PATHTOF(button.paa);
            //video = "\a3\Ui_f\Video\spotlight_1_Apex.ogv";
            action = QUOTE([_this, 'server.tacticalbacon.de', '2302', 'tbm'] call COMPILE_FILE(joinServer)); // execVM QPATHTOF
            actionText = "Join TacticalBacon Server";
            condition = "true";
        };
    };
};
