/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )
  
    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {};

params [
        ["_mkr", "", [""]],
        ["_infantry", [], [[]]],
        ["_LVeh", [], [[]]],
        ["_AVeh", [], [[]]],
        ["_SVeh", [], [[]]],
        ["_settings", [], [[]]],
        ["_basSettings", [], [[]]],
        ["_initialLaunch", false, [false]]
    ];

private _mPos = markerpos _mkr;

(getMarkerSize _mkr) params ["_mkrX", "_mkrY"];
private _mkrAgl = markerDir _mkr;

_infantry params [["_PApatrols", 0, [0]], ["_PAgroupSize", [], [[]]]];
_LVeh params [["_LVehGroups", 0, [0]], ["_LVgroupSize", [], [[]]]];
_AVeh params [["_AVehGroups", 0, [0]]];
_SVeh params [["_CHGroups", 0, [0]], ["_fSize", [], [[]]]];
_settings params [["_faction", 0, [0]], ["_mA", 0, [0]], ["_side", EAST, [sideUnknown]], ["_heightLimit", false, [false]]];
_basSettings params [["_pause", 0, [0]], ["_waves", 0, [0]], ["_timeout", 0, [0]], ["_eosZone", false, [false]], ["_hints", false, [false]]];

private _placement = (_mkrX max _mkrY) + 500;

private _mAH = 1;
private _mAN = 0.5;
if (_mA == 1) then {_mAH = 0; _mAN = 0;};
if (_mA == 2) then {_mAH = 0.5; _mAN = 0.5;};

private _enemyFaction = "east";
if (_side == WEST) then {_enemyFaction = "west"};
if (_side == INDEPENDENT) then {_enemyFaction = "GUER"};
if (_side == CIVILIAN) then {_enemyFaction = "civ"};

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

private _basActivated = createTrigger ["EmptyDetector", _mPos]; 
_basActivated setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
_basActivated setTriggerActivation ["ANY", "PRESENT", true]; 
_basActivated setTriggerStatements [_actCond, "", ""]; 

_mkr setMarkerColor bastionColor;
_mkr setMarkerAlpha _mAN;    
    
waitUntil {triggerActivated _basActivated};
_mkr setMarkerColor bastionColor;
_mkr setMarkerAlpha _mAH;

private _bastActive = createTrigger ["EmptyDetector", _mPos]; 
_bastActive setTriggerArea [_mkrX, _mkrY, _mkrAgl, false]; 
_bastActive setTriggerActivation ["any", "PRESENT", true];
_bastActive setTriggerTimeout [1, 1, 1, true];
_bastActive setTriggerStatements [_actCond, "", ""];

private _bastClear = createTrigger ["EmptyDetector", _mPos]; 
_bastClear setTriggerArea [_mkrX + (_placement * 0.3), _mkrY + (_placement * 0.3), _mkrAgl, FALSE]; 
_bastClear setTriggerActivation [_enemyFaction, "NOT PRESENT", true]; 
_bastClear setTriggerStatements ["this", "", ""]; 

// PAUSE IF REQUESTED                            
if (_pause > 0 and !_initialLaunch) then
{
    for "_counter" from 1 to _pause do
    {
        if (_hints) then {hint format ["Angriffs ETA : %1", _pause - _counter]};
        uiSleep 1;
    };
};

// SPAWN PATROLS        
private _aGroup = [];
for "_counter" from 1 to _PApatrols do
{
    private _pos = [_mPos, _placement, random 360] call BIS_fnc_relPos;
    private _grp = [_pos, _PAgroupSize, _faction, _side] call TB_EOS_fnc_spawnGroup;    
    _aGroup pushBack _grp;
};    

// SPAWN LIGHT VEHICLES        
private _bGrp = [];
for "_counter" from 1 to _LVehGroups do
{
    private _newpos = [_mPos, _placement + 200, random 360] call BIS_fnc_relPos;
    
    private _vehType = 7;
    private _cargoType = 9;
    if (surfaceIsWater _newpos) then
    {
        _vehType = 8;
        _cargoType = 10;
    };
    
    private _bGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;                    
    
    if ((_LVgroupSize select 0) > 0) then
    {
        private _cargoGrp = [_bGroup select 0, _LVgroupSize, _side, _faction, _cargoType] call TB_EOS_fnc_setCargo;
        [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
        _bGroup pushBack _cargoGrp;
    };

    [_bGroup select 2, "LIGskill"] call TB_EOS_fnc_setSkill;
    _bGrp pushBack _bGroup;
};

// SPAWN ARMOURED VEHICLES
private _cGrp = [];
for "_counter" from 1 to _AVehGroups do
{
    private _newpos = [_mPos, _placement, random 360] call BIS_fnc_relPos;
    private _vehType = if (surfaceiswater _newpos) then {8} else {2};
    private _cGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
    
    [_cGroup select 2, "ARMskill"] call TB_EOS_fnc_setSkill;    
    _cGrp pushBack _cGroup;
};

// SPAWN HELICOPTERS        
private _fGrp = [];
for "_counter" from 1 to _CHGroups do
{
    private _vehType = if ((_fSize select 0) > 0) then {4} else {3};
    private _newpos = [markerPos _mkr, 1500, random 360] call BIS_fnc_relPos;
    
    private _fGroup = [_newpos, _side, _faction, _vehType, "FLY"] call TB_EOS_fnc_spawnVehicle;    
    _fGrp pushBack _fGroup;
    
    if ((_fSize select 0) > 0) then
    {
        private _cargoGrp = [_fGroup select 0, _fSize, _side, _faction, 9] call TB_EOS_fnc_setCargo;
        [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
        
        _fGroup pushBack _cargoGrp;
        [_mkr, _fGroup] spawn TB_EOS_fnc_transportUnload;
    }
    else
    {
        _wp1 = (_fGroup select 2) addWaypoint [markerPos _mkr, 0];  
        _wp1 setWaypointSpeed "FULL";  
        _wp1 setWaypointType "SAD";
    };
};

// ADD WAYPOINTS
{
    private _getToMarker = _x addWaypoint [_mPos, 0];
    _getToMarker setWaypointType "SAD";
    _getToMarker setWaypointSpeed "NORMAL";
    _getToMarker setWaypointBehaviour "AWARE"; 
    _getToMarker setWaypointFormation "NO CHANGE";
}
forEach _aGroup;

{
    private _getToMarker = (_x select 2) addWaypoint [_mPos, 0];
    _getToMarker setWaypointType "MOVE";
    _getToMarker setWaypointSpeed "NORMAL";
    _getToMarker setWaypointBehaviour "AWARE"; 
    _getToMarker setWaypointFormation "NO CHANGE";
    
    _getToMarker = (_x select 2) addWaypoint [_mPos, 0];
    _getToMarker setWaypointType "SAD";
    _getToMarker setWaypointSpeed "NORMAL";
    _getToMarker setWaypointBehaviour "AWARE"; 
    _getToMarker setWaypointFormation "NO CHANGE";
}
forEach _cGrp;

{
    _x params ["_vehicle", "_vehCrew", "_grp", "_cargoGrp"];
    
    private _pos = [_mPos, _mkrX + 50, random 360] call BIS_fnc_relPos;
    private _getToMarker = (_x select 2) addWaypoint [_pos, 0];
    _getToMarker setWaypointType "TR UNLOAD";
    _getToMarker setWaypointSpeed "NORMAL";
    _getToMarker setWaypointBehaviour "AWARE"; 
    _getToMarker setWaypointFormation "NO CHANGE";
    
    private _wp = _cargoGrp addWaypoint [_mPos, 10];
    _wp setWaypointType "SAD";
    _wp setWaypointSpeed "NORMAL";
    _wp setWaypointBehaviour "AWARE"; 
    _wp setWaypointFormation "NO CHANGE";
    
    _wp = (_x select 2) addWaypoint [_mPos, 1];
    _wp setWaypointType "SAD";
    _wp setWaypointSpeed "NORMAL";
    _wp setWaypointBehaviour "AWARE"; 
    _wp setWaypointFormation "NO CHANGE";
}
forEach _bGrp;    

waitUntil {triggerActivated _bastActive};    

for "_counter" from 1 to _timeout do
{
    if (_hints) then
    {
        if (_waves > 1) then {hint format ["Nächste Welle in ETA : %1",(_timeout - _counter)];};
    };
    uiSleep 1;
    
    if (!triggerActivated _bastActive || getMarkerColor _mkr == "colorblack") exitwith 
    {
        _mkr setMarkerColor hostileColor;
        _mkr setMarkerAlpha _mAN;
        
        if (_eosZone) then {
            if (_hints) then {hint "Zone verloren, sie wurde besetzt!"};
        
            [
                _mkr,
                [_PApatrols, _PAgroupSize],
                [_PApatrols, _PAgroupSize],
                [_LVehGroups, _LVgroupSize],
                [_AVehGroups, 0, 0, 0],
                [_faction, _mA, 350, _side]
            ] spawn TB_EOS_fnc_core;
        };
        
        _waves = 0;
    };                
};

_waves = _waves - 1;
    
if (triggerActivated _bastActive && triggerActivated _bastClear && (_waves < 1)) then
{
    if (_hints) then  {hint "Keine feindliche Verstärkung mehr."};
    _mkr setMarkerColor VictoryColor;
    _mkr setMarkerAlpha _mAN;
}
else
{
    if (_waves >= 1) then
    {
        if (_hints) then {hint "Feindliche Verstärkung ist auf dem Weg."};
        [
            _mkr,
            [_PApatrols, _PAgroupSize],
            [_LVehGroups, _LVgroupSize],
            [_AVehGroups],
            [_CHGroups, _fSize],
            _settings,
            [_pause, _waves, _timeout, _eosZone, _hints],
            true
        ] spawn TB_EOS_fnc_bastionCore;
    };
};
    
waitUntil {getMarkerColor _mkr == "colorblack" || getMarkerColor _mkr == VictoryColor || getMarkerColor _mkr == hostileColor || !triggerActivated  _bastActive};
    
{_x call CBA_fnc_deleteEntity} forEach _aGroup;

if (count _cGrp > 0) then 
{                
    {
        _x params ["_vehicle", "_crew", "_grp"];

        _crew call CBA_fnc_deleteEntity;       
        if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};                                                
        _grp call CBA_fnc_deleteEntity;
    }
    forEach _cGrp;
};

if (count _bGrp > 0) then 
{                
    {
        _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];

        _crew call CBA_fnc_deleteEntity;       
        if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};                                                
        _grp call CBA_fnc_deleteEntity;
        _cargoGrp call CBA_fnc_deleteEntity;
    }
    forEach _bGrp;
};

// CACHE HELICOPTER TRANSPORT
if (count _fGrp > 0) then 
{            
    {
        _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];
        
        _crew call CBA_fnc_deleteEntity;       
        if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};                                                
        _grp call CBA_fnc_deleteEntity;
        _cargoGrp call CBA_fnc_deleteEntity;
    }
    forEach _fGrp;
};    

deleteVehicle _bastActive;
deleteVehicle _bastClear;
deleteVehicle _basActivated;

if (getMarkerColor _mkr == "colorblack") then {_mkr setMarkerAlpha 0};
