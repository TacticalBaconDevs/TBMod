/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Drops currently hold Rope
    
    Arguments:

    Return Value:
    None
*/

private _helper =  ACE_player getVariable ["TB_Rope_helper", objNull];
private _idPFH = ACE_player getVariable ['TB_Rope_idPFH', -1];
//Sanity Checks
if (isNull _helper) then {systemChat format ["ERROR(dropRope): _helper %1", _helper]};



if (_idPFH==-1) then 
{
	systemChat format ["ERROR(dropRope): no idPFH assigned _helper %1", _helper];
} else 
{
	systemChat format ["DEBUG(dropRope): idPFH is %1", _idPFH];
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
ACE_player setVariable ['TB_Rope_idPFH', nil];

detach _helper;

_helper setVariable ["TB_Rope_is_carry", false, true];
ACE_player setVariable ['TB_Rope_helper', nil];
