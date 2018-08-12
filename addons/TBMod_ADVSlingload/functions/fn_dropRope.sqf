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
private _idPFH = _helper getVariable ['TB_Rope_idPFH', -1];
//Sanity Checks
if (isNull _helper) exitWith{systemChat format ["ERROR(dropRope): _helper %1", _helper]};

player setVariable ['TB_Rope_helper', nil];

if (_idPFH==-1) then 
    {hint "Why was no PFH assigned"}
else 
{
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
_helper setVariable ['TB_Rope_idPFH', nil];

detach _helper;

_helper setVariable ["TB_Rope_is_carry", false, true];
