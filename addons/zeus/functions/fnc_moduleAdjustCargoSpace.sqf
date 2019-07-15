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

_unit spawn
{
    private _currentSpace = _this getVariable ["ace_cargo_space", if (isNumber (configFile >> "CfgVehicles" >> (typeOf _this) >> "ace_cargo_space")) then {getNumber (configFile >> "CfgVehicles" >> (typeOf _this) >> "ace_cargo_space")} else {0}];
    private _dialogResult = [
        "TB Adjust Ace Cargo",
        [["Cargo Space", "", str _currentSpace]]
    ] call Ares_fnc_showChooseDialog;

    if (_dialogResult isEqualTo []) exitWith {};
    _dialogResult params ["_newSize"];
    _newSize = parseNumber (_dialogResult # 0);
    [_this, _newSize] call ace_cargo_fnc_setSpace;
};

true
