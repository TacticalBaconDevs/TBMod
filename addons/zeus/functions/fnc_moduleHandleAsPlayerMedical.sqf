#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _unit = attachedTo _logic;
deleteVehicle _logic;

if (!alive _unit) exitWith {true};

// TODO: ACE 3.13.* bietet derzeit nicht diese Funktionalität PRs sind nötig
/*{
    _x params ["_key", "_value"];
    _unit setVariable ["ace_medical_"+ _key, _value, true];
}
forEach [
        ["enableUnconsciousnessAI", 2],
        ["preventInstaDeath", true],
        ["amountOfReviveLives", 5],
        ["enableRevive", 2]
    ];

systemChat "[TBMod_main] HandleAsPlayerMedical: KI wird nun als Spieler behandelt!";*/

true
