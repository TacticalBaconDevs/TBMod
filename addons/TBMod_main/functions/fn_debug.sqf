/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    0 - kein DEBUG
    1 - diag_log
    2 - + systemChat
    3 - + hint
*/
if (TB_debug_lvl <= 0) exitWith {};

private _text = format ["[DEBUG][%1] %2", _fnc_scriptNameParent, if (_this isEqualType []) then {format _this} else {_this}];

if (TB_debug_lvl >= 1) then {diag_log _text};
if (TB_debug_lvl >= 2) then {systemChat _text};
if (TB_debug_lvl >= 3) then {hintSilent _text};
