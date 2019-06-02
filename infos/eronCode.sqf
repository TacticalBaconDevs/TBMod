
player addEventHandler ["FIRED", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    [
        {
            params ["_args", "_pfID"];
            _args params ["_projectile", "_armedTime", "_detonationHeight"];

            if (!alive _projectile) exitWith
            {
                [_pfID] call CBA_fnc_removePerFrameHandler;
            };
    systemChat "schaue time";
            if (time < _armedTime) exitWith {};

            private _height = (getPos _projectile) # 2;
    systemChat "height check";
            if (_height > _detonationHeight) exitWith {};

            private _position = getPosATL _projectile;
_position spawn {
uiSleep 0.3;
private _subMunition = createVehicle ["TB_vz99_ammo_he_airburst", _this, [], 0, "FLY"];
            _subMunition setPosATL _this;
            _subMunition setVelocity [0, 0, -10];
systemChat "submuni";};

            deleteVehicle _projectile;
            [_pfID] call CBA_fnc_removePerFrameHandler;
        },
        0,
        [_projectile, time + 1, 1]
    ] call CBA_fnc_addPerFrameHandler;
}];

























