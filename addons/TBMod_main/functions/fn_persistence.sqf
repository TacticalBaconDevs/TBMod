/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_save", false, [false]],
        ["_number", 0, [0]]
    ];

if (!isServer) exitWith {"[TBMod_main] NUR auf dem Server ausführen" remoteExecCall ["systemChat"]};
if (!canSuspend) exitWith {"[TBMod_main] Skript muss per SPAWN ausgeführt werden" remoteExecCall ["systemChat"]};
if !(_number in [1,2,3,4,5]) exitWith {"[TBMod_main] Wähle einen Slot zwischen 1-5" remoteExecCall ["systemChat"]};

if (_save) then
{
    private _saveArray = [
        [],     // disconnectCache
        [],     // Markers
        [],     // Objects
        []      // Vehicles
    ];
    
    // save current players
    {
        private _unit = _x;
        private _uid = getPlayerUID _unit;

        private _pos = getPosASL _unit;
        _pos set [2, (_pos select 2) + 0.5];
    
        private _array = [
            _uid,
            getUnitLoadout _unit,
            _pos,
            getDir _unit,
            _unit getVariable ["TB_arsenalType", ""],
            _unit getVariable ["TB_rolle", ""],
            group _unit,
            _unit getVariable ["TB_team", "MAIN"]
        ];
    
        private _find = [TB_disconnectCache, _uid] call BIS_fnc_findNestedElement;
        if (_find isEqualTo []) then
        {
            TB_disconnectCache pushBack _array;
        }
        else
        {
            TB_disconnectCache set [_find select 0, _array];
        };
    }
    forEach allPlayers;
    publicVariable "TB_disconnectCache";
    _saveArray set [0, TB_disconnectCache];

    // save marker
    {
        if ((_x select [0, 13]) == "_USER_DEFINED") then {
            (_saveArray select 1) pushBack [
                _x,
                markerPos _x,
                markerColor _x,
                markerSize _x,
                markerType _x,
                markerAlpha _x,
                markerBrush _x,
                markerDir _x,
                markerShape _x,
                markerText _x
            ];
        };
    } forEach allMapMarkers;

    private _objectarray = ((allMissionObjects "Static") + (allMissionObjects "Thing")) select {isNil {_x getVariable "TB_building_addInfos"} && !(_x in vehicles)};
    _objectarray = _objectarray arrayIntersect _objectarray; // doppelte elemenieren
    
    // sorting
    _objectarray = _objectarray apply {[(getPosASL _X) select 2, _x]};
    _objectarray sort true;
    _objectarray = _objectarray apply {_x select 1};
    
    {
        private _array = [
                typeOf _x,
                getPosASL _x,
                getDir _x,
                simulationEnabled _x
            ];
        
        if (vehicleVarName _x != "") then {_array pushBack (vehicleVarName _x)};
        
        (_saveArray select 2) pushBack _array;
    }
    forEach _objectarray;
    
    // save vehicles
    {
        private _veh = _x;
        private _ammo = [];
        private _pylonMags = [];
        {
            _pylonMags pushBack (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> (configName _x) >> "attachment"));
        } forEach (configProperties [configFile >> "CfgVehicles" >> (typeOf _veh) >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]);

        {
            if !((_x select 0) in _pylonMags) then {_ammo pushBack [_x select 0, _x select 2, _x select 1]};
        } forEach (magazinesAllTurrets _x);
        
        private _array = [
            typeOf _veh,
            getPosASL _veh,
            getDir _veh,
            [true, _veh] call TB_fnc_cargo,
            (_veh getVariable ["ace_cargo_loaded", []]) apply {[typeOf _x, [true, _veh] call TB_fnc_cargo]},
            if ((getAllHitPointsDamage _veh) isEqualTo []) then {[]} else {[(getAllHitPointsDamage _veh) select 0, (getAllHitPointsDamage _veh) select 2]},
            _ammo,
            fuel _veh,
            [side _veh, (crew _veh) apply {typeOf _x}]
        ];
        
        if (vehicleVarName _veh == "") then {_array pushBack (vehicleVarName _x)};
            
        (_saveArray select 3) pushBack _array;
    }
    forEach vehicles;

    profileNamespace setVariable [format ["TB_persistence_%1", _number], _saveArray];
    [true, _number] spawn TB_fnc_buildingPersistence;
    
    (format ["[TBMod_main] Es wurde alles in Slot %1 gespeichert!", _number]) remoteExecCall ["systemChat"];
}
else // load
{
    private _loadArray = profileNamespace getVariable [format ["TB_persistence_%1", _number], [[], [], [], []]];
    private _objArray = (allMissionObjects "Static") + (allMissionObjects "Thing") + vehicles;
    _objArray = _objArray arrayIntersect _objArray;
    
    // vorhandene nicht benannte Fahrzeuge löschen
    (_objArray select {vehicleVarName _x == ""}) call CBA_fnc_deleteEntity;
    
    // Benutzermarker löschen
    (allMapMarkers select {(_x select [0, 13]) == "_USER_DEFINED"}) call CBA_fnc_deleteEntity;

    // benannte Fahrzeuge simulation temp deaktivieren
    private _tempSimulationDisabled = [];
    {
        _x enableSimulationGlobal false;
        _tempSimulationDisabled pushBackUnique _x;
    }
    forEach (_objArray select {vehicleVarName _x != "" && simulationEnabled _x});

    // disconnectCache setzen
    TB_disconnectCache = _loadArray select 0;
    publicVariable "TB_disconnectCache";
    
    // Marker laden
    {
        _x params ["_marker", "_pos", "_color", "_size", "_type", "_alpha", "_brush", "_dir", "_shape", "_text"];
        
        private _newMarker = createMarker [_marker, _pos];
        _newMarker setMarkerColor _color;
        _newMarker setMarkerSize _size;
        _newMarker setMarkerType _type;
        _newMarker setMarkerAlpha _alpha;
        _newMarker setMarkerBrush _brush;
        _newMarker setMarkerDir _dir;
        _newMarker setMarkerShape _shape;
        _newMarker setMarkerText _text;
    }
    forEach (_loadArray select 1);
    
    // das Löschen der Fahrzeuge dauert etwas, um Explosionen zu verhindern kurz warten
    uiSleep 1;

    // Objekte organisieren
    {
        _x params ["_classname", "_pos", "_dir", "_sim", "_name"];
        
        objNull;

        private _obj = (if (isNil "_name") then
            {
                createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
            }
            else
            {
                missionNamespace getVariable [_name, objNull];
            });
        
        _obj setDir _dir;
        _obj setPosASL _pos;

        if (!_sim) then {_obj enableSimulationGlobal false};
    }
    forEach (_loadArray select 2);

    // Fahrzeuge organisieren
    {
        _x params ["_class", "_pos", "_dir", "_vanillaCargo", "_aceCargo", "_dmg", "_ammo", "_fuel", "_crew", "_name"];
        
        private _vehicle = (if (isNil "_name") then
            {
                createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
            }
            else
            {
                missionNamespace getVariable [_name, objNull];
            });
        
        _vehicle setDir _dir;
        
        if (_vehicle in _tempSimulationDisabled) then {_pos set [2, (_pos select 2) + 0.5]};
        _vehicle setPosASL _pos;
        
        [false, _vehicle, _vanillaCargo] call TB_fnc_cargo;
        
        {
            private _ammoChest = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
            _ammoChest attachTo [_vehicle, [0,0,-100]];
            [false, _ammoChest, _x select 1] call TB_fnc_cargo;
            
            [_ammoChest, _vehicle, true] call ace_cargo_fnc_loadItem;
        }
        forEach _aceCargo;
        
        if !(_dmg isEqualTo []) then {
            {
                _vehicle setHitPointDamage [_x, (_dmg select 1) select _forEachIndex];
            }
            forEach (_dmg select 0);
        };
        
        { _vehicle setMagazineTurretAmmo _x} forEach _ammo;

        _vehicle setFuel _fuel;
        
        private _grp = grpNull;
        {
            if (isNull _grp) then {_grp = createGroup [_crew select 0, true]};
            private _unit = _grp createUnit [_x, [0,0,0], [], 0, "CAN_COLLIDE"];
            _unit moveInAny _vehicle;
        }
        forEach (_crew select 1);
    }
    forEach (_loadArray select 3);

    // temp silumlierte Objekte wieder zurücksetzen
    {_x enableSimulationGlobal true} forEach _tempSimulationDisabled;

    //Teleport players
    {
        private _find = [TB_disconnectCache, getPlayerUID _x] call BIS_fnc_findNestedElement;
        if !(_find isEqualTo []) then
        {
            (TB_disconnectCache select (_find select 0)) params ["_uid", "_gear", "_pos", "_dir", "_arsenalType", "_rolle", "_group", "_team"];
    
            [_x] joinSilent _group;
    
            if !(_rolle isEqualTo "" || _arsenalType isEqualTo "") then
            {
                _x setVariable ["TB_arsenalType", _arsenalType, true];
                [_rolle, _arsenalType, objNull, false] remoteExec ["TB_fnc_changeRolle", _x];
            };

            _x setUnitLoadout _gear;
    
            _x setVariable ["TB_team", _team, true];
            _x assignTeam _team;    
    
            [_x, false] remoteExec ["allowDamage", _x];
            _x setDir _dir;
            _x setPosASL _pos;
    
            _x spawn
            {
                uiSleep 10;
                [_this, true] remoteExec ["allowDamage", _this];
            };
        };
    }
    forEach allPlayers;

    [false, _number] spawn TB_fnc_buildingPersistence;
    
    (format ["[TBMod_main] Es wurde alles von Slot %1 geladen!", _number]) remoteExecCall ["systemChat"];
};
