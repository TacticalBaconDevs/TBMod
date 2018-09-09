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
        "_a",
        "_b",
        "_c",
        "_d",
        "_e",
        "_f",
        "_settings",
        ["_heightLimit", false],
        ["_cache", false]
    ];

private _mPos = markerPos _mkr;

(getMarkerSize _mkr) params ["_mkrX", "_mkrY"];
private _mkrAgl = markerDir _mkr;

_a params ["_aGrps", "_aSize", "_aGrpsIncrease", "_aSizeIncrease"];
_b params ["_bGrps", "_bSize", "_bGrpsIncrease", "_bSizeIncrease"];
_c params ["_cGrps", "_cSize", "_cGrpsIncrease", "_cSizeIncrease"];

_d params ["_dGrps", "_dGrpsIncrease"];
_e params ["_eGrps", "_eGrpsIncrease"];
_f params ["_fGrps", "_fSize", "_fGrpsIncrease", "_fSizeIncrease"];

_settings params ["_faction", "_mA", "_distance", "_side"];

private _civZone = false;
private _enemyFaction = "east";
if (_side == WEST) then {_enemyFaction = "west"};
if (_side == INDEPENDENT) then {_enemyFaction = "GUER"};
if (_side == CIVILIAN) then {_enemyFaction = "civ"; _civZone = true};

private _mAH = 1;
private _mAN = 0.5;
if (_mA == 1) then {_mAH = 0; _mAN = 0;};
if (_mA == 2) then {_mAH = 0.5; _mAN = 0.5;};

// INITIATE ZONE
private _trig = format ["EOSTrigger%1", _mkr];

private _eosActivated = tb_server getVariable [_trig, objNull];
if (!_cache) then
{
    private _actCond = "";
    
    if (isMultiplayer) then
    {
        if (_heightLimit) then 
        {
            _actCond = "{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 5} count playableunits > 0";
        }
        else
        {
            _actCond = "{vehicle _x in thisList && isplayer _x} count playableunits > 0";
        };
    }
    else
    {
        if (_heightLimit) then 
        {
            _actCond = "{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0";
        }
        else
        {
            _actCond = "{vehicle _x in thisList && isplayer _x} count allUnits > 0";
        };
    };
    
    _eosActivated = createTrigger ["EmptyDetector", _mPos]; 
    _eosActivated setTriggerArea [_distance + _mkrX, _distance + _mkrY, _mkrAgl, false]; 
    _eosActivated setTriggerActivation ["ANY", "PRESENT", true];
    _eosActivated setTriggerTimeout [1, 1, 1, true];
    _eosActivated setTriggerStatements [_actCond, "", ""];

    tb_server setVariable [_trig, _eosActivated];
};

_mkr setMarkerAlpha _mAN;
if !(getMarkerColor _mkr == VictoryColor) then {_mkr setMarkerColor hostileColor};

//WAIT UNTIL PLAYERS IN ZONE
waitUntil {triggerActivated _eosActivated};

if (getMarkerColor _mkr != "ColorBlack") then
{
    if (getMarkerColor _mkr != VictoryColor) then {_mkr setMarkerAlpha _mAH};

    // SPAWN HOUSE PATROLS
    private _playerCount = count allPlayers;
    private _aGrp = [];
    for "_counter" from 1 to (_aGrps + (_aGrpsIncrease * _playerCount)) do
    {
    
        if (_cache) then
        {
            private _cacheGrp = format ["HP%1", _counter];
            _aSize = _eosActivated getVariable [_cacheGrp, _aSize + (_aSizeIncrease * _playerCount)];    
        };
        
        if (_aSize + (_aSizeIncrease * _playerCount) > 0) then
        {
            private _aGroup = [_mPos, _aSize + (_aSizeIncrease * _playerCount), _faction, _side] call TB_EOS_fnc_spawnGroup;    
            
            if (!surfaceIsWater _mPos) then
            {
                [_mPos, units _aGroup, _mkrX min _mkrY] call TB_EOS_fnc_shk_buildingpos;
            }
            else
            {
                [_aGroup, _mkr] call TB_EOS_fnc_shk_patrol;
            };
            
            [_aGroup, "INFskill"] call TB_EOS_fnc_setSkill;
            _aGrp pushBack _aGroup;
        };
    };

    // SPAWN PATROLS
    private _bGrp = [];
    for "_counter" from 1 to (_bGrps + (_bGrpsIncrease * _playerCount)) do
    {
        if (_cache) then
        {
            private _cacheGrp = format ["PA%1", _counter];
             _bSize = _eosActivated getVariable [_cacheGrp, _bSize + (_bSizeIncrease * _playerCount)];   
        };

        if (_bSize + (_bSizeIncrease * _playerCount) > 0) then
        {    
            private _pos = [_mkr, true] call TB_EOS_fnc_shk_pos;            
            private _bGroup = [_pos, _bSize + (_bSizeIncrease * _playerCount), _faction, _side] call TB_EOS_fnc_spawnGroup;
            [_bGroup, _mkr] call TB_EOS_fnc_shk_patrol;
            
            [_bGroup,"INFskill"] call TB_EOS_fnc_setSkill;
            _bGrp pushBack _bGroup;
        };
    };    
        
    //SPAWN LIGHT VEHICLES
    private _cGrp = [];
    for "_counter" from 1 to (_cGrps + (_cGrpsIncrease * _playerCount)) do
    {
        private _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        
        private _vehType = 7;
        private _cargoType = 9;
        if (surfaceIsWater _newpos) then
        {
            _vehType = 8;
            _cargoType = 10;
        };

        private _cGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
        if (_cSize + (_cSizeIncrease * _playerCount) > 0) then
        {
            private _cargoGrp = [_cGroup select 0, _cSize + (_cSizeIncrease * _playerCount), _side, _faction, _cargoType] call TB_EOS_fnc_setCargo;
            [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
        };

        [_cGroup select 2, "LIGskill"] call TB_EOS_fnc_setSkill;
        [_cGroup select 2, _mkr] call TB_EOS_fnc_shk_patrol;
        
        _cGrp pushBack _cGroup;
    };

    //SPAWN ARMOURED VEHICLES
    private _dGrp = [];
    for "_counter" from 1 to (_dGrps + (_dGrpsIncrease * _playerCount)) do
    {
        private _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        private _vehType = if (surfaceiswater _newpos) then {8} else {2};
        
        private _dGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
        
        [_dGroup select 2, "ARMskill"] call TB_EOS_fnc_setSkill;
        [_dGroup select 2, _mkr] call TB_EOS_fnc_shk_patrol;
        
        _dGrp pushBack _dGroup;
    };

    //SPAWN STATIC PLACEMENTS
    private _eGrp = [];
    for "_counter" from 1 to (_eGrps + (_eGrpsIncrease * _playerCount)) do
    {
        if (surfaceIsWater _mPos) exitwith {};
        
        private _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        private _eGroup = [_newpos, _side, _faction, 5] call TB_EOS_fnc_spawnVehicle;
        [_eGroup select 2, "STAskill"] call TB_EOS_fnc_setSkill;
        
        _eGrp pushBack _eGroup;
    };

    //SPAWN CHOPPER
    private _fGrp = [];
    for "_counter" from 1 to (_fGrps + (_fGrpsIncrease * _playerCount)) do
    {
        private _vehType = if (_fSize + (_fSizeIncrease * _playerCount) > 0) then {4} else {3};
        
        private _newpos = [markerpos _mkr, 3000, random 360] call BIS_fnc_relPos;    
        private _fGroup = [_newpos, _side, _faction, _vehType, "FLY"] call TB_EOS_fnc_spawnVehicle;    
        
        if (_fSize + (_fSizeIncrease * _playerCount) > 0) then
        {
            private _cargoGrp = [_fGroup select 0, _fSize + (_fSizeIncrease * _playerCount), _side, _faction, 9] call TB_EOS_fnc_setCargo;
            [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
            _fGroup pushBack _cargoGrp;
            [_mkr, _fGroup] spawn TB_EOS_fnc_transportUnload;
        }
        else
        {
            private _wp1 = (_fGroup select 2) addWaypoint [markerPos _mkr, 0];  
            _wp1 setWaypointSpeed "FULL";  
            _wp1 setWaypointType "SAD";
        };
        
        [_fGroup select 2, "AIRskill"] call TB_EOS_fnc_setSkill;
        _fGrp pushBack _fGroup;
    };

    //SPAWN ALT TRIGGERS
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
            //CACHE LIGHT VEHICLES
            {
                _x params ["_vehicle", "_crew", "_grp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_cGrps = _cGrps - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
            }
            forEach _cGrp;
            
            // CACHE ARMOURED VEHICLES
            {
                _x params ["_vehicle", "_crew", "_grp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_dGrps = _dGrps - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
            }
            forEach _dGrp;

            // CACHE PATROL INFANTRY
            {
                private _cacheGrp = format ["PA%1", _forEachIndex + 1];
                _eosActivated setVariable [_cacheGrp, {alive _x} count (units _x)];
                _x call CBA_fnc_deleteEntity;
            }
            forEach _bGrp;

            // CACHE HOUSE INFANTRY              
            {
                private _cacheGrp = format ["HP%1", _forEachIndex + 1];
                _eosActivated setVariable [_cacheGrp, {alive _x} count (units _x)];
                _x call CBA_fnc_deleteEntity;
            }
            forEach _aGrp;

            // CACHE MORTARS
            {
                _x params ["_vehicle", "_crew", "_grp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_eGrps = _eGrps - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
            }
            forEach _eGrp;

            // CACHE HELICOPTER TRANSPORT
            {
                _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];
                
                if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_fGrps = _fGrps - 1};
                _crew call CBA_fnc_deleteEntity;
                if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                _grp call CBA_fnc_deleteEntity;
                if (!isNil "_cargoGrp") then {_cargoGrp call CBA_fnc_deleteEntity};
            }
            forEach _fGrp;

            _eosAct = false;
        };
        
        // IF ZONE CAPTURED BEGIN CHECKING FOR ENEMIES
        if (triggerActivated _clear && triggerActivated _taken && !_civZone) exitwith 
        {
            _cGrps = 0;
            _aGrps = 0;
            _bGrps = 0;
            _dGrps = 0;
            _eGrps = 0;
            _fGrps = 0;
            
            while {triggerActivated _eosActivated && !(getMarkerColor _mkr == "ColorBlack")} do 
            {
                if (!triggerActivated _clear) then
                {
                    _mkr setMarkerColor hostileColor;
                    _mkr setMarkerAlpha _mAH;
                }
                else
                {
                    _mkr setMarkerColor VictoryColor;
                    _mkr setMarkerAlpha _mAN;
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
            _a,
            _b,
            _c,
            _d,
            _e,
            _f
            _settings,
            _heightLimit,
            true
        ] spawn TB_EOS_fnc_core;
    }
    else
    {
        _Mkr setMarkerAlpha 0;
    };
};
