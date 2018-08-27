/*
    Author: Willi "shukari" Graff
    Authors: Willi "shukari" Graff, Eric Ruhland
*/
params ["_save", "_number"];

if !(_number in [1,2,3,4,5]) exitWith {systemChat "Wähle einen Slot zwischen 1-5"};

if (isNil "_save") exitWith {
    profileNamespace setVariable [format ["TB_persistence_%1", _number], nil];
};

if (_save) then {


    //save current players
    {
        _unit = _X;
        _uid = getPlayerUID _unit;

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
    
        
    } forEach allPlayers;
    publicVariable "TB_disconnectCache";

    private _saveArray = [
        TB_disconnectCache,
        [],     // Markers
        [],     // Vehicles
        [],     // Objects
        [],     // Named Vehicles
        []      // Named Objects
    ];


    
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
        
        (_saveArray select 2) pushBack [
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
    } forEach (vehicles select {vehicleVarName _x == ""});  //unnamed

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
        
        (_saveArray select 4) pushBack [
            typeOf _veh,
            getPosASL _veh,
            getDir _veh,
            [true, _veh] call TB_fnc_cargo,
            (_veh getVariable ["ace_cargo_loaded", []]) apply {[typeOf _x, [true, _veh] call TB_fnc_cargo]},
            if ((getAllHitPointsDamage _veh) isEqualTo []) then {[]} else {[(getAllHitPointsDamage _veh) select 0, (getAllHitPointsDamage _veh) select 2]},
            _ammo,
            fuel _veh,
            [side _veh, (crew _veh) apply {typeOf _x}],
            vehicleVarName _x
        ];
    } forEach (vehicles select {vehicleVarName _x != ""}); //named

    private _objectarray = ((allMissionObjects "Static") + (allMissionObjects "Thing")) select {vehicleVarName _x == "" && !(_x in vehicles)};
    _objectarray = _objectarray apply {[(getPosASL _X) select 2, _x]};
    _objectarray sort true;
    _objectarray= _objectarray apply {_x select 1};
    {
        if(isnil {_x getVariable "TB_building_addInfos"}) then{// TB_building exclude //Double Objects removal from vehicles
            (_saveArray select 3) pushBack [
                typeOf _x,
                getPosASL _x,
                getDir _x,
                simulationEnabled _x
            ];
        };
    } forEach _objectarray;

    _objectarray = ((allMissionObjects "Static") + (allMissionObjects "Thing")) select {vehicleVarName _x != ""  && !(_x in vehicles)};
    _objectarray = _objectarray apply {[(getPosASL _X) select 2, _x]};
    _objectarray sort true;
    _objectarray= _objectarray apply {_x select 1};
    {
        if(isnil {_x getVariable "TB_building_addInfos"}) then{// TB_building exclude 
            (_saveArray select 5) pushBack [
                typeOf _x,
                getPosASL _x,
                getDir _x,
                simulationEnabled _x,
                vehicleVarName _x
            ];
        };
    } forEach _objectarray;

    profileNamespace setVariable [format ["TB_persistence_%1", _number], _saveArray];
    systemChat format ["(TBMod_main) Es wurde alles in Slot %1 gespeichert!", _number];

    [true, _number] spawn TB_fnc_buildingPersistence;
} else {
    private _loadArray = profileNamespace getVariable [format ["TB_persistence_%1", _number], [[], [], [], []]];
    private _tempSimulationdisabled = [];

    {
        {
            deleteVehicle _x;
        } forEach (crew _x);
        deleteVehicle _x;
    } forEach (vehicles select {vehicleVarName _x == ""});

    {
        if (simulationEnabled _x) then {
            [_x, false] remoteExecCall ["enableSimulationGlobal", 2];
            _tempSimulationdisabled pushBack _x;
        };
    } forEach (vehicles select {vehicleVarName _x != ""});

    {
        if (simulationEnabled _x) then {
            [_x, false] remoteExecCall ["enableSimulationGlobal", 2];
            _tempSimulationdisabled pushBack _x;
        };
    } forEach (((allMissionObjects "Static") + (allMissionObjects "Thing")) select {vehicleVarName _x != "" && !(_x in vehicles)});

    {deleteVehicle _x} forEach (((allMissionObjects "Static") + (allMissionObjects "Thing")) select {vehicleVarName _x == "" && !(_x in vehicles)});
    {
        if ((_x select [0, 13]) == "_USER_DEFINED") then {
            deleteMarker _x;
        };
    } forEach allMapMarkers;
    
    TB_disconnectCache = _loadArray select 0;
    publicVariable "TB_disconnectCache";
    
    uiSleep 1;
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
    } forEach (_loadArray select 1);
    
    uiSleep 2;

    {
        _x params ["_classname", "_pos", "_dir", "_sim"];
        
        private _obj = createVehicle [_classname, [0, 0, 0], [], 0, "CAN_COLLIDE"];
        
        _obj setDir _dir;
        _obj setPosASL _pos;

        if (!_sim) then
        {
            [_obj, false] remoteExecCall ["enableSimulationGlobal", 2];
        };

        // Medic
        if ((typeOf _obj) in ["Land_Medevac_house_V1_F", "Land_MedicalTent_01_white_generic_open_F"]) then
        {
            _obj setVariable ["ace_medical_isMedicalFacility", true, true];
        };
        
        // Antenne
        if ((typeOf _obj) in ["Land_TTowerSmall_1_F"]) then
        {
            [_obj, 10000] call TFAR_antennas_fnc_initRadioTower;
        };
        
        // Antenne
        if ((typeOf _obj) in ["Land_BarGate_F"]) then
        {
            [_obj, false] remoteExecCall ["allowDamage", _obj];
        };
        
        // Repair
        if ((typeOf _obj) in ["B_Slingload_01_Repair_F"]) then
        {
            _obj enableRopeAttach false;
        };
        
    } forEach (_loadArray select 3);
    
    uiSleep 2;

    {
        _x params ["_classname", "_pos", "_dir", "_sim", "_name"];
        
       private _obj = missionNamespace getVariable [_name, objNull];
        
        _obj setDir _dir;
        _obj setPosASL _pos;

        if (!_sim) then
        {
            [_obj, false] remoteExecCall ["enableSimulationGlobal", 2];
        };

        // Medic
        if ((typeOf _obj) in ["Land_Medevac_house_V1_F", "Land_MedicalTent_01_white_generic_open_F"]) then
        {
            _obj setVariable ["ace_medical_isMedicalFacility", true, true];
        };
        
        // Antenne
        if ((typeOf _obj) in ["Land_TTowerSmall_1_F"]) then
        {
            [_obj, 10000] call TFAR_antennas_fnc_initRadioTower;
        };
        
        // Antenne
        if ((typeOf _obj) in ["Land_BarGate_F"]) then
        {
            [_obj, false] remoteExecCall ["allowDamage", _obj];
        };
        
        // Repair
        if ((typeOf _obj) in ["B_Slingload_01_Repair_F"]) then
        {
            _obj enableRopeAttach false;
        };
        
    } forEach (_loadArray select 5);

    uiSleep 2;
    {
        _x params ["_class", "_pos", "_dir", "_vanillaCargo", "_aceCargo", "_dmg", "_ammo", "_fuel", "_crew"];
        
        private _vehicle = createVehicle [_class, [0,0,1000], [], 0, "CAN_COLLIDE"];
        _vehicle setDir _dir;
        
        _vehicle setPosASL _pos;
        [false, _vehicle, _vanillaCargo] call TB_fnc_cargo;
        
        {
            private _ammoChest = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
            _ammoChest attachTo [_vehicle, [0,0,-100]];
            [false, _ammoChest, _x select 1] call TB_fnc_cargo;
            
            [_ammoChest, _vehicle, true] call ace_cargo_fnc_loadItem;
        } forEach _aceCargo;
        
        if !(_dmg isEqualTo []) then {
            {
                _vehicle setHitPointDamage [_x, (_dmg select 1) select _forEachIndex];
            } forEach (_dmg select 0);
        };
        
        {
            _vehicle setMagazineTurretAmmo _x;
        } forEach _ammo;

        _vehicle setFuel _fuel;
        
        private _grp = grpNull;
        {
            if (isNull _grp) then {_grp = createGroup (_crew select 0)};
            private _unit = _grp createUnit [_x, [0,0,0], [], 0, "CAN_COLLIDE"];
            _unit moveInAny _vehicle;
        } forEach (_crew select 1);
    } forEach (_loadArray select 2);

    uiSleep 2;
    {
        _x params ["_class", "_pos", "_dir", "_vanillaCargo", "_aceCargo", "_dmg", "_ammo", "_fuel", "_crew", "_name"];
        
        private _vehicle = missionNamespace getVariable [_name, objNull];
        _vehicle setDir _dir;
        if(_vehicle in _tempSimulationdisabled) then {
            _pos set [2, (_pos select 2) + 0.5];
        };
        
        _vehicle setPosASL _pos;
        [false, _vehicle, _vanillaCargo] call TB_fnc_cargo;
        
        {
            private _ammoChest = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
            _ammoChest attachTo [_vehicle, [0,0,-100]];
            [false, _ammoChest, _x select 1] call TB_fnc_cargo;
            
            [_ammoChest, _vehicle, true] call ace_cargo_fnc_loadItem;
        } forEach _aceCargo;
        
        if !(_dmg isEqualTo []) then {
            {
                _vehicle setHitPointDamage [_x, (_dmg select 1) select _forEachIndex];
            } forEach (_dmg select 0);
        };
        
        {
            _vehicle setMagazineTurretAmmo _x;
        } forEach _ammo;

        _vehicle setFuel _fuel;
        
        private _grp = grpNull;
        {
            if (isNull _grp) then {_grp = createGroup (_crew select 0)};
            private _unit = _grp createUnit [_x, [0,0,0], [], 0, "CAN_COLLIDE"];
            _unit moveInAny _vehicle;
        } forEach (_crew select 1);
    } forEach (_loadArray select 4); //Named Vehicles

    uiSleep 2;

    {
        [_x, true] remoteExecCall ["enableSimulationGlobal", 2];
    } forEach _tempSimulationdisabled;

    uiSleep 2;
    //Teleport players
    {
        private _find = [TB_disconnectCache, getPlayerUID _x] call BIS_fnc_findNestedElement;
        if !(_find isEqualTo []) then
        {
            (TB_disconnectCache select (_find select 0)) params ["_uid", "_gear", "_pos", "_dir", "_arsenalType", "_rolle", "_group", "_team"];
    
            [_x] joinSilent _group;
    
            if !(_rolle isEqualTo "" || _arsenalType isEqualTo "") then {
                _x setVariable ["TB_arsenalType", _arsenalType, true];
                [_rolle, _arsenalType, objNull, false] remoteExec ["TB_fnc_changeRolle",_x];
                //[_rolle, _arsenalType, objNull, false] call TB_fnc_changeRolle;//TODO locality
            };

            _x setUnitLoadout _gear;
    
    
            _x setVariable ["TB_team", _team, true];
            _x assignTeam _team;    
    
            //_x allowDamage false;//TODO locality
            [_x, false] remoteExec ["allowDamage", _x];

            _x setDir _dir;
            _x setPosASL _pos;
    
            _x spawn
            {
                uiSleep 10;
                [_this, true] remoteExec ["allowDamage", _this];
                //_x allowDamage true;//TODO locality
            };
        };
    } forEach allPlayers;

    systemChat format ["(TBMod_main) Es wurde alles von Slot %1 geladen!", _number];
    [false, _number] spawn TB_fnc_buildingPersistence;
};
