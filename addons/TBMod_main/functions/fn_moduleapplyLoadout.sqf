/*
    Author: Eric Ruhland
*/
params ["_logic", "", "_activated"];

private _unit = attachedTo _logic;
private _local = local _logic;
deleteVehicle _logic;

if !(_local) exitWith {true};
if !(_activated) exitWith {true};

private _units = if (isNull _unit) then
{
    ["Units"] call Achilles_fnc_SelectUnits;
}
else
{
    units group _unit;
};
if (isNil "_units") exitWith {};
if (_units isEqualTo []) exitWith {hint "Keine Einheiten ausgewählt"};

private _loadouts = profileNamespace getVariable ["ACE_arsenal_saved_loadouts",[]];
if (_loadouts isEqualTo []) exitWith {hint "Keine Loadouts gespeichert"};
private _choices = [];
{
    _choices pushBack (_x select 0);
} forEach _loadouts;

private _result = 
[ 
    "Select Loadout", 
    [ 
        ["Loadout", _choices, 0]
    ] 
] call Ares_fnc_showChooseDialog;

if (_result isEqualTo []) exitWith{};

private _loadout =  (_loadouts select (_result select 0) select 1);
{
    _x setUnitLoadout _loadout;
} forEach _units;
