#include "../script_component.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * Zeus module callback for unflipping a vehicle.
 *
 * Arguments:
 * 0: Placed module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _logic call TB_zeus_fnc_moduleUnflipVehicle
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
    case (isNull _target): {[objNull, "nothing selected"] call bis_fnc_showCuratorFeedbackMessage};
    case (!alive _target): {[objNull, "target is destroyed"] call bis_fnc_showCuratorFeedbackMessage};
    default {_target remoteExec [QFUNC(unflipVehicle), _target]};
};
