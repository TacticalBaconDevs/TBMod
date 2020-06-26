#include "../script_component.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * If available applies tourniquets to all bleeding extremeties. Primarly used
 * as part of the limit wounds module.
 *
 * Arguments:
 * 0: Unit to be tourniqueted <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call TBMod_zeus_fnc_applyTourniquets
 */
params ["_unit", ["_full", true]];

private _applyTo = [];
{
    _x params ["", "_bodyPart", "_numOpenWounds", "_bloodLoss", ""];

    if (_bloodLoss > 0 && _numOpenWounds > 0) then
    {
        switch (_bodyPart) do
        {
            case 2: {_applyTo pushBackUnique "leftarm"};
            case 3: {_applyTo pushBackUnique "rightarm"};
            case 4: {_applyTo pushBackUnique "leftleg"};
            case 5: {_applyTo pushBackUnique "rightleg"};
        };
    };

    if (count _applyTo == 4) exitWith {};
}
forEach (_unit getVariable ["ace_medical_openWounds", []]);

// wenn nicht genügend Tourniquets vorhanden, dann geben
if (_cheat && {count _applyTo > [_unit, "ACE_tourniquet"] call ace_common_fnc_getCountOfItem}) then
{
    for "_i" from ([_unit, "ACE_tourniquet"] call ace_common_fnc_getCountOfItem) to (count _applyTo) do {_unit addItem "ACE_tourniquet"};
};

{
    if (_full || {floor (random 2) == 1}) then
    {
        ["ace_medical_treatment_tourniquetLocal", [_unit, _x], _unit] call CBA_fnc_targetEvent;
    };
}
forEach _applyTo;

count _applyTo
