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
_original_mass = _attached_Vehicle getvariable['TB_Rope_original_Mass',0];
if(_original_mass != 0) then {hint "Setting mass";_attached_Vehicle setMass _original_mass; };
{ropeDestroy _x;} forEach (ropes _target);
_attached_Vehicle setVariable['TB_Rope_original_Mass',objNull,true];
_target setVariable['TB_Rope_attached_Vehicle',objNull,true];
systemChat "Detached vehicle";