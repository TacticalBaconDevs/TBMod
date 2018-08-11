/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Returns Rope to Chopper
    
    Arguments:
    0: Target <OBJECT>
    Return Value:
    None
*/
params["_target"];

_helper = player getVariable ['TB_Rope_helper', objNull];
_rope = _helper getVariable ['TB_Rope_rope', objNull];
player setVariable ['TB_Rope_helper', nil, true];
detach _helper;
ropeDestroy _rope;
deleteVehicle _helper;
