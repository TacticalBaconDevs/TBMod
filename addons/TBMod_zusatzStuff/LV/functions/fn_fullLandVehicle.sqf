//ARMA3Alpha function TB_LV_fnc_fnc_fullLandVehicle v2.0 - by SPUn / Kaarto Media
//Spawns random vehicle full of units and returns the driver 
params [
        ["_pos", [], [[]]],
        ["_grp", grpNull, [grpNull]],
        ["_classModuleFilters", [], [[]]],
        ["_syncedUnit", nil, [[]]],
        ["_dissapearDistance", nil, [0]],
        ["_clean", false, [false]]
    ];

private _veh = ([_classModuleFilters, 1] call TB_LV_fnc_classnames) + ([_classModuleFilters, 2] call TB_LV_fnc_classnames);
_veh = [_veh] call TB_LV_fnc_validateClassArrays;
_veh = selectRandom _veh;

_radius = 40;
_roads = [];
while {_roads isEqualTo []} do {
    _roads = _pos nearRoads _radius;
    _radius = _radius + 10;
};

private _pos1 = nil;
if ((_roads select 0) distance _pos < 200) then {
    _pos = getPos (_roads select 0);
    _pos1 = [_pos, 0, 25, 5, 0, 1, 0] call BIS_fnc_findSafePos;
} else {
    _pos1 = [_pos, 0, 200, 5, 0, 1, 0] call BIS_fnc_findSafePos;
};
_pos = [_pos1 select 0, _pos1 select 1, 0];

_vehicle = createVehicle [_veh, [0,0,0], [], 0, "NONE"];
_vehicle setPos _pos;

_vehicle allowDamage false;
if ((vectorUp _vehicle) select 2 != 0) then {_vehicle setvectorup [0, 0, 0]};
_vehicle allowDamage true;

[_vehicle, _grp] call BIS_fnc_spawnCrew;

private _vehSpots = getNumber (configFile >> "CfgVehicles" >> _veh >> "transportSoldier");
if (_vehSpots > 0) then {
    for "_i" from 1 to _vehSpots do {
        _man1 = getText (configFile >> "CfgVehicles" >> _veh >> "crew");
        _man = _grp createUnit [_man1, [0,0,0], [], 0, "CAN_COLLIDE"];
        if !(_man moveInAny _vehicle) then {deleteVehicle _man};
    };
};

if (_clean) then {
    {
        _x setVariable ["syncedUnit", _syncedUnit];
        _x setVariable ["dissapearDistance", _dissapearDistance];
        _x addEventHandler ["killed", {_this call TB_LV_fnc_fnc_ACAIkilled}];
    } forEach ([_vehicle] + crew _vehicle);
};

driver _vehicle;