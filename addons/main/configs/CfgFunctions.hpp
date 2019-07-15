/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    // REPLACEMENT
    class Achilles
    {
        class ui_f_eventHandler
        {
            class onDisplayCuratorLoad
            {
                file = QPATHTOF(replacement\fn_onDisplayCuratorLoad.sqf);
            };
        };
    };

    // REPLACEMENT - Experiment
    class A3_Modules
    {
        tag = "BIS";
        project = "arma3";

        class Environment
        {
            class moduleEditTerrainObject
            {
                file = QPATHTOF(replacement\init.sqf); // TODO: das ist kritisch ggf in 1.90 geupdated worden
            };
        };
    };
};
