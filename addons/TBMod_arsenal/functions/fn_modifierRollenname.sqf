/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", "_shortName"];
_args params ["_target", "_player", "_params", "_actionData"];

_actionData set [1, [_shortName] call TB_fnc_getRollenName];
