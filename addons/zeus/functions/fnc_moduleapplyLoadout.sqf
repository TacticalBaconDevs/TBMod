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
if (isNull _unit) exitWith {true};

private _loadouts = profileNamespace getVariable ["ACE_arsenal_saved_loadouts",[]];
if (_loadouts isEqualTo []) exitWith {hint "Keine Loadouts gespeichert"};

[
    "Select Loadout",
    [
        [
            "LIST",
            "Loadouts",
            [_loadouts apply {_x select 1}, _loadouts apply {_x select 0}, 0, 10]
        ],
        [
            "CHECKBOX",
            "Ganze Gruppe",
            false
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_loadout", "_gruppe"];
        _args params ["_unit"];

        {
            _x setUnitLoadout _loadout;
        }
        forEach ([[_unit], units _unit] select _gruppe);
    },
    {},
    [_unit]
] call zen_dialog_fnc_create;

true
