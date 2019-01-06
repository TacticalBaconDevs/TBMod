/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/

if !(call TB_fnc_isWLMission) exitWith {};

// KI ist keine Muniversorgung
[
    "CAManBase",
    "Killed",
    {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (local _unit) then
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
