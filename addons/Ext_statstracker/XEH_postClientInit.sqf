/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
TB_StatstrackerStarted = false;

0 spawn {
    waitUntil{systemChat "Statstracker not yet activated"; uiSleep 30; TB_StatstrackerStarted};
};

["startST", {

    if (TB_StatstrackerStarted) exitwith {systemChat "Statstracker already started!"};
    TB_StatstrackerStarted = true;
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


    ["TB_MedicalReport", {"TBMODExt_Statistics" callExtension ["Medical", [text name (_this select 0),text getPlayerUID (_this select 0), text name (_this select 1),text getPlayerUID (_this select 1),text (_this select 2),text (_this select 3), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""]), text groupid group(_this select 1), text ((_this select 1) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;
    ["TB_CPSReport", {"TBMODExt_Statistics" callExtension ["CPS", [text (_this select 0), (_this select 1)]]}] call CBA_fnc_addEventHandler;
    ["TB_FPSReport", {"TBMODExt_Statistics" callExtension ["FPS", [text (_this select 0), (_this select 1)]]}] call CBA_fnc_addEventHandler;
    //ace_killed maybe after new update
    ["TB_Kill", {"TBMODExt_Statistics" callExtension ["Kill", [text name (_this select 0),text getPlayerUID (_this select 0),text name (_this select 1),text getPlayerUID (_this select 1), text groupid group(_this select 0), text ((_this select 0) getVariable ["TB_Rolle",""])]]}] call CBA_fnc_addEventHandler;
    
    ["ace_unconscious", {
        params ["_unit","_state"];
        if (_state) then {
            _unit setVariable ["TB_LastDown", CBA_missiontime, true];
        } else {
            "TBMODExt_Statistics" callExtension ["DownTime", [text name _unit, text getPlayerUID _unit, round (CBA_missiontime - (_unit getVariable ["TB_LastDown",0]))]];
        };

    }] call CBA_fnc_addEventHandler;
    
    //Sent reporter to all players
    
    TB_ReporterClient = (missionNamespace getVariable ["TB_ReporterClient", []]);
    TB_ReporterClient pushBackUnique player;
    TB_ReporterClient = TB_ReporterClient - [objNull];
    publicVariable "TB_ReporterClient";
    (format ["[TBMod_statstracker] %1 is using the Statstracker", TB_ReporterClient]) remoteExecCall ["systemChat"];

    //Send script
    [0,{
        if (isNil "TB_ReporterMedical") then
        {
            TB_ReporterMedical = ["ace_treatmentSucceded", {
                if (!isNil "TB_ReporterClient") then {
                    ["TB_MedicalReport", _this, TB_ReporterClient] call CBA_fnc_targetEvent;
                };
            }] call CBA_fnc_addEventHandler;
        };
        /*
        if (isNil "TB_ReporterKill") then
        {
            TB_ReporterKill = 
            ["CAManBase", 
            "Killed", 
            {["TB_Kill", [(_this # 0) getVariable ["ace_medical_lastDamageSource", objNull], _this # 0]] call CBA_fnc_globalEvent;}, 
            true, [], true
            ] call CBA_fnc_addClassEventHandler;
        };*/
        
    }] remoteExec ["call", 0, true];

    private _hcs = entities "HeadlessClient_F";
    _hcs pushBack 2;

    [0,{
        if (isNil "TB_ReporterCPS") then
        {
            TB_cps = 0;
            TB_ReporterCPS = 0 spawn {
                waitUntil {TB_cps = TB_cps + 1; false};
            };
            TB_ReporterCPS2 = 0 spawn {
                waitUntil {
                    uisleep 30;
                    if (!isNil "TB_ReporterClient") then {
                        ["TB_CPSReport", [profileName,round (TB_CPS/30)], TB_ReporterClient] call CBA_fnc_targetEvent;
                    };
                    TB_cps = 0;
                    false
                };
            };
        };
    }] remoteExec ["spawn", _hcs];

    [0,{
        if (isNil "TB_ReporterFPS") then
        {
            TB_ReporterFPS = 0 spawn {
                waitUntil {
                    uisleep 30;
                    if (!isNil "TB_ReporterClient") then {
                        ["TB_FPSReport", [profileName,round diag_fps], TB_ReporterClient] call CBA_fnc_targetEvent;
                    };
                    false
                }
            };
        };
    }] remoteExec ["spawn", _hcs];
}, "all"] call CBA_fnc_registerChatCommand;
