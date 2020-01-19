#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
private _unit = attachedTo _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};
if (isNull _unit) exitWith {systemChat "[TBMOD_zeus] No vehicle selected"; true};

private _cfg = configFile >> "CfgVehicles" >> (typeOf _unit) >> "ace_cargo_space";
private _currentSpace = _unit getVariable ["ace_cargo_space", getNumber _cfg];
[
    "TB Adjust Ace Cargo",
    [
        [
            "SLIDER",
            ["Lagerraumgröße", "Die Anzahl der Kisten (wenn Größe 1)"],
            [0, 50, _currentSpace, 0]
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_newSize"];
        _args params ["_unit"];

        [_unit, round _newSize] call ace_cargo_fnc_setSpace;
    },
    {},
    [_unit]
] call zen_dialog_fnc_create;

true
