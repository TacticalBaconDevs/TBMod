/*
    Author: Willi "shukari" Graff
*/
ace_microdagr_settingUseMils = true;

// ### RECHTE & ChatCommands
TB_lvl3 = ["76561198029318101", /* shukari */
            "76561198053478498", /* Sponst */
            "76561198040057152", /* Culli */
            "76561198047437015" /* BeLink */];
TB_lvl2 = ["76561198066861232" /* Darky */];

// Von [14.JgKp]Ben@Arms
private _grasAction = ["TB_cutGras", "Gras entfernen", "", {[] spawn {
    private _zerschneider = createVehicle ['Land_ClutterCutter_medium_F', player modeltoworld [0,2.7,0], [], 0, "can_collide"];
    deleteVehicle _zerschneider;
}}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _grasAction] call ace_interact_menu_fnc_addActionToObject;

// TB Rank up
(squadParams ACE_player) params [["_gruppenInfos", []]];
_gruppenInfos params [["_tag", ""]];

if (_tag == "TB") then
{
    ACE_player setRank "COLONEL";
    ACE_player setUnitRank "COLONEL";
    ACE_player addRating 999999;
    
    //Insignia laden
    TB_insignia_pic = "TB_Insigna_Soldat";
    [ACE_player, TB_insignia_pic] call BIS_fnc_setUnitInsignia;
};

// BriefingStühle nicht tragen lassen
{[_x, false] call ace_dragging_fnc_setCarryable} forEach (entities "Land_CampingChair_V2_F");

// BuildAbfrage
waitUntil {!isNil "TB_serverBuild"};
productVersion params ["", "", "", "_buildNumber", "", "", "", "_architecture"];

if (_buildNumber < TB_serverBuild) then
{
    private _msg = "[WICHTIG] Du benutzt kein PerformanceBuild, solltest du FPS Probleme oder Crashes haben, können wir Dir nicht helfen!";
    
    systemChat _msg;
    hint _msg;
    diag_log _msg;
    
    (format ["[WARNUNG] %1 benutzt kein PerformanceBuild!", profileName]) remoteExecCall ["systemChat"];
};

if (_architecture != "x64") then
{
    private _msg = "[WICHTIG] Du benutzt ein 32bit Arma3, bitte überprüfe das!";
    
    systemChat _msg;
    hint _msg;
    diag_log _msg;
    
    (format ["[WARNUNG] %1 benutzt ein 32bit Arma3!", profileName]) remoteExecCall ["systemChat"];
};

// ZeusFix
{ 
    private _zeus = getAssignedCuratorUnit _x; 
    
    if (!isNull _zeus && {player == _zeus} && {isNull (getAssignedCuratorLogic _zeus)}) then {
        [{(getMarkerPos "respawn") distance player < 2}, {
            params ["_dir", "_pos"];
            {
                {deleteVehicle _x} forEach (_pos nearObjects [_x, 5]);
            } forEach ["CAManBase","GroundWeaponHolder","WeaponHolderSimulated"];
            
            player setDir _dir;
            player setPos _pos;
        }, [getDir player, getPos player]] call CBA_fnc_waitUntilAndExecute;
        forceRespawn player;
    };
} forEach allCurators;

// Entschärf Fix
["ACE_DefuseObject", 0, ["ACE_Defuse"]] call ace_interact_menu_fnc_removeActionFromClass;
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
    4 
] call ace_interact_menu_fnc_createAction, true] call ace_interact_menu_fnc_addActionToClass;
