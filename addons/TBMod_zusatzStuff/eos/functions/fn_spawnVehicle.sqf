/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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
        private _unit = _grp createUnit [_vehicleType select 1, [0,0,0], [], 0, "CAN_COLLIDE"];                    
        _unit assignAsDriver _vehicle;
        
        if (_unit moveInAny _vehicle) then
        {
            _vehCrew pushBack _unit;
        }
        else
        {
            deleteVehicle _unit;
        };
    };

    if (_currentPosition select 0 == "turret" && _maxTurrents > 0) then
    {
        private _unit = _grp createUnit [_vehicleType select 1, [0,0,0], [], 0, "CAN_COLLIDE"];
        _unit assignAsGunner _vehicle;
        
        if (_unit moveInAny _vehicle) then
        {
            _vehCrew pushBack _unit;
            _maxTurrents = _maxTurrents - 1;
        }
        else
        {
            deleteVehicle _unit;
        };
    };
}
foreach _vehPositions;

_grp allowFleeing 0;
[_vehicle, true] remoteExecCall ["engineOn", _vehicle];

[_vehicle, _vehCrew, _grp]
