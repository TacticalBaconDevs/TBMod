/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
    FNC: TBMod_medical_fnc_calcTreatmentTime
*/
params ["_this", ["_timeOrCode", 4, [0, {}]], ["_manuellDiff", 0]]; // WRAPPER PARAMS
params ["_medic", "_patient", "_bodypart", "_bandage"];

private _inFacility = [_patient] call ace_medical_treatment_fnc_isInMedicalFacility;
private _inVehicle = [_patient] call ace_medical_treatment_fnc_isInMedicalVehicle;
private _isSani = [_medic, 1] call ace_medical_treatment_fnc_isMedic;
private _isArzt = [_medic, 2] call ace_medical_treatment_fnc_isMedic;

private _inputTime = if (_timeOrCode isEqualType {}) then {_this call _timeOrCode} else {_timeOrCode};
private _coef = TBMOD_medical_coef_global + _manuellDiff;

private _selfTreat = _medic == _patient;
if (_selfTreat) then {_coef = _coef + 0.3}; // Selber dauert immer 30% länger

if (_isSani) then {_coef = _coef - 0.1};    // Sani: 10% Boost
if (_inVehicle) then {_coef = _coef - 0.1}; // MedicFahrzeug: 10% Boost

if (_isArzt) then {_coef = _coef - 0.3};    // Arzt: 30% Boost
if (_inFacility) then {_coef = _coef - 0.3};// MedicGebäude: 30% Boost

private _time = (_inputTime * (_coef max 0.1)) max 1;

["Treatmenttime -> InputTime: %1, FinalTime: %2, Self: %3, GlobalCoef: %4, FinalCoef: %5 [Sa:%6|Ar:%7|Veh:%8|Fac:%9]",
        _inputTime,
        _time,
        _selfTreat,
        TBMOD_medical_coef_global,
        _coef,
        _isSani,
        _isArzt,
        _inVehicle,
        _inFacility] call TBMod_main_fnc_debug;

_time
