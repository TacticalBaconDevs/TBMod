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

// get all wounded bodyparts with bleeding open wounds
(_unit call FUNC(getNumOpenWounds)) params ["", "_woundedBodyParts"];

// we only want arms and legs
private _applyTo = _woundedBodyParts select {_x in ["leftarm", "rightarm", "leftleg", "rightleg"]};

{
    // everytime or by a 50/50 chance
    if (_full || {floor (random 2) == 1}) then
    {
        ["ace_medical_treatment_tourniquetLocal", [_unit, _x], _unit] call CBA_fnc_targetEvent;
    };
}
forEach _applyTo;

count _applyTo
