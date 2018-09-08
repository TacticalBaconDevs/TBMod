/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: shukari
*/
params ["_logic", "", "_activated"];

private _unit = attachedTo _logic;
private _pos = getPos _logic;
private _local = local _logic;
deleteVehicle _logic;

if !(_local) exitWith {true};
if !(_activated) exitWith {true};
if (isNull _unit) exitWith {true};

_unit setVariable ["ace_medical_enableUnconsciousnessAI", 2, true];

true
