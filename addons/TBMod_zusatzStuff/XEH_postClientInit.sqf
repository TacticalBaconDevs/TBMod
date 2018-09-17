/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: shukari
*/
if !(call TB_fnc_isTBMission) exitWith {};

// CORE FUNCTIONS
[] spawn 
{
    waitUntil {!isNil "BIS_fnc_init" && !isNil "TB_mission_tpw_civ"};
    
    TB_fnc_tpw_core = {
        if (!isNil "tpw_core_active" && {tpw_core_active}) exitWith {};
        
        tpw_core_active = true;
        private _core = [
            ["c_man", "c_man", "RDS", "lop_tak_civ_man", "lop_afr_civ_man", "c_man"],
            [],
            5,
            22
        ] spawn compile preprocessFileLineNumbers "\TBMod_zusatzStuff\tpw\tpw_core.sqf";
    };
    
    if (TB_mission_tpw_civ) then {
        call TB_fnc_tpw_core;
        
        tpw_civ_active = true;
        [
            10/*1800*/,   // delay (sec) until civ spawning starts
            300,    // radius (m) around player to check for house and spawn civs
            6,      // how many waypoints to assign each civ
            2,      // how many houses per civ. 0 = ambient civs disabled
            4,      // maximum number of civilian casualties that can be inflicted by squad
            50,     // maximum number of total civilian casualties
            0,      // what to do if casualty threshold exceeded (0 -nothing, 1 - popup message, 2 - end mission)
            20,     // maximum number of civs to spawn regardless of tpw_civ_density
            5,      // civilian interaction radius. Civs closer than this to other civs will stop and talk (15 - default, 0 - no interaction).
            1,      // civilians will not be spawned during combat. 0 = civilians continue to spawn during combat
            [],     // civilians with these strings in their classnames will be excluded
            ""      // function or script to run when each civ is spawned. e.g. "_this call your_function", or "[_this,2] execvm 'your_script.sqf'", where _this is the civ 
        ] spawn compile preprocessFileLineNumbers "\TBMod_zusatzStuff\tpw\tpw_civs.sqf";
    };
    
    if (TB_mission_tpw_soap) then {
        call TB_fnc_tpw_core;
        
        tpw_soap_active = true;
        [
            1,      // Ambient sounds volume (0-2)
            1,      // Music volume (0-2)
            1,      // Azan volume (0-2)
            1,      // House fx volume (0-2)
            1,      // Screams volume (0-2)
            0,      // Number of user supplied music files in @TPW_MODS\music. 0 = no user music
            0,      // Number of user supplied sound files in @TPW_MODS\sounds. 0 = no user sounds
            0,      // Region specific sounds. 0 = autodetect, 1 = Greek, 2 = Mideast, 3 = Fijian, 4 = French, 5 = Russian, 6 = Polyglot
            6,      // 0 = no traffic sounds, 20 = very loud
            1       // Chainsaw volume (0-2)    
        ] spawn compile preprocessFileLineNumbers "\TBMod_zusatzStuff\tpw\tpw_soap.sqf";
    };
};