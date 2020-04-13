#include "../script_component.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * Returns the number of open wounds for a unit.
 *
 * Arguments:
 * 0: The bleeding unit <OBJECT>
 *
 * Return Value:
 * Number of open/bleeding wounds <NUMBER>
 *
 * Example:
 * _unit call TB_zeus_fnc_getNumOpenWounds
 *
 */
params ["_unit"];

private _wound = 0;

{
    _x params ["", "_bodyPart", "_numOpenWounds", "_bloodLoss", ""];
    if (_bloodLoss > 0 && _bodyPart >= 0 && _bodyPart <= 5) then {_wound = _wound + _numOpenWounds};
}
forEach (_unit getVariable ["ace_medical_openWounds", []]);

_wound
