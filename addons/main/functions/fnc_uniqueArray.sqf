#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_arrayOrItem", "_type"];
private _return = [];

if (_arrayOrItem isEqualType []) then
{
    {
        _return append ([_x, _type] call FUNC(uniqueArray));
    }
    forEach _arrayOrItem;
}
else
{
    if (isNil "_type" || {_x isEqualType _type}) then {_return pushBack _x};
};

_return arrayIntersect _return;
