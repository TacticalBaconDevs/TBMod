/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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
