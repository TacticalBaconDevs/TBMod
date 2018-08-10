/*
    ***        ARMA3Alpha MILITARIZE AREA SCRIPT v3.5 - by SPUn / KAARTO MEDIA    ***
*/
if (!isServer) exitWith {};

params [
        ["_cPos", "", ["", [], objNull]],
        ["_classModuleFilters", [], [[]]],
        ["_side", 2, [0]],
        ["_radius", 150, [0]],
        ["_men", [true, false], [[]], 2],
        ["_vehicles", [true, false, false], [[]], 3],
        ["_still", false, [false]],
        ["_menRatio", [10,5], [[]]],
        ["_vehRatio", [0,1], [[]]],
        ["_skills", -1, [0]],
        ["_smokesAndChems", false, [true]],
        ["_doorHandling", false, [true]],
        ["_dynamicSimulation", false, [true]]
    ];

if (_cPos isEqualType "" && _cpos isEqualTo "") exitWith {systemChat "LV_militarize: no cPos"};
if (_classModuleFilters isEqualTo []) exitWith {systemChat "LV_militarize: no classModuleFilters"};

private _centerPos = nil;
if (_cPos isEqualType "" && {_cPos in allMapMarkers}) then {_centerPos = getMarkerPos _cPos};
if (_cPos isEqualType []) then {_centerPos = _cPos};
if (_cPos isEqualType objNull) then {_centerPos = getPos _cPos};
if (isNil "_centerPos") exitWith {systemChat "LV_militarize: no centerPos"};

private _menAmount = _menRatio#0 + (floor (random (_menRatio#1)));
private _vehAmount = _vehRatio#0 + (floor (random (_vehRatio#1)));

private _milGroup = createGroup (switch (_side) do { 
    case 1: {west};
    case 2: {east};
    case 3: {resistance};
    default {civilian};
});

private _menArray = [_classModuleFilters, 6] call TB_LV_fnc_classnames;
_menArray = [_menArray] call TB_LV_fnc_validateClassArrays;

private _diveArray = [_classModuleFilters, 7] call TB_LV_fnc_classnames;
_diveArray = [_diveArray] call TB_LV_fnc_validateClassArrays;

_men params [["_spawnLand", true, [false]], ["_spawnWater", false, [false]]];

if ((_spawnLand && _menArray isEqualTo []) || (_spawnWater && _diveArray isEqualTo [])) exitWith {systemChat "LV_militarize: keine Units ausdem configFilter, richtige Mods aktiv?"};

if (_spawnLand || _spawnWater) then {
    _wMode = 1;
    if (!_spawnWater) then {_wMode = _wMode - 1};
    if (!_spawnLand) then {_wMode = _wMode + 1};
    
    for "_i" from 1 to _menAmount do {
        private ["_unitType", "_pos"];
        _validPos = false;
        
        while {!_validPos} do {
            _dir = random 360;
            _range = random _radius;
            _pos0 = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
            _pos = [_pos0, 0, 35, 1, _wMode, 1, 0] call BIS_fnc_findSafePos;
            
            if (surfaceIsWater _pos) then {
                if (_spawnWater) then {
                    _unitType = selectRandom _diveArray;
                    _validPos = true;
                } else {
                    _wMode = 0;
                };
            } else {
                if (_spawnLand) then {
                    _unitType = selectRandom _menArray;
                    _validPos = true;
                } else {
                    _wMode = 2;
                };
            };
        };
        _unit = _milGroup createUnit [_unitType, _pos, [], 0, "NONE"];
        _unit allowDamage false;
        _unit setPos _pos;

        if (!_still) then {
            if (_unitType in _menArray) then {
                [_unit, _cPos, _radius, _doorHandling] execVM "\TBMod_zusatzStuff\LV\patrol-vD.sqf";
            } else {
                [_unit,_pos] spawn TB_LV_fnc_swimPatrol;
            };
        } else {
            doStop _unit;
        };
        
        if (_smokesAndChems) then {
            _unit addMagazine ["SmokeShell", 2];
            _unit addMagazine [selectRandom ["Chemlight_green", "Chemlight_red", "Chemlight_yellow", "Chemlight_blue"], 2];
        };
    };
};

_vehicles params [["_spawnLand", true, [false]], ["_spawnWater", true, [false]], ["_spawnAir", true, [false]]];
if (_spawnLand || _spawnWater || _spawnAir) then {
    private _wMode = 1;
    
    for "_i" from 1 to _vehAmount do {
        private _validPos = false;
        private _driver = objNull;
        
        while {!_validPos} do {
            _dir = random 360;
            _range = random _radius;
            _pos0 = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
            _pos = [_pos0, 0, 50, 5, _wMode, 0.25, 0] call BIS_fnc_findSafePos;
            
            if (surfaceIsWater _pos) then {
                if (_spawnWater) then {
                    _driver = [_pos, _milGroup, _classModuleFilters] call TB_LV_fnc_fullWaterVehicle;
                    if (!_still) then {
                        [vehicle _driver, _pos] execVM '\TBMod_zusatzStuff\LV\patrol-vH.sqf';
                    } else {
                        doStop (crew _driver);
                    };
                    _validPos = true;
                } else {
                    _wMode = 0;
                };
            } else {
                if (_spawnLand && _spawnAir) then {
                    _whichOne = floor (random 10);
                    if(_whichOne < 3)then{
                        _driver = [_pos, _milGroup,_classModuleFilters] call TB_LV_fnc_fullAirVehicle;
                        if (!_still) then {
                            [_driver, _pos, [200, 200]] execVM '\TBMod_zusatzStuff\LV\patrol-vE.sqf';
                        } else {
                            doStop (crew _driver);
                        };
                        (vehicle _driver) flyInHeight 10;
                    } else {
                        _driver = [_pos, _milGroup,_classModuleFilters] call TB_LV_fnc_fullLandVehicle;
                        if (!_still) then {
                            [vehicle _driver, _pos] execVM '\TBMod_zusatzStuff\LV\patrol-vE.sqf';
                        } else {
                            doStop (crew _driver);
                        };
                    };
                    
                    _validPos = true;
                } else {
                    if (_spawnLand) then {
                        _driver = [_pos, _milGroup,_classModuleFilters] call TB_LV_fnc_fullLandVehicle;
                        if (!_still) then {
                            [vehicle _driver, _pos] execVM '\TBMod_zusatzStuff\LV\patrol-vE.sqf';
                        } else {
                            doStop (crew _driver);
                        };
                        _validPos = true;
                    } else {
                        if (_spawnAir) then {
                            _driver = [_pos, _milGroup, _classModuleFilters] call TB_LV_fnc_fullAirVehicle;
                            if (!_still) then {
                                [_driver, _pos, [200,200]] execVM '\TBMod_zusatzStuff\LV\patrol-vE.sqf';
                            } else {
                                doStop (crew _driver);
                            };
                            (vehicle _driver) flyInHeight 10;
                            _validPos = true;
                        };
                    };
                };
            };        
        };
         
        _vehicle = vehicle _driver;
        _vehicle allowDamage false;
        
        (units _driver) joinSilent _milGroup;
    };
};

_milGroup setBehaviour "SAFE";
if (_skills  >= 0) then {{_x setSkill _skills} forEach (units _milGroup)};
{_x allowDamage true} forEach (units _milGroup);

if (_dynamicSimulation) then {
    _milGroup enableDynamicSimulation true;
    {
        _x triggerDynamicSimulation false;
        _x enableDynamicSimulation true;
        if (vehicle _x != _x) then {(vehicle _x) enableDynamicSimulation true};
    } forEach (units _milGroup);
};

if (_smokesAndChems) then {
    [_milGroup] spawn {
        params ["_milGroup"];
        
        while {{alive _x} count (units _milGroup) > 0} do {
            {
                if (behaviour _x == "COMBAT") then {
                    _chance = floor (random 100);
                    
                    if (_chance < 3 && {daytime > 23 || daytime < 5}) then {
                        private _mags = magazines _x;
                        
                        if ("Chemlight_green" in _mags) exitWith {
                            _x playActionNow "gestureCover";
                            _x selectWeapon "ChemlightGreenMuzzle";
                            _x fire ["ChemlightGreenMuzzle","ChemlightGreenMuzzle","Chemlight_green"];
                        };
                        if ("Chemlight_red" in _mags) exitWith {
                            _x playActionNow "gestureCover";
                            _x selectWeapon "ChemlightRedMuzzle";
                            _x fire ["ChemlightRedMuzzle","ChemlightRedMuzzle","Chemlight_red"];
                        };
                        if ("Chemlight_yellow" in _mags) exitWith {
                            _x playActionNow "gestureCover";
                            _x selectWeapon "ChemlightYellowMuzzle";
                            _x fire ["ChemlightYellowMuzzle","ChemlightYellowMuzzle","Chemlight_yellow"];
                        };
                        if ("Chemlight_blue" in _mags) exitWith {
                            _x playActionNow "gestureCover";
                            _x selectWeapon "ChemlightBlueMuzzle";
                            _x fire ["ChemlightBlueMuzzle","ChemlightBlueMuzzle","Chemlight_blue"];
                        };
                    };
                    
                    if ("SmokeShell" in (magazines _x)) then { 
                        if (_chance < 3) exitWith {
                            _x playActionNow "gestureCover";
                            _x selectWeapon "SmokeShellMuzzle";
                            _x fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
                        };
                    };
                };
            } forEach (units _milGroup);
            uiSleep 30;
        };
    };
};