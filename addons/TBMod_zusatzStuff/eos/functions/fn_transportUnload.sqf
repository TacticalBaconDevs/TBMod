params ["_mkr", "_veh", "_counter"];
_veh params ["_vehicle", "", "_grp", "_cargoGrp"];

private _pos = [_mkr, false] call TB_EOS_fnc_shk_pos;
private _pad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"]; 

{_x allowFleeing 0} forEach ((units _grp) + (units _cargoGrp));        

private _wp1 = _grp addWaypoint [_pos, 0];  
_wp1 setWaypointSpeed "FULL";  
_wp1 setWaypointType "UNLOAD";
_wp1 setWaypointStatements ["true", "(vehicle this) LAND 'GET IN';"]; 

waituntil {_vehicle distance _pad < 30};
_cargoGrp leaveVehicle _vehicle;    

waitUntil {uiSleep 0.2; ({_x in _vehicle} count (units _cargoGrp)) == 0};

[_cargoGrp, _mkr] call TB_EOS_fnc_shk_patrol;

private _wp2 = _grp addWaypoint [[0,0,0], 0];  
_wp2 setWaypointSpeed "FULL";  
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"];  

deleteVehicle _pad;
