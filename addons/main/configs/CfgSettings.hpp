/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/wiki/Versioning-System
*/
class CfgSettings
{
    class CBA
    {
        class Versioning
        {
            class ADDON
            {
                main_addon = "TBMod_main";

                class Dependencies
                {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};
                    ACE[] = {"ace_main", REQUIRED_ACE_VERSION, "(true)"};
                };

                removed[] = {"TBMod_ausbildung", "TBMod_items", "TBMod_zusatzStuff"};
            };
        };
    };
};
