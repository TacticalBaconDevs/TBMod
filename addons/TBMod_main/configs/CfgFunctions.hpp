/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_main
    {
        tag = ADDONTAG;

        class functions
        {
            file = "\TBMod_main\functions";

            class upDown {};
            class teleport {};
            class safe {};
            class actionTeleportKamerad {};
            class insertChildrenFOB {};
            class insertChildrenKameraden {};
            class modifierFOBs {};
            class displayName {};
            class isTBMission {};
            class insertChildrenGruppen {};
            class garage {};
            class garageGUI {};
            class doorBreach {};
            class recoilSystem {};
            class crashHelferClient {};
            class crashHelferServer {};
            class shortcuts {};
            class chatCommands {};
            class miscStuff {};
            class debug {};
            class forceRagdoll {};
            class attachToRelative {};
            class addBriefingEntries {};
            class firstJoin {};
            class deleteIfNotSeen {};
        };

        class gcam
        {
            file = "\TBMod_main\gcam";
            class showGCAM {};
        };

        // Replacement
        class replacement
        {
            file = "\TBMod_main\replacement";
        };
    };

    // REPLACEMENT
    class Achilles
    {
        class ui_f_eventHandler
        {
            class onDisplayCuratorLoad
            {
                file = "\TBMod_main\replacement\fn_onDisplayCuratorLoad.sqf";
            };
        };
    };

    // REPLACEMENT - ace3
    class ACE3
    {
        tag = "ace_medical";
        class ace_medical
        {
            class getBloodVolumeChange
            {
                file = "\TBMod_main\replacement\fn_getBloodVolumeChange.sqf";
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
                file = "\TBMod_main\replacement\init.sqf"; // TODO: das ist kritisch ggf in 1.90 geupdated worden
            };
        };
    };
};
