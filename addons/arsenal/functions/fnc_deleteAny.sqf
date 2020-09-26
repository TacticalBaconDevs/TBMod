#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_item", ""],
        ["_player", player],
        ["_blockedCats", []]
    ];

if (_item isEqualTo "") exitWith {};

(_item call BIS_fnc_itemType) params ["_cat", "_subCat"];

if (_cat in _blockedCats || _subCat in _blockedCats) exitWith {};

switch (_cat) do
{
    case "Mine";
    case "Weapon":
    {
        [_player, _item] call CBA_fnc_removeWeapon;
        [_player, _item] call CBA_fnc_removeItem;

        for "_i" from 1 to ({_x == _item} count (items _player + assignedItems _player + magazines _player)) do
        {
            [_player, _item] call CBA_fnc_removeWeapon;
            [_player, _item] call CBA_fnc_removeItem;
        };
    };
    case "Magazine":
    {
        private _magArray = magazines _player + primaryWeaponMagazine _player + primaryWeaponItems _player +
                secondaryWeaponMagazine _player + secondaryWeaponItems _player + handgunMagazine _player + handgunItems _player;

        [_player, _item] call CBA_fnc_removeMagazine;
        [_player, _item] call CBA_fnc_removeItem;

        for "_i" from 1 to ({_x == _item} count _magArray) do
        {
            [_player, _item] call CBA_fnc_removeMagazine;
            [_player, _item] call CBA_fnc_removeItem;
        };

        _player removePrimaryWeaponItem _item;
        _player removeSecondaryWeaponItem _item;
        _player removeHandgunItem _item;
    };
    case "Equipment":
    {
        switch (_subCat) do
        {
            case "Glasses": {removeGoggles _player; goggles _player != _item};
            case "Headgear": {removeHeadgear _player; headgear _player != _item};
            case "Vest": {removeVest _player; Vest _player != _item};
            case "Uniform": {removeUniform _player; Uniform _player != _item};
            case "Backpack": {removeBackpackGlobal _player; backpack _player != _item};
            default {systemChat format ["Fehler #94 -> switchCase Equipment -> %1 | %2 | %3", _cat, _subCat, _item]};
        };
    };
    case "Item":
    {
        switch (_subCat) do
        {
            case "Binocular";
            case "LaserDesignator": {[_player, _item] call CBA_fnc_removeWeapon};
            case "AccessoryMuzzle";
            case "AccessorySights";
            case "AccessoryPointer";
            case "AccessoryBipod":
            {
                [_player, _item] call CBA_fnc_removeItem;
                _player unlinkItem _item;

                for "_i" from 1 to ({_x == _item} count (items _player + assignedItems _player)) do
                {
                    [_player, _item] call CBA_fnc_removeItem;
                    _player unlinkItem _item;
                };

                _player removePrimaryWeaponItem _item;
                _player removeSecondaryWeaponItem _item;
                _player removeHandgunItem _item;
            };
            default
            {
                [_player, _item] call CBA_fnc_removeItem;
                _player unlinkItem _item;

                for "_i" from 1 to ({_x == _item} count (items _player + assignedItems _player)) do
                {
                    [_player, _item] call CBA_fnc_removeItem;
                    _player unlinkItem _item;
                };
            };
        };
    };
    default {};
};
