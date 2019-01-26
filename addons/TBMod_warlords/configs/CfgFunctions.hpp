/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_warlords
    {
        tag = "TB";

        class functions
        {
            file = "\TBMod_warlords\functions";
            class isWLMission {};
        };
    };


    // OVERRIDES
    class A3_Warlords
    {
        tag = "BIS";
        project = "arma3";

        class Warlords
        {
            class WLVarsInit
            {
                file = "\TBMod_warlords\replacement\fn_WLVarsInit.sqf";
            };
            class WLInit
            {
                file = "\TBMod_warlords\replacement\fn_WLInit.sqf";
            };
        };
    };
};