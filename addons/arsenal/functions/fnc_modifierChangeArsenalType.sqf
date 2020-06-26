#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", "_arsenalType"];
_args params ["_target", "_player", "_params", "_actionData"];

_actionData set [1, format ["Zu ArsenalType '%1' wechseln", _arsenalType]];
