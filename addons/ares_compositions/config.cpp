#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod AresCompositions";
        author = "Anton Struyk";
        url = "https://github.com/astruyk/Ares";
        authorUrl = "https://github.com/astruyk/Ares";

        requiredAddons[] = {
            "TBMod_main"
        };

        addonRootClass = "TBMod_main";
    };
};

PRELOAD_ADDONS;

// Configs
class CfgGroups
{
    #include "compositions.hpp"
};
