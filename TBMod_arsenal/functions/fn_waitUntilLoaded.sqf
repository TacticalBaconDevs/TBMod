/*
	Author: Willi "shukari" Graff
*/
waitUntil {!isNull player && time > 0};

private _rolle = ACE_player getVariable ['TB_rolle', ""];

if (_rolle == "") exitWith {};

[_rolle] call TB_fnc_setAttributes;
