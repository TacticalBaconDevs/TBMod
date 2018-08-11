/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
//if !(call TB_fnc_isTBMission) exitWith {};

[
    "Helicopter", 
    "init", 
    {
        private _getaction = ["Get Rope", "Get Rope", "", {[_target, false] call TB_fnc_pickupRope;}, {isNull (player getVariable ['TB_Rope_helper', objNull])}] call ace_interact_menu_fnc_createAction;
        private _storeaction = ["Store Rope", "Store Rope", "", {[_target] call TB_fnc_putBackRope;}, {!isNull (player getVariable ['TB_Rope_helper', objNull])}] call ace_interact_menu_fnc_createAction;
        private _cutaction = ["Cut Rope", "Cut Rope", "", {_target call TB_fnc_detach}, {!isNull (_target getVariable ['TB_Rope_attachedVehicle', objNull])}] call ace_interact_menu_fnc_createAction;
        private _dropaction = ["Drop Rope", "Drop Rope", "", {_target call TB_fnc_dropRopefromChopper}, {!isTouchingGround _target}] call ace_interact_menu_fnc_createAction;
        
        [_this select 0, 0, ["ACE_MainActions"], _getaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 0, ["ACE_MainActions"], _storeaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 0, ["ACE_MainActions"], _cutaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 1, ["ACE_SelfActions"], _cutaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 1, ["ACE_SelfActions"], _dropaction] call ace_interact_menu_fnc_addActionToObject;
    }, 
    true, 
    [], 
    true
] call CBA_fnc_addClassEventHandler;

{
    [
        _x, 
        "init", 
        {[_this select 0] call TB_fnc_addAttachAction}, 
        true, 
        [], 
        true
    ] call CBA_fnc_addClassEventHandler;
}
forEach ["Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship", "Thing"];

private _dropaction = ["Drop Rope", "Drop Rope", "", {call TB_fnc_dropRope;}, {!isNull (player getVariable ['TB_Rope_helper', objNull])}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _dropaction] call ace_interact_menu_fnc_addActionToObject;

TB_Rope_PickupAction = ["Pickup Rope", "Pickup Rope", "", {[_target, true] call TB_fnc_pickupRope;}, {!(_target getVariable ["TB_Rope_is_carry", false])}, {}, [], [0, 0, 0], 2] call ace_interact_menu_fnc_createAction;

["TB_Rope_addPickupAction", {[_this select 0, 0, [], TB_Rope_PickupAction] call ace_interact_menu_fnc_addActionToObject}] call CBA_fnc_addEventHandler;
["TB_Rope_attachto", {[(_this select 0),  (_this select 1), [0, 0, -1]] ropeAttachTo (_this select 2)}] call CBA_fnc_addEventHandler;
