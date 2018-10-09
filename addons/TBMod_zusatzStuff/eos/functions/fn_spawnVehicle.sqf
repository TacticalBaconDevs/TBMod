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
        "_type"//,
        //["_special", "CAN_COLLIDE"]
    ];

private _vehiclePool = [_faction, _type] call TB_EOS_fnc_unitPools;
if (_vehiclePool isEqualTo []) exitWith {[]};

_vehiclePool params ["_vehicleType"];
[_position, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle;

// private _vehPositions = [_vehicleType] call BIS_fnc_vehicleRoles;
// private _vehicle = createVehicle [_vehicleType, _position, [], 0, _special];

// private _vehCrew = [];
// private _grp = createGroup [_side, true];
// private _maxTurrents = 3;
// private _unit = objNull;
// {
    // if (_x select 0 == "driver") then
    // {
        // private _unit = _grp createUnit [_crewType, [0,0,0], [], 0, "CAN_COLLIDE"];                    
        // _unit assignAsDriver _vehicle;
        
        // if (_unit moveInAny _vehicle) then
        // {
            // _vehCrew pushBack _unit;
        // }
        // else
        // {
            // deleteVehicle _unit;
        // };
    // };

    // if (_x select 0 == "turret" && _maxTurrents > 0) then
    // {
        // private _unit = _grp createUnit [_crewType, [0,0,0], [], 0, "CAN_COLLIDE"];
        // _unit assignAsGunner _vehicle;
        
        // if (_unit moveInAny _vehicle) then
        // {
            // _vehCrew pushBack _unit;
            // _maxTurrents = _maxTurrents - 1;
        // }
        // else
        // {
            // deleteVehicle _unit;
        // };
    // };
// }
// foreach _vehPositions;

//([_position, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) params ["_vehicle", "_crewArray", "_vehGroup"];

// _grp allowFleeing 0;
// [_vehicle, true] remoteExecCall ["engineOn", _vehicle];

//[_vehicle, _vehCrew, _grp]
