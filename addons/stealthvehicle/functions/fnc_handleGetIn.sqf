#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_vehicle", "_role", "_unit", "_turret"]; 

if (!local _unit) exitWith {};

if (_vehicle getVariable [QGVAR(activateStealth), false]) then 
{
    _unit setCaptive true;
};
