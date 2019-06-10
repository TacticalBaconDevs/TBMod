#include "../script_macros.hpp"
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
    _x params ["", "", "_bodyPart", "_numOpenWounds", "_bloodLoss"];

    if (_bloodLoss > 0) then
	{
        switch (_bodyPart) do
		{
            case 2: {_applyTo pushBackUnique "hand_l"};
            case 3: {_applyTo pushBackUnique "hand_r"};
            case 4: {_applyTo pushBackUnique "leg_l"};
			case 5: {_applyTo pushBackUnique "leg_r"};
        };
    };

	if (count _applyTo == 4) exitWith {};
}
forEach (_unit getVariable ["ace_medical_openWounds", []]);

{[_unit, "", _x] remoteExec ["ace_medical_fnc_treatmentTourniquetLocal", _unit]} forEach _applyTo;
