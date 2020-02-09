#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_vehicle", "_source", "_damage", "_instigator"];

if (!local _vehicle) exitWith {};

_vehicle = vehicle _vehicle;

if ((_vehicle getVariable [QGVAR(activateStealth), false]) && 
     (_vehicle getVariable [QGVAR(deactivateStealthOnHit), false])) then 
{
    _vehicle setVariable [QGVAR(activateStealth), nil, true];
    {
        [_x, false] remoteExecCall ["setCaptive", _x];
    } forEach (crew _vehicle);
};
