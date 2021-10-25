#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "_units", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _unit = attachedTo _logic;
deleteVehicle _logic;

if (!alive _unit) exitWith {true};

[
    "HandleAsPlayer",
    [
        [
            "CHECKBOX",
            ["Am Leben erhalten", "Es wird dafür gesorgt, dass die KI nicht stirbt"],
            true
        ]
    ],
    {
        params ["_values", "_unit"];
        _values params ["_keepAlive"];

        // Handle keepAlive and ACE states
        if (_keepAlive) then {["add", _unit] call TBMod_medical_fnc_keepAlive};
        _unit setVariable ["ace_medical_fatalDamageSource", 3, true];
        _unit setVariable ["ace_medical_statemachine_AIUnconsciousness", true, true];

        systemChat "[TBMod] HandleAsPlayerMedical: KI wird nun als Spieler behandelt!";
    },
    {},
    _unit
] call zen_dialog_fnc_create;

true
