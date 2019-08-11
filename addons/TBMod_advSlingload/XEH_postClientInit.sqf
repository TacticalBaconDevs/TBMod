#include "script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

if !(call EFUNC(main,isTBMission)) exitWith {};

[
    "Helicopter",
    "init",
    {
        private _getaction = ["Lastenseil nehmen", "Lastenseil nehmen", "", {[_target, false] call FUNC(pickupRope);}, {isNull (ACE_player getVariable ['TB_Rope_helper', objNull])}] call ace_interact_menu_fnc_createAction;
        private _storeaction = ["Lastenseil zurück packen", "Lastenseil zurück packen", "", {[_target] call FUNC(putBackRope);}, {!isNull (ACE_player getVariable ['TB_Rope_helper', objNull])}] call ace_interact_menu_fnc_createAction;
        private _cutaction = ["Lastenseil abtrennen", "Lastenseil abtrennen", "", {_target call FUNC(detach)}, {! ((ropes _target) isEqualTo [])}] call ace_interact_menu_fnc_createAction;
        private _dropaction = ["Lastenseil fallenlassen", "Lastenseil fallenlassen", "", {_target call FUNC(dropRopefromChopper)}, {!isTouchingGround _target && (driver _target) == ACE_Player}] call ace_interact_menu_fnc_createAction;

        [_this select 0, 0, ["ACE_MainActions"], _getaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 0, ["ACE_MainActions"], _storeaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 0, ["ACE_MainActions"], _cutaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 1, ["ACE_SelfActions"], _cutaction] call ace_interact_menu_fnc_addActionToObject;
        [_this select 0, 1, ["ACE_SelfActions"], _dropaction] call ace_interact_menu_fnc_addActionToObject;

        (_this select 0) addEventHandler ["RopeAttach", {
            params ["_object1", "_rope", "_object2"];
            if (TB_enableVanillaSlingload) exitWith {};
            if (!local _object1) exitWith {};

            if (typeOf _object2 != "TB_Rope_InvisibleObject") then {
                private _source = _rope getVariable ["TB_Rope_Source", objNull];
                if (isNull _source) then {
                    if (((vehicle ACE_player) getVariable ["ace_fastroping_deploymentstage", 0]) == 0) then {
                         //Überprüfung ob Slingload ausgefahren
                        ropeDestroy _rope;
                        systemChat "Vanilla Slingload wurde ausgeschalten";
                    }

                };
            };
        }];
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

{
    [
        _x,
        "init",
        {[_this select 0] call FUNC(addAttachAction)},
        true,
        [],
        true
    ] call CBA_fnc_addClassEventHandler;
}
forEach ["Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship", "Thing"];

private _dropaction = ["Lastenseil fallenlassen", "Lastenseil fallenlassen", "", {call FUNC(dropRope);}, {!isNull (ACE_player getVariable ['TB_Rope_helper', objNull])}] call ace_interact_menu_fnc_createAction;
[ACE_player, 1, ["ACE_SelfActions"], _dropaction] call ace_interact_menu_fnc_addActionToObject;

TB_Rope_PickupAction = ["Lastenseil aufnehmen", "Lastenseil aufnehmen", "", {[_target, true] call FUNC(pickupRope);}, {(!(_target getVariable ["TB_Rope_is_carry", false])) && (isNull (ACE_player getVariable ["TB_Rope_helper", objNull])) }, {}, [], [0, 0, 0.2], 2] call ace_interact_menu_fnc_createAction;

["TB_Rope_addPickupAction", {[_this select 0, 0, [], TB_Rope_PickupAction] call ace_interact_menu_fnc_addActionToObject}] call CBA_fnc_addEventHandler;
