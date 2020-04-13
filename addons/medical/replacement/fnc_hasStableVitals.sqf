#include "\z\ace\addons\medical_status\script_component.hpp"
/*
 * Author: Ruthberg
 * Check if a unit has stable vitals (required to become conscious)
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * Has stable vitals <BOOL>
 *
 * Example:
 * [player] call ace_medical_status_fnc_hasStableVitals
 *
 * Public: No
 */
// ORIGINAL: https://github.com/acemod/ACE3/blob/master/addons/medical_status/functions/fnc_hasStableVitals.sqf

params ["_unit"];

if (GET_BLOOD_VOLUME(_unit) < BLOOD_VOLUME_CLASS_3_HEMORRHAGE) exitWith { false }; // BLOOD_VOLUME_CLASS_2_HEMORRHAGE -> BLOOD_VOLUME_CLASS_3_HEMORRHAGE
if IN_CRDC_ARRST(_unit) exitWith { false };

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
private _bloodLoss = GET_BLOOD_LOSS(_unit);
if (_bloodLoss > (BLOOD_LOSS_KNOCK_OUT_THRESHOLD * _cardiacOutput) / 2) exitWith { false };

private _bloodPressure = GET_BLOOD_PRESSURE(_unit);
_bloodPressure params ["_bloodPressureL", "_bloodPressureH"];
if (_bloodPressureL < 50 || {_bloodPressureH < 60}) exitWith { false };

private _heartRate = GET_HEART_RATE(_unit);
if (_heartRate < 40) exitWith { false };

true
