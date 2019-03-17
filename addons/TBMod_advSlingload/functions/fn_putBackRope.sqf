/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Returns Lastenseil to Chopper

    Arguments:
    0: Target <OBJECT>

    Return Value:
    None
*/
params ["_target"];

private _helper = ACE_player getVariable ["TB_Rope_helper", objNull];
private _helpergravity = _helper getVariable ["TB_Rope_helpergravity", objNull];
private _rope = _helper getVariable ["TB_Rope_rope", objNull];

//Sanity Checks
if (isNull _helper || isNull _rope) exitWith {systemChat format ["ERROR(putBackRope): _helper %1 _rope %2", _helper, _rope]};
if (!alive _helper || !alive _rope) exitWith {systemChat format ["ERROR(putBackRope): Wie konnten die Items zerstört werden _helper %1 _rope %3", alive _helper, alive _rope]};

private _idPFH = ACE_player getVariable ["TB_Rope_idPFH", -1];
if (_idPFH==-1) then
{
    systemChat format ["ERROR(dropRope): no idPFH assigned _helper %1", _helper];
}
else
{
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

ACE_player setVariable ["TB_Rope_idPFH", nil];
ACE_player setVariable ["TB_Rope_helper", nil, true];

detach _helper;
ropeDestroy _rope;
deleteVehicle _helper;
