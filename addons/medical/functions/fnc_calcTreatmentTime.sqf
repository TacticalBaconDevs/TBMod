#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
    FNC: TBMod_medical_fnc_calcTreatmentTime
*/
params ["_this", ["_timeOrCode", 4, [0, ""]], ["_manuellDiff", 0]]; // WRAPPER PARAMS
params ["_medic", "_patient", "_bodypart", "_bandage"];

private _inFacility = [_patient] call ace_medical_treatment_fnc_isInMedicalFacility;
private _inVehicle = [_patient] call ace_medical_treatment_fnc_isInMedicalVehicle;
private _isSani = [_medic, 1] call ace_medical_treatment_fnc_isMedic;
private _isArzt = [_medic, 2] call ace_medical_treatment_fnc_isMedic;

private _inputTime = if (_timeOrCode isEqualType "") then {_this call (missionNameSpace getVariable _timeOrCode)} else {_timeOrCode};
if (_timeOrCode isEqualTo "ace_medical_treatment_fnc_getHealTime") then
{
    _inputTime = _inputTime * 2;
    TRACE_1("komplett heilung muss lange dauern",_inputTime);
};

private _coef = GVAR(coef_global) + _manuellDiff;

private _selfTreat = _medic == _patient;
if (_selfTreat) then {_coef = _coef + GVAR(selfTreatMalus)};
if (_selfTreat && _timeOrCode isEqualTo "ace_medical_treatment_fnc_getStitchTime") then
{
    _coef = _coef + GVAR(selfTreatMalus);
    _inputTime = _inputTime * 2;
    TRACE_2("extrem lange beim Eigenen nähen",_inputTime,_coef);
};


if (_isSani) then {_coef = _coef - ([GVAR(saniBoost), GVAR(saniBoost) / 2] select _selfTreat)};
if (_inVehicle) then {_coef = _coef - GVAR(vehicleBoost)};
if (_isArzt) then {_coef = _coef - ([GVAR(arztBoost), GVAR(arztBoost) / 2] select _selfTreat)};
if (_inFacility) then {_coef = _coef - GVAR(facilityBoost)};

private _time = (_inputTime * (_coef max 0.1)) max 1;

["Treatmenttime -> InputTime: %1, FinalTime: %2, Self: %3, GlobalCoef: %4, FinalCoef: %5 [Sa:%6|Ar:%7|Veh:%8|Fac:%9]",
        _inputTime,
        _time,
        _selfTreat,
        GVAR(coef_global),
        _coef,
        _isSani,
        _isArzt,
        _inVehicle,
        _inFacility] call EFUNC(main,debug);

_time
