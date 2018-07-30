params ["_save"];

if (isNil "_save") exitWith {
    profileNamespace setVariable ["TB_persistence", nil];
};

TB_fnc_cargo = {
    params ["_save", "_vehicle", "_value"];
    
    if (_save) then {
        [
            getBackpackCargo _vehicle,
            getItemCargo _vehicle,
            getMagazineCargo _vehicle,
            getWeaponCargo _vehicle
        ]
    } else {
        _value params ["_backpack", "_item", "_mags", "_items"];
        {
            _vehicle addBackpackCargoGlobal [_x, (_backpack select 1) select _forEachIndex];
        } forEach (_backpack select 0);
        {
            _vehicle addItemCargoGlobal [_x, (_item select 1) select _forEachIndex];
        } forEach (_item select 0);
        {
            _vehicle addMagazineCargoGlobal [_x, (_mags select 1) select _forEachIndex];
        } forEach (_mags select 0);
        {
            _vehicle addItemCargoGlobal [_x, (_items select 1) select _forEachIndex];
        } forEach (_items select 0);
    };
};

if (_save) then {
    private _saveArray = [
        TB_disconnectCache,
        [],     // Markers
        []      // Vehicles
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
            getPos _veh,
            getDir _veh,
            [true, _veh] call TB_fnc_cargo,
            (_veh getVariable ["ace_cargo_loaded", []]) apply {[typeOf _x, [true, _veh] call TB_fnc_cargo]},
            if ((getAllHitPointsDamage _veh) isEqualTo []) then {[]} else {[(getAllHitPointsDamage _veh) select 0, (getAllHitPointsDamage _veh) select 2]},
            _ammo,
            fuel _veh,
            [side _veh, (crew _veh) apply {typeOf _x}]
        ];
    } forEach vehicles;
    
    profileNamespace setVariable ["TB_persistence", _saveArray];
    
    [true, 1] spawn TB_fnc_buildingPersistence;
} else {
    private _loadArray = profileNamespace getVariable ["TB_persistence", [[], [], []]];
    
    {deleteVehicle _x} forEach vehicles;
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
        _x params ["_class", "_pos", "_dir", "_vanillaCargo", "_aceCargo", "_dmg", "_ammo", "_fuel", "_crew"];
        
        private _vehicle = createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
        _vehicle setDir _dir;
        _vehicle setPos _pos;
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
    
    [false, 1] spawn TB_fnc_buildingPersistence;
};
