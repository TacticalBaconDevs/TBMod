#include "..\script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
	Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/

params ["_unit", "_magazine", ["_weapons", []], ["_magazines", []]];

if (_weapons isEqualTo []) then {
    _weapons = [primaryWeapon _unit, handgunWeapon _unit, secondaryWeapon _unit];
    _magazines = [primaryWeaponMagazine _unit, handgunMagazine _unit, secondaryWeaponMagazine _unit];
};

private _weapon = _weapons deleteAt 0;
private _loadedMagazines = _magazines deleteAt 0;
private _compatibleMagsFirstMuzzle = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
private _compatibleMagsSecondMuzzle = [];

private _secondMuzzle = (getArray (configfile >> "CfgWeapons" >> _weapon >> "muzzles") - ["this"]) param [0, ""];
if (_secondMuzzle != "") then {
    _compatibleMagsSecondMuzzle = getArray (configfile >> "CfgWeapons" >> _weapon >> _secondMuzzle >> "magazines");
};

_loadedMagazines            = _loadedMagazines apply {toLower _x};
_compatibleMagsFirstMuzzle  = _compatibleMagsFirstMuzzle apply {toLower _x};
_compatibleMagsSecondMuzzle = _compatibleMagsSecondMuzzle apply {toLower _x};

switch (true) do {
    case ((toLower _magazine) in _compatibleMagsFirstMuzzle  && {(_loadedMagazines arrayIntersect _compatibleMagsFirstMuzzle) isEqualTo []}):  { _weapon };
    case ((toLower _magazine) in _compatibleMagsSecondMuzzle && {(_loadedMagazines arrayIntersect _compatibleMagsSecondMuzzle) isEqualTo []}): { _weapon };
    case (_weapons isEqualTo []): { "" };
    default {
        [_unit, _magazine, _weapons, _magazines] call FUNC(findLoadableWeapon);
    };
};
