#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_mode", ["_hideMessage", false]];
if (isDedicated) exitWith {};
if (isNil "_mode") then
{
    _mode = !isNil QGVAR(safeJIP);
    _hideMessage = true;
};

if (_mode) then
{
    if (isNil QGVAR(FiredMan)) then
    {
        GVAR(FiredMan_last) = ["", diag_tickTime];
        GVAR(FiredMan) = player addEventHandler ["FiredMan", {
            params ["", "_weapon", "", "", "_ammo", "", "_obj"];

            if (!weaponLowered player && !(_weapon in (player getVariable ["ace_safemode_safedWeapons", []])) && _weapon != "" && (GVAR(FiredMan_last) # 0 != _weapon || GVAR(FiredMan_last) # 1 <= diag_tickTime)) then
            {
                (format ["[SafeWeapons] %1 hat mit %2 geschossen!", profileName, [_weapon] call FUNC(displayName)]) remoteExecCall ["systemChat"];
                GVAR(FiredMan_last) = [_weapon, diag_tickTime + 2];
            };

            deleteVehicle _obj;
        }];
    };

    if (isNil QGVAR(firedPlayer)) then
    {
        GVAR(firedPlayer_last) = ["", diag_tickTime];
        GVAR(firedPlayer) = ["ace_firedPlayer", {
            if (_weapon == "Throw") then
            {
                if (GVAR(firedPlayer_last) # 0 != _ammo || GVAR(firedPlayer_last) # 1 <= diag_tickTime) then
                {
                    (format ["[SafeWeapons] %1 hat mit %2 geworfen!", profileName, [_ammo] call FUNC(displayName)]) remoteExecCall ["systemChat"];
                    GVAR(firedPlayer_last) = [_ammo, diag_tickTime + 2];
                };
                deleteVehicle _projectile;
            };
        }] call CBA_fnc_addEventHandler;
    };

    if (isNil QGVAR(blockFire)) then
    {
        GVAR(blockFire_last) = ["", diag_tickTime];
        GVAR(blockFire) = [player, "DefaultAction", {true}, {
            private _weapon = currentWeapon (vehicle (_this select 1));

            if (!weaponLowered player && !(_weapon in (player getVariable ["ace_safemode_safedWeapons", []])) && _weapon != "" && (GVAR(blockFire_last) # 0 != _weapon || GVAR(blockFire_last) # 1 <= diag_tickTime)) then
            {
                (format ["[SafeWeapons] %1 hat mit %2 versucht zu schießen!", profileName, [_weapon] call FUNC(displayName)]) remoteExecCall ["systemChat"];
                GVAR(blockFire_last) = [_weapon, diag_tickTime + 2];
            };
        }] call ace_common_fnc_addActionEventHandler;
    };

    if (isNil QGVAR(safeInfo) && !_hideMessage) then {GVAR(safeInfo) = [] spawn {waitUntil {uiSleep 60; systemChat format ["[SafeWeapons] ist immer noch aktiv!"]; false}}};

    if (!_hideMessage) then {systemChat "[SafeWeapons] Deine Munition wurde aus Sicherheitsgründen durch Luft ersetzt!"};

    if (isNil QGVAR(safeJIP)) then
    {
        GVAR(safeJIP) = true;
        publicVariable QGVAR(safeJIP);
    };
}
else
{
    if (!isNil QGVAR(FiredMan)) then {player removeEventHandler ["FiredMan", GVAR(FiredMan)]; GVAR(FiredMan) = nil;};
    if (!isNil QGVAR(firedPlayer)) then {["ace_firedPlayer", GVAR(firedPlayer)] call CBA_fnc_removeEventHandler; GVAR(firedPlayer) = nil;};
    if (!isNil QGVAR(blockFire)) then {[player, "DefaultAction", GVAR(blockFire)] call ace_common_fnc_removeActionEventHandler; GVAR(blockFire) = nil;};

    if (!isNil QGVAR(safeInfo)) then
    {
        terminate GVAR(safeInfo);
        GVAR(safeInfo) = nil;
    };

    if (!_hideMessage) then {systemChat "[SafeWeapons] Deine Munition ist nun wieder tödlich!"};

    if (!isNil QGVAR(safeJIP)) then
    {
        GVAR(safeJIP) = nil;
        publicVariable QGVAR(safeJIP);
    };
};
