#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )

    Complete rewrite and modification:
        shukari
        Eric Ruhland
*/
if (!isServer) exitWith {{"[TBMod_zusatzStuff] EOS-ZONE: nur auf Server ausführen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};
if (!canSuspend) exitWith {{"[TBMod_zusatzStuff] EOS-ZONE: nur per spawn aufrufen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};

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
private _mkrSize = _mkrX min _mkrY;
private _mkrAgl = markerDir _mkr;

_hausInf params ["_hiGroups", "_hiSize", ["_hiGroupsIncrease", 0], ["_hiSizeIncrease", 0]];
_patrolInf params ["_piGroups", "_piSize", ["_piGroupsIncrease", 0], ["_piSizeIncrease", 0]];
_lightVeh params ["_lvGroups", "_lvSize", ["_lvGroupsIncrease", 0], ["_lvSizeIncrease", 0]];
_armorVeh params ["_avGroups", ["_avGroupsIncrease", 0]];
_statics params ["_stGroups", ["_stGroupsIncrease", 0]];
_helis params ["_hGroups", "_hSize", ["_hGroupsIncrease", 0], ["_hSizeIncrease", 0]];

_settings params ["_faction", "_distance", "_side", "_heightLimit", "_parachuteJump", "_helicopterHeight", "_angriffsRichtungHeli", "_lockVehicle", "_keyVehicle"];

private _civZone = false;
private _enemyFaction = "east";
if (_side == WEST) then {_enemyFaction = "west"};
if (_side == INDEPENDENT) then {_enemyFaction = "GUER"};
if (_side == CIVILIAN) then {_enemyFaction = "civ"; _civZone = true};

// INITIATE ZONE
private _trig = format ["EOSTrigger%1", _mkr];
private _eosActivated = missionNamespace getVariable [_trig, objNull];
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

    missionNamespace setVariable [_trig, _eosActivated];
};

if (getMarkerColor _mkr != "ColorGreen") then {_mkr setMarkerColor "ColorRed"};

// ### Positionen vorbereiten - WarmUp ###
private _positions = [[], []];

// SPAWN PATROLS
for "_i" from 1 to _piGroups do {(_positions select 0) pushBackUnique ([_mPos, 0, _mkrSize, 3, 1, 0, 0, [], [_mPos, [0,0,0]]] call FUNC(findSafePos))};

// SPAWN LIGHT VEHICLES
for "_i" from 1 to (_lvGroups + _avGroups + _stGroups) do {(_positions select 1) pushBackUnique ([_mPos, 0, _mkrSize, 7, 1, 0.25, 0] call FUNC(findSafePos))};

// Auf Auslösung warten
waitUntil {triggerActivated _eosActivated};

if (getMarkerColor _mkr != "ColorBlack") then
{
    private _playerCount = count (call CBA_fnc_players);

    // SPAWN HOUSE PATROLS
    private _hiZoneGroups = [];
    if (!_cache) then
    {
        _hiGroups = round (_hiGroups + (_hiGroupsIncrease * _playerCount));
        _hiSize = round (_hiSize + (_hiSizeIncrease * _playerCount));
    };
    for "_i" from 1 to _hiGroups do
    {
        if (_cache) then
        {
            _hiSize = _eosActivated getVariable [format ["HP%1", _i], _hiSize];
        };

        if (_hiSize > 0) then
        {
            private _hiGroup = [_mPos, _hiSize, _faction, _side] call FUNC(spawnGroup);
            if (!isNull _hiGroup) then
            {
                if (!surfaceIsWater _mPos) then
                {
                    [_mPos, units _hiGroup, _mkrSize] call FUNC(shk_buildingpos);
                }
                else
                {
                    [_hiGroup, _mkr] call FUNC(shk_patrol);
                };

                _hiZoneGroups pushBack _hiGroup;
            };
        };
    };

    uiSleep 1; // TODO: temp solution

    // SPAWN PATROLS
    private _piZoneGroups = [];
    private _pos = [0,0,0];
    if (!_cache) then
    {
        _piGroups = round (_piGroups + (_piGroupsIncrease * _playerCount));
        _piSize = round (_piSize + (_piSizeIncrease * _playerCount));
    };
    for "_i" from 1 to _piGroups do
    {
        if (_cache) then
        {
            _piSize = _eosActivated getVariable [format ["PA%1", _i], _piSize];
        };

        if (_piSize > 0) then
        {
            _pos = if ((_positions select 0) isEqualTo []) then
            {
                [_mPos, 0, _mkrSize, 3, 1, 0, 0, [], [_mPos, [0,0,0]]] call FUNC(findSafePos);
            }
            else
            {
                (_positions select 0) deleteAt 0;
            };

            private _piGroup = [_pos, _piSize, _faction, _side] call FUNC(spawnGroup);
            if (!isNull _piGroup) then
            {
                [_piGroup, _mkr] call FUNC(shk_patrol);

                _piZoneGroups pushBack _piGroup;
            };
        };
    };

    uiSleep 1; // TODO: temp solution

    // SPAWN LIGHT VEHICLES
    private _lvZoneGroups = [];
    if (!_cache) then
    {
        _lvGroups = round (_lvGroups + (_lvGroupsIncrease * _playerCount));
        _lvSize = round (_lvSize + (_lvSizeIncrease * _playerCount));
    };
    for "_i" from 1 to _lvGroups do
    {
        _pos = if ((_positions select 1) isEqualTo []) then
        {
            [_mPos, 0, _mkrSize, 7, 1, 0.25, 0] call FUNC(findSafePos);
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

            [_lvGroup select 2, _mkr] call FUNC(shk_patrol);
            _lvZoneGroups pushBack _lvGroup;
        };
    };

    uiSleep 1; // TODO: temp solution

    // SPAWN ARMOURED VEHICLES
    private _avZoneGroups = [];
    if (!_cache) then
    {
        _avGroups = round (_avGroups + (_avGroupsIncrease * _playerCount));
    };
    for "_i" from 1 to _avGroups do
    {
        _pos = if ((_positions select 1) isEqualTo []) then
        {
            [_mPos, 0, _mkrSize, 7, 1, 0.25, 0] call FUNC(findSafePos);
        }
        else
        {
            (_positions select 1) deleteAt 0;
        };

        private _vehType = if (surfaceiswater _pos) then {8} else {2};
        private _avGroup = [_pos, _side, _faction, _vehType, _lockVehicle, _keyVehicle] call FUNC(spawnVehicle);

        if !(_avGroup isEqualTo []) then
        {
            [_avGroup select 2, _mkr] call FUNC(shk_patrol);
            _avZoneGroups pushBack _avGroup;
        };
    };

    uiSleep 1; // TODO: temp solution

    // SPAWN STATIC PLACEMENTS
    private _stZoneGroups = [];
    if (!_cache) then
    {
        _stGroups = round (_stGroups + (_stGroupsIncrease * _playerCount));
    };
    for "_i" from 1 to _stGroups do
    {
        if (surfaceIsWater _mPos) exitwith {};

        _pos = if ((_positions select 1) isEqualTo []) then
        {
            [_mPos, 0, _mkrSize, 7, 1, 0.25, 0] call FUNC(findSafePos);
        }
        else
        {
            (_positions select 1) deleteAt 0;
        };

        private _stGroup = [_pos, _side, _faction, 5, _lockVehicle, _keyVehicle] call FUNC(spawnVehicle);

        if !(_stGroup isEqualTo []) then {_stZoneGroups pushBack _stGroup};
    };

    uiSleep 1; // TODO: temp solution

    // SPAWN CHOPPER
    _angriffsRichtungHeli params ["_baseDirHeli", "_randomDirHeli"];
    _randomDirHeli = 10 max _randomDirHeli min 360;
    private _hZoneGroups = [];
    if (!_cache) then
    {
        _hGroups = round (_hGroups + (_hGroupsIncrease * _playerCount));
        _hSize = round (_hSize + (_hSizeIncrease * _playerCount));
    };
    for "_i" from 1 to _hGroups do
    {
        private _vehType = if (_hSize > 0) then {4} else {3};

        private _pos = [_mPos, 3000 + ((random 500) - 250), _baseDirHeli + ((random _randomDirHeli) - (_randomDirHeli / 2))] call BIS_fnc_relPos;
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
                private _wp1 = (_hGroup select 2) addWaypoint [_mPos, 0];
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

    // SPAWN ALT TRIGGERS
    private _clear = createTrigger ["EmptyDetector", _mPos];
    _clear setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
    _clear setTriggerActivation [_enemyFaction, "NOT PRESENT", true];
    _clear setTriggerStatements ["this", "", ""];

    private _taken = createTrigger ["EmptyDetector", _mPos];
    _taken setTriggerArea [_mkrX, _mkrY, _mkrAgl, false];
    _taken setTriggerActivation ["ANY", "PRESENT", true];
    _taken setTriggerStatements ["{vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0", "", ""];

    // TODO waitUntil CBA PEFH
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
        ] spawn FUNC(core);
    }
    else
    {
        _mkr setMarkerAlpha 0;
    };
};
