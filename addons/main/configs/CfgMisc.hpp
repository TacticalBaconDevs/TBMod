/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class cfgScriptPaths
{
    TB_Main = QPATHTOF(functions\);
    TB_replacement = QPATHTOF(replacement\);
};

class RscDisplayGarage;
class TB_RscDisplayGarage: RscDisplayGarage
{
    enableSimulation = 1;
    icon = "\A3\Ui_f\data\Logos\a_64_ca.paa";
    idd = -1;
    logo = "\A3\Ui_f\data\Logos\arsenal_1024_ca.paa";
    onLoad = "['onLoad',_this,'TB_RscDisplayGarage','GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
    onUnload = "['onUnload',_this,'TB_RscDisplayGarage','GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
    scriptName = "TB_RscDisplayGarage";
    scriptPath = "TB_Main";
};

class RscDisplayCurator
{
    scriptPath = "TB_replacement";
};
