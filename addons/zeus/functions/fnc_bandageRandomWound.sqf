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
    _x params ["", "", "_bodyPart", "_numOpenWounds", "_bloodLoss"];

    if (_bloodLoss > 0) then
    {
        switch (_bodyPart) do
        {
            case 0:
            {
                for "_i" from 1 to _numOpenWounds do {[_unit, _unit, "head", selectRandom ["ElasticBandage", "PackingBandage"]] call ace_medical_fnc_treatmentAdvanced_bandage};
            };

            case 1:
            {
                for "_i" from 1 to _numOpenWounds do {[_unit, _unit, "body", selectRandom ["ElasticBandage", "PackingBandage"]] call ace_medical_fnc_treatmentAdvanced_bandage};
            };

            case 2:
            {
                for "_i" from 1 to (random _numOpenWounds) do {[_unit, _unit, "hand_l", "Bandage"] call ace_medical_fnc_treatmentAdvanced_bandage};
            };

            case 3:
            {
                for "_i" from 1 to (random _numOpenWounds) do {[_unit, _unit, "hand_r", "Bandage"] call ace_medical_fnc_treatmentAdvanced_bandage};
            };

            case 4:
            {
                for "_i" from 1 to (random _numOpenWounds) do {[_unit, _unit, "leg_l", "Bandage"] call ace_medical_fnc_treatmentAdvanced_bandage};
            };

            case 5:
            {
                for "_i" from 1 to (random _numOpenWounds) do {[_unit, _unit, "leg_r", "Bandage"] call ace_medical_fnc_treatmentAdvanced_bandage};
            };
        };
    };
}
forEach (_unit getVariable ["ace_medical_openWounds", []]);
