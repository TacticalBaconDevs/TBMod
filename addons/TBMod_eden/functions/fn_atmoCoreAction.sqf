/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_ftl", "_marker"];

private _grp = createGroup west;
private _units = [];
private _vehicle = vehicle _ftl;
for "_i" from 1 to (3 + (random 3)) do
{
    private _unit = _grp createUnit ["rhsusf_army_ocp_rifleman", [0,0,0], [], 0, "CAN_COLLIDE"];
    _units pushBack _unit;

    _unit assignAsCargoIndex [_vehicle, _i - 1];
    _unit moveInCargo _vehicle;

    if (_vehicle getCargoIndex _unit == -1) exitWith {deleteVehicle _unit};
};

_units joinSilent _grp;
_grp deleteGroupWhenEmpty true;

[_grp, {isNull objectParent (leader _this)}, 20, 200] spawn TB_fnc_deleteIfNotSeen;

_grp setBehaviour (selectRandom ["CARELESS", "SAFE", "AWARE"]);
_grp setSpeedMode (selectRandom ["UNCHANGED", "LIMITED", "NORMAL", "FULL"]);

private _wp = _grp addWaypoint [getMarkerPos _marker, 0];
_wp setWaypointStatements ["isNull objectParent this", "{deleteVehicle _x} forEach thislist"];
