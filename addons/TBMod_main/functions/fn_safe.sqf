#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_mode", ["_hideMessage", false]];
if (isDedicated) exitWith {};

if (_mode) then
{
    if (isNil QGVAR(FiredMan)) then
    {
        GVAR(FiredMan_last) = "";
        GVAR(FiredMan) = player addEventHandler ["FiredMan", {
            params ["", "_weapon", "", "", "_ammo", "", "_obj"];

            if (GVAR(FiredMan_last) != _weapon) then
            {
                (format ["[SafeWeapons] %1 hat mit %2 geschossen!", profileName, [_weapon] call FUNC(displayName)]) remoteExecCall ["systemChat"];
                GVAR(FiredMan_last) = _weapon;
            };

            deleteVehicle _obj;
        }];
    };

    if (isNil QGVAR(firedPlayer)) then
    {
        GVAR(firedPlayer_last) = "";
        GVAR(firedPlayer) = ["ace_firedPlayer", {
            if (_weapon == "Throw") then
            {
                if (GVAR(firedPlayer_last) != _ammo) then
                {
                    (format ["[SafeWeapons] %1 hat mit %2 geworfen!", profileName, [_ammo] call FUNC(displayName)]) remoteExecCall ["systemChat"];
                    GVAR(firedPlayer_last) = _ammo;
                };
                deleteVehicle _projectile;
            };
        }] call CBA_fnc_addEventHandler;
    };

    if (isNil QGVAR(blockFire)) then
    {
        GVAR(blockFire_last) = "";
        GVAR(blockFire) = [player, "DefaultAction", {true}, {
            private _weapon = currentWeapon (vehicle (_this select 1));

            if (GVAR(blockFire_last) != _weapon) then
            {
                (format ["[SafeWeapons] %1 hat mit %2 versucht zu schießen!", profileName, [_weapon] call FUNC(displayName)]) remoteExecCall ["systemChat"];
                GVAR(blockFire_last) = _weapon;
            };
        }] call ace_common_fnc_addActionEventHandler;
    };

    if (isNil QGVAR(safeInfo) && !_hideMessage) then {GVAR(safeInfo) = [] spawn {waitUntil {uiSleep 60; systemChat format ["[SafeWeapons] ist immer noch aktiv!"]; false}}};

    if (!_hideMessage) then {systemChat "[SafeWeapons] Deine Munition wurde aus Sicherheitsgründen durch Luft ersetzt!"};
}
else
{
    if (!isNil QGVAR(FiredMan)) then {player removeEventHandler ["FiredMan", GVAR(FiredMan)]; GVAR(FiredMan) = nil;};
    if (!isNil QGVAR(firedPlayer)) then {["ace_firedPlayer", GVAR(firedPlayer)] call CBA_fnc_removeEventHandler; GVAR(firedPlayer) = nil;};
    if (!isNil QGVAR(blockFire)) then {[player, "DefaultAction", GVAR(blockFire)] call ace_common_fnc_removeActionEventHandler; GVAR(blockFire) = nil;};

    if (!isNil QGVAR(safeInfo)) then
    {
        terminate TB_safeInfo;
        GVAR(safeInfo) = nil;
    };

    if (!_hideMessage) then {systemChat "[SafeWeapons] Deine Munition ist nun wieder tödlich!"};
};
