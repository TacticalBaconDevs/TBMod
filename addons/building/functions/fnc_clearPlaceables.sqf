#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target"];

private _bbr = boundingBoxReal _target;
private _range = (((abs (((_bbr # 1) # 1) - ((_bbr # 0) # 1))) / 2) max ((abs (((_bbr # 1) # 0) - ((_bbr # 0) # 0))) / 2)) min 9;
_range = (_range - 1) max 5;

[
    _range * 2, // TODO: Zeit pro Gegenstand einstellbar
    [_target],
    {
        (_this select 0) params ["_target"];

        deleteVehicle _target;
    },
    {},
    "Räumen",
    {
        (_this select 0) params ["_target"];
        ACE_player distance _target < 5
    },
    ["isnotdead", "isnotinside", "isnothandcuffed", "isnotsurrendering", "isnotswimming", "isnotonladder", "isnotunconscious", "isnotrefueling", "isnotescorting", "isnotdragging", "isnotsitting"]
] call ace_common_fnc_progressBar;
