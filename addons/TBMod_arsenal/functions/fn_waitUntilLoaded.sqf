/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
waitUntil {!isNull player && time > 0};

private _rolle = ACE_player getVariable ['TB_rolle', ""];

if (_rolle == "") exitWith {};

[_rolle] call TB_fnc_setAttributes;
