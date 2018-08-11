/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Drops currently hold Rope
    
    Arguments:

    Return Value:
    None
*/

_helper =  player getVariable ["TB_Rope_helper", objNull];
if(isNull _helper) exitWith{hint "No Helper found"};
player setVariable ['TB_Rope_helper', nil];
detach _helper;
_helperpos = getPos _helper;
_helper setPos [_helperpos select 0, _helperpos select 1, 0.1];
_helper setVariable ["TB_Rope_is_carry", false, true];
