/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_ai
    {
        name = "TBMod AI";

        requiredAddons[] = {
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgAISkill.hpp"
#include "configs\CfgDifficulty.hpp"
#include "configs\CfgEventHandlers.hpp"
#include "configs\CfgSurfaces.hpp"
