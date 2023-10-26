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
 * 0: Number of open/bleeding wounds <NUMBER>
 * 1: String array of bodyparts with open/bleeding wounds <ARRAY>
 * 2: Hashmap with open/bleeding wounds per bodypart <HASHMAP>
 *
 * Example:
 * _unit call TBMod_zeus_fnc_getNumOpenWounds
 */
params ["_unit"];

private _allCount = 0;
private _result = createHashMap;

{
    private _bodyPart = _x;
    private _openWounds = _y;
    private _bodyPartCount = 0;
    
    {
        _x params ["_classComplex", "_amountOf", "_bleedingRate", "_woundDamage"];
        if (_bleedingRate > 0) then {_bodyPartCount = _bodyPartCount + _amountOf};
    }
    forEach _openWounds;

    if (_bodyPartCount > 0) then
    {
        _result set [_bodyPart, _bodyPartCount];
        _allCount = _allCount + _bodyPartCount;
    };
}
forEach (player getVariable ["ace_medical_openWounds", createHashMap]);

[_allCount, keys _result, _result]
