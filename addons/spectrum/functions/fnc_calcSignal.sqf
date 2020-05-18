#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_sender"];

private _min = missionNamespace getVariable ["#EM_SMin", -60];
private _max = missionNamespace getVariable ["#EM_SMax", 0];

private _relDir = abs ((((getPos ACE_player) vectorFromTo (getPos _sender)) call CBA_fnc_vectDir) - ((getCameraViewDirection ACE_player) call CBA_fnc_vectDir));
_relDir = ([linearConversion [0, GVAR(cone), _relDir, 1, 0, true]] call FUNC(conversion)) max ([linearConversion [360, 360 - GVAR(cone), _relDir, 1, 0, true]] call FUNC(conversion));

private _dist = [linearConversion [5, GVAR(range), _sender distance ACE_player, 1, 0, true]] call FUNC(conversion);

private _visi = [[ACE_player, "VIEW", _sender] checkVisibility [eyePos ACE_player, AGLToASL (unitAimPosition _sender)]] call FUNC(conversion);

private _value = if (_relDir <= 0 || _dist <= 0) then {0} else {(_relDir + _dist) * (_visi max 0.5)};

["calcSignal: %1 = (%2 + %3) * %4", _value, _relDir, _dist, _visi max 0.5] call EFUNC(main,debug);
((linearConversion [0, 2, _value, _min, _max, true]) max _min) min _max;
