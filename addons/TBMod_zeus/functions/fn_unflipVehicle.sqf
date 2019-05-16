#include "../script_macros.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * Unflips a vehicle, e.g., if got stuck or flipped.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _vechile call TB_fnc_unflipVehicle
 */
params ["_vehicle"];

if (!isNull _vehicle && {local _vehicle} && {alive _vehicle}) then
{
    _vehicle allowDamage false;
    _vehicle setPos [(getpos _vehicle) select 0, (getpos _vehicle) select 1, 0.5];
    _vehicle setVectorUp (surfaceNormal (position _vehicle));
    uiSleep 3;
    _vehicle allowDamage true;
};
