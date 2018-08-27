/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Willi "shukari" Graff
*/
params ["_unit", "_value"];

if (!alive _unit && _value != "") exitWith {};

waitUntil {time > 0 && !isNil "TB_init_done"};

[_unit, "ANIM"] remoteExec ["disableAI", _unit];
[_unit, _value, 2] call ace_common_fnc_doAnimation;
