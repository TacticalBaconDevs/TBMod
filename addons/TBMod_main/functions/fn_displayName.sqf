/*
    Author: Willi "shukari" Graff
*/
params ["_name"];

if (_name isEqualType objNull) then {_name = typeOf _name};
if !(_name isEqualType "") exitWith {hint "Schwerer Fehler #300"};

private _return = _name;

{
    private _cfg = configfile >> _x >> _return;
    if (isClass _cfg) exitWith {_return = [_cfg] call BIS_fnc_displayName};
}
forEach ["CfgWeapons", "CfgMagazines", "CfgAmmo", "CfgVehicles", "CfgGlasses"];

_return
