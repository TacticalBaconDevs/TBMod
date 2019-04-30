/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_mortarVeh", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if (!local _mortarVeh) exitWith {};

// Remove the empty magazine, so a new one will load correctly
private _loadedEmpty = _mortarVeh magazinesTurret [0];
if !(_loadedEmpty isEqualTo []) then
{
    _mortarVeh removeMagazinesTurret [_loadedEmpty select 0, [0]];
};

private _fuze = getText (configFile >> "CfgMagazines" >> _magazine >> "TB_vz99_fuze");
if (_fuze == "") exitWith {};

private _detonationHeight = switch (true) do
{
    case (_fuze == "prx"): {5}; // M734 says "PRX = Proximity air burst between 3 and 13 feet"
    default {-1};
};

[
    {
        params ["_args", "_pfID"];
        _args params ["_projectile", "_detonationHeight", "_armedTime"];

        if (!alive _projectile) exitWith
        {
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };

        // Wait for it to arm (heading down)
        if (time < _armedTime) exitWith {};

        private _height = (getPos _projectile) select 2;
        if (_height > _detonationHeight) exitWith {};

        private _position = getPosATL _projectile;
        private _subMunition = createVehicle ["TB_vz99_ammo_he_airburst", _position, [], 0, "FLY"];

        _subMunition setPosATL _position;
        _subMunition setVelocity [0, 0, -10];

        deleteVehicle _projectile;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    },
    0,
    [_projectile, _detonationHeight, time + 5]
] call CBA_fnc_addPerFrameHandler;
