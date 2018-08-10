/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Detatach a Vehicle that was attached
    
    Arguments:
    0: Target <OBJECT>
    
    Return Value:
    None
*/
params ["_target"];

private _attachedVehicle = _target getVariable ['TB_Rope_attachedVehicle', objNull];
if (_attachedVehicle == objNull) exitWith {hint "Es ist kein Fahrzeug verbunden"};

private _originalMass = _attachedVehicle getVariable ['TB_Rope_originalMass', 0];
if (_originalMass != 0) then {hint "Setting mass"; _attachedVehicle setMass _originalMass;};
{
    _helper = _x getVariable ['TB_Rope_helper',objNull];
    if(!isNull _helper) then{
        detach _helper;
        deleteVehicle _helper;
    };
    ropeDestroy _x;
} forEach (ropes _target);

_attachedVehicle setVariable ['TB_Rope_originalMass', nil, true];
_target setVariable ['TB_Rope_attachedVehicle', nil, true];
systemChat "Detached vehicle";
