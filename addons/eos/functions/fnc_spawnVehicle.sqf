#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)

    Complete rewrite and modification:
        shukari
*/
params [
        "_position",
        "_side",
        "_faction",
        "_type",
        ["_lockVehicleParams", [true, false]]
    ];

private _vehiclePool = [_faction, _type] call FUNC(unitPools);
if (isNil "_vehiclePool" || {_vehiclePool isEqualTo []}) exitWith
{
    {(format ["[ERROR][EOS][spawnVehicle] pool ist leer/kaputt -> %1", _this]) remoteExecCall [_x]} forEach ["systemChat", "diag_log"];
    [];
};

_vehiclePool params ["_vehicleType", ""];
private _return = [_position, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle;
_return params ["_vehicle", "_crew", "_grp"];

_lockVehicleParams params [["_lockVehicle", true], ["_giveKeys", false]];
if (_lockVehicle) then
{
    _vehicle lock 2;

    if (_giveKeys && ace_vehiclelock_VehicleStartingLockState != -1) then
    {
        {[_x, _vehicle, true] call ACE_VehicleLock_fnc_addKeyForVehicle} forEach _crew;
    };
};

_return;
