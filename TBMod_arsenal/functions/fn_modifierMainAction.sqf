/*
	Author: Willi "shukari" Graff
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

private _rolle = _player getVariable ["TB_rolle", ""];
private _condition = (_rolle != "") && ((getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType')) == _player getVariable ['TB_arsenalType', '']);
_actionData set [1, ["TB-Arsenal", [_rolle] call TB_fnc_getRollenName] select _condition];
