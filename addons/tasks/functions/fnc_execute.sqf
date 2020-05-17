#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_states", "_args"];
_states params ["_curState", "_newState"];
_args params [["_can", {false}], ["_client", {}], ["_server", {}]];

if (call _can) then
{
    call _server;
    [[], _client] remoteExecCall ["call"];

    _curState = _newState;
    GVAR(states) setVariable [_x, _curState, true];
};

_curState
