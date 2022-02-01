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

class CfgMainMenuSpotlight
{
    class JoinServer
    {
        text = "TacticalBacon Server";
        picture = PATHTOF(button.paa);
        //action = QUOTE([_this, 'server.tacticalbacon.de', '2302', 'tbm'] call COMPILE_SCRIPT(joinServer)); // execVM QPATHTOF
        action = "connectToServer ['195.201.168.197', 2302, 'tbm']";
        actionText = "Join TacticalBacon Server";
        condition = "true";
    };
    delete ApexProtocol;
    delete BootCamp;
    delete EastWind;
    delete Orange_CampaignGerman;
    delete Orange_Showcase_IDAP;
    delete Orange_Showcase_LoW;
    delete Showcase_TankDestroyers;
    class Tacops_Campaign_01 { condition = "false";}; // Can´t be deleted
    delete Tacops_Campaign_02;
    delete Tacops_Campaign_03;
    delete Tanks_Campaign_01;
    delete gm_campaign_01;
    delete Contact_Campaign;
    delete OldMan;
    delete SP_FD14;
    delete Orange_Campaign;
    delete AoW_Showcase_AOW;
    delete AoW_Showcase_Future;
};
