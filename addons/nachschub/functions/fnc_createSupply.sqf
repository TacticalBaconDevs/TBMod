#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target", "_item"];

if (_target getVariable ['TBMod_Nachschub_kisten', -1] != -1) then
{
    _target setVariable ['TBMod_Nachschub_kisten', (_target getVariable ['TBMod_Nachschub_kisten', 0]) - 1, true];
};

private _obj = createVehicle [_item, [0, 0, 0], [], 0, "CAN_COLLIDE"];
_obj allowDamage false;

if (ACE_player distance _target < 3) exitWith {systemChat "Du stehst zu dicht am Vorratslager!"; deleteVehicle _obj};

private _pos = AGLtoASL (ACE_player modelToWorld [0, 1.5, 0]);
_obj setPosASL _pos;

[
    {(_this # 0) distance2D (_this # 1) < 5},
    {
        (_this # 0) allowDamage true;
        [ACE_player, _this # 0] call ace_dragging_fnc_startCarry;
    },
    [_obj, _pos],
    2
] call CBA_fnc_waitUntilAndExecute;
