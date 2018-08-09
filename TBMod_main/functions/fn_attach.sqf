/*
	Author: Eric Ruhland
	Berechnet den außeren Punkt eines Object innerhalb der Sicht
	Parameter:
	1: Target
	Rückgabe:
	   
*/
params ["_target"]; 
_postoAttach = [player, vectorNormalized ((positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]))] call TB_fnc_calculateAttachPoint; 
ropeCreate [player getvariable['TB_Rope_source',objNull], "slingload0", _target, _target worldToModel ASLtoATL _postoAttach, 20]; 
if((getMass _target)>12000) then {_target setMass 12000;};
player setVariable["TB_Rope_source",objNull];