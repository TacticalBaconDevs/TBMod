#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
[
    "Helicopter",
    "init",
    {
        private _heli = _this # 0;
        {
            _x params ["_types", "_action"];

            {
                [_heli, _x, [["ACE_MainActions", "ACE_SelfActions"] # _x], _action] call ace_interact_menu_fnc_addActionToObject;
            }
            forEach _types;
        }
        forEach [
            [
                [0],
                [
                    "pickup",
                    "Lastenseil nehmen",
                    "",
                    {[_target, false] call FUNC(pickupRope)},
                    {isNull (ACE_player getVariable [QGVAR(ropeHelper), objNull])}
                ] call ace_interact_menu_fnc_createAction
            ],
            [
                [0],
                [
                    "putBack",
                    "Lastenseil zurück packen",
                    "",
                    {[_target] call FUNC(putBackRope)},
                    {!isNull (ACE_player getVariable [QGVAR(ropeHelper), objNull])}
                ] call ace_interact_menu_fnc_createAction
            ],
            [
                [0, 1],
                [
                    "detach",
                    "Lastenseil abtrennen",
                    "",
                    {_target call FUNC(detach)},
                    {(ropes _target) isNotEqualTo []}
                ] call ace_interact_menu_fnc_createAction
            ],
            [
                [1],
                [
                    "drop",
                    "Lastenseil fallenlassen",
                    "",
                    {_target call FUNC(dropRopefromChopper)},
                    {!isTouchingGround _target && (driver _target) == ACE_Player}
                ] call ace_interact_menu_fnc_createAction
            ]
        ];

        _heli addEventHandler ["RopeAttach", {
            params ["_object1", "_rope", "_object2"];

            if (GVAR(enableVanillaSlingload)) exitWith {};
            if (!local _object1) exitWith {};

            if (typeOf _object2 != QGVAR(ropeInvisibleObject)) then
            {
                private _source = _rope getVariable [QGVAR(ropeSource), objNull];
                if (isNull _source) then
                {
                    if (((vehicle ACE_player) getVariable ["ace_fastroping_deploymentstage", 0]) == 0) then
                    {
                        // Überprüfung ob Slingload ausgefahren
                        ropeDestroy _rope;
                        systemChat "Vanilla Slingload wurde ausgeschalten";
                    }

                };
            };
        }];
    },
    true,
    ["ParachuteBase"],
    true
] call CBA_fnc_addClassEventHandler;

{
    [
        _x,
        "init",
        {[_this # 0] call FUNC(addAttachAction)},
        true,
        [],
        true
    ] call CBA_fnc_addClassEventHandler;
}
forEach ["Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship", "Thing"];

private _dropaction = [
    "drop2",
    "Lastenseil fallenlassen",
    "",
    {call FUNC(dropRope)},
    {!isNull (ACE_player getVariable [QGVAR(ropeHelper), objNull])}
] call ace_interact_menu_fnc_createAction;
[ACE_player, 1, ["ACE_SelfActions"], _dropaction] call ace_interact_menu_fnc_addActionToObject;

GVAR(pickupAction) = [
    "pickup2",
    "Lastenseil aufnehmen",
    "",
    {[_target, true] call FUNC(pickupRope)},
    {(!(_target getVariable [QGVAR(isCarry), false])) && (isNull (ACE_player getVariable [QGVAR(ropeHelper), objNull]))},
    {},
    [],
    [0, 0, 0.2],
    2
] call ace_interact_menu_fnc_createAction;
[QGVAR(addPickupActionEvent), {[_this # 0, 0, [], GVAR(pickupAction)] call ace_interact_menu_fnc_addActionToObject}] call CBA_fnc_addEventHandler;
