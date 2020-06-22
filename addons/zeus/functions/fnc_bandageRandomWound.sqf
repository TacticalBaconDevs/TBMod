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
 * _unit call tb_zeus_fnc_bandageRandomWound
 *
 */
params ["_unit"];

private _wounds = 0;
{
    _x params ["", "_bodyPart", "_numOpenWounds", "_bloodLoss", ""];

    if (_bloodLoss > 0) then
    {
        switch (_bodyPart) do
        {
            case 0:
            {
                for "_i" from 1 to _numOpenWounds do {["ace_medical_treatment_bandageLocal", [_unit, "head", "Bandage"], _unit] call CBA_fnc_targetEvent};
            };

            case 1:
            {
                for "_i" from 1 to _numOpenWounds do {["ace_medical_treatment_bandageLocal", [_unit, "body", "Bandage"], _unit] call CBA_fnc_targetEvent};
            };

            case 2:
            {
                for "_i" from 1 to (random _numOpenWounds) do {["ace_medical_treatment_bandageLocal", [_unit, "leftarm", "Bandage"], _unit] call CBA_fnc_targetEvent};
            };

            case 3:
            {
                for "_i" from 1 to (random _numOpenWounds) do {["ace_medical_treatment_bandageLocal", [_unit, "rightarm", "Bandage"], _unit] call CBA_fnc_targetEvent};
            };

            case 4:
            {
                for "_i" from 1 to (random _numOpenWounds) do {["ace_medical_treatment_bandageLocal", [_unit, "leftleg", "Bandage"], _unit] call CBA_fnc_targetEvent};
            };

            case 5:
            {
                for "_i" from 1 to (random _numOpenWounds) do {["ace_medical_treatment_bandageLocal", [_unit, "rightleg", "Bandage"], _unit] call CBA_fnc_targetEvent};
            };
        };
    };
}
forEach (_unit getVariable ["ace_medical_openWounds", []]);
