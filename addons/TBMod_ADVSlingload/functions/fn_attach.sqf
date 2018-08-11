/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Berechnet den außeren Punkt eines Object innerhalb der Sicht
    
    Arguments:
    0: Target <OBJECT>
    
    Return Value:
    None
*/
params ["_target"]; 
systemChat str _target;

private _source = player getVariable ['TB_Rope_source', objNull];

// Sanity Checks
if (isNull _source) exitWith {hint "Source nicht gefunden"};
if (isNull _target) exitWith {hint "Target nicht gefunden"};
if (!alive _source || !alive _target) exitWith {hint "Was zerstört ist sollte nicht benutzt werden"};

private _ray = vectorNormalized ((positionCameraToWorld [0, 0, 0.6]) vectorDiff (positionCameraToWorld [0, 0, 0]));
private _objectfound = lineIntersects [eyepos player, (eyePos player) vectorAdd (_ray vectorMultiply 4), player];
if (!_objectfound) exitWith {hint "Keine Hitbox gefunden"};
if (_source == _target) exitWith {hint "Warum versuchst du das?"};

private _attachedVehicle = _source getVariable ['TB_Rope_attachedVehicle', objNull];
if (!isNull _attachedVehicle && _attachedVehicle != _target) exitWith {hint "Es kann nur ein Fahrzeug verbunden werden"};

private _selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
if (_selection == "") exitWith {hint "Helikopter besitzt kein Slingload"};

private _posToAttach = [player, _ray] call TB_fnc_calculateAttachPoint; 
private _sourcepos = ATLtoASL (_source modelToWorld (_source selectionPosition _selection));

// Sanity Check
if ((_posToAttach distance _sourcepos) > 20) exitWith {hint "Seil ist zu kurz"};
systemChat str _source;
systemChat str _selection;
systemChat str _target;
systemChat str (_target worldToModel ASLtoATL _posToAttach);

ropeCreate [_source, _selection, _target, _target worldToModel ASLtoATL _posToAttach, 20]; 

_source setVariable ['TB_Rope_attachedVehicle', _target, true];
_target setVariable ['TB_Rope_original_Mass', getMass _target, true];

if (getMass _target > 12000) then {_target setMass 12000};
player setVariable ["TB_Rope_source", nil];

systemChat "Attached vehicle";
