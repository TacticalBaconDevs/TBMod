/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

if !(call TB_fnc_isWLMission) exitWith {};

// kein Thermal
[
    "AllVehicles",
    "init",
    {
        params ["_entity"];
        _entity disableTIEquipment true;
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

// KI ist keine Muniversorgung - SpielerKI
[
    "CAManBase",
    "Killed",
    {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (local _unit && !isPlayer _unit) then
        {
            removeAllItems _unit;
            removeAllWeapons _unit;
            removeAllAssignedItems _unit;
            removeAllItemsWithMagazines _unit;
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

// Respawn - Schlüssel
[
    "CAManBase",
    "Respawn",
    {
        params ["_unit"];

        if (local _unit && isPlayer _unit) then
        {
            _unit addItem (["ACE_key_east", "ACE_key_west"] select (side _unit == blufor));
            _unit addItem "ACE_key_indp";
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;
