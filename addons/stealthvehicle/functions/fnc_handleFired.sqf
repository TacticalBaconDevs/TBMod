#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_vehicle", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if (!local _vehicle) exitWith {};

if (_vehicle getVariable [QGVAR(activateStealth), false]) then 
{
    _vehicle setVariable [QGVAR(activateStealth), false, true];
    {
        _x setCaptive false;
    } forEach (crew _vehicle);
};