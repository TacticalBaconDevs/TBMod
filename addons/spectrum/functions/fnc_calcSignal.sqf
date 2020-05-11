#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_sender"];
private _value = -100;

private _relDir = abs ((((getPos ACE_player) vectorFromTo (getPos _sender)) call CBA_fnc_vectDir) - ((getCameraViewDirection ACE_player) call CBA_fnc_vectDir));
_relDir = (linearConversion [0, GVAR(cone), _relDir, 1, 0, true]) max (linearConversion [360, 360 - GVAR(cone), _relDir, 1, 0, true]);

private _dist = linearConversion [0, GVAR(range), _sender distance ACE_player, 1, 0, true];

private _visi = linearConversion [0, 2, ([ACE_player, "VIEW"] checkVisibility [eyePos ACE_player, eyepos _sender]) + ([ACE_player, "VIEW"] checkVisibility [eyePos ACE_player, AGLToASL (unitAimPosition _sender)]), 0, 1, true];

_value = if (_relDir <= 0) then {0} else {_relDir + _dist + _visi};
linearConversion [1, 2, _value, _min, -30, false];