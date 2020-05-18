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
private _bbr = boundingBoxReal _obj;
private _attachPos = (abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2 + 1;

private _pos = AGLtoASL (player modelToWorld [0, _attachPos, 0]);
_obj setPosASL _pos;

[{(_this # 0) distance2D (_this # 1) < 5}, {[ACE_player, _this # 0] call ace_dragging_fnc_startCarry}, [_obj, _pos]] call CBA_fnc_waitUntilAndExecute;
