/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

// ThemenArsenale Rollen blockieren
private _type = _player getVariable ["TB_arsenalType", ""];
TB_blacklistRollen_themen = [];
if (_type == "Themen") then
{
    private _patches = configfile >> "CfgPatches";
    if (isClass (_patches >> "uns_main")) exitWith {TB_blacklistRollen_themen = ["jtac", "sniper", "spotter", "rifle"]};
};

private _rolle = _player getVariable ["TB_rolle", ""];
private _condition = (_rolle != "") && ((getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType')) == _player getVariable ['TB_arsenalType', '']);
_actionData set [1, ["TB-Arsenal", [_rolle] call TB_fnc_getRollenName] select _condition];
