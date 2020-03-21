#include "\z\ace\addons\medical_treatment\script_component.hpp"

/*
 * Author: Ruthberg
 * Calculates the PAK treatment time based on the amount of damage to heal.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player] call TBMod_medical_fnc_getHealTime
 *
 * Public: No
 */

#define DAMAGE_SCALING_FACTOR 5

params ["_medic", "_patient", "_bodypart", "_bandage"];


private _inFacility = [ACE_player] call FUNC(isInMedicalFacility);
private _inVehicle = [ACE_player] call FUNC(isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

private _bodyPartDamage = 0;

{
    _bodyPartDamage = _bodyPartDamage + _x;
} forEach (_patient getVariable [QEGVAR(medical,bodyPartDamage), []]);

private _time = 10 max (((_bodyPartDamage * DAMAGE_SCALING_FACTOR) min 180) * GVAR(timeCoefficientPAK));

["Treatmenttime(Heal) ->Take: %1, Damage: %2, Sani: %3, Arzt: %4, Vehicle: %5, Facility: %6", _time, _bodyPartDamage, _isSani, _isArzt, _inVehicle, _inFacility] call TBMod_main_fnc_debug;

_time;