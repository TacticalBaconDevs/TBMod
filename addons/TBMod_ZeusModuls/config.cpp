/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_ZeusModuls
    {
        name = "TBMod Zeus Modules";
        
        units[] = {
            "TB_zeus_base",
            "TB_zeus_nachschubAbwurf",
            "TB_zeus_disablePath",
            "TB_zeus_prioSichtbarkeit",
            "TB_zeus_handleAsPlayerMedical",
            "TB_zeus_applyLoadout",
            "TB_zeus_handleAsPlayerMedical"
        };

        requiredAddons[] = {"TBMod_main", "TBMod_nachschub"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgFunctions.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
