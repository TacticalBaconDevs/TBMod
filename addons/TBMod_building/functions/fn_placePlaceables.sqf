/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    "_item",
    "_obj",
    ["_attachPos", -1],
    ["_spiegeln", false]
];

ACE_player removeItem _item;

private _obj = createVehicle [_obj, [0, 0, 0], [], 0, "NONE"];

[_obj, _item] call TB_fnc_initItem;

private _specialDir = [0, 180] select _spiegeln;
_obj setDir _specialDir;

if (_attachPos == -1) then
{
    private _bbr = boundingBoxReal _obj;
    _attachPos = (abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2 + 2;
};

private _pos = player modelToWorld [0, _attachPos, 0];
_obj setPos _pos;

[_obj, true, [0, _attachPos, 0], _specialDir] remoteExec ["ace_dragging_fnc_setDraggable", [0, -2] select isDedicated, true];
[_obj, true, [0, _attachPos, 0], _specialDir] remoteExec ["ace_dragging_fnc_setCarryable", [0, -2] select isDedicated, true];
[_obj, true, [0, _attachPos, 0], _specialDir] call ace_dragging_fnc_setCarryable;

waitUntil {_obj distance2D _pos < 5};
[ACE_player, _obj] call ace_dragging_fnc_startCarry;

[_obj, _item] spawn
{
    params ["_obj", "_item"];

    waitUntil {!(ACE_player getVariable ["ace_dragging_isCarrying", false])};

    if !(typeOf _obj in ["Land_PortableLight_single_F"]) then
    {
        _obj enableSimulation false;
        [_obj, false] remoteExecCall ["enableSimulationGlobal", 2];
    };
    [_obj, true] remoteExecCall ["hideObjectGlobal", 2];

    [ACE_player, "AinvPknlMstpSnonWrflDnon_medic"] call ace_common_fnc_doAnimation;

    [[15, 2] select ((ACE_player getVariable ['TB_rolle', '']) == 'pionier' || _item in ["TB_building_item_ace_concertinawirecoil"]), [ _obj, _item], {
        (_this select 0) params ["_obj"];

        [ACE_player, "", 1] call ace_common_fnc_doAnimation;

        [_obj, false] remoteExecCall ["hideObjectGlobal", 2];

        if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};
        TB_persistent_buildings pushBack [_obj, false];
        publicVariable "TB_persistent_buildings";
    },
    {
        (_this select 0) params ["_obj", "_item"];

        [ACE_player, "", 1] call ace_common_fnc_doAnimation;

        deleteVehicle _obj;
        ACE_player addItem _item;
    }, localize "STR_PLACE_Build"] call ace_common_fnc_progressBar;
};
