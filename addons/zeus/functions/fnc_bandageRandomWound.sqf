#include "../script_component.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * Bandages one random wound, prioritizes head and torso wounds. Primarly used
 * as part of the limit wounds module.
 *
 * Arguments:
 * 0: Unit to be bandaged <OBJECT>
 *
 * Return Value:
 * Number of bandange treatments
 *
 * Example:
 * [_unit] call TBMod_zeus_fnc_bandageRandomWound
 */
params ["_unit", ["_full", true]];

// get all wounded bodyparts with bleeding open wounds
(_unit call FUNC(getNumOpenWounds)) params ["", "", "_openWoundMap"];

private _wounds = 0;
{
    private _bodyPart = _x;
    private _openWounds = _y;

    // if full healing is on or head and body multiply by two to be sure
    private _anzahl = if (_full || _bodyPart in ["head", "body"]) then {(_openWounds * 2) max 1} else {floor (random (_openWounds + 1))};

    for "_i" from 1 to _anzahl do
    {
        ["ace_medical_treatment_bandageLocal", [_unit, _bodyPart, "FieldDressing"], _unit] call CBA_fnc_targetEvent;
        _wounds = _wounds + 1;
    };
}
forEach _openWoundMap;

_wounds
