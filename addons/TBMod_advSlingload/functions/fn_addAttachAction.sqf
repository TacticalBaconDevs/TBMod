/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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
    {[_this select 0, ACE_player getVariable ['TB_Rope_helper', objNull]] call TB_fnc_attach},
    [],
    1.5,
    true,
    true,
    "",
    "!isNull (ACE_player getVariable ['TB_Rope_helper', objNull])",
    10,
    false,
    "",
    ""
];
