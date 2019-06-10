/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Original idea/code: http://killzonekid.com/farewell-my-arma-friends/
    Modified for Spotlight: https://github.com/ampersand38/Server-Spotlight
*/
class CfgPatches
{
    class TBMod_menubutton
    {
        name = "TBMod MenuButton";

        requiredAddons[] = {
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay
{
    class Spotlight
    {
        class TB_missionServer
        {
            text = ""; // Text displayed on the square button, converted to upper-case
            textIsQuote = 0; // 1 to add quotation marks around the text
            picture = "\TBMod_menubutton\button.paa"; // Square picture, ideally 512x512
            //video = "\a3\Ui_f\Video\spotlight_1_Apex.ogv"; // Video played on mouse hover
            action = "0 = [_this, 'server.tacticalbacon.de', '2302', 'TacticalBacon'] execVM '\TBMod_menubutton\joinServer.sqf';";
            actionText = "Join TacticalBacon Server"; // Text displayed in top left corner of on-hover white frame
            condition = "true"; // Condition for showing the spotlight
        };
    };
};

#include "script_macros.hpp"