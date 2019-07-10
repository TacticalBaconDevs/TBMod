#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Add Attach Action to vehicle

    Arguments:
    0: Target <OBJECT>

    Return Value:
    None
*/
params ["_target"];

_target addAction [
    "Lastenseil anbringen",
    {[_this select 0, ACE_player getVariable ['TB_Rope_helper', objNull]] call FUNC(attach)},
    [],
    1.5,
    true,
    true,
    "",
    "alive _target && !isNull (ACE_player getVariable ['TB_Rope_helper', objNull])",
    10,
    false,
    "",
    ""
];
