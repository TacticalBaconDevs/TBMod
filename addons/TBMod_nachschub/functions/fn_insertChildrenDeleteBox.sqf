﻿/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target", "_player", "_params"];

private _items = (_target nearEntities [["ReammoBox_F", "ACE_Wheel", "ACE_Track"], 5]) select {!(_x isKindOf "TB_supply_base" || _x isKindOf "TB_arsenal_base")};

// Add children to this action
private _actions = [];
{
    private _action = [str _x, format ["%1 (%2m)", [_x] call TB_fnc_displayName, round (_target distance2D _x)], "", {deleteVehicle (_this select 2)}, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
}
forEach _items;



_actions
