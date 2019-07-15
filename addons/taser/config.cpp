#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod Taser";

        author = "Eric Ruhland";

        weapons[] = {"TB_weap_taser"};

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgAmmo.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\ExtendedEventHandlers.hpp"
