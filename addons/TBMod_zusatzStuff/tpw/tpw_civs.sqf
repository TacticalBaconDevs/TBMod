/* 
TPW CIVS - Ambient civilians
Author: tpw 
Date: 20180324
Version: 1.59
Requires: CBA A3, tpw_core.sqf
Compatibility: SP, MP client

Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.     

To use: 
1 - Save this script into your mission directory as eg tpw_civs.sqf
2 - Call it with 0 = [5,150,15,5,4,50,0,10,15,1,[],"spawnscript"] execvm "tpw_civs.sqf"; where 5 = start delay,150 = radius, 15 = number of waypoints, 5 = how many houses per civilian, 4 = maximum squad inflicted civ casualties, 50 = max total casualties, 0 = what to do if casualty thresholds exceeded (0 - nothing, 1 - popup message, 2 - end mission), 10 = maximum possible civs regardless of density, 15 = civilian interaction radius. Civs closer than this to other civs will stop and talk (0 - no interaction), 1 = no civilians spawned during combat (0 = civs spawned during combat), [] = civilians with these strings in their classnames will be excluded,["C_MAN","C_MAN","CUP_C","CAF_AG","CAF_AG","C_MAN"] = strings to select civilians in the order [Mediterranean, Oceania, Europe, Mideast, Africa, Asia], where C_MAN is the BIS default civilian, which will also be used if the string can't be found. spawnscript = function or script to run when each civ is spawned. eg "_this call your_function", or "[_this,2] execvm 'your_script.sqf'" where _this is the civ.

THIS SCRIPT WON'T RUN ON DEDICATED SERVERS
*/

if (isDedicated) exitWith {};
if (count _this < 12) exitwith {hint "TPW CIVS incorrect/no config, exiting."};
WaitUntil {!isNull FindDisplay 46};
WaitUntil {!isnil "tpw_core_sunangle"};

// READ IN VARIABLES
tpw_civ_version = "1.59"; // Version string
tpw_civ_sleep = _this select 0;
tpw_civ_radius = _this select 1;
tpw_civ_waypoints = _this select 2;
tpw_civ_density = _this select 3;
tpw_civ_maxsquadcas  = _this select 4;
tpw_civ_maxallcas  = _this select 5;
tpw_civ_casdisplay = _this select 6;
tpw_civ_maxciv = _this select 7;
tpw_civ_interact = _this select 8;
tpw_civ_nocombatspawn = _this select 9;
tpw_civ_blacklist = _this select 10;
tpw_civ_init = _this select 11;

// VARIABLES
tpw_civ_oldpos = [0,0,0];
tpw_civ_civarray = []; // array holding spawned civs
tpw_civ_houses = []; // array holding civilian houses near player
tpw_civ_civnum = 0; // number of civs to spawn
tpw_civ_debug = false; // Debugging
tpw_civ_allcas = 0; // all civ casualities 
tpw_civ_squadcas = 0; // civ casualities caused by squad
tpw_civ_active = true; // global activate/deactivate
tpw_civ_minstoptime = 6; // minimum time civs will interact
tpw_civ_maxstoptime = 10; // maximum time civs will interact
tpw_civ_resettime = tpw_civ_maxstoptime * 3; // time before civ can interact again
tpw_civ_stoprange = tpw_civ_maxstoptime - tpw_civ_minstoptime; 
tpw_civ_rain = false;
tpw_civ_gunfire = false;
if (tpw_civ_maxciv > 100) then {tpw_civ_maxciv = 100}; // hardcoded upper limit to civs to prevent using all groups
tpw_civ_clothes = [] call tpw_core_fnc_clothes;
tpw_civ_late = false;

tpw_civ_civanims = [
"HubBriefing_think",
"HubBriefing_lookaround1",
"HubBriefing_lookaround2",
"HubBriefing_pointleft",
"HubBriefing_pointright",
"HubBriefing_scratch",
"HubBriefing_stretch",
"Acts_CivilTalking_1",
"Acts_CivilTalking_2",
"Acts_CivilListening_1",
"Acts_CivilListening_2",
"Acts_CivilIdle_1",
"Acts_CivilIdle_2"
];
// DELAY
sleep tpw_civ_sleep;

// CREATE AI CENTRES SO SPAWNED UNITS KNOW WHO'S AN ENEMY
_centerC = createCenter civilian;

// TEST
tpw_civ_fnc_test = 
    {
    private _unit = _this select 0;
    private _num = _this select 1;
    hint format ["%1 %2",_unit, _num];
    };

// IF CIV IS SHOT BY PLAYER
tpw_civ_fnc_casualty = 
    {
    private ["_civ","_shooter"];
    _civ = _this select 0;
    _shooter = _this select 1;
    if (_civ getvariable ["tpw_civ_cas",0] == 0) then
        {
        _civ setvariable ["tpw_civ_cas",1];
        tpw_civ_allcas = tpw_civ_allcas + 1;
        if (_shooter in (units (group player))) then 
            {
            tpw_civ_squadcas = tpw_civ_squadcas + 1;
            };
        };
    if (tpw_civ_allcas > tpw_civ_maxallcas || tpw_civ_squadcas > tpw_civ_maxsquadcas) then 
        {
        switch tpw_civ_casdisplay do
            {
            case 1: 
                {
                hint format ["Warning: significant civilian casualties!\n %1 total casualties.\n%2 attributed to your squad.",tpw_civ_allcas,tpw_civ_squadcas];
                };
            case 2:
                {
                [nil,false,nil] call BIS_fnc_endMission;
                };
            };    
        };
    };

// SPAWN CIV INTO EMPTY GROUP
tpw_civ_fnc_civspawn =
    {
    private ["_civtype","_civ","_spawnpos","_i","_ct","_sqname","_house","_wp","_wppos"];
    
    // Only bother if no nearby gunfire
    if (tpw_civ_gunfire) exitwith {};
    
    // Pick a random house for civ to spawn into
    _spawnpos = getpos (tpw_civ_houses select (floor (random (count tpw_civ_houses))));
    _civtype = tpw_core_civs select (floor (random (count tpw_core_civs)));

    //Spawn civ into empty group
    _sqname = creategroup [civilian,true];
    _civ = _sqname createUnit [_civtype,_spawnpos, [], 0, "FORM"]; 
    _civ switchmove "";
    _civ enablesimulation false;
    _civ setskill 0;
    _civ disableAI "TARGET";
    _civ disableAI "FSM";
    _civ disableAI "AUTOTARGET";
    _civ disableAI "AIMINGERROR";
    _civ disableAI "SUPPRESSION"; 
    _civ disableAI "CHECKVISIBLE"; 
    _civ disableAI "COVER"; 
    _civ disableAI "AUTOCOMBAT";
    removeallweapons _civ; 
    _civ setAnimSpeedCoef 0.8 + random 0.2;
     _civ setSpeaker "NoVoice";
    _move = ["Acts_CivilTalking_1","Acts_CivilTalking_2","Acts_CivilListening_1","Acts_CivilListening_2","Acts_CivilIdle_1","Acts_CivilIdle_2"]select (floor random 6);
    _civ setvariable ["tpw_civ_anim",_move];
    
    //Add it to the array of civs for this player
    tpw_civ_civarray pushBack _civ;
    
    // Random uniform if using BIS civs
    if (["c_man",str _civtype] call BIS_fnc_inString) then
        {
        _civ forceAddUniform (tpw_civ_clothes select  (floor random count tpw_civ_clothes));
        removeheadgear _civ;
        if (random 1 > 0.5) then 
            {
            _civ execVM "\A3\characters_f\civil\scripts\randomize_civ1.sqf";// force headgear
            };
        };
    removebackpack _civ;        
    
    //Mark it as owned by this player
    _civ setvariable ["tpw_civ_owner", [player],true];

    //Add killed/hit eventhandlers
    _civ addeventhandler ["Hit",{_this call tpw_civ_fnc_casualty}];
    _civ addeventhandler ["Killed",{_this call tpw_civ_fnc_casualty}];

    //Speed and behaviour
    _sqname setspeedmode "LIMITED";
    _sqname setBehaviour "CARELESS";
    
    //Assign waypoints
    for "_i" from 1 to tpw_civ_waypoints do
        {
        sleep 0.05;
        if (count tpw_civ_houses > 1) then
            {
            _house = tpw_civ_houses select (floor (random (count tpw_civ_houses)));
            _wppos = getpos _house;
            _wp =_sqname addWaypoint [_wppos,5];
            _wp setWaypointCompletionRadius 5;

            if (_i == tpw_civ_waypoints) then 
                {
                _wp setwaypointtype "CYCLE";
                } else
                {
                _wp setWaypointType "MOVE";
                };
            };
        };
        
    // User init    
    if (count tpw_civ_init > 5) then
        {
        _civ call compile tpw_civ_init;
        };    
        
    // Activate civ    
    _civ enablesimulation true;
    };
    
// SEE IF ANY CIVS OWNED BY OTHER PLAYERS ARE WITHIN RANGE, WHICH CAN BE USED INSTEAD OF SPAWNING A NEW CIV
tpw_civ_fnc_nearciv =
    {
    private ["_owner","_shareflag"];
    _shareflag = 0;
    if (isMultiplayer) then         
        {
            {
            // Live units within range
            if (_x distance vehicle player < tpw_civ_radius && alive _x) then 
                {
                _owner = _x getvariable ["tpw_civ_owner",[]];

                //Units with owners, but not this player
                if ((count _owner > 0) && !(player in _owner)) exitwith
                    {
                    _shareflag = 1;
                    _owner pushBack player; // add player as another owner of this civ
                    _x setvariable ["tpw_civ_owner",_owner,true]; // update ownership
                    tpw_civ_civarray pushBack _x; // add this civ to the array of civs for this player
                    };
                };
            } count allunits;
        };    

    //Otherwise, spawn a new civ
    if (_shareflag == 0 && {count tpw_civ_houses > 2} && {!tpw_civ_late}) then 
        {
        [] call tpw_civ_fnc_civspawn;    
        };     
    };
    
// PERIODICALLY UPDATE POOL OF ENTERABLE HOUSES NEAR PLAYER, DETERMINE MAX CIVILIAN NUMBER, DISOWN CIVS FROM DEAD PLAYERS IN MP
0 = [] spawn 
    {
    while {true} do
        {
        if (tpw_civ_oldpos distance position player > (tpw_civ_radius / 2)) then
            {
            tpw_civ_oldpos = position player;
            private ["_civarray","_deadplayer","_housestring","_uninhab","_house","_i"];
            
            // Scan for habitable houses 
            tpw_civ_houses = [tpw_civ_radius] call tpw_core_fnc_screenhouses;
            tpw_civ_civnum = floor ((count tpw_civ_houses) / tpw_civ_density);            
            if (tpw_civ_civnum > tpw_civ_maxciv) then
                    {
                    tpw_civ_civnum = tpw_civ_maxciv;
                    };
                
            // No civs if raining, gunfire or very late 
            if (tpw_civ_rain || tpw_civ_late || tpw_civ_gunfire) then 
                {
                tpw_civ_civnum = 0;
                };
                    
            
            // Check if any players have been killed and disown their civs
            if (isMultiplayer) then 
                {
                    {
                    if ((isplayer _x) && !(alive _x)) then
                        {
                        _deadplayer = _x;
                        _civarray = _x getvariable ["tpw_civarray"];
                            {
                            _x setvariable ["tpw_civ_owner",(_x getvariable "tpw_civ_owner") - [_deadplayer],true];
                            } count _civarray;
                        };
                    } count allunits;    
                };
            };    
        sleep 10.13;
        };
    };
    

// CIV INTERACTION LOOP - NEARBY CIVS WILL MOVE TOWARDS EACH OTHER AND STOP TO "TALK"
if (tpw_civ_interact > 0) then
    {
    [] spawn
        {
        while {true} do
            {
            private ["_civ","_test","_other","_i"];
            // Don't stop for a chat if raining or nearby gunfire
            if (!(tpw_civ_rain) && !(tpw_civ_gunfire)) then 
                {
                for "_i" from 0 to (count tpw_civ_civarray - 1) do
                    {
                    _civ = tpw_civ_civarray select _i;
                    _test = tpw_civ_civarray - [_civ]; // all the other civs but this one
                        
                    // Civ interact if near another civ
                    for "_i" from 0 to (count _test - 1) do    
                        {
                        _other = _test select _i;
                        if (
                        _other distance _civ < tpw_civ_interact && // another civ nearby
                        {_civ getvariable ["tpw_civ_stopped",0] == 0} && // civ is not already stopped
                        {stance _civ == "STAND"} &&  // civ is standing up
                        {stance _OTHER == "STAND"}// other civ is standing up
                        ) exitwith
                            {                        
                            _civ setvariable ["tpw_civ_stopped",1]; // unit can't be stopped again
                            
                            // Move towards other civ
                            [_civ,_other] spawn
                                {
                                private ["_civ","_other","_dir","_ct","_anim"];
                                _civ = _this select 0;
                                _other = _this select 1;
                                _ct = 0;
                                waituntil 
                                    {
                                    sleep 0.5;
                                    _ct = _ct + 1;
                                    _civ domove (position _other);
                                    (_civ distance _other < 3 || _ct > 50)
                                    };
                                _dir = [_civ,_other] call bis_fnc_dirto; // direction to nearest civ
                                _civ setdir _dir; // face nearest civ
                                _civ disableai "move"; // stop moving 
                                sleep random 2;
                                _anim = tpw_civ_civanims select (floor (random (count tpw_civ_civanims))); // talking anim
                                _civ switchmove _anim;
                                sleep tpw_civ_minstoptime;
                                _civ switchmove "";
                                };

                            _civ setvariable ["tpw_civ_restart",diag_ticktime + tpw_civ_minstoptime + random tpw_civ_stoprange]; // how long til unit moves again
                            _civ setvariable ["tpw_civ_reset",diag_ticktime + tpw_civ_resettime]; // how long until unit can be stopped again
                            };
                        };
                    
                    // If enough time has passed since stopping then move
                    if    (diag_ticktime > _civ getvariable ["tpw_civ_restart",0]) then
                        {
                        _civ enableai "move"; // start moving
                        };
                    
                    // If enough time has passed then allow stopping                
                    if    (diag_ticktime > _civ getvariable ["tpw_civ_reset",0]) then
                        {
                        _civ setvariable ["tpw_civ_stopped",0]; // unit can be stopped again
                        };    
                    };
                
                };
            sleep 5;    
            };    
        };
    };    

// MAIN LOOP - ADD AND REMOVE CIVS AS NECESSARY
while {tpw_civ_active} do 
{
    if (vehicle player == player) then
    {
        private ["_group","_civ","_i", "_owner"];

        // Too late?
        if (daytime > tpw_core_morning && daytime < tpw_core_night) then
            {
            tpw_civ_late = false;
            } else
            {
            tpw_civ_late = true;
            };
            
        // Gunfire?
        if (!(isnil "tpw_soap_nextcry") && {diag_ticktime < tpw_soap_nextcry + 60}) then
            {
            tpw_civ_gunfire = true;
            } else
            {
            tpw_civ_gunfire = false;
            };
        
        // Rain?
        if (rain > 0.2) then
            {
            tpw_civ_rain = true;
            } else
            {
            tpw_civ_rain = false;
            };    
            
        // Add civs if there are less than the calculated civilian density for the player's current location 
        if ((count tpw_civ_civarray < tpw_civ_civnum) && (count tpw_civ_houses > 0)) then
            {
            [] spawn tpw_civ_fnc_nearciv;
            };    

        // For each civ...    
        if (count tpw_civ_civarray > 0) then
            {
            for "_i" from 0 to (count tpw_civ_civarray - 1) do
                {
                _civ = tpw_civ_civarray select _i;
                
                // Remove dead civ from players array (but leave body)
                if !(alive _civ) then 
                    {
                    tpw_civ_civarray set [_i, -1];    
                    }
                    else
                    {
                    // Civs run in the rain or in battle
                    if (tpw_civ_rain || tpw_civ_gunfire) then 
                        {
                        _civ setspeedmode "NORMAL";
                        }
                    else
                        {
                        _civ setspeedmode "LIMITED";
                        };
                        
                    // Play idle anim if still
                    if (animationState _civ != (_civ getvariable "tpw_civ_anim") && {speed _civ == 0}) then
                        {
                        _civ playmove (_civ getvariable "tpw_crowd_anim");
                        };         
                        
                    // Check if civ is out of range and not visible to player. If so, disown it and remove it from players civ array    
                    if ((stance _civ == "CROUCH" || _civ distance vehicle player > tpw_civ_radius || tpw_civ_late) && {[objNull, "VIEW"] checkVisibility [eyePos player, eyepos _civ] == 0}) then
                        {
                        _owner = _civ getvariable "tpw_civ_owner";
                        _owner = _owner - [player];
                        _civ setvariable ["tpw_civ_owner",_owner,true];            
                        tpw_civ_civarray set [_i, -1];       
                        };

                    // Delete the live civ and its waypoints if it's not owned by anyone    
                    if (_civ getvariable "tpw_civ_owner" isequalto []) then
                        {
                        _group = group _civ;    
                        for "_i" from count (waypoints _group) to 1 step -1 do
                            {
                            deleteWaypoint ((waypoints _group) select _i);
                            };
                        deletevehicle _civ;
                        deletegroup _group;
                        sleep 0.1;    
                        };    
                    };  
                };

            //Update player's civ array    
            tpw_civ_civarray = tpw_civ_civarray - [-1]; 
            player setvariable ["tpw_civarray",tpw_civ_civarray,true];   
            };
    };
        
    uiSleep (random 10);    
};  

