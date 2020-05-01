#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    0 - kein DEBUG
    1 - diag_log
    2 - + systemChat
    3 - + hint
*/
private _lvl = GVAR(debug_lvl);

#ifdef DEBUG_MODE_FULL
    if (_lvl == 0) then {_lvl = 2};
#endif

if (_lvl <= 0) exitWith {};

private _text = format ["[DEBUG] %1", if (_this isEqualType []) then {format _this} else {_this}];

if (_lvl >= 1) then {diag_log _text};
if (_lvl >= 2) then {systemChat _text};
if (_lvl >= 3) then {hintSilent _text};
