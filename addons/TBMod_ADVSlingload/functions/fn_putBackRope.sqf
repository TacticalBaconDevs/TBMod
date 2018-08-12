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

private _helper = player getVariable ['TB_Rope_helper', objNull];
private _helpergravity = _helper getVariable ['TB_Rope_helpergravity', objNull];
private _rope = _helper getVariable ['TB_Rope_rope', objNull];
//Sanity Checks
if (isNull _helper || isNull _rope) exitWith { systemChat format ["ERROR(putBackRope): _helper %1 _rope %2", _helper, _rope]};
if (!alive _helper || !alive _rope) exitWith { hint "Was zerstört ist sollte nicht benutzt werden"; systemChat format ["DEBUG(putBackRope): _helper %1 _rope %3", alive _helper, alive _rope]};

player setVariable ['TB_Rope_helper', nil, true];

detach _helper;
ropeDestroy _rope;
deleteVehicle _helper;
