/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};


"TBModExt_Statistics" callExtension missionName;

//Setup all Events to be send to Extension    
["ace_firedPlayer", {"TBMODExt_Statistics" callExtension ["Player", [text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;
["ace_firedPlayerNonLocal", {"TBMODExt_Statistics" callExtension ["Player", [text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", {"TBMODExt_Statistics" callExtension ["Player", [text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;

["ace_firedPlayerVehicle", {"TBMODExt_Statistics" callExtension ["Vehicle", [text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;
["ace_firedPlayerVehicleNonLocal", {"TBMODExt_Statistics" callExtension ["Vehicle", [text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayerVehicle", {
    "TBMODExt_Statistics" callExtension ["Vehicle", [text typeOf (_this select 0), text name (_this select 0),text getPlayerUID (_this select 0),text (_this select 1),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]
}] call CBA_fnc_addEventHandler;

//Sent reporter to all players
//is player already available
0 spawn {
    waitUntil {!isNull player && isPlayer player};
    TB_ReporterClientMedical = player;
    publicVariable "TB_ReporterClientMedical";
    (format ["[TBMod_statstracker] %1 is using the Statstracker", TB_ReporterClientMedical]) remoteExecCall ["systemChat"];
};

0 spawn {
    while {TRUE} do {
        {
            _pos = getPos _x;
            "TBMODExt_Statistics" callExtension ["Position", [text name _x,text getPlayerUID _x,text str round (_pos select 0), text str round (_pos select 1), text groupid group _X, text (_x getVariable ["TB_Rolle",""])]];
        } forEach allPlayers - entities "HeadlessClient_F";;
        uiSleep 1;
    }
};

//0 spawn {
//    for "_x" from 0 to 10240 step 1 do {
//        for "_y" from 0 to 10240 step 1 do {
//            s = str getTerrainHeightASL [_x, _y];
//            systemchat ((str [_x,_y]) + s);
//        };
//    };
//};

// Setup reviever
["TB_MedicalReport", {"TBMODExt_Statistics" callExtension ["Medical", [text name (_this select 0),text getPlayerUID (_this select 0), text name (_this select 1),text getPlayerUID (_this select 1),text (_this select 2),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""]), text groupid group(_this select 1), text ((_this select 1) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;


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