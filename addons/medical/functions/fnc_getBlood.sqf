#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
    FNC: TBMod_medical_fnc_calcTreatmentTime
*/
params ["_medic", "_patient"];

private _blood = _patient getVariable ["ace_medical_bloodVolume", 6];
private _take = [3.5, 1] select (alive _patient);
_patient setVariable ["ace_medical_bloodVolume", (_blood - _take) max 0, true];
_medic addItem "ACE_bloodIV_250";
