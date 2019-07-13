#include "../script_component.hpp"
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

private _helper = ACE_player getVariable [QGVAR(ropeHelper), objNull];
private _rope = _helper getVariable [QGVAR(ropeObj), objNull];

//Sanity Checks
if (isNull _helper || isNull _rope) exitWith {systemChat format ["ERROR(putBackRope): _helper %1 _rope %2", _helper, _rope]};
if (!alive _helper || !alive _rope) exitWith {systemChat format ["ERROR(putBackRope): Wie konnten die Items zerstört werden _helper %1 _rope %3", alive _helper, alive _rope]};

private _idPFH = ACE_player getVariable [QGVAR(ropeIdPFH), -1];
if (_idPFH == -1) then
{
    ERROR_MSG_1("no idPFH assigned _helper: %1", _helper)
}
else
{
    [_idPFH] call CBA_fnc_removePerFrameHandler;
    ACE_player setVariable [QGVAR(ropeIdPFH), nil];
};

ACE_player setVariable [QGVAR(ropeHelper), nil, true];

detach _helper;
ropeDestroy _rope;
deleteVehicle _helper;
