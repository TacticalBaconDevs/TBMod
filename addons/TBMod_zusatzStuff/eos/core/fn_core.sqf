/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )
  
    Complete rewrite and modification:
        shukari
        Eric Ruhland
*/
if (!isServer) exitWith {};

params [
        "_mkr",
        "_hausInf",
        "_patrolInf",
        "_lightVeh",
        "_armorVeh",
        "_statics",
        "_helis",
        "_settings",
        ["_cache", false]
    ];

private _mPos = markerPos _mkr;

(getMarkerSize _mkr) params ["_mkrX", "_mkrY"];
private _mkrAgl = markerDir _mkr;

_hausInf params ["_hiGroups", "_hiSize", "_hiGroupsIncrease", "_hiSizeIncrease"];
_patrolInf params ["_piGroups", "_piSize", "_piGroupsIncrease", "_piSizeIncrease"];
_lightVeh params ["_lvGroups", "_lvSize", "_lvGroupsIncrease", "_lvSizeIncrease"];
_armorVeh params ["_avGroups", "_avGroupsIncrease"];
_statics params ["_stGroups", "_stGroupsIncrease"];
_helis params ["_hGroups", "_hSize", "_hGroupsIncrease", "_hSizeIncrease"];

_settings params ["_faction", "_distance", "_side", ["_heightLimit", false], "_parachuteJump", "_helicopterHeight", "_angriffsRichtungHeli"];

private _civZone = false;
private _enemyFaction = "east";
if (_side == WEST) then {_enemyFaction = "west"};
if (_side == INDEPENDENT) then {_enemyFaction = "GUER"};
if (_side == CIVILIAN) then {_enemyFaction = "civ"; _civZone = true};

// INITIATE ZONE
private _trig = format ["EOSTrigger%1", _mkr];
private _eosActivated = tb_server getVariable [_trig, objNull];
if (!_cache) then
{
    private _actCond = if (isMultiplayer) then
    {
        if (_heightLimit) then 
        {
            "{(vehicle _x) in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count playableUnits > 0"
        }
        else
        {
            "{(vehicle _x) in thisList && isPlayer _x} count playableUnits > 0"
        };
    }
    else
    {
        if (_heightLimit) then 
        {
            "{(vehicle _x) in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0"
        }
        else
        {
            "{(vehicle _x) in thisList && isPlayer _x} count allUnits > 0"
        };
    };
    
    _eosActivated = createTrigger ["EmptyDetector", _mPos]; 
    _eosActivated setTriggerArea [_distance + _mkrX, _distance + _mkrY, _mkrAgl, false]; 
    _eosActivated setTriggerActivation ["ANY", "PRESENT", true];
    _eosActivated setTriggerTimeout [1, 1, 1, true];
    _eosActivated setTriggerStatements [_actCond, "", ""];

    tb_server setVariable [_trig, _eosActivated];
};

if (getMarkerColor _mkr != "ColorGreen") then {_mkr setMarkerColor "ColorRed"};

// WAIT UNTIL PLAYERS IN ZONE
waitUntil {triggerActivated _eosActivated};

if (getMarkerColor _mkr != "ColorBlack") then
{
    _angriffsRichtungHeli params ["_baseDirHeli", "_randomDirHeli"];
    _randomDirHeli = 5 max _randomDirHeli min 360;
    private _attackDirHeli = _baseDirHeli + ((random (_randomDirHeli * 2)) - _randomDirHeli);
    private _playerCount = count (call CBA_fnc_players);
    
    // SPAWN HOUSE PATROLS
    private _hiZoneGroups = [];
    if (!_cache) then
    {
        _hiGroups = round (_hiGroups + (_hiGroupsIncrease * _playerCount));
        _hiSize = round (_hiSize + (_hiSizeIncrease * _playerCount));
    };
    for "_counter" from 1 to _hiGroups do
    {
        if (_cache) then
        {
            _hiSize = _eosActivated getVariable [format ["HP%1", _counter], _hiSize];    
        };
        
        if (_hiSize > 0) then
        {
            private _hiGroup = [_mPos, _hiSize, _faction, _side] call TB_EOS_fnc_spawnGroup;    
            
            if (!surfaceIsWater _mPos) then
            {
                [_mPos, units _hiGroup, _mkrX min _mkrY] call TB_EOS_fnc_shk_buildingpos;
            }
            else
            {
                [_hiGroup, _mkr] call TB_EOS_fnc_shk_patrol;
            };
            
            [_hiGroup, "INFskill"] call TB_EOS_fnc_setSkill;
            _hiZoneGroups pushBack _hiGroup;
        };
    };

    // SPAWN PATROLS
    private _piZoneGroups = [];
    if (!_cache) then
    {
        _piGroups = round (_piGroups + (_piGroupsIncrease * _playerCount));
        _piSize = round (_piSize + (_piSizeIncrease * _playerCount));
    };
    for "_counter" from 1 to _piGroups do
    {
        if (_cache) then
        {
            _piSize = _eosActivated getVariable [format ["PA%1", _counter], _piSize];   
        };

        if (_piSize > 0) then
        {    
            private _pos = [_mkr, true] call TB_EOS_fnc_shk_pos;            
            private _piGroup = [_pos, _piSize, _faction, _side] call TB_EOS_fnc_spawnGroup;
            [_piGroup, _mkr] call TB_EOS_fnc_shk_patrol;
            
            [_piGroup,"INFskill"] call TB_EOS_fnc_setSkill;
            _piZoneGroups pushBack _piGroup;
        };
    };    
    
    // SPAWN LIGHT VEHICLES
    private _lvZoneGroups = [];
    if (!_cache) then
    {
        _lvGroups = round (_lvGroups + (_lvGroupsIncrease * _playerCount));
        _lvSize = round (_lvSize + (_lvSizeIncrease * _playerCount));
    };
    for "_counter" from 1 to _lvGroups do
    {
        private _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        
        private _vehType = 7;
        private _cargoType = 9;
        if (surfaceIsWater _newpos) then
        {
            _vehType = 8;
            _cargoType = 10;
        };

        private _lvGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
        if !(_lvGroup isEqualTo []) then
        {
            if (_lvSize > 0) then
            {
                private _cargoGrp = [_lvGroup select 0, _lvSize, _side, _faction, _cargoType] call TB_EOS_fnc_setCargo;
                [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
                _lvGroup pushBack _cargoGrp;
            };

            [_lvGroup select 2, "LIGskill"] call TB_EOS_fnc_setSkill;
            [_lvGroup select 2, _mkr] call TB_EOS_fnc_shk_patrol;
            
            _lvZoneGroups pushBack _lvGroup;
        };
    };

    // SPAWN ARMOURED VEHICLES
    private _avZoneGroups = [];
    if (!_cache) then
    {
        _avGroups = round (_avGroups + (_avGroupsIncrease * _playerCount));
    };
    for "_counter" from 1 to _avGroups do
    {
        private _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        private _vehType = if (surfaceiswater _newpos) then {8} else {2};
        
        private _avGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
        
        if !(_avGroup isEqualTo []) then
        {
            [_avGroup select 2, "ARMskill"] call TB_EOS_fnc_setSkill;
            [_avGroup select 2, _mkr] call TB_EOS_fnc_shk_patrol;
        
            _avZoneGroups pushBack _avGroup;
        };
    };

    // SPAWN STATIC PLACEMENTS
    private _stZoneGroups = [];
    if (!_cache) then
    {
        _stGroups = round (_stGroups + (_stGroupsIncrease * _playerCount));
    };
    for "_counter" from 1 to _stGroups do
    {
        if (surfaceIsWater _mPos) exitwith {};
        
        private _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        private _stGroup = [_newpos, _side, _faction, 5] call TB_EOS_fnc_spawnVehicle;

        if !(_stGroup isEqualTo []) then
        {
            [_stGroup select 2, "STAskill"] call TB_EOS_fnc_setSkill;
            _stZoneGroups pushBack _stGroup;
        };
    };

    // SPAWN CHOPPER
    private _hZoneGroups = [];
    if (!_cache) then
    {
        _hGroups = round (_hGroups + (_hGroupsIncrease * _playerCount));
        _hSize = round (_hSize + (_hSizeIncrease * _playerCount));
    };
    for "_counter" from 1 to _hGroups do
    {
        private _vehType = if (_hSize > 0) then {4} else {3};
        
        private _newpos = [markerpos _mkr, 3000, _attackDirHeli] call BIS_fnc_relPos;    
        private _hGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;    
        
        if !(_hGroup isEqualTo []) then
        {
            if (_hSize > 0) then
            {
                private _cargoGrp = [_hGroup select 0, _hSize, _side, _faction, 9] call TB_EOS_fnc_setCargo;
                [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
                _hGroup pushBack _cargoGrp;
                [_mkr, _hGroup, _parachuteJump] spawn TB_EOS_fnc_transportUnload;
            }
            else
            {
                private _wp1 = (_hGroup select 2) addWaypoint [markerPos _mkr, 0];  
                _wp1 setWaypointSpeed "FULL";  
                _wp1 setWaypointType "SAD";
            };
            
            (_hGroup select 0) flyInHeight _helicopterHeight;
            [_hGroup select 2, "AIRskill"] call TB_EOS_fnc_setSkill;
            _hZoneGroups pushBack _hGroup;
        };
    };

    // SPAWN ALT TRIGGERS
    private _clear = createTrigger ["EmptyDetector", _mPos];
    _clear setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
    _clear setTriggerActivation [_enemyFaction, "NOT PRESENT", true];
    _clear setTriggerStatements ["this", "", ""];
    
    private _taken = createTrigger ["EmptyDetector", _mPos];
    _taken setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
    _taken setTriggerActivation ["ANY", "PRESENT", true];
    _taken setTriggerStatements ["{vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0", "", ""]; 
    private _eosAct = true;

    while {_eosAct} do
    {
        // IF PLAYER LEAVES THE AREA OR ZONE DEACTIVATED
        if (!triggerActivated _eosActivated || getMarkerColor _mkr == "ColorBlack") exitwith 
        {
            // CACHE PATROL INFANTRY
            {
                private _cacheGrp = format ["PA%1", _forEachIndex + 1];
                _eosActivated setVariable [_cacheGrp, {alive _x} count (units _x)];
                _x call CBA_fnc_deleteEntity;
            }
            forEach _piZoneGroups;

            // CACHE HOUSE INFANTRY              
            {
                private _cacheGrp = format ["HP%1", _forEachIndex + 1];
                _eosActivated setVariable [_cacheGrp, {alive _x} count (units _x)];
                _x call CBA_fnc_deleteEntity;
            }
            forEach _hiZoneGroups;
            
            //CACHE LIGHT VEHICLES
            {
                _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_lvGroups = _lvGroups - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
                if (!isNil "_cargoGrp") then {_cargoGrp call CBA_fnc_deleteEntity};
            }
            forEach _lvZoneGroups;
            
            // CACHE ARMOURED VEHICLES
            {
                _x params ["_vehicle", "_crew", "_grp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_avGroups = _avGroups - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
            }
            forEach _avZoneGroups;

            // CACHE MORTARS
            {
                _x params ["_vehicle", "_crew", "_grp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_stGroups = _stGroups - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
            }
            forEach _stZoneGroups;

            // CACHE HELICOPTER TRANSPORT
            {
                _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_hGroups = _hGroups - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
                if (!isNil "_cargoGrp") then {_cargoGrp call CBA_fnc_deleteEntity};
            }
            forEach _hZoneGroups;

            _eosAct = false;
        };
        
        // IF ZONE CAPTURED BEGIN CHECKING FOR ENEMIES
        if (triggerActivated _clear && triggerActivated _taken && !_civZone) exitwith 
        {
            _lvGroups = 0;
            _hiGroups = 0;
            _piGroups = 0;
            _avGroups = 0;
            _stGroups = 0;
            _hGroups = 0;
            
            while {triggerActivated _eosActivated && getMarkerColor _mkr != "ColorBlack"} do 
            {
                if (!triggerActivated _clear) then
                {
                    _mkr setMarkerColor "ColorRed";
                }
                else
                {
                    _mkr setMarkerColor "ColorGreen";
                };
                
                uiSleep 1;
            };
            
            // PLAYER LEFT ZONE
            _eosAct = false;
        };
        
        uiSleep 0.5;
    };

    deleteVehicle _clear;
    deleteVehicle _taken;    

    if (getMarkerColor _mkr != "ColorBlack") then
    {
        [
            _mkr,
            [_hiGroups, _hiSize, _hiGroupsIncrease, _hiSizeIncrease],
            [_piGroups, _piSize, _piGroupsIncrease, _piSizeIncrease],
            [_lvGroups, _lvSize, _lvGroupsIncrease, _lvSizeIncrease],
            [_avGroups, _avGroupsIncrease],
            [_stGroups, _stGroupsIncrease],
            [_hGroups, _hSize, _hGroupsIncrease, _hSizeIncrease],
            _settings,
            true
        ] spawn TB_EOS_fnc_core;
    }
    else
    {
        _mkr setMarkerAlpha 0;
    };
};
