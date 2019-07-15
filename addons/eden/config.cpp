#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod eden";

        units[] = {
            "TB_eden_frontverlauf",
            "TB_eden_atmoReinforcementLZ",
            "TB_eden_atmoReinforcementEndpoint",
            "TB_eden_atmoReinforcementCore",
            "TB_eden_atmoShootingRange",
            "TB_eden_atmoMortarSupport",
            "TB_eden_atmoMortarSuppression",
            "TB_eden_atmoFireSuppression",
            "TB_eden_atmoTarget"
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\Cfg3DEN.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgFactionClasses.hpp"
