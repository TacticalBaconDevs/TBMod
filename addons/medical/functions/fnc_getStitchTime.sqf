#include "\z\ace\addons\medical_treatment\script_component.hpp"

/*
 * Author: mharis001
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call TBMod_medical_fnc_getStitchTime
 *
 * Public: No
 */

params ["", "_patient"];

private _inFacility = [ACE_player] call EFUNC(medical,isInMedicalFacility);
private _inVehicle = [ACE_player] call EFUNC(medical,isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

count (_patient call FUNC(getStitchableWounds)) * WOUND_STITCH_TIME