/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
params [
    "_obj",
    "_item"
];

_obj setVariable ["TB_building_addInfos", [_item], true];

// Actions
private _pickupAction = [
    "pickupAction_" + _item,
    localize "STR_PLACE_PickUpAction",
    "",
    {
        params ["_target", "_player", "_argumente"];
        _argumente params ["_item"];
        
        deleteVehicle _target;
        _player addItem _item;
    },
    {true},
    nil,
    [_item],
    nil,
    4
] call ace_interact_menu_fnc_createAction;

[
    _obj,
    0,
    ["ACE_MainActions"],
    _pickupAction
] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", [0, -2] select isDedicated, true];
