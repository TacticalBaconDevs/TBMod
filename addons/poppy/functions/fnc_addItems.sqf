#include "..\script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/
params ["_unit", "_array"];

{
    _x params ["_item", "_amount"];

    for "_i" from 1 to _amount do
    {
        if ([_unit, _item] call CBA_fnc_canAddItem) then {_unit addItem _item};
    };
}
forEach _array;
