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
    for "_i" from 0 to _amount do {
        if(_unit canAdd _item) then {
            _unit addItem _item;
        }
    };
} forEach array;