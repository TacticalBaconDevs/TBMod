/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

["CBA_loadingScreenDone", {
    call TB_fnc_schauspieler;
    call TB_fnc_inkognitoSystem;
}] call CBA_fnc_addEventHandler;
