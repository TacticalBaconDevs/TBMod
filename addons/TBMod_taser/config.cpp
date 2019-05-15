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
#include "script_macros.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\ExtendedEventHandlers.hpp"
