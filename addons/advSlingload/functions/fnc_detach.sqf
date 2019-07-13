#include "../script_component.hpp"
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

private _attachedVehicle = _target getVariable [QGVAR(attachedVehicle), objNull];
// if (isNull _attachedVehicle) exitWith {systemChat format ["ERROR(Detach): Es war kein angehängtes Ziel gespeichert"]};
if (!isNull _attachedVehicle) then
{
    private _originalMass = _attachedVehicle getVariable [QGVAR(originalMass), 0];
    if (_originalMass != 0) then {[_attachedVehicle, _originalMass] remoteExec ["setMass", _originalMass]};
    _attachedVehicle setVariable [QGVAR(originalMass), nil, true];
    _target setVariable [QGVAR(attachedVehicle), nil, true];
};

{
    private _helper = _x getVariable [QGVAR(ropeHelper), objNull];
    if (!isNull _helper) then
    {
        detach _helper;
        deleteVehicle _helper;
    };

    ropeDestroy _x;
}
forEach (ropes _target);
