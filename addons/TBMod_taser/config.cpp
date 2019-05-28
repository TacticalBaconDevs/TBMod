class CfgPatches
{
    class TBMod_taser
    {
        name = "TBMod Taser";

        author = "Eric Ruhland";

        weapons[] = {"TB_weap_taser"};

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "..\TBMod_main\script_macros_common.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\ExtendedEventHandlers.hpp"
