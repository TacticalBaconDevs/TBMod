/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_vz99
    {
        name = "TBMod vz99";

        author = "Potato";
        authors[] = {"PabstMirror"};
        authorUrl = "https://github.com/BourbonWarfare/POTATO";

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";

        units[] = {"TB_vz99_mortar", "TB_vz99_box"};
        weapons[] = {"TB_vz99_carryWeapon"};
        magazines[] = {
            "TB_vz99_HE",
            "TB_vz99_HE_multi",
            "TB_vz99_HE_multi_charge0",
            "TB_vz99_HE_PRX",
            "TB_vz99_HE_PRX_charge0",
            "TB_vz99_smokeWhite",
            "TB_vz99_smokeWhite_charge0",
            "TB_vz99_smokeRed",
            "TB_vz99_smokeRed_charge0",
            "TB_vz99_flare",
            "TB_vz99_flare_charge0"
        };
        ammo[] = {
            "TB_vz99_deploy_smokeWhite",
            "TB_vz99_deploy_smokeRed",
            "TB_vz99_ammo_smokeWhite",
            "TB_vz99_ammo_smokeRed",
            "TB_vz99_ammo_flare",
            "TB_vz99_ammo_he",
            "TB_vz99_ammo_he_airburst"
        };
    };
};

// Configs
#include "..\TBMod_main\script_macros_common.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\CfgAmmo.hpp"
#include "configs\CfgMagazines.hpp"
#include "configs\CfgFunctions.hpp"
