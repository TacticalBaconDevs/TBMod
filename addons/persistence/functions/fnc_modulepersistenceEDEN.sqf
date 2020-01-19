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
if (_saves isEqualTo []) then {["Keine lokalen Saves vorhanden!", 1] call bis_fnc_3dennotification;};

[
    "Persistence laden",
    [
        [
            "COMBO",
            ["Speichername", "Der Name des Speicherstandes"],
            [_saves, _saves, ((count _saves) - 1) max 0],
            true
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_name"];

        [_name] spawn FUNC(persistenceEDEN);
        ["Persistence wurde geladen", 0] call bis_fnc_3dennotification;
    }
] spawn zen_dialog_fnc_create; // TODO: setzt sich selbst mit CBA_fnc_directCall wieder auf unscheduled, aber derzeit werden alle Tastatureingaben geblocked... ENTER drücken geht

true;
