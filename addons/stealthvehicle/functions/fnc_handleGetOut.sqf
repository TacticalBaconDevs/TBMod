#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
systemChat str ["GetOut",this];
params ["_vehicle", "_role", "_unit", "_turret"]; 
if(_vehicle getVariable [QGVAR(activateStealth), false]) then 
{
    _unit setCaptive false;
};