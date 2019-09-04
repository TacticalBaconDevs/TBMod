#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
ace_microdagr_settingUseMils = true;


// ### Gras entfernen - Von [14.JgKp]Ben@Arms
private _grasAction = ["TB_cutGras", "Gras entfernen", "", {
    private _zerschneider = createVehicle ["Land_ClutterCutter_medium_F", ACE_player modelToWorld [0, 2.7, 0], [], 0, "CAN_COLLIDE"];

    [_zerschneider] spawn {
        params ["_zerschneider"];
        uiSleep 2;
        deleteVehicle _zerschneider;
    };
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
//waitUntil {!isNil "TB_serverBuild"};
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


// ### AddZeus
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


// ### Piloten Spielerschaden updaten
["CBA_SettingChanged", {
    params ["_setting", "_value"];

    if (_setting == "ace_medical_playerDamageThreshold") then
    {
        TB_origin_playerDamageThreshold = ace_medical_playerDamageThreshold;
        if (ACE_player getVariable ["TB_rolle", ""] == "pilot") then {ace_medical_playerDamageThreshold = TB_origin_playerDamageThreshold + 10};
    };
}] call CBA_fnc_addEventHandler;


// ### FPS Infos
[{
    if (TB_fpsMonitor_client) then
    {
        player setVariable ["TB_clientFPS", floor diag_fps, true];
    }
    else
    {
        if ((player getVariable ["TB_clientFPS", -1]) != -1) then {player setVariable ["TB_clientFPS", nil, true]};
    };

    if (TB_fpsMonitor_zeus) then
    {
        if (player in (call BIS_fnc_listCuratorPlayers) && {!isNull (findDisplay 312)}) then
        {
            if (isNil "TB_fpsMonitor_id") then
            {
                TB_fpsMonitor_id = addMissionEventHandler ["Draw3D", {
                    {
                        if ((positionCameraToWorld [0, 0, 0]) distance2D _x < 1000) then
                        {
                            private _playerFPS = _x getVariable ["TB_clientFPS", -1];

                            drawIcon3D
                            [
                                "",
                                [1, 0, 0, [0.5, 0.7] select (_playerFPS < 20)],
                                ASLToAGL getPosASL _x,
                                1,
                                2,
                                0,
                                format ["FPS: %1", _playerFPS],
                                0,
                                [0.03, 0.05] select (_playerFPS < 20),
                                "PuristaMedium",
                                "center"
                            ];
                        };
                    }
                    forEach allPlayers;
                }];
            };
        }
        else
        {
            if (!isNil "TB_fpsMonitor_id") then {removeMissionEventHandler ["Draw3D", TB_fpsMonitor_id]; TB_fpsMonitor_id = nil;};
        };
    }
    else
    {
        if (!isNil "TB_fpsMonitor_id") then {removeMissionEventHandler ["Draw3D", TB_fpsMonitor_id]; TB_fpsMonitor_id = nil;};
    };
}, 5] call CBA_fnc_addPerFrameHandler;


// ### CPR/HLW Stuff
["adv_aceCPR_evh_CPR_local", {
    params ["_caller", "_target"];
    if ([_target] call adv_aceCPR_fnc_isResurrectable) then {_target setVariable [QGVAR(cprBoost), (_target getVariable [QGVAR(cprBoost), 0]) + 5]};
}] call CBA_fnc_addEventHandler;


// ### block Codeexec
Ares_Allow_Zeus_To_Execute_Code = false; //getPlayerUID player in (call TB_lvl3);

// ### dance for me
[
    player,
    1,
    ["ACE_SelfActions"],
    [
        "Time2Dance",
        "Time2Dance",
        "",
        {(player nearEntities ["Man", 10]) findIf {isPlayer _x && _x getVariable ["TB_danceTime", false]} != -1},
        {[player, [selectRandom ["Acts_Dance_01", "Acts_Dance_02"], ""] select (animationState player == "Acts_Dance_01" || animationState player == "Acts_Dance_02")] remoteExecCall ["switchMove"]}
    ] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
