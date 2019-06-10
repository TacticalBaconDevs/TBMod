#include "../script_macros.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * Zeus module callback for limiting wounds of unit, e.g., applying tourniquets
 * and bandaging wounds.
 *
 * Arguments:
 * 0: Placed module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _logic call TB_zeus_fnc_moduleLimitWounds
 *
 */
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
private _target = attachedTo _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};
if (isNull _target) exitWith {systemChat "[TBMod_zeus] No vehicle selected"; true};

switch (true) do
{
    case (isNull _target):
	{
        systemChat "[TBMod_zeus] _target is null";
        [objNull, "_target is null"] call bis_fnc_showCuratorFeedbackMessage;
    };
    case (!alive _target):
	{
        systemChat "[TBMod_zeus] _target is not alive";
        [objNull, "_target is not alive"] call bis_fnc_showCuratorFeedbackMessage;
    };
    default
	{
        private _numOpenWounds = _target call FUNC(getNumOpenWounds);

        if (_numOpenWounds > 0) then {_target call FUNC(applyTourniquets)};
        _target call FUNC(bandageRandomWound);
    };
};
