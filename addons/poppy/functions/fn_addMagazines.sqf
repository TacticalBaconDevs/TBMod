#include "..\script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
	Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/

params ["_unit", "_array"];

{
	private _item = _x # 0;
	private _amount = _x # 1;
	private _loadableWeapon = [_unit, _item] call FUNC(findLoadableWeapon);
	if (_loadableWeapon != "") then {
		_unit addWeaponItem [_loadableWeapon, _item];
		_amount = _amount - 1;
	};
	_unit addMagazines [_item, _amount];
} forEach array;