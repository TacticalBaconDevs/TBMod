﻿/*
    Author: shukari
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

if !([_target] call TB_fnc_isArsenalType) exitWith {};

// ThemenArsenale Rollen blockieren
private _type = _player getVariable ["TB_arsenalType", ""];
TB_blacklistRollen_themen = [];
if (_type == "Themen") then
{
    private _patches = configfile >> "CfgPatches";
    if (isClass (_patches >> "uns_main")) exitWith {TB_blacklistRollen_themen = ["jtac", "sniper", "spotter"]};
};

private _tbCargo = ACE_player getVariable 'TB_arsenalCargo';

if (!isNil {_tbCargo} && {!(_tbCargo isEqualTo (_target getVariable ['ace_arsenal_virtualItems', []]))}) then
{
    _target setVariable ['ace_arsenal_virtualItems', _tbCargo];
    
    {
        if ([_x] call TB_fnc_isArsenalType && {!(_tbCargo isEqualTo (_x getVariable ['ace_arsenal_virtualItems', []]))}) then
        {
            _x setVariable ['ace_arsenal_virtualItems', _tbCargo];
        };
    }
    forEach (entities (typeOf _target));
};

TB_arsenal_kiste = _target;
