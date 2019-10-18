/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    // OVERRIDES
    class A3_Warlords
    {
        tag = "BIS";
        project = "arma3";

        class Warlords
        {
            #define WL_FNC(name) class name \
                { \
                    file = QPATHTOF(replacement\fn_##name##.sqf); \
                }

            WL_FNC(WLVarsInit);
            WL_FNC(WLInit);
            WL_FNC(WLClientInit);
            WL_FNC(WLParseAssetList);
        };
    };
};
