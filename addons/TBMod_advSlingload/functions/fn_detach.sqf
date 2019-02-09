/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Detatach a Vehicle that was attached

    Arguments:
    0: Target <OBJECT>

    Return Value:
    None
*/
params ["_target"];

// Sanity Checks
if (isNull _target) exitWith {systemChat format ["ERROR(detach): Es gab kein Ziel"]};

private _attachedVehicle = _target getVariable ["TB_Rope_attachedVehicle", objNull];
// if (isNull _attachedVehicle) exitWith {systemChat format ["ERROR(Detach): Es war kein angehängtes Ziel gespeichert"]};
if (!isNull _attachedVehicle) then
{
    private _originalMass = _attachedVehicle getVariable ["TB_Rope_original_Mass", 0];
    if (_originalMass != 0) then {_attachedVehicle setMass _originalMass};
    _attachedVehicle setVariable ["TB_Rope_original_Mass", nil, true];
    _target setVariable ["TB_Rope_attachedVehicle", nil, true];
};

{
    private _helper = _x getVariable ["TB_Rope_helper", objNull];
    if (!isNull _helper) then
    {
        detach _helper;
        deleteVehicle _helper;
    };

    ropeDestroy _x;
}
forEach (ropes _target);
