#include "\z\ace\addons\medical_treatment\script_component.hpp"

/*
 * Author: SilentSpike
 * Calculates the time to bandage a wound based on it's size, the patient and the medic.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorTarget, "Head", "FieldDressing"] call TBMod_medical_fnc_getIVTime
 *
 * Public: No
 */

//params ["_medic", "_patient", "_bodypart", "_bandage"];


private _inFacility = [ACE_player] call EFUNC(medical,isInMedicalFacility);
private _inVehicle = [ACE_player] call EFUNC(medical,isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

12;