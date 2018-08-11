/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Drops currently hold Rope
    
    Arguments:

    Return Value:
    None
*/

private _helper =  player getVariable ["TB_Rope_helper", objNull];
private _helpergravity = _helper getVariable ['TB_Rope_helpergravity', objNull];
//Sanity Checks
if (isNull _helper || isNull _helpergravity) exitWith{systemChat format ["ERROR(dropRope): _helper %1  _helpergravity %2 ", _helper, _helpergravity]};

player setVariable ['TB_Rope_helper', nil];

detach _helpergravity;

_helper setVariable ["TB_Rope_is_carry", false, true];
