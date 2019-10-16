/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_ctrlGroup"];
_ctrlGroup = _ctrlGroup controlsGroupCtrl 100;

[
    lbCurSel _ctrlGroup,
    _ctrlGroup lbData (lbCurSel _ctrlGroup)
]
