/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
private _text = if (_this isEqualType []) then {format _this} else {_this};
diag_log format ["[%1] %2", _fnc_scriptNameParent, _text];
