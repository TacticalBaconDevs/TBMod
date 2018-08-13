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

//Sanity Checks
if (isNull _target) exitWith {systemChat format ["ERROR(detach): Es gab kein Ziel"]};
if (isNull _attachedVehicle) exitWith {systemChat format ["ERROR(Detach): Es war kein angehängtes Ziel gespeichert"]};

private _originalMass = _attachedVehicle getVariable ['TB_Rope_originalMass', 0];
if (_originalMass != 0) then {_attachedVehicle setMass _originalMass};

{
    private _helper = _x getVariable ['TB_Rope_helper', objNull];
    if (!isNull _helper) then
    {
        detach _helper;
        deleteVehicle _helper;
    };
    
    ropeDestroy _x;
}
forEach (ropes _target);

_attachedVehicle setVariable ['TB_Rope_originalMass', nil, true];
_target setVariable ['TB_Rope_attachedVehicle', nil, true];
