params [
        "_position",
        "_side",
        "_faction",
        "_type",
        ["_special", "CAN_COLLIDE"]
    ];

private _vehicleType = [_faction, _type] call eos_fnc_getunitpool;
private _grp = createGroup _side;

private _vehPositions = [_vehicleType select 0] call BIS_fnc_vehicleRoles;
private _vehicle = createVehicle [_vehicleType select 0, _position, [], 0, _special];

private _vehCrew = [];

{
    _currentPosition = _x;
    
    if (_currentPosition select 0 == "driver") then
    {
        _unit = _grp createUnit [_vehicleType select 1, _position, [], 0, "CAN_COLLIDE"];                    
        _unit assignAsDriver _vehicle;
        _unit moveInDriver _vehicle;
        _vehCrew pushBack _unit;
    };

    if (_currentPosition select 0 == "turret") then
    {
        _unit = _grp createUnit [_vehicleType select 1, _position, [], 0, "CAN_COLLIDE"];
        _unit assignAsGunner _vehicle;
        _unit moveInTurret [_vehicle, _currentPosition select 1];
        _vehCrew pushBack _unit;
    };
}
foreach _vehPositions;
    
[_vehicle, _vehCrew, _grp]
