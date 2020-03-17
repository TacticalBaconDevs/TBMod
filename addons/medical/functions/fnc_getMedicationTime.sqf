#include "\z\ace\addons\medical_treatment\script_component.hpp"

/*

TBMod_medical_fnc_getIVTime
*/
private _inFacility = [ACE_player] call EFUNC(medical,isInMedicalFacility);
private _inVehicle = [ACE_player] call EFUNC(medical,isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

5;