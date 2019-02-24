/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", -1, [0]]];

private _inFacility = [ACE_player] call ace_medical_fnc_isInMedicalFacility;
private _inVehicle = [ACE_player] call ace_medical_fnc_isInMedicalVehicle;
private _influence = ([0, 0.1] select _inVehicle) max ([0, 0.3] select _inFacility);

private _result = _input * (0.05 max (TB_medical_coef - _influence) min 2);
["Orig: %1 | Now: %2 | Coef: %3 | Influ: %4 | InFac: %5 | InVeh: %5", _input, _result, TB_medical_coef, _influence, _inFacility, _inVehicle] call TB_fnc_debug;

_result;
