#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _unit = attachedTo _logic;
deleteVehicle _logic;

if (!alive _unit) exitWith {true};

private _loadouts = profileNamespace getVariable ["ACE_arsenal_saved_loadouts",[]];
if (_loadouts isEqualTo []) exitWith {hint "Keine Loadouts gespeichert"};

[
    "Select Loadout",
    [
        [
            "CHECKBOX",
            "Ganze Gruppe",
            false
        ],
        [
            "LIST",
            "Loadouts",
            [_loadouts apply {_x select 1}, _loadouts apply {_x select 0}, 0, 10]
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_gruppe", "_loadout"];
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
