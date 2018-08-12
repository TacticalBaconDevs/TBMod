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
private _idPFH = _helper getVariable ['TB_Rope_idPFH', -1];
//Sanity Checks
if (isNull _helper || isNull _helpergravity) exitWith{systemChat format ["ERROR(dropRope): _helper %1  _helpergravity %2 ", _helper, _helpergravity]};

player setVariable ['TB_Rope_helper', nil];

if (_idPFH==-1) then 
    {hint "Why was no PFH assigned"}
else 
{
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
_helper setVariable ['TB_Rope_idPFH', nil];

detach _helpergravity;

_helper setVariable ["TB_Rope_is_carry", false, true];
