#include "..\script_component.hpp"
params ["_unit", "_array","_slot"];
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
	Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/

private _item = selectRandom _array;

if (_item == "") exitwith {};


switch (_slot) do {
    case "backpack": { _unit addBackpack _item; };
    case "binoculars": { _unit addWeapon _item; };
    case "googgles": { _unit addGoggles _item; };
    case "weapon": { _unit addWeapon (_item#0); { _unit addPrimaryWeaponItem _x;  } foreach (_item select [1,100]);};
    case "secondary": { _unit addWeapon (_item#0); { _unit addHandgunItem _x; } foreach (_item select [1, 100]);};
    case "launcher": { _unit addWeapon (_item#0); { _unit addSecondaryWeaponItem _x; } foreach (_item select [1, 100]);};
    case "uniform": { _unit forceAddUniform _item; };
    case "vest": {_unit addVest _vest; };
    case "magazines": { [_unit, _array] call FUNC(addItems); };
    case "items": { [_unit, _array] call FUNC(addMagazines); };
    //Map, Headgear, Watch, Radio, NVG, Compass, GPS
    default { _unit linkItem _item; };
};
