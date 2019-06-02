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

private _rope = _helper getVariable ['TB_Rope_rope', objNull];
private _source = _rope getVariable ['TB_Rope_Source', objNull];
private _idPFH = ACE_player getVariable ['TB_Rope_idPFH', -1];
// Sanity Checks
if (isNull _source || isNull _target || isNull _helper) exitWith {systemChat format ["ERROR(attach): _source %1  _target %2 _helper %3", _source, _target, _helper]};
if (!alive _source || !alive _target) exitWith {systemChat "Was zerstört ist sollte nicht benutzt werden"};
private _ray = vectorNormalized ((positionCameraToWorld [0, 0, 0.6]) vectorDiff (positionCameraToWorld [0, 0, 0]));

private _objectfound = lineIntersects [eyepos ACE_player, (eyePos ACE_player) vectorAdd (_ray vectorMultiply 4), ACE_player];
if (!_objectfound) exitWith {systemChat format ["ERROR(attach):no Hitbox _source %1  _target %2 _helper %3", _source, _target, _helper]};
if (_source == _target) exitWith {systemChat "Warum versuchst du das?"};

private _attachedVehicle = _source getVariable ['TB_Rope_attachedVehicle', objNull];
if (!isNull _attachedVehicle && _attachedVehicle != _target) exitWith {systemChat "Es kann nur ein Fahrzeug verbunden werden"};

private _selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
if (_selection == "") exitWith {systemChat format ["ERROR(attach): no Slingloadposition found on _source %1   ", _source]};

private _posToAttach = ASLToAGL ([ACE_player, _ray] call TB_fnc_calculateAttachPoint);
private _sourcepos = (_source modelToWorld (_source selectionPosition _selection));

// Sanity Check
if ((_posToAttach distance _sourcepos) > 20) exitWith {systemChat "Seil ist zu kurz"};

//systemChat format ["DEBUG(attach): _source %1  _selection %2 _target %3 _attachoffset %4", _source, _selection, _target, (_target worldToModel _posToAttach)];
if (_idPFH==-1) then
{
    systemChat format ["ERROR(dropRope): no idPFH assigned _helper %1", _helper];
}
else
{
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
ACE_player setVariable ['TB_Rope_idPFH', nil];

detach _helper;
deleteVehicle _helper;

["TB_Rope_attachto", [_target, _target worldToModel _posToAttach, _rope], _rope] call CBA_fnc_targetEvent;
//[_target,  _target worldToModel ASLtoATL _posToAttach, [0, 0, -1]] ropeAttachTo _rope;

_rope setVariable ['TB_Rope_helper', nil, true];
ACE_player setVariable ['TB_Rope_helper', nil];
_source setVariable ['TB_Rope_attachedVehicle', _target, true];
_target setVariable ['TB_Rope_original_Mass', getMass _target, true];

if (getMass _target > TB_adv_maxWeight) then {_target setMass TB_adv_maxWeight};
ACE_player setVariable ["TB_Rope_source", nil];
