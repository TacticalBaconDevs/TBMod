params [
        "_position",
        "_side",
        "_faction",
        "_type",
        ["_special", "CAN_COLLIDE"]
    ];

private _vehicleType = [_faction, _type] call TB_EOS_fnc_unitPools;
private _grp = createGroup _side;

private _vehPositions = [_vehicleType select 0] call BIS_fnc_vehicleRoles;
private _vehicle = createVehicle [_vehicleType select 0, _position, [], 0, _special];

private _vehCrew = [];
private _maxTurrents = 3;

{
    _currentPosition = _x;
    
    if (_currentPosition select 0 == "driver") then
    {
        _unit = _grp createUnit [_vehicleType select 1, [0,0,0], [], 0, "CAN_COLLIDE"];                    
        _unit assignAsDriver _vehicle;
        _unit moveInDriver _vehicle;
        _vehCrew pushBack _unit;
    };

    if (_currentPosition select 0 == "turret" && _maxTurrents > 0) then
    {
        _unit = _grp createUnit [_vehicleType select 1, [0,0,0], [], 0, "CAN_COLLIDE"];
        _unit assignAsGunner _vehicle;
        _unit moveInTurret [_vehicle, _currentPosition select 1];
        _vehCrew pushBack _unit;
        _maxTurrents = _maxTurrents - 1;
    };
}
foreach _vehPositions;

[_vehicle, _vehCrew, _grp]
