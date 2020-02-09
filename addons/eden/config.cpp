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
            QGVAR(frontverlauf),
            QGVAR(atmoReinforcementLZ),
            QGVAR(atmoReinforcementEndpoint),
            QGVAR(atmoReinforcementCore),
            QGVAR(atmoShootingRange),
            QGVAR(atmoMortarSupport),
            QGVAR(atmoMortarSuppression),
            QGVAR(atmoFireSuppression),
            QGVAR(atmoTarget),
            QGVAR(atmoCarAlarm),
            QGVAR(radio),
            QGVAR(flares),
            QGVAR(injured),
            QGVAR(lockDoors),
            QGVAR(clearPlaceables)
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
