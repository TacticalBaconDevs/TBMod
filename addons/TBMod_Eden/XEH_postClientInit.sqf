/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: shukari
*/
if !(call TB_fnc_isTBMission) exitWith {};

enableEnvironment [false, true];
enableSaving [false, false];

["CBA_loadingScreenDone", {
    [] call TB_fnc_schauspieler;
}] call CBA_fnc_addEventHandler;
