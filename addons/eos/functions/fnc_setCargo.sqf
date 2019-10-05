#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)

    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {};

params [
        "_vehicle",
        "_grpSize",
        "_side",
        "_faction",
        "_cargoType"
    ];

private _grp = grpNull;
private _cargoPool = [_faction, _cargoType] call FUNC(unitPools);
if (_cargoPool isEqualTo []) exitWith {_grp};

private _emptySeats = _vehicle emptyPositions "cargo";

if (_emptySeats > 0) then
{
    _grpSize = round _grpSize;
    if (_grpSize > _emptySeats) then {_grpSize = _emptySeats};

    _grp = createGroup [_side, true];
    private _unit = objNull;
    for "_i" from 1 to _grpSize do
    {
        _unit = _grp createUnit [selectRandom _cargoPool, [0,0,0], [], 0, "CAN_COLLIDE"];
        _unit assignAsCargoIndex [_vehicle, _i - 1];
        _unit moveInCargo _vehicle;

        // _unit moveInCargo _vehicle;
        // _unit assignAsCargo _vehicle;

        if (_vehicle getCargoIndex _unit == -1) exitWith {deleteVehicle _unit};
    };
};

_grp
