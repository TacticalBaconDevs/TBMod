#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// ace_microdagr_settingUseMils = true;


// ### Reload geschreie verhindern
UVO_main_reloadBuffer = 9e30;


// ### Gras entfernen - Von [14.JgKp]Ben@Arms
private _grasAction = ["TB_cutGras", "Gras entfernen", "", {
    private _zerschneider = createVehicle ["Land_ClutterCutter_medium_F", ACE_player modelToWorld [0, 2.7, 0], [], 0, "CAN_COLLIDE"];
    [{deleteVehicle _this}, _zerschneider, 2] call CBA_fnc_waitAndExecute;
}, {true}] call ace_interact_menu_fnc_createAction;
[ACE_player, 1, ["ACE_SelfActions", "ACE_Equipment"], _grasAction] call ace_interact_menu_fnc_addActionToObject;


// ### TB Rank up
(squadParams ACE_player) params [["_gruppenInfos", []]];
_gruppenInfos params [["_tag", ""]];

if (_tag == "TB") then
{
    ACE_player setRank "COLONEL";
    ACE_player setUnitRank "COLONEL";
    ACE_player addRating 999999;

    // Insignia laden
    [ACE_player, "TB_Insigna_Soldat"] call BIS_fnc_setUnitInsignia;
};


// ### BriefingStühle nicht tragen lassen
{
    {[_x, false] call ace_dragging_fnc_setCarryable} forEach (entities (configName _x));
}
forEach (configProperties [configFile >> "CfgVehicles", "isClass _x && {getNumber (_x >> 'acex_sitting_canSit') == 1}", true]);


// BuildAbfrage
//waitUntil {!isNil "TB_serverBuild"}; // wenn dann CBA_fnc_waitUntilAndExecute
productVersion params ["", "", "", "_buildNumber", "", "", "", "_architecture"];

//if (_buildNumber < TB_serverBuild) then
//{
//    private _msg = "[WICHTIG] Du benutzt kein PerformanceBuild, solltest du FPS Probleme oder Crashes haben, können wir Dir nicht helfen!";
//
//    systemChat _msg;
//    hint _msg;
//    diag_log _msg;
//
//    (format ["[WARNUNG] %1 benutzt kein PerformanceBuild!", profileName]) remoteExecCall ["systemChat"];
//};

if (_architecture != "x64") then
{
    private _msg = "[WICHTIG] Du benutzt ein 32bit Arma3, bitte überprüfe das!";

    systemChat _msg;
    hint _msg;
    diag_log _msg;

    (format ["[WARNUNG] %1 benutzt ein 32bit Arma3!", profileName]) remoteExecCall ["systemChat"];
};


// ### ZeusFix
{
    private _zeus = getAssignedCuratorUnit _x;

    if (!isNull _zeus && {player == _zeus}) then
    {
        // TFAR Timeout setzen
        if (TFAR_pluginTimeout < 15) then {
            ["TFAR_pluginTimeout", 15, 0, "client", true] call CBA_settings_fnc_set;
        };

        if (isNull (getAssignedCuratorLogic _zeus)) then
        {
            // TODO: das scheint nicht zu gehen, killedEH?!?
            [{(getMarkerPos "respawn") distance player < 2}, {
                params ["_dir", "_pos"];
                {
                    {deleteVehicle _x} forEach (_pos nearObjects [_x, 5]);
                }
                forEach ["CAManBase", "GroundWeaponHolder", "WeaponHolderSimulated"];

                player setDir _dir;
                player setPos _pos;
            }, [getDir player, getPos player]] call CBA_fnc_waitUntilAndExecute;

            systemChat "[TBMod_Main] ForceRespawn, weil noch kein Zeus zugeordnet!";
            forceRespawn player;
            setPlayerRespawnTime 1; // fix for Hardsettings
        };
    };
}
forEach allCurators;


// ### Entschärf Fix
["ACE_DefuseObject"] call ace_interact_menu_fnc_compileMenu;
["ACE_DefuseObject", 0, ["ACE_Defuse"]] call ace_interact_menu_fnc_removeActionFromClass;
["ACE_DefuseObject_Large"] call ace_interact_menu_fnc_compileMenu;
["ACE_DefuseObject_Large", 0, ["ACE_Defuse"]] call ace_interact_menu_fnc_removeActionFromClass;
["ACE_DefuseObject", 0, [], [
    "ACE_Defuse",
    "Entschärfen",
    "\z\ace\addons\explosives\UI\Defuse_ca.paa",
    {[_player, _target] call ace_explosives_fnc_startDefuse},
    {[_player, _target] call ace_explosives_fnc_canDefuse},
    nil,
    nil,
    nil,
    3
] call ace_interact_menu_fnc_createAction, true] call ace_interact_menu_fnc_addActionToClass;


// ### TFAR Funkanim
if (isNil "TB_funkAnim") then {TB_funkAnim = true};
if (isNil "TB_funkAnim_on") then {TB_funkAnim_on = false};
["TB_funkAnim", "OnTangent", {
    params ["_unit", "_activRadio", "_isLR", "_additional", "_buttonDown"];

    if (!TB_funkAnim) exitWith {};
    if (!(TB_funkAnim_on && !_buttonDown) && (ace_common_isReloading || cameraView == "GUNNER")) exitWith {};

    if (_buttonDown) then
    {
        TB_funkAnim_on = true;
        player playActionNow (["tb_radioSR", "tb_radioLR"] select _isLR);
    }
    else
    {
        TB_funkAnim_on = false;
        player playActionNow "tb_radioStop";
    };
}, player] call TFAR_fnc_addEventHandler;


// ### informAdminsAndZeus
[
    "TB_informAdminsAndZeus",
    {
        if ((call BIS_fnc_admin) != 0 || !isNull (getAssignedCuratorLogic player) || (getPlayerUID player) in (call TB_lvl3)) then
        {
            private _msg = if (_this isEqualType []) then {format _this} else {_this};
            systemChat _msg;
            diag_log format ["[ADMINLOG] %1", _msg];
        };
    }
] call CBA_fnc_addEventHandler;


// ### FPS Infos
[{
    if (GVAR(fpsMonitor_client)) then
    {
        player setVariable ["TB_clientFPS", floor diag_fps, true];
    }
    else
    {
        if ((player getVariable ["TB_clientFPS", -1]) != -1) then {player setVariable ["TB_clientFPS", nil, true]};
    };

    if (GVAR(fpsMonitor_zeus) && {player in (call BIS_fnc_listCuratorPlayers)} && {!isNull (findDisplay 312)}) then
    {
        if (isNil "TB_fpsMonitor_id") then
        {
            TB_fpsMonitor_id = addMissionEventHandler ["Draw3D", {
                {
                    if ((positionCameraToWorld [0, 0, 0]) distance2D _x < 1000) then
                    {
                        private _playerFPS = _x getVariable ["TB_clientFPS", -1];

                        if (_playerFPS > 0) then
                        {
                            drawIcon3D
                            [
                                "",
                                [1, 0, 0, [0.6, 0.9] select (_playerFPS < 20)],
                                getPosVisual _x,
                                1,
                                2,
                                0,
                                format ["FPS: %1", _playerFPS],
                                0,
                                [0.05, 0.08] select (_playerFPS < 20),
                                "PuristaMedium",
                                "center"
                            ];
                        };
                    };
                }
                forEach allPlayers;

                /*{
                    if ((positionCameraToWorld [0, 0, 0]) distance2D _x < 1000) then
                    {
                        if ((units _x) findIf {isPlayer _x} == -1) then
                        {
                            drawIcon3D
                            [
                                "",
                                [1, 0, 0, [0.6, 0.9] select (_playerFPS < 20)],
                                getPosVisual _x,
                                1,
                                2,
                                0,
                                format ["FPS: %1", _playerFPS],
                                0,
                                [0.05, 0.08] select (_playerFPS < 20),
                                "PuristaMedium",
                                "center"
                            ];
                        };
                    };
                }
                forEach allGroups;*/
            }];
        };
    }
    else
    {
        if (!isNil "TB_fpsMonitor_id") then {removeMissionEventHandler ["Draw3D", TB_fpsMonitor_id]; TB_fpsMonitor_id = nil;};
    };
}, 5] call CBA_fnc_addPerFrameHandler;


// ### block Codeexec
ZEN_disableCodeExecution = true; //getPlayerUID player in (call TB_lvl3);


// ### dance for me
[
    ACE_player,
    1,
    ["ACE_SelfActions"],
    [
        "Time2Dance",
        "Time2Dance",
        "",
        {[player, [selectRandom ["Acts_Dance_01", "Acts_Dance_02"], ""] select (animationState player == "Acts_Dance_01" || animationState player == "Acts_Dance_02")] remoteExecCall ["switchMove"]},
        {(player nearEntities ["Man", 10]) findIf {isPlayer _x && _x getVariable [QGVAR(danceTime), false]} != -1 || (animationState player == "Acts_Dance_01" || animationState player == "Acts_Dance_02")}
    ] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;


// ### Vehicle in Vehicle
GVAR(vehicleTransport) = ["Car", "Tank", "Motorcycle", "Helicopter", "Plane", "Ship", "Air", "ReammoBox_F", "Cargo_base_F", "Land_CargoBox_V1_F", "StaticWeapon", "PlasticCase_01_base_F", "ACE_Wheel",
        "ACE_Track", QEGVAR(nachschub,CanisterFuel)];
[
    "Car",
    "init",
    {
        private _car = _this # 0;

        if (isClass (configFile >> "CfgVehicles" >> typeOf _car >> "VehicleTransport" >> "Carrier")) then
        {
            private _action = ["VehicleTransport", "VehicleTransport", "", {}, {vehicleCargoEnabled _target}] call ace_interact_menu_fnc_createAction;
            [_car, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

            // Aufladen
            private _action = [
                "loadIn",
                "Aufladen",
                "",
                {},
                {},
                {
                    params ["_target", "_player", "_params"];

                    private _actions = [];
                    {
                        if (alive _x) then
                        {
                            private _action = [
                                format ["vehicle_%1", random 999999],
                                format ["%1%2 (%3m)", [_x] call FUNC(displayName), if (alive (driver _x)) then {format [" (%1)", [driver _x] call ace_common_fnc_getName]} else {""}, round (_target distance _x)],
                                "",
                                {
                                    params ["_target", "_player", "_params"];
                                    _target setVehicleCargo _params;
                                },
                                {
                                    params ["_target", "_player", "_params"];
                                    (_target canVehicleCargo _params) # 0
                                },
                                {},
                                _x
                            ] call ace_interact_menu_fnc_createAction;

                            _actions pushBack [_action, [], _target];
                        };
                    }
                    forEach (nearestObjects [_target, GVAR(vehicleTransport), 10]);

                    _actions
                },
                [],
                {[0, 0, 0]},
                5,
                [false, true, false, true, false],
                {}
            ] call ace_interact_menu_fnc_createAction;
            [_car, 0, ["ACE_MainActions", "VehicleTransport"], _action] call ace_interact_menu_fnc_addActionToObject;

            // Entladen
            _action = [
                "loadOff",
                "Abladen",
                "",
                {_target setVehicleCargo objNull},
                {(getVehicleCargo _target) isNotEqualTo []},
                {
                    params ["_target", "_player", "_params"];

                    private _actions = [];
                    {
                        private _action = [
                            format ["vehicleOff_%1", random 999999],
                            format ["%1%2", [_x] call FUNC(displayName), if (alive (driver _x)) then {format [" (%1)", [driver _x] call ace_common_fnc_getName]} else {""}],
                            "",
                            {
                                params ["_target", "_player", "_params"];
                                TRACE_2("vehicleOff_setVehicleCargo",_params,_this);
                                objNull setVehicleCargo _params;
                            },
                            {true},
                            {},
                            _x
                        ] call ace_interact_menu_fnc_createAction;

                        _actions pushBack [_action, [], _target];
                    }
                    forEach (getVehicleCargo _target);

                    _actions
                },
                [],
                {[0, 0, 0]},
                5,
                [false, true, false, false, false],
                {}
            ] call ace_interact_menu_fnc_createAction;
            [_car, 0, ["ACE_MainActions", "VehicleTransport"], _action] call ace_interact_menu_fnc_addActionToObject;
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;


// ### ACE Fehler überschreiben
[missionNamespace, "ACE_setCustomAimCoef", "ACE_advanced_fatigue", {
    private _unit = ACE_player;
    private _fatigue = _unit getVariable ["ACE_advanced_fatigue_aimFatigue", 0];

    switch (stance _unit) do {
        case "PRONE": {
            (1.0 + _fatigue ^ 2 * 0.1) * ACE_advanced_fatigue_swayFactor
        };
        case "CROUCH": {
            (1.0 + _fatigue ^ 2 * 2.0) * ACE_advanced_fatigue_swayFactor
        };
        default {
            (1.5 + _fatigue ^ 2 * 3.0) * ACE_advanced_fatigue_swayFactor
        };
    };
}] call ace_common_fnc_arithmeticSetSource;
