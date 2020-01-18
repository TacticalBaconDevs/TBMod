#include "..\script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
	Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/

params ["_unit", "_loadout"];

private _config = configFile >> "CfgLoadouts" >> _loadout;


removeAllAssignedItems _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeAllContainers _unit;
removeAllWeapons _unit;

{
    if (isArray (_config >> _x)) then {
        [_unit, getArray (_config >> _x), _x] call FUNC(setEquipment);
    };
} forEach LOADOUT_INDEXES;

_unit selectWeapon (primaryWeapon _unit);
