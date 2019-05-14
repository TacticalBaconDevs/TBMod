/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_eden
    {
        name = "TBMod eden";

        units[] = {
            "TB_eden_frontverlauf",
            "TB_eden_atmoReinforcementLZ", "TB_eden_atmoLZ",
            "TB_eden_atmoReinforcementEndpoint", "TB_eden_endpoint",
            "TB_eden_atmoReinforcementCore", "TB_eden_atmoCore",
            "TB_eden_atmoShootingRange"
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "..\TBMod_main\script_macros_common.hpp"
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\Cfg3DEN.hpp"
#include "configs\ExtendedEventHandlers.hpp"
