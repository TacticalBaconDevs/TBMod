/*
	Author: Eric Ruhland
	Berechnet den außeren Punkt eines Object innerhalb der Sicht
	Parameter:
	1: Target
	Rückgabe:
	   
*/
params ["_target"]; 
systemChat str _target;
_ray = vectorNormalized ((positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]));
_source = player getvariable['TB_Rope_source',objNull];
//Sanity Checks
if(isNull _source) exitWith {hint "No Source found"};
_objectfound = lineIntersects [ eyepos player , eyePos player vectorAdd (_ray vectorMultiply 4 ), player];
if(!_objectfound) exitWith {hint "No Hitbox found"};
if(_source == _target) exitWith {hint "Can't attach Vehicle to itself"};
_attached_Vehicle = _source getvariable['TB_Rope_attached_Vehicle',objNull];
if(!isNull _attached_Vehicle && _attached_Vehicle!=_target) exitWith {hint "Es kann nur ein Fahrzeug beladen werden"};

_selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
if(_selection == "") exitWith {hint "Helikopter besitzt kein Slingload"};

_postoAttach = [player, _ray] call TB_fnc_calculateAttachPoint; 

//Sanity Check
_sourcepos = ATLtoASL (_source modelToWorld (_source selectionPosition _selection));

if((_postoAttach distance _sourcepos)>20) exitWith {hint "Seil ist zu kurz"};
systemChat str _source;
systemChat str _selection;
systemChat str _target;
systemChat str (_target worldToModel ASLtoATL _postoAttach);

ropeCreate [_source, _selection, _target, _target worldToModel ASLtoATL _postoAttach, 20]; 

_source setVariable['TB_Rope_attached_Vehicle',_target,true];

if((getMass _target)>12000) then {
	_target setVariable ['TB_Rope_original_Mass',getMass _target,true];
	_target setMass 12000;};
player setVariable["TB_Rope_source",objNull];
hint "attached";