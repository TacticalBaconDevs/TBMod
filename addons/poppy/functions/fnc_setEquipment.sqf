#include "..\script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/
params ["_unit", "_array", "_slot"];

if (_array isEqualTo []) exitwith {};
private _item = selectRandom _array;
if (_item isEqualTo "" || _item isEqualTo []) exitwith {};

switch (toLower _slot) do
{
    case "backpack": {_unit addBackpack _item};
    case "binoculars": {_unit addWeapon _item};
    case "googgles": {_unit addGoggles _item};
    case "primary": {
        if (_item isEqualType "") then
        {
            _unit addWeapon _item;
        }
        else
        {
            _unit addWeapon (_item#0);
            {_unit addPrimaryWeaponItem _x} foreach (_item select [1,100]);
        };
    };
    case "secondary": {
        if (_item isEqualType "") then
        {
            _unit addWeapon _item;
        }
        else
        {
            _unit addWeapon (_item#0);
            {_unit addHandgunItem _x} foreach (_item select [1,100]);
        };
    };
    case "launcher": {
        if (_item isEqualType "") then
        {
            _unit addWeapon _item;
        }
        else
        {
            _unit addWeapon (_item#0);
            {_unit addSecondaryWeaponItem _x} foreach (_item select [1,100]);
        };
    };
    case "uniform": {_unit forceAddUniform _item};
    case "vest": {_unit addVest _item};
    case "magazines": {[_unit, _array] call FUNC(addMagazines)};
    case "items": {[_unit, _array] call FUNC(addItems)};
    default {_unit linkItem _item}; // Map, Headgear, Watch, Radio, NVG, Compass, GPS
};
