/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
//if !(call TB_fnc_isTBMission) exitWith {};

[
    "Helicopter", 
    "init", 
    {
        private _getaction = ["Get Rope", "Get Rope", "", {player setVariable ['TB_Rope_source', _target]}, {isNull (player getVariable ['TB_Rope_source', objNull])}] call ace_interact_menu_fnc_createAction;
        private _storeaction = ["Store Rope", "Store Rope", "", {player setVariable ['TB_Rope_source', objNull]}, {!isNull (player getVariable ['TB_Rope_source', objNull])}] call ace_interact_menu_fnc_createAction;
        private _cutaction = ["Cut Rope", "Cut Rope", "", {_target call TB_fnc_detach}, {!((ropes _target) isEqualTo [])}] call ace_interact_menu_fnc_createAction;
        
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
