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
            "TBMod_common"
        };
        addonRootClass = "TBMod_common";
    };
};

PRELOAD_ADDONS;

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay
{
    class Spotlight
    {
        class GVAR(missionServer)
        {
            text = "TacticalBacon Server";
            picture = PATHTOF(button.paa);
            //action = QUOTE([_this, 'server.tacticalbacon.de', '2302', 'tbm'] call COMPILE_SCRIPT(joinServer)); // execVM QPATHTOF
            action = "connectToServer ['195.201.168.197', 2302, 'tbm']";
            actionText = "Join TacticalBacon Server";
            condition = "true";
        };
    };
};
