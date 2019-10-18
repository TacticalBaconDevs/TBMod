/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_ctrlGroup", "_value"];

if !(_value isEqualType []) exitWith {};

(_ctrlGroup controlsGroupCtrl 100) lbSetCursel (_value # 0);

true
