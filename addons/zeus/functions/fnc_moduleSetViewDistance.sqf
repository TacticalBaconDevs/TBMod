#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    TODO:
    - JIP remoteExec Code ggf oder createNamespace
    - Auswahl auch ggf per Liste nicht per Auswahl
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _unit = attachedTo _logic;
deleteVehicle _logic;

if (!alive _unit || !isPlayer _unit) exitWith {true};

[
    "Viewdistance setzen",
    [
        [
            "Slider",
            ["Viewdistance Limit", "Der maximale Wert der in den Einstellungen für den Spieler einstellbar ist"],
            [100, 12000, ace_viewdistance_limitViewdistance, 0]
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_viewdistance"];
        _args params ["_unit"];

        [missionNamespace, ["ace_viewdistance_limitViewdistance", _viewdistance]] remoteExecCall ["setVariable", _unit];
    },
    {},
    [_unit]
] call zen_dialog_fnc_create;

true
