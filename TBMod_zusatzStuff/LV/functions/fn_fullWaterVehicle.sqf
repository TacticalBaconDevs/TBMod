//ARMA3Alpha function LV_fnc_fullVehicle v2.0 - by SPUn / Kaarto Media
//Spawns random water vehicle full of units and returns the driver 
params [
        ["_pos", [], [[]]],
        ["_grp", grpNull, [grpNull]],
        ["_classModuleFilters", [], [[]]],
        ["_syncedUnit", nil, [[]]],
        ["_dissapearDistance", nil, [0]],
        ["_clean", false, [false]]
    ];

private _veh = [_classModuleFilters, 5] call TB_LV_fnc_classnames;
_veh = [_veh] call LV_validateClassArrays;
_veh = selectRandom _veh;

private _vehicle = createVehicle [_veh, [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle setPos _pos;

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
