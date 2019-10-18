#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Befestigt ein Object

    Arguments:
    0: Target <OBJECT>
    1: Helper <OBJECT>

    Return Value:
    None
*/
params ["_target", "_helper"];

private _rope = _helper getVariable [QGVAR(ropeObj), objNull];
private _source = _rope getVariable [QGVAR(ropeSource), objNull];
private _idPFH = ACE_player getVariable [QGVAR(ropeIdPFH), -1];

// Sanity Checks
if (isNull _source || isNull _target || isNull _helper) exitWith {ERROR_MSG_3("isNull-Checks: _source: %1 | _target: %2 | _helper: %3", _source, _target, _helper)};
if (!alive _source || !alive _target) exitWith {ERROR_MSG("alive-Checks: Was zerstört ist sollte nicht benutzt werden")};

private _ray = vectorNormalized ((positionCameraToWorld [0, 0, 0.6]) vectorDiff (positionCameraToWorld [0, 0, 0]));
private _objectfound = lineIntersects [eyepos ACE_player, (eyePos ACE_player) vectorAdd (_ray vectorMultiply 4), ACE_player];

if (!_objectfound) exitWith {ERROR_MSG_3("no Hitbox: _source: %1 | _target: %2 | _helper: %3", _source, _target, _helper)};
if (_source == _target) exitWith {systemChat "Warum versuchst du das?"};

private _attachedVehicle = _source getVariable [QGVAR(attachedVehicle), objNull];
if (!isNull _attachedVehicle && _attachedVehicle != _target) exitWith {systemChat "Es kann nur ein Fahrzeug verbunden werden"};

private _selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
if (_selection == "") exitWith {ERROR_MSG_1("no Slingloadposition found on _source: %1", _source)};

private _posToAttach = ASLToAGL ([ACE_player, _ray] call FUNC(calculateAttachPoint));
private _sourcepos = (_source modelToWorld (_source selectionPosition _selection));

// Sanity Check
if ((_posToAttach distance _sourcepos) > 20) exitWith {systemChat "Seil ist zu kurz"};

LOG_4("DEBUG attach: _source: %1 | _selection: %2 | _target: %3 | _attachoffset: %4", _source, _selection, _target, (_target worldToModel _posToAttach));
if (_idPFH == -1) then
{
    ERROR_MSG_1("no idPFH assigned _helper: %1", _helper)
}
else
{
    [_idPFH] call CBA_fnc_removePerFrameHandler;
    ACE_player setVariable [QGVAR(ropeIdPFH), nil];
};

detach _helper;
deleteVehicle _helper;

[QGVAR(attachToEvent), [_target, _target worldToModel _posToAttach, _rope], _rope] call CBA_fnc_targetEvent;

_rope setVariable [QGVAR(ropeHelper), nil, true];
ACE_player setVariable [QGVAR(ropeHelper), nil];
_source setVariable [QGVAR(attachedVehicle), _target, true];
_target setVariable [QGVAR(originalMass), getMass _target, true];

if (getMass _target > GVAR(maxWeight)) then {[_target, GVAR(maxWeight)] remoteExec ["setMass", _target]};
ACE_player setVariable [QGVAR(ropeSource), nil];
