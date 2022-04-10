#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_mode", "_args"];

// Set returnCode to a variable
if (_mode isEqualTo "init") exitWith 
{
    _args param ["_returnCode"];
    private _returnCodeId = QGVAR(returnCode) +"_"+ floor random 999999;
    missionNameSpace setVariable [_returnCodeId, _returnCode];
    _returnCodeId
};

// execute the returnCode and clear the variable
if (_mode isEqualTo "exec") exitWith 
{
    _args param ["_returnCodeId", "_remoteReturn"];

    // get the value and clear it
    private _returnCode = missionNameSpace getVariable [_returnCodeId, {}];
    missionNameSpace setVariable [_returnCodeId, nil];
    
    _remoteReturn call _returnCode;
};
