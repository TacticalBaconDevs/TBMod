/*
    Author: Willi "shukari" Graff
*/
params ["_target", "_item"];

if (_target getVariable ['TBMod_Nachschub_kisten', -1] != -1) then
{
    _target setVariable ['TBMod_Nachschub_kisten', (_target getVariable ['TBMod_Nachschub_kisten', 0]) - 1, true];
};

private _obj = createVehicle [_item, [0, 0, 0], [], 0, 'NONE'];
private _bbr = boundingBoxReal _obj;
private _attachPos = (abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2 + 1;

private _pos = player modelToWorld [0, _attachPos, 0];
_obj setPos _pos;

waitUntil {_obj distance2D _pos < 5};

[ACE_player, _obj] call ace_dragging_fnc_startCarry;
