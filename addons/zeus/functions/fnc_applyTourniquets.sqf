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
 * _unit call tb_zeus_fnc_applyTourniquets
 *
 */
params ["_unit"];

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

{
    ["ace_medical_treatment_tourniquetLocal", [_unit, _x], _unit] call CBA_fnc_targetEvent;
}
forEach _applyTo;
