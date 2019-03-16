/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};


"TBModExt_Statstracker" callExtension missionName;

//Setup all Events to be send to Extension
["ace_firedPlayer", {"TBMODExt_Statistics" callExtension ["sendQueue", [text "Player",text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedPlayerNonLocal", {"TBMODExt_Statistics" callExtension ["sendQueue", [text "Player",text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", {"TBMODExt_Statistics" callExtension ["sendQueue", [text "Player",text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;

["ace_firedPlayerVehicle", {"TBMODExt_Statistics" callExtension ["sendQueue", [text "Vehicle",text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedPlayerVehicleNonLocal", {"TBMODExt_Statistics" callExtension ["sendQueue", [text "Vehicle",text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayerVehicle", {"TBMODExt_Statistics" callExtension ["sendQueue", [text "Vehicle",text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;