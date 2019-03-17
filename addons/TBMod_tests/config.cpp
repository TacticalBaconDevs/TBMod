/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class TBMod_tests
    {
        name = "TBMod Tests";

        author = "shukari";
        authorUrl = "tacticalbacon.de";

        requiredVersion = 1.88;
        requiredAddons[] = {
            // Arma3
            "A3_Data_F_Sams_Loadorder",

            // CBA
            "cba_main",
            "cba_common",

            // ACE/ACEX
            "acex_main",
            "ace_common",
            "ace_main"
        };
    };
};

// Configs
#include "configs\CfgVehicles.hpp"