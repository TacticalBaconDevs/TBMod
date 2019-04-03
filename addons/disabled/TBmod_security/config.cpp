class CfgPatches
{
    class TBMod_security
    {
        author = "Eric Ruhland";
        authorUrl = "tacticalbacon.de";
        
        weapons[] = {};
        units[] = {};
        ammo[] = {};
        
        requiredVersion = 1.84;
        requiredAddons[] = {"TBMod_main"};
        
        addonRootClass = "TBMod_main";
    };
};

class Extended_PostInit_EventHandlers
{
    class TBMod_security
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_security\XEH_postClientInit.sqf'";
        serverinit = "call compile preprocessFileLineNumbers '\TBMod_security\XEH_postServerInit.sqf'";
    };
};

#include "CfgFunctions.hpp"
