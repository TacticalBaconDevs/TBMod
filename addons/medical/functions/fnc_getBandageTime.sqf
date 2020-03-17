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
 * [player, cursorTarget, "Head", "FieldDressing"] call TBMod_medical_fnc_getBandageTime
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodypart", "_bandage"];

private _inFacility = [ACE_player] call EFUNC(medical,isInMedicalFacility);
private _inVehicle = [ACE_player] call EFUNC(medical,isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith { ERROR_1("invalid partIndex - %1",_this); 0 };

private _targetWound = [_patient, _bandage, _partIndex] call FUNC(findMostEffectiveWound);
_targetWound params ["_wound", "_woundIndex", "_effectiveness"];
TRACE_3("findMostEffectiveWound",_wound,_woundIndex,_effectiveness);

// Everything is patched up on this body part already
if (_wound isEqualTo EMPTY_WOUND) exitWith {0};

_wound params ["_classID", "", "_amountOf", "_bloodloss", "_damage"];
private _category = (_classID % 10);

// Base bandage time is based on wound size and remaining percentage
private _bandageTime = [2, 3, 4] select _category; //4,6,8

// Scale bandage time based on amount left and effectiveness (less time if only a little wound left)
// Basic bandage treatment will have a very high effectiveness and can be ignored
if (GVAR(advancedBandages) != 0) then {
    _bandageTime = _bandageTime * linearConversion [0, _effectiveness, _amountOf, 0.666, 1, true];
};

// Medics are more practised at applying bandages

if (_isSani) then {
    _bandageTime = _bandageTime - 1;
};
if (_isArzt) then {
    _bandageTime = _bandageTime - 1;
};

// Bandaging yourself requires more work
if (_medic == _patient) then {
    _bandageTime = _bandageTime + 1; //2
};

// Nobody can bandage instantly

["Treatmenttime -> Out: %1, Sani: %2, Arzt: %2", _bandageTime, _isSani, _isArzt] call TBMod_main_debug;


_bandageTime max 1