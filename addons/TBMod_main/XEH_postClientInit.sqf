/*
    Author: Willi "shukari" Graff
*/
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
        {(_this select 0) call TB_fnc_addAttachAction}, 
        true, 
        [], 
        true
    ] call CBA_fnc_addClassEventHandler;
}
forEach ["Car", "Helicopter", "Ship", "Tank", "Motorcycle", "Plane", "Thing"];

if !(call TB_fnc_isTBMission) exitWith {};

enableEnvironment [false, true];
enableSaving [false, false];

["CBA_XEH_loadingScreenEnded", {
    params ["_loadingScreen"];
    diag_log format ["CBA_XEH_loadingScreenEnded: %1", _loadingScreen];
    //CBA_XEH_expectedLoadingScreens
}] call CBA_fnc_addEventHandler;

["CBA_loadingScreenDone", {
    [] call TB_fnc_doorBreach;
    [] call TB_fnc_recoilSystem;
    [] spawn TB_fnc_crashHelferClient;
    [] spawn TB_fnc_shortcuts;
    [] call TB_fnc_chatCommands;
    [] call TB_fnc_extremMedicMode;
    [] call TB_fnc_schauspieler;
    [] spawn TB_fnc_miscStuff;
}] call CBA_fnc_addEventHandler;
