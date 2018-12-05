﻿/*
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
            class inkognitoSystem {};
            class doorBreach {};
            class recoilSystem {};
            class crashHelferClient {};
            class crashHelferServer {};
            class shortcuts {};
            class chatCommands {};
            class schauspieler {};
            class miscStuff {};
            class persistence {};
            class cargo {};
            class sitAI {};
            class animationAI {};
            class clearCache {};
            class keysForAI {};
            class moduleHandleAsPlayerMedical {};
            class moduleApplyLoadout {};
            class moduleFrontverlauf {};
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
            class onDisplayCuratorLoad
            {
                file = "\TBMod_main\replacement\fn_onDisplayCuratorLoad.sqf";
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
                file = "\TBMod_main\replacement\init.sqf";
            };
        };
    };
};