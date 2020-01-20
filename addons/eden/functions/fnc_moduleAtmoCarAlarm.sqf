#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    if (isNil QGVAR(carAlarm)) then {GVAR(carAlarm) = false};
    if (GVAR(carAlarm)) exitWith {systemChat "Nur ein AtmoCarAlarm-Modul wird benötigt!"};
    GVAR(carAlarm) = true;

    [
        "Car", // "Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship", "Thing"
        "initPost",
        {
            params ["_vehicle"];
            if (GVAR(carAlarm) && {local _vehicle}) then {["init", _vehicle] call BIS_fnc_carAlarm}
        },
        true,
        [],
        true
    ] call CBA_fnc_addClassEventHandler;
};
