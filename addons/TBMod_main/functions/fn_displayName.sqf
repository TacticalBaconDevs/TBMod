#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_name", ["_short", false, [false]]];

if (_name isEqualType objNull) then {_name = typeOf _name};
if !(_name isEqualType "") exitWith {hint "Schwerer Fehler #300"};

private _return = _name;

{
    private _cfg = configfile >> _x >> _return;
    if (isClass _cfg) exitWith
    {
        _return = getText (_config >> (["displayName", "displayNameShort"] select _short));
        if (_return == "") then {_return = configname _config};
    };
}
forEach ["CfgWeapons", "CfgMagazines", "CfgAmmo", "CfgVehicles", "CfgGlasses"];

_return
