/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

_actionData set [1, getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName")];
