#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];

// On-Use-Eden Module, darf nicht direkt gelöscht werden
_input spawn
{
    uiSleep 1;
    params [["_logic", objNull, [objNull]]];
    if (!isNull _logic) then {delete3DENEntities [_logic]};
};

private _activated = switch _mode do
{
    case "init";
    case "attributesChanged3DEN";
    case "registeredToWorld3DEN": {true};
    default {false};
};

if (!_activated) exitWith {true};

private _saves = profileNamespace getVariable [QGVAR(savedNames), []];
[
    "Persistence laden",
    [
        [
            "COMBO",
            ["Speichername", "Der Name des Speicherstandes"],
            [_saves, [], (count _saves) - 1],
            true
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_name"];

        [_name] spawn FUNC(persistenceEDEN);
    }
] call zen_dialog_fnc_create;

true;
