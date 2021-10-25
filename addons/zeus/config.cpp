#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod ZeusModules";

        units[] = {
            QGVAR(base),
            QGVAR(nachschubAbwurf),
            QGVAR(disablePath),
            QGVAR(prioSichtbarkeit),
            QGVAR(handleAsPlayerMedical),
            QGVAR(applyLoadout),
            QGVAR(moduleUnflipVehicle),
            QGVAR(adjustAceCargo),
            QGVAR(limitDamage),
            QGVAR(switchMove),
            QGVAR(defineAmmo),
            QGVAR(createTransmitter),
            QGVAR(setViewDistance),
            QGVAR(base_ki),
            QGVAR(ki_disablePath),
            QGVAR(ki_handleAsPlayerMedical),
            QGVAR(ki_applyLoadout),
            QGVAR(ki_injured)
        };

        requiredAddons[] = {
            "TBMod_main",
            "TBMod_nachschub"
        };
        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgFactionClasses.hpp"
#include "configs\ACE_ZeusActions.hpp"
#include "configs\CfgFunctions.hpp"