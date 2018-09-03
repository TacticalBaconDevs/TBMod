class CfgPatches
{
    class TBMod_zusatzStuff
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredVersion = 1.82;
        requiredAddons[] = {
            "A3_Data_F_Tank_Loadorder",
            "ace_main",
            "cba_main",
            "acex_main",
            "achilles_functions_f_achilles",
            "TBMod_main",
            "3denEnhanced"
        };
        
        addonRootClass = "TBMod_main";
    };
};

class Extended_PostInit_EventHandlers
{
    class TBMod_zusatzStuff
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_zusatzStuff\XEH_postClientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_zusatzStuff\XEH_postServerInit.sqf'";
    };
};

#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"
#include "Cfg3DEN.hpp"
// #include "LV\config_aissp.hpp"
