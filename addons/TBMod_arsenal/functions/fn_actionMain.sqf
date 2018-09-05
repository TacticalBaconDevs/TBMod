/*
    Author: shukari
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

if !([_target] call TB_fnc_isArsenalType) exitWith {};

private _tbCargo = ACE_player getVariable 'TB_arsenalCargo';

if (!isNil {_tbCargo} && {!(_tbCargo isEqualTo (_target getVariable ['ace_arsenal_virtualItems', []]))}) then
{
    _target setVariable ['ace_arsenal_virtualItems', _tbCargo];
    
    {
        if ([_x] call TB_fnc_isArsenalType && {!(_tbCargo isEqualTo (_x getVariable ['ace_arsenal_virtualItems', []]))}) then
        {
            _x setVariable ['ace_arsenal_virtualItems', _tbCargo];
        };
        
        false;
    }
    count (entities (typeOf _target));
};

TB_arsenal_kiste = _target;
