private ["_newpos","_cargoType","_vehType","_dGrp","_bGroup","_fGrp","_eGrp","_aGrp","_units","_bGrp","_trig","_grp","_crew","_vehicle","_actCond","_mAN",
    "_mAH","_cGrp","_taken","_clear","_enemyFaction","_n","_eosAct","_eosActivated"];

if (!isServer) exitWith {};

params [
        "_mkr",
        "_a",
        "_b",
        "_c",
        "_d",
        "_settings",
        ["_heightLimit", false],
        ["_cache", false]
    ];

private _mPos = markerPos _mkr;

(getMarkerSize _mkr) params ["_mkrX", "_mkrY"];
private _mkrAgl = markerDir _mkr;

_a params ["_aGrps", "_aSize"];
private _aMin = _aSize select 0;

_b params ["_bGrps", "_bSize"];
private _bMin = _bSize select 0;

_c params ["_cGrps", "_cSize"];

_d params ["_dGrps", "_eGrps", "_fGrps", "_fSize"];

_settings params ["_faction", "_mA", "_distance", "_side"];

private _civZone = false;
if (_side==EAST) then {_enemyFaction="east"};
if (_side==WEST) then {_enemyFaction="west"};
if (_side==INDEPENDENT) then {_enemyFaction="GUER"};
if (_side==CIVILIAN) then {_enemyFaction="civ"; _civZone=true};

if (_mA==0) then {_mAH = 1;_mAN = 0.5;};
if (_mA==1) then {_mAH = 0;_mAN = 0;};
if (_mA==2) then {_mAH = 0.5;_mAN = 0.5;};

// INITIATE ZONE
private _trig = format ["EOSTrigger%1", _mkr];

if (!_cache) then
{
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
}
else
{
    _eosActivated = tb_server getVariable _trig;    
};

_mkr setmarkerAlpha _mAN;
if !(getmarkercolor _mkr == VictoryColor) then {_mkr setmarkercolor hostileColor};

waituntil {triggeractivated _eosActivated};    //WAIT UNTIL PLAYERS IN ZONE

if !(getmarkercolor _mkr == "colorblack") then
{
    if !(getmarkercolor _mkr == VictoryColor) then {_mkr setmarkerAlpha _mAH};

    // SPAWN HOUSE PATROLS
    for "_counter" from 1 to _aGrps do
    {
        if (isNil "_aGrp") then {_aGrp=[]};
        if (_cache) then
        {
            _cacheGrp = format ["HP%1", _counter];
            _units = _eosActivated getVariable [_cacheGrp, 0];    
            _aSize = [_units, _units];
            _aMin = _aSize select 0;
        };
        
        if (_aMin > 0) then
        {
            _aGroup = [_mPos, _aSize, _faction, _side] call TB_EOS_fnc_spawnGroup;    
            
            if (!surfaceIsWater _mPos) then
            {
                [_mPos, units _aGroup, _mkrX, 0, [0, 20], true, true] call TB_EOS_fnc_shk_buildingpos;
            }
            else
            {
                [_aGroup, _mkr] call TB_EOS_fnc_shk_patrol;
            };
            
            _aGrp pushBack _aGroup;
            [_aGroup, "INFskill"] call TB_EOS_fnc_setSkill;
        };
    };

    // SPAWN PATROLS
    for "_counter" from 1 to _bGrps do
    {
        if (isNil "_bGrp") then {_bGrp=[]};
        if (_cache) then
        {
            _cacheGrp = format ["PA%1", _counter];
            _units = _eosActivated getVariable _cacheGrp;    
            _bSize = [_units, _units];
            _bMin = _bSize select 0;
        };

        if (_bMin > 0) then
        {    
            _pos = [_mkr, true] call TB_EOS_fnc_shk_pos;            
            _bGroup = [_pos, _bSize, _faction, _side] call TB_EOS_fnc_spawnGroup;
            [_bGroup, _mkr] call TB_EOS_fnc_shk_patrol;
            
            _bGrp pushBack _bGroup;
            [_bGroup,"INFskill"] call TB_EOS_fnc_setSkill;
        };
    };    
        
    //SPAWN LIGHT VEHICLES
    for "_counter" from 1 to _cGrps do
    {    
        if (isNil "_cGrp") then {_cGrp=[]};    

        _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        if (surfaceIsWater _newpos) then
        {
            _vehType=8;
            _cargoType=10;
        }
        else
        {
            _vehType=7;
            _cargoType=9;
        };

        _cGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
        if ((_cSize select 0) > 0) then
        {
            private _cargoGrp = [_cGroup select 0, _cSize, _side, _faction, _cargoType] call TB_EOS_fnc_setCargo;
            [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
        };

        [_cGroup select 2, "LIGskill"] call TB_EOS_fnc_setSkill;
        [_cGroup select 2, _mkr] call TB_EOS_fnc_shk_patrol;
        
        _cGrp pushBack _cGroup;
    };

    //SPAWN ARMOURED VEHICLES
    for "_counter" from 1 to _dGrps do
    {
        if (isNil "_dGrp") then {_dGrp = []};

        _newpos=[_mkr,50] call TB_EOS_fnc_findSafePos;
        if (surfaceiswater _newpos) then {_vehType = 8} else {_vehType = 2};
        
        _dGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
        
        [_dGroup select 2, "ARMskill"] call TB_EOS_fnc_setSkill;
        [_dGroup select 2, _mkr] call TB_EOS_fnc_shk_patrol;
        
        _dGrp pushBack _dGroup;
    };

    //SPAWN STATIC PLACEMENTS
    for "_counter" from 1 to _eGrps do
    {
        if (surfaceIsWater _mPos) exitwith {};
        if (isNil "_eGrp") then {_eGrp = []};
        
        _newpos = [_mkr, 50] call TB_EOS_fnc_findSafePos;
        _eGroup = [_newpos, _side, _faction, 5] call TB_EOS_fnc_spawnVehicle;
        [_eGroup select 2, "STAskill"] call TB_EOS_fnc_setSkill;
        
        _eGrp pushBack _eGroup;
    };

    //SPAWN CHOPPER
    for "_counter" from 1 to _fGrps do
    {
        if (isNil "_fGrp") then {_fGrp = []};
        if ((_fSize select 0) > 0) then {_vehType = 4} else {_vehType = 3};
        _newpos = [markerpos _mkr, 1500, random 360] call BIS_fnc_relPos;    
        _fGroup = [_newpos, _side, _faction, _vehType, "fly"] call TB_EOS_fnc_spawnVehicle;    
        
        if ((_fSize select 0) > 0) then
        {
            private _cargoGrp = [_fGroup select 0, _fSize, _side, _faction, 9] call TB_EOS_fnc_setCargo;
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
    _clear = createTrigger ["EmptyDetector",_mPos];
    _clear setTriggerArea [_mkrX,_mkrY,_mkrAgl,FALSE];
    _clear setTriggerActivation [_enemyFaction,"NOT PRESENT",true];
    _clear setTriggerStatements ["this","",""];
    _taken = createTrigger ["EmptyDetector",_mPos];
    _taken setTriggerArea [_mkrX,_mkrY,_mkrAgl,FALSE];
    _taken setTriggerActivation ["ANY","PRESENT",true];
    _taken setTriggerStatements ["{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0","",""]; 
    _eosAct = true;

    while {_eosAct} do
    {
        // IF PLAYER LEAVES THE AREA OR ZONE DEACTIVATED
        if (!triggeractivated _eosActivated || getmarkercolor _mkr == "colorblack") exitwith 
        {
            //CACHE LIGHT VEHICLES
            if (!isNil "_cGrp") then
            {
                {
                    _x params ["_vehicle", "_crew", "_grp"];
                    
                    if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_cGrps = _cGrps - 1};
                    _crew call CBA_fnc_deleteEntity;
                    if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                    _grp call CBA_fnc_deleteEntity;
                }
                forEach _cGrp;
            };
            
            // CACHE ARMOURED VEHICLES
            if (!isNil "_dGrp") then 
            {
                {
                    _x params ["_vehicle", "_crew", "_grp"];
                    
                    if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_dGrps = _dGrps - 1};
                    _crew call CBA_fnc_deleteEntity;
                    if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                    _grp call CBA_fnc_deleteEntity;
                }
                forEach _dGrp;
            };

            // CACHE PATROL INFANTRY
            if (!isNil "_bGrp") then 
            {
                {
                    private _cacheGrp = format ["PA%1", _forEachIndex + 1];
                    _eosActivated setVariable [_cacheGrp, {alive _x} count (units _x)];
                    _x call CBA_fnc_deleteEntity;
                }
                forEach _bGrp;
            };

            // CACHE HOUSE INFANTRY
            if (!isNil "_aGrp") then 
            {                
                {
                    private _cacheGrp = format ["HP%1", _forEachIndex + 1];
                    _eosActivated setVariable [_cacheGrp, {alive _x} count (units _x)];
                    _x call CBA_fnc_deleteEntity;
                }
                forEach _aGrp;
            };

            // CACHE MORTARS
            if (!isNil "_eGrp") then
            {
                {
                    _x params ["_vehicle", "_crew", "_grp"];
                    
                    if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_eGrps = _eGrps - 1};
                    _crew call CBA_fnc_deleteEntity;
                    if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                    _grp call CBA_fnc_deleteEntity;
                }
                forEach _eGrp;
            };

            // CACHE HELICOPTER TRANSPORT
            if (!isNil "_fGrp") then
            {
                {
                    _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];
                    
                    if (!alive _vehicle || ({alive _x} count _crew) == 0) then {_fGrps = _fGrps - 1};
                    _crew call CBA_fnc_deleteEntity;
                    if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
                    _grp call CBA_fnc_deleteEntity;
                    if (!isNil "_cargoGrp") then {_cargoGrp call CBA_fnc_deleteEntity};
                }
                forEach _fGrp;
            };

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
            
            while {triggerActivated _eosActivated && !(getMarkerColor _mkr == "colorblack")} do 
            {
                if (!triggerActivated _clear) then
                {
                    _mkr setmarkercolor hostileColor;
                    _mkr setmarkerAlpha _mAH;
                }
                else
                {
                    _mkr setmarkercolor VictoryColor;
                    _mkr setmarkerAlpha _mAN;
                };
                
                uiSleep 1;
            };
            
            // PLAYER LEFT ZONE
            _eosAct = false;
        };
        
        uiSleep 0.5;
    };

    deletevehicle _clear;
    deletevehicle _taken;    

    if (getMarkerColor _mkr != "colorblack") then
    {    
        [
            _mkr,
            [_aGrps, _aSize],
            [_bGrps, _bSize],
            [_cGrps, _cSize],
            [_dGrps, _eGrps, _fGrps, _fSize],
            _settings,
            _heightLimit,
            true
        ] spawn TB_EOS_fnc_core;
    }
    else
    {
        _Mkr setmarkeralpha 0;
    };
};
