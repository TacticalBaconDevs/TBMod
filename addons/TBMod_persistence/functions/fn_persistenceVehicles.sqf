/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    {
        private _veh = _x;

        // is loaded in ace context -> skip
        if !(_veh in ((attachedTo _veh) getVariable ["ace_cargo_loaded", []])) then
        {
            private _pylonMags = [];
            {
                _pylonMags pushBack (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> (configName _x) >> "attachment"));
            }
            forEach (configProperties [configFile >> "CfgVehicles" >> (typeOf _veh) >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]);

            private _ammo = [];
            {
                if !((_x select 0) in _pylonMags) then {_ammo pushBack [_x select 0, _x select 2, _x select 1]};
            }
            forEach (magazinesAllTurrets _x);

            private _array = [
                    typeOf _veh,
                    getPosASL _veh,
                    vectorDir _veh,
                    vectorUp _veh,
                    simulationEnabled _veh,
                    [true, _veh] call TB_fnc_cargo,
                    (_veh getVariable ["ace_cargo_loaded", []]) apply {[typeOf _x, [true, _x] call TB_fnc_cargo]},
                    if ((getAllHitPointsDamage _veh) isEqualTo []) then {[]} else {[(getAllHitPointsDamage _veh) select 0, (getAllHitPointsDamage _veh) select 2]},
                    _ammo,
                    fuel _veh,
                    [side _veh, (crew _veh) apply {typeOf _x}]
                ];

            if (vehicleVarName _veh != "") then {_array pushBack (vehicleVarName _x)};

            _storagearray pushBack _array;
        };
    }
    forEach (vehicles select {_x getVariable ["ace_arsenal_virtualitems",[]] isEqualTo []});
}
else // load
{
    {
        _x params ["_class", "_pos", "_dir", "_up", "_sim", "_vanillaCargo", "_aceCargo", "_dmg", "_ammo", "_fuel", "_crew", "_name"];

        private _vehicle = (if (isNil "_name") then
            {
                createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
            }
            else
            {
                missionNamespace getVariable [_name, objNull];
            });

        _vehicle setVectorDirAndUp [_dir, _up];

        if (_vehicle in TB_persistence_tempSimulationDisabled) then {_pos set [2, (_pos select 2) + 0.5]};
        _vehicle setPosASL _pos;

        [false, _vehicle, _vanillaCargo] call TB_fnc_cargo;

        {
            private _ammoChest = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
            _ammoChest attachTo [_vehicle, [0,0,-100]];
            [false, _ammoChest, _x select 1] call TB_fnc_cargo;

            [_ammoChest, _vehicle, true] call ace_cargo_fnc_loadItem;
        }
        forEach _aceCargo;

        if !(_dmg isEqualTo []) then
        {
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

        _vehicle enableSimulationGlobal _sim;
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Fahrzeuge wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
