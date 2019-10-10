/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_ctrlGroup"];

[
    lbCurSel (_ctrlGroup controlsGroupCtrl 100),
    (_ctrlGroup controlsGroupCtrl 100) lbData (lbCurSel (_ctrlGroup controlsGroupCtrl 100))
]
