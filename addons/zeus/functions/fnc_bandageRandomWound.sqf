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
 * None
 *
 * Example:
 * [_unit] call TBMod_zeus_fnc_bandageRandomWound
 *
 */
params ["_unit", ["_full", true]];

private _wounds = 0;
{
    _x params ["", "_bodyPart", "_numOpenWounds", "_bloodLoss", ""];

    if (_bloodLoss > 0 && _numOpenWounds > 0) then
    {
        private _anzahl = if (_full) then {(_numOpenWounds * 2) max 1} then {floor (random (_numOpenWounds + 1))};

        private _target = switch (_bodyPart) do
        {
            case 0:
            {
                _anzahl = (_numOpenWounds * 2) max 1;
                "head"
            };

            case 1:
            {
                _anzahl = (_numOpenWounds * 2) max 1;
                "body"
            };

            case 2: {"leftarm"};
            case 3: {"rightarm"};
            case 4: {"leftleg"};
            case 5: {"rightleg"};
        };

        for "_i" from 1 to _anzahl do
        {
            ["ace_medical_treatment_bandageLocal", [_unit, _target, "FieldDressing"], _unit] call CBA_fnc_targetEvent;
            _wounds = _wounds + 1;
        };
    };
}
forEach (_unit getVariable ["ace_medical_openWounds", []]);

_wounds
