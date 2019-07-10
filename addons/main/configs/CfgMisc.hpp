/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class cfgScriptPaths
{
    TB_Main = "\TBMod_main\functions\";
    TB_replacement = "\TBMod_main\replacement\";
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
    idd = 312;
    onLoad = "[_this select 0] call Achilles_fnc_onDisplayCuratorLoad;";
    onUnload = "[_this select 0] call Achilles_fnc_onDisplayCuratorUnload;";
    scriptName = "RscDisplayCurator";
    scriptPath = "TB_replacement";
};
