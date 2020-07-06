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
 * _logic call TBMod_zeus_fnc_moduleUnflipVehicle
 */
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _target = attachedTo _logic;
deleteVehicle _logic;

if (!alive _target) exitWith {systemChat "[TBMod_zeus] No vehicle selected"; true};

_target remoteExec [QFUNC(unflipVehicle), _target];
