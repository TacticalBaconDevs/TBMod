#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_vehicle", "_source", "_damage", "_instigator"];

if (!local _vehicle) exitWith {};

if ((_vehicle getVariable [QGVAR(activateStealth), false]) && 
     (_vehicle getVariable [QGVAR(deactivateStealthOnHit), false])) then 
{
    _vehicle setVariable [QGVAR(activateStealth), false, true];
    {
        _x setCaptive false;
    } forEach (crew _vehicle);
};
