#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (GVAR(pause)) exitWith {};

private _state = STATE_Completed;
{
    _state = GVAR(states) getVariable [_x, STATE_Completed];
    ((_this # 0) getVariable[_x, []]) params ["_canInit", "_init", "_initServer", "_canComplete", "_completed", "_completedServer", "_canFail", "_failed", "_failedServer"];
    if !(_state in [STATE_Completed, STATE_Failed]) then
    {
        if (_state isEqualTo STATE_NotInitialised) then
        {
            _state = [[_state, STATE_Initialised], [_canInit, _init, _initServer]] call FUNC(execute);
        };

        if (_state isEqualTo STATE_Initialised) then
        {
            _state = [[_state, STATE_Failed], [_canFail, _failed, _failedServer]] call FUNC(execute);
        };

        // Dont complete if failed at the same time
        if (_state isEqualTo STATE_Initialised) then
        {
            [[_state, STATE_Completed], [_canComplete, _completed, _completedServer]] call FUNC(execute);
        };
    };
}
forEach (allVariables GVAR(states));
