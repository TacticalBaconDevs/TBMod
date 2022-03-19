#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Aufgerufen aus chatCommands
*/
params ["_values", "_args"];
_values params ["_enabled", "_buffertime", "_vehicleKills", "_multiKills", "_multiCount"];

GVAR(highlight_enabled) = _enabled;
GVAR(highlight_buffertime) = round _buffertime;
GVAR(highlight_vehEnabled) = _vehicleKills;
GVAR(highlight_multiEnabled) = _multiKills;
GVAR(highlight_multiCount) = _multiCount;

if (!GVAR(highlight_enabled)) exitWith {};

// Fahrzeugkills
if (GVAR(highlight_vehEnabled) && isNil QGVAR(highlight_vehEH)) then
{
    GVAR(highlight_vehEH_last) = diag_tickTime;
    GVAR(highlight_vehEH) = true;

    {
        [_x, "Killed", {
            if (!GVAR(highlight_enabled) || !GVAR(highlight_vehEnabled)) exitWith {systemChat "veh highlight: disabled or global"};

            params ["_unit", "_killer", "_instigator", "_useEffects"];

            if (!isNull _killer && isNull _instigator) then {_instigator = effectiveCommander _killer};
            if !(_killer == player || _instigator == player) exitWith {};
            if (count (crew _unit) == 0) exitWith {};
            if (GVAR(highlight_vehEH_last) > diag_tickTime) exitWith {};

            GVAR(highlight_vehEH_last) = diag_tickTime + 5;
            ["highlights", "trigger", [systemTime, GVAR(highlight_buffertime)]] call EFUNC(extension,callExtension);
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    }
    foreach ["Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship", "Air"];
};

// Multikills
if (GVAR(highlight_multiEnabled) && isNil QGVAR(highlight_multiEH)) then
{
    GVAR(highlight_multi_last) = diag_tickTime;
    GVAR(highlight_multi_count) = [];

    GVAR(highlight_multiEH) = ["ace_killed", {
        params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

        if (isPlayer _unit) exitWith {};
        if (!isNull _killer && isNull _instigator) then {_instigator = effectiveCommander _killer};
        if !(_killer == player || _instigator == player) exitWith {};

        GVAR(highlight_multi_count) pushBack diag_tickTime;
        private _multiTime = round (GVAR(highlight_buffertime) * 0.7);
        GVAR(highlight_multi_count) = GVAR(highlight_multi_count) select {_x > (diag_tickTime - _multiTime)};
        if (count GVAR(highlight_multi_count) < GVAR(highlight_multiCount)) exitWith {};

        if (GVAR(highlight_multi_last) > diag_tickTime) exitWith {};
        GVAR(highlight_multi_last) = diag_tickTime + 5;

        private _mitte = (selectMax GVAR(highlight_multi_count)) - (selectMin GVAR(highlight_multi_count));
        ["highlights", "trigger", [systemTime, round (GVAR(highlight_buffertime) - _mitte)]] call EFUNC(extension,callExtension);
    }] call CBA_fnc_addEventHandler;
};

systemChat "Highlight Settings wurden gesetzt! 5";
