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
        "_mkr",
        "_patrolInf",
        "_lightVeh",
        "_armorVeh",
        "_helis",
        "_settings",
        "_basSettings",
        ["_initialLaunch", false, [false]]
    ];

private _mPos = markerpos _mkr;

(getMarkerSize _mkr) params ["_mkrX", "_mkrY"];
private _mkrAgl = markerDir _mkr;

_patrolInf params ["_piGroups", "_piSize", "_piGroupsIncrease", "_piSizeIncrease"];
_lightVeh params ["_lvGroups", "_lvSize", "_lvGroupsIncrease", "_lvSizeIncrease"];
_armorVeh params ["_avGroups", "_avGroupsIncrease"];
_helis params ["_hGroups", "_hSize", "_hGroupsIncrease", "_hSizeIncrease"];

_settings params ["_faction", "_side", "_heightLimit", "_placementRadius", "_parachuteJump"];
_basSettings params ["_pause", "_waves", "_timeout", "_eosZone", "_hints"];

private _radius = _mkrX max _mkrY;
private _placement = _radius + _placementRadius;

private _enemyFaction = "east";
if (_side == WEST) then {_enemyFaction = "west"};
if (_side == INDEPENDENT) then {_enemyFaction = "GUER"};
if (_side == CIVILIAN) then {_enemyFaction = "civ"};

private _actCond = if (isMultiplayer) then
{
    if (_heightLimit) then 
    {
        "{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 5} count playableunits > 0"
    }
    else 
    {
        "{vehicle _x in thisList && isplayer _x} count playableunits > 0"
    };
}
else
{
    if (_heightLimit) then 
    {
        "{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0"
    }
    else
    {
        "{vehicle _x in thisList && isplayer _x} count allUnits > 0"
    };
};

private _basActivated = createTrigger ["EmptyDetector", _mPos]; 
_basActivated setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
_basActivated setTriggerActivation ["ANY", "PRESENT", true]; 
_basActivated setTriggerStatements [_actCond, "", ""]; 

_mkr setMarkerColor "ColorOrange";

waitUntil {triggerActivated _basActivated};

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

private _playerCount = count (call CBA_fnc_players);

// SPAWN PATROLS        
private _piZoneGroups = [];
_piGroups = round (_piGroups + (_piGroupsIncrease * _playerCount));
_piSize = round (_piSize + (_piSizeIncrease * _playerCount));
for "_counter" from 1 to _piGroups do
{
    private _pos = [_mPos, _radius + 200, random 360] call BIS_fnc_relPos;
    private _piGroup = [_pos, _piSize, _faction, _side] call TB_EOS_fnc_spawnGroup;    
    _piZoneGroups pushBack _piGroup;
};    

// SPAWN LIGHT VEHICLES        
private _lvZoneGroups = [];
_lvGroups = round (_lvGroups + (_lvGroupsIncrease * _playerCount));
_lvSize = round (_lvSize + (_lvSizeIncrease * _playerCount));
for "_counter" from 1 to _lvGroups do
{
    private _newpos = [_mPos, _placement, random 360] call BIS_fnc_relPos;
    
    private _vehType = 7;
    private _cargoType = 9;
    if (surfaceIsWater _newpos) then
    {
        _vehType = 8;
        _cargoType = 10;
    };
    
    private _lvGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;                    
    
    if (_lvSize > 0) then
    {
        private _cargoGrp = [_lvGroup select 0, _lvSize, _side, _faction, _cargoType] call TB_EOS_fnc_setCargo;
        [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
        _lvGroup pushBack _cargoGrp;
    };

    [_lvGroup select 2, "LIGskill"] call TB_EOS_fnc_setSkill;
    _lvZoneGroups pushBack _lvGroup;
};

// SPAWN ARMOURED VEHICLES
private _avZoneGroups = [];
_avGroups = round (_avGroups + (_avGroupsIncrease * _playerCount));
for "_counter" from 1 to _avGroups do
{
    private _newpos = [_mPos, _placement, random 360] call BIS_fnc_relPos;
    private _vehType = if (surfaceiswater _newpos) then {8} else {2};
    private _avGroup = [_newpos, _side, _faction, _vehType] call TB_EOS_fnc_spawnVehicle;
    
    [_avGroup select 2, "ARMskill"] call TB_EOS_fnc_setSkill;    
    _avZoneGroups pushBack _avGroup;
};

// SPAWN HELICOPTERS        
private _hZoneGroups = [];
_hGroups = round (_hGroups + (_hGroupsIncrease * _playerCount));
_hSize = round (_hSize + (_hSizeIncrease * _playerCount));
for "_counter" from 1 to _hGroups do
{
    private _vehType = if (_hSize > 0) then {4} else {3};
    private _newpos = [markerPos _mkr, _placement + 1000, random 360] call BIS_fnc_relPos;
    
    private _hGroup = [_newpos, _side, _faction, _vehType, "FLY"] call TB_EOS_fnc_spawnVehicle;    
    
    if (_hSize > 0) then
    {
        private _cargoGrp = [_hGroup select 0, _hSize, _side, _faction, 9] call TB_EOS_fnc_setCargo;
        [_cargoGrp, "INFskill"] call TB_EOS_fnc_setSkill;
        
        _hGroup pushBack _cargoGrp;
        [_mkr, _hGroup, _parachuteJump] spawn TB_EOS_fnc_transportUnload;
    }
    else
    {
        _wp1 = (_hGroup select 2) addWaypoint [markerPos _mkr, 0];  
        _wp1 setWaypointSpeed "FULL";
        _wp1 setWaypointType "SAD";
    };
    
    _hZoneGroups pushBack _hGroup;
};

// ADD WAYPOINTS
{
    private _getToMarker = _x addWaypoint [_mPos, 0];
    _getToMarker setWaypointType "SAD";
    _getToMarker setWaypointSpeed "NORMAL";
    _getToMarker setWaypointBehaviour "AWARE";
    _getToMarker setWaypointFormation "NO CHANGE";
}
forEach _piZoneGroups;

{
    _x params ["_vehicle", "_vehCrew", "_piGroup", "_cargoGrp"];

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
forEach _lvZoneGroups;

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
forEach _avZoneGroups;


waitUntil {triggerActivated _bastActive};

for "_counter" from 1 to _timeout do
{
    if (_hints) then
    {
        if (_waves > 1) then {hint format ["Nächste Welle in ETA: %1", _timeout - _counter]};
    };
    uiSleep 1;
    
    if (!triggerActivated _bastActive || getMarkerColor _mkr == "colorblack") exitwith 
    {
        _mkr setMarkerColor "ColorRed";
        
        if (_eosZone) then
        {
            if (_hints) then {hint "Zone verloren, sie wurde besetzt!"};
        
            [
                _mkr,
                _patrolInf,
                [_piGroups/2, _piSize/2, _piGroupsIncrease/2, _piSizeIncrease/2],
                _lightVeh,
                _armorVeh,
                [1, 0.1],       // Statics
                _helis,
                [_faction, 350, _side, _heightLimit]
            ] spawn TB_EOS_fnc_core;
        };
        
        _waves = 0;
    };
};

_waves = _waves - 1;
    
if (triggerActivated _bastActive && triggerActivated _bastClear && (_waves < 1)) then
{
    if (_hints) then  {hint "Keine feindliche Verstärkung mehr"};
    _mkr setMarkerColor "ColorGreen";
}
else
{
    if (_waves >= 1) then
    {
        if (_hints) then {hint "Feindliche Verstärkung ist auf dem Weg"};
        [
            _mkr,
            _patrolInf,
            _lightVeh,
            _armorVeh,
            _helis,
            _settings,
            _basSettings,
            true
        ] spawn TB_EOS_fnc_bastionCore;
    };
};
    
waitUntil {getMarkerColor _mkr == "colorblack" || getMarkerColor _mkr == "ColorGreen" || getMarkerColor _mkr == "ColorRed" || !triggerActivated  _bastActive};
    
{_x call CBA_fnc_deleteEntity} forEach _piZoneGroups;

if (count _lvZoneGroups > 0) then
{
    {
        _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];

        _crew call CBA_fnc_deleteEntity;
        if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
        _grp call CBA_fnc_deleteEntity;
        if (!isNil "_cargoGrp") then {_cargoGrp call CBA_fnc_deleteEntity};
    }
    forEach _lvZoneGroups;
};

if (count _avZoneGroups > 0) then
{
    {
        _x params ["_vehicle", "_crew", "_grp"];

        _crew call CBA_fnc_deleteEntity;
        if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
        _grp call CBA_fnc_deleteEntity;
    }
    forEach _avZoneGroups;
};

// CACHE HELICOPTER TRANSPORT
if (count _hZoneGroups > 0) then 
{
    {
        _x params ["_vehicle", "_crew", "_grp", "_cargoGrp"];
        
        _crew call CBA_fnc_deleteEntity;
        if (vehicle player != _vehicle) then {_vehicle call CBA_fnc_deleteEntity};
        _grp call CBA_fnc_deleteEntity;
        if (!isNil "_cargoGrp") then {_cargoGrp call CBA_fnc_deleteEntity};
    }
    forEach _hZoneGroups;
};    

deleteVehicle _bastActive;
deleteVehicle _bastClear;
deleteVehicle _basActivated;

if (getMarkerColor _mkr == "colorblack") then {_mkr setMarkerAlpha 0};
