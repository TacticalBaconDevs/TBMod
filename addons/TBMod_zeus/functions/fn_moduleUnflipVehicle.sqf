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
 * _logic call TB_fnc_moduleUnflipVehicle
 */
params ["_logic"];

if (!local _logic) exitWith {};

private _target = attachedTo _logic;

switch (true) do
{
    case (isNull _target): {[objNull, "nothing selected"] call bis_fnc_showCuratorFeedbackMessage};
    case (!alive _target): {[objNull, "target is destroyed"] call bis_fnc_showCuratorFeedbackMessage};
    default {_target remoteExec ["TB_fnc_unflipVehicle", _target]};
};

deleteVehicle _logic;
