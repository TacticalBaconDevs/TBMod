/*
	Author: Willi "shukari" Graff
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

_actionData set [1, getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName")];
