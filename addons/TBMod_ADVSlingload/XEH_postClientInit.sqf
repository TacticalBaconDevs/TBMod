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
        
        [_this select 0, 0, ["ACE_MainActions"], _getaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 0, ["ACE_MainActions"], _storeaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 0, ["ACE_MainActions"], _cutaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 1, ["ACE_SelfActions"], _cutaction] call ace_interact_menu_fnc_addActionToObject;
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


private _addActions = {
        if (0 == {((player actionParams _x) select 0) isEqualTo "Drop Rope"} count (actionIDs player)) then {
            player addAction ["Drop Rope", {call TB_fnc_dropRope;}, nil, 0.3, false, false, "" , "!isNull (player getVariable ['TB_Rope_helper', objNull])"]; 
        };
    };
    
    call _addActions;
    player addEventHandler ["Respawn", _addActions];