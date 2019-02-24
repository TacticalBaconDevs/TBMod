/*
    SHK_patrol

    Based on BIN_taskPatrol by Binesi

    Version 0.22
    Author: Shuko (shuko@quakenet, miika@miikajarvinen.fi)
    http://forums.bistudio.com/showthread.php?163496-SHK_Patrol
    Modified for EOS by Bangabob
    MODIFIED BY: shukari [TacticalBacon.de]

    Required Parameters:
        0 Object or Group     The patrolling unit
        1 Marker Name
*/
if (!isServer) exitWith {};

params ["_grp", "_mkr", ["_onlyInf", false]];
if (_grp isEqualType objNull) then {_grp = group _grp};

private _dst = 250;
private _onlyInf = _onlyInf || (units _grp) findIf {!((vehicle _x) isKindOf "CAManBase")} == -1;

_grp setBehaviour "SAFE";
_grp setSpeedMode "LIMITED";
_grp setCombatMode "YELLOW";
_grp setFormation (selectRandom ["STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND"]);

private _cnt = 4 + (floor (random 3)) + (floor (_dst / 100)); // number of waypoints
private _wps = [];
private _slack = _dst / 5.5;
if (_slack < 20) then {_slack = 20};

private _mkrPos = getMarkerPos _mkr;
(getMarkerSize _mkr) params ["_mkrX", "_mkrY"];
private _mkrSize = _mkrX min _mkrY;
private _waterMode = parseNumber (surfaceIsWater (getPos (leader _grp)));

// Find positions for waypoints
private _safeDistance = [10, 2] select _onlyInf;
while {count _wps < _cnt} do
{
    _wps pushBack ([_mkrPos, 0, _mkrSize, _safeDistance, _waterMode, 0.25, 0] call TB_EOS_fnc_findSafePos);
};

// Create waypoints
for "_i" from 1 to (_cnt - 1) do
{
    private _wp = _grp addWaypoint [_wps select _i, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointCompletionRadius (5 + _slack);
    [_grp,_i] setWaypointTimeout [0, 2, 16];

    // When completing waypoint have 33% chance to choose a random next wp
    [_grp,_i] setWaypointStatements ["true", "if (random 3 > 2) then {(group this) setCurrentWaypoint [group this, floor (random (count (waypoints (group this))))]}"];
};

// Cycle in case we reach the end
private _wp1 = _grp addWaypoint [_wps select 1, 0];
_wp1 setWaypointType "CYCLE";
_wp1 setWaypointCompletionRadius 50;
