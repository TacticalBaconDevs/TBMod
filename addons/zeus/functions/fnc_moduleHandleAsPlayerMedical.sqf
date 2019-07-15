#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
private _unit = attachedTo _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};
if (isNull _unit) exitWith {true};

{
    _x params ["_key", "_value"];
    _unit setVariable ["ace_medical_"+ _key, _value, true];
}
forEach [
        ["enableUnconsciousnessAI", 2],
        ["preventInstaDeath", true],
        ["amountOfReviveLives", 5],
        ["enableRevive", 2]
    ];

systemChat "[TBMod_main] HandleAsPlayerMedical: KI wird nun als Spieler behandelt!";

true
