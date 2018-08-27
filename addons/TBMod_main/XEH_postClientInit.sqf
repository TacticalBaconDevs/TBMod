/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Willi "shukari" Graff
*/
if !(call TB_fnc_isTBMission) exitWith {};

enableEnvironment [false, true];
enableSaving [false, false];

["CBA_XEH_loadingScreenEnded", {
    params ["_loadingScreen"];
    diag_log format ["CBA_XEH_loadingScreenEnded: %1", _loadingScreen];
    //CBA_XEH_expectedLoadingScreens
}] call CBA_fnc_addEventHandler;

["CBA_loadingScreenDone", {
    [] call TB_fnc_doorBreach;
    [] call TB_fnc_recoilSystem;
    [] spawn TB_fnc_crashHelferClient;
    [] spawn TB_fnc_shortcuts;
    [] call TB_fnc_chatCommands;
    [] call TB_fnc_extremMedicMode;
    [] call TB_fnc_schauspieler;
    [] spawn TB_fnc_miscStuff;
    //[] call TB_fnc_advSimulationMgr;
    
    TB_init_done = true;
}] call CBA_fnc_addEventHandler;
