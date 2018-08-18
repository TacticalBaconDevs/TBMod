/*
    Author: Willi "shukari" Graff
*/
class CfgFunctions
{
    class TBMod_main
    {
        tag = "TB";
        
        class functions
        {
            file = "\TBMod_main\functions";
            class UpDown {};
            class teleport {};
            class safe {};
            class actionTeleportKamerad {};
            class insertChildrenFOB {};
            class insertChildrenKameraden {};
            class modifierFOBs {};
            class displayName {};
            class isTBMission {};
            class moduleNachschubAbwurf {};
            class moduleDisablePath {};
            class modulePrioSichtbarkeit {};
            class insertChildrenGruppen {};
            class garage {};
            class garageGUI {};
            class extremMedicMode {};
            class doorBreach {};
            class recoilSystem {};
            class crashHelferClient {};
            class crashHelferServer {};
            class shortcuts {};
            class chatCommands {};
            class schauspieler {};
            class miscStuff {};
            class persistence {};
            class advSimulationMgr {};
        };
        
        class gcam
        {
            file = "\TBMod_main\gcam";
            class showGCAM {};
        };
    };
    
    // REPLACEMENT
    class Achilles
    {
        class ui_f_eventHandler
        {
            class onDisplayCuratorLoad {file = "\TBMod_main\replacement\fn_onDisplayCuratorLoad.sqf";};
            class RscDisplayCurator {file = "\TBMod_main\replacement\fn_RscDisplayCurator.sqf";};
        };
    };
};