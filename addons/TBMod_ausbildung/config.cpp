class CfgPatches
{
    class TBMod_ausbildung
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {};
        units[] = {};
        
        requiredVersion = 1.82;
        requiredAddons[] = {
            "A3_Data_F_Tank_Loadorder",
            "ace_main",
            "cba_main",
            "acex_main",
            "TBMod_main"
        };
        addonRootClass = "TBMod_main";
    };
};

class Extended_PostInit_EventHandlers
{
    class TBMod_ausbildung
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_ausbildung\XEH_postClientInit.sqf'";
    };
};

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "Cfg3DEN.hpp"
