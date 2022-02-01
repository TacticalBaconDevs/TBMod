#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    ["_logic", objNull, [objNull]],
    ["_units", [], [[]]],
    ["_activated", true, [true]]
];

if (!isServer) then {"moduleShowHide muss auf dem Server ausgeführt werden!" remoteExecCall ["systemChat"]};

{
    _veh = vehicle _x;
    {
        _x hideobjectglobal !_activated;
        _x enablesimulationglobal _activated;
    }
    forEach ((crew _veh) + (units _x) + [_veh]);
}
forEach _units;

true
