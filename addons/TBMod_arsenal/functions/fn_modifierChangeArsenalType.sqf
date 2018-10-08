/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
params ["_args", "_arsenalType"];
_args params ["_target", "_player", "_params", "_actionData"];

_actionData set [1, format ["Zu ArsenalType '%1' wechseln", _arsenalType]];
