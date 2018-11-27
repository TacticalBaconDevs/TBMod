/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBModExt_monitoring
    {
        author = "shukari";
        authorUrl = "tacticalbacon.de";
        
        requiredVersion = 1.84;
        requiredAddons[] = {
            "TBMod_main"
        };
        
        addonRootClass = "TBMod_main";
    };
};

#include "CfgFunctions.hpp"
#include "ExtendedEventHandlers.hpp"
