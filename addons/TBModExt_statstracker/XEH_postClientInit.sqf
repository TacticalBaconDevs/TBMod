/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};


"TBModExt_Statistics" callExtension missionName;

//Setup all Events to be send to Extension
["ace_firedPlayer", {"TBMODExt_Statistics" callExtension ["Player", [text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedPlayerNonLocal", {"TBMODExt_Statistics" callExtension ["Player", [text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", {"TBMODExt_Statistics" callExtension ["Player", [text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;

["ace_firedPlayerVehicle", {"TBMODExt_Statistics" callExtension ["Vehicle", [text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedPlayerVehicleNonLocal", {"TBMODExt_Statistics" callExtension ["Vehicle", [text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayerVehicle", {"TBMODExt_Statistics" callExtension ["Vehicle", [text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3)]]}] call CBA_fnc_addEventHandler;

//Sent reporter to all players
//is player already available
TB_ReporterClientMedical = player;
publicVariable "TB_ReporterClientMedical";

// Setup reviever
["TB_MedicalReport", {"TBMODExt_Statistics" callExtension ["Medical", [text name (_this select 0),text getPlayerUID (_this select 0), text name (_this select 1),text getPlayerUID (_this select 1),text (_this select 2),text (_this select 3)]]}] call CBA_fnc_addEventHandler;


//Send script
[0,{
    if (isNil "TB_ReporterMedical") then
    {
        TB_ReporterMedical = ["ace_treatmentSucceded", {
            if (!isNil "TB_ReporterClientMedical") then {
                ["TB_MedicalReport", _this, TB_ReporterClientMedical] call CBA_fnc_targetEvent;
             };
        }] call CBA_fnc_addEventHandler;
    };
}] remoteExec ["call", 0, true];