#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )

    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {{"[TBMod_zusatzStuff] EOS-BASTION: nur auf Server ausführen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};
if (!canSuspend) exitWith {{"[TBMod_zusatzStuff] EOS-BASTION: nur per spawn aufrufen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};

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

_patrolInf params ["_piGroups", "_piSize", ["_piGroupsIncrease", 0], ["_piSizeIncrease", 0]];
_lightVeh params ["_lvGroups", "_lvSize", ["_lvGroupsIncrease", 0], ["_lvSizeIncrease", 0]];
_armorVeh params ["_avGroups", ["_avGroupsIncrease", 0]];
_helis params ["_hGroups", "_hSize", ["_hGroupsIncrease", 0], ["_hSizeIncrease", 0]];

_settings params ["_faction", "_side", "_heightLimit", "_placementRadius", "_parachuteJump", "_helicopterHeight", "_angriffsRichtung", "_angriffsRichtungHeli", "_lockVehicle", "_keyVehicle"];
_basSettings params ["_pause", "_waves", "_timeout", "_eosZone", "_hints"];

private _radius = _mkrX max _mkrY;
private _placement = _radius + _placementRadius;

private _enemyFaction = "east";
if (_side == WEST) then {_enemyFaction = "west"};
if (_side == INDEPENDENT) then {_enemyFaction = "GUER"};
if (_side == CIVILIAN) then {_enemyFaction = "civ"};

_angriffsRichtung params ["_baseDir", "_randomDir"];
_randomDir = 10 max _randomDir min 360;
_angriffsRichtungHeli params ["_baseDirHeli", "_randomDirHeli"];
_randomDirHeli = 10 max _randomDirHeli min 360;

private _actCond = if (isMultiplayer) then
{
    if (_heightLimit) then
    {
        "{vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count playableUnits > 0"
    }
    else
    {
        "{vehicle _x in thisList && isPlayer _x} count playableUnits > 0"
    };
}
else
{
    if (_heightLimit) then
    {
        "{vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0"
    }
    else
    {
        "{vehicle _x in thisList && isPlayer _x} count allUnits > 0"
    };
};

// TODO -> Watermode als Einstellung
if (isNil "TB_waterMode") then {TB_waterMode = 1};

private _basActivated = createTrigger ["EmptyDetector", _mPos];
_basActivated setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
_basActivated setTriggerActivation ["ANY", "PRESENT", true];
_basActivated setTriggerStatements [_actCond, "", ""];

_mkr setMarkerColor "ColorOrange";

// ### Positionen vorbereiten - WarmUp ###
private _positions = [[], [], [], []];

// SPAWN PATROLS - POSITIONEN
private _default = _mPos getPos [_placement, _baseDir + ((random (_randomDir * 2)) - _randomDir)];
for "_i" from 1 to _piGroups do {(_positions select 0) pushBackUnique ([_mPos, _placement - 100, _placement + 100, 3, TB_waterMode, 0, 0, [], [_default, [0,0,0]], _angriffsRichtung] call FUNC(findSafePos))};

// SPAWN LIGHT VEHICLES - POSITIONEN
private _spezicalPlacement = _placement + 500;
_default = _mPos getPos [_spezicalPlacement, _baseDir + ((random (_randomDir * 2)) - _randomDir)];
for "_i" from 1 to _lvGroups do {(_positions select 1) pushBackUnique ([_mPos, _spezicalPlacement - 200, _spezicalPlacement + 200, 7, TB_waterMode, 0.2, 0, [], [_default, [0,0,0]], _angriffsRichtung] call FUNC(findSafePos))};

// SPAWN ARMOURED VEHICLES - POSITIONEN
_spezicalPlacement = _placement + 700;
_default = _mPos getPos [_spezicalPlacement, _baseDir + ((random (_randomDir * 2)) - _randomDir)];
for "_i" from 1 to _avGroups do {(_positions select 2) pushBackUnique ([_mPos, _spezicalPlacement - 250, _spezicalPlacement + 250, 7, TB_waterMode, 0.2, 0, [], [_default, [0,0,0]], _angriffsRichtung] call FUNC(findSafePos))};

// SPAWN HELICOPTERS - POSITIONEN
_spezicalPlacement = _placement + 1000;
_default = _mPos getPos [_spezicalPlacement, _baseDirHeli + ((random (_randomDirHeli * 2)) - _randomDirHeli)];
for "_i" from 1 to _hGroups do {(_positions select 3) pushBackUnique ([_mPos, _spezicalPlacement - 250, _spezicalPlacement + 250, 7, TB_waterMode, 0.2, 0, [], [_default, [0,0,0]], _angriffsRichtungHeli] call FUNC(findSafePos))};

// Auf Auslösung warten
waitUntil {triggerActivated _basActivated};

// TODO Setting machen
if (isNil "TB_dauerZone") then {TB_dauerZone = false};
_actCond = _actCond + " && !TB_dauerZone";

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
    for "_i" from 1 to _pause do
    {
        if (_hints) then {hint format ["Angriffs ETA : %1", _pause - _i]};
        uiSleep 1;
    };
};

private _playerCount = count (call CBA_fnc_players);
private _pos = [0,0,0];

// SPAWN PATROLS
private _piZoneGroups = [];
_piGroups = round (_piGroups + (_piGroupsIncrease * _playerCount));
_piSize = round (_piSize + (_piSizeIncrease * _playerCount));
private _default = _mPos getPos [_placement, _baseDir + ((random (_randomDir * 2)) - _randomDir)];
for "_i" from 1 to _piGroups do
{
    _pos = if ((_positions select 0) isEqualTo []) then
    {
        [_mPos, _placement - 100, _placement + 100, 3, TB_waterMode, 0, 0, [], [_default, [0,0,0]], _angriffsRichtung] call FUNC(findSafePos);
    }
    else
    {
        (_positions select 0) deleteAt 0;
    };

    private _piGroup = [_pos, _piSize, _faction, _side] call FUNC(spawnGroup);
    if (!isNull _piGroup) then {_piZoneGroups pushBack _piGroup};
};

uiSleep 1; // TODO: temp solution

// SPAWN LIGHT VEHICLES
private _lvZoneGroups = [];
_lvGroups = round (_lvGroups + (_lvGroupsIncrease * _playerCount));
_lvSize = round (_lvSize + (_lvSizeIncrease * _playerCount));
private _spezicalPlacement = _placement + 500;
_default = _mPos getPos [_spezicalPlacement, _baseDir + ((random (_randomDir * 2)) - _randomDir)];
for "_i" from 1 to _lvGroups do
{
    _pos = if ((_positions select 1) isEqualTo []) then
    {
        [_mPos, _spezicalPlacement - 200, _spezicalPlacement + 200, 7, TB_waterMode, 0.2, 0, [], [_default, [0,0,0]], _angriffsRichtung] call FUNC(findSafePos);
    }
    else
    {
        (_positions select 1) deleteAt 0;
    };

    private _vehType = 7;
    private _cargoType = 9;
    if (surfaceIsWater _pos) then
    {
        _vehType = 8;
        _cargoType = 10;
    };

    private _lvGroup = [_pos, _side, _faction, _vehType, _lockVehicle, _keyVehicle] call FUNC(spawnVehicle);

    if !(_lvGroup isEqualTo []) then
    {
        if (_lvSize > 0) then
        {
            private _cargoGrp = [_lvGroup select 0, _lvSize, _side, _faction, _cargoType] call FUNC(setCargo);
            if (!isNull _cargoGrp) then {_lvGroup pushBack _cargoGrp};
        };

        _lvZoneGroups pushBack _lvGroup;
    };
};

uiSleep 1; // TODO: temp solution

// SPAWN ARMOURED VEHICLES
private _avZoneGroups = [];
_avGroups = round (_avGroups + (_avGroupsIncrease * _playerCount));
_spezicalPlacement = _placement + 700;
_default = _mPos getPos [_spezicalPlacement, _baseDir + ((random (_randomDir * 2)) - _randomDir)];
for "_i" from 1 to _avGroups do
{
    _pos = if ((_positions select 2) isEqualTo []) then
    {
        [_mPos, _spezicalPlacement - 250, _spezicalPlacement + 250, 7, TB_waterMode, 0.2, 0, [], [_default, [0,0,0]], _angriffsRichtung] call FUNC(findSafePos);
    }
    else
    {
        (_positions select 2) deleteAt 0;
    };

    private _vehType = if (surfaceiswater _pos) then {8} else {2};
    private _avGroup = [_pos, _side, _faction, _vehType, _lockVehicle, _keyVehicle] call FUNC(spawnVehicle);

    if !(_avGroup isEqualTo []) then {_avZoneGroups pushBack _avGroup};
};

uiSleep 1; // TODO: temp solution

// SPAWN HELICOPTERS
private _hZoneGroups = [];
_hGroups = round (_hGroups + (_hGroupsIncrease * _playerCount));
_hSize = round (_hSize + (_hSizeIncrease * _playerCount));
_spezicalPlacement = _placement + 1000;
_default = _mPos getPos [_spezicalPlacement, _baseDirHeli + ((random (_randomDirHeli * 2)) - _randomDirHeli)];
for "_i" from 1 to _hGroups do
{
    _pos = if ((_positions select 3) isEqualTo []) then
    {
        [_mPos, _spezicalPlacement - 250, _spezicalPlacement + 250, 7, TB_waterMode, 0.2, 0, [], [_default, [0,0,0]], _angriffsRichtungHeli] call FUNC(findSafePos);
    }
    else
    {
        (_positions select 3) deleteAt 0;
    };

    private _vehType = if (_hSize > 0) then {4} else {3};
    private _hGroup = [_pos, _side, _faction, _vehType, _lockVehicle, _keyVehicle] call FUNC(spawnVehicle);

    if !(_hGroup isEqualTo []) then
    {
        if (_hSize > 0) then
        {
            private _cargoGrp = [_hGroup select 0, _hSize, _side, _faction, 9] call FUNC(setCargo);
            if (!isNull _cargoGrp) then
            {
                _hGroup pushBack _cargoGrp;
                [_mkr, _hGroup, _parachuteJump] spawn FUNC(transportUnload);
            };
        }
        else
        {
            _wp1 = (_hGroup select 2) addWaypoint [markerPos _mkr, 0];
            _wp1 setWaypointSpeed "FULL";
            _wp1 setWaypointType "SAD";
        };

        _pos set [2, _helicopterHeight];
        (_hGroup select 0) setPos _pos;
        (_hGroup select 0) flyInHeight _helicopterHeight;
        _hZoneGroups pushBack _hGroup;
    };
};

uiSleep 1; // TODO: temp solution

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

    if (!isNull _cargoGrp) then
    {
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
    };
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

for "_i" from 1 to _timeout do
{
    if (_hints) then
    {
        if (_waves > 1) then {hint format ["Nächste Welle in ETA: %1", _timeout - _i]};
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
            ] spawn FUNC(core);
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
        // Updates waves in the settings before sending next wave 
        _basSettings set [1, _waves];
        [
            _mkr,
            _patrolInf,
            _lightVeh,
            _armorVeh,
            _helis,
            _settings,
            _basSettings,
            true
        ] spawn FUNC(bastionCore);
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
