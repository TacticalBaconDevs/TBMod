/*
	Author: Eric Ruhland
	Detatach a Vehicle that was attached
	Parameter:
	1: Target
	Rückgabe:
	   
*/
params ["_target"]; 
_attached_Vehicle = _target getvariable['TB_Rope_attached_Vehicle',objNull];
if(_attached_Vehicle == objNull) exitWith {hint "Es ist kein Fahrzeug verbunden";};
_original_mass = _attached_Vehicle getvariable['TB_Rope_original_Mass',objNull];
if(_original_mass != objNull) then {_attached_Vehicle setMass _original_mass; };
{ropeDestroy _x;} forEach (ropes _target);
_attached_Vehicle setVariable['TB_Rope_original_Mass',objNull,true];
_target setVariable['TB_Rope_attached_Vehicle',objNull,true];