/*			***		 ARMA2Alpha randomSectors1.sqf [v2.0] by SPUn - Modified by Haz ***

	syntax: nul = [radius, [game logics]] execVM "randomSectors1.sqf";
	
		radius		=	inside this radius (of GameLogics/Objects) all scripts takes place
		[objects]	=	define all objects / gamelogics etc, which are being used as random mission locations of this script
		
	example: nul = [100, [gameLogic01,gameLogic02,gameLogic03]] execVM "randomSectors1.sqf";
	
	Q: How to delete/limit/end this mission loop?
	A: Execute anywhere you want (script/trigger):
		
			LVSspots = nil;
			
		(Then mission loop ends after current task)
		
	NOTES:
		-This script reserves IDs: 1,2,3,4 so do NOT use these in another scripts!
	
*/
private ["_newSpot","_enemyCount","_enemyCountMilitarize","_enemyCountFillHouse","_chance","_heliChance","_customInit","_x1","_spotValid",
		"_useFillHouse","_newTask","_enemyCountChopper","_sPos","_players","_sleepDelay","_validSpots","_GLpos","_areaBuildings","_GLradius",
		"_minDis","_extraChance","_infChance","_milSide","_milMen","_milVehicles","_milStill","_milMenRatio","_milVehRatio","_backupPercentage",
		"_milSkills","_milGroup","_milInit","_milID","_fihSide","_fihPatrol","_fihPtype","_fihSrate","_fihSkills","_fihGroup","_fihInit",
		"_fihID","_choExact","_choSide","_choType","_choCaptive","_choPatrol","_choDistance","_choPrecise","_choCycle","_choGrpSize",
		"_choSkills","_choGroup","_choInit","_choID","_infSide","_infSize","_infID","_infMinDis","_infMaxDis","_origAmount","_uLimit",
		"_engagePercentage","_eLimit","_enemyCountInfantry","_engage","_updateTask","_milDoors","_milSmokes","_choSmoke","_classModuleFilters","_mp"];
if(!isServer)exitWith{}; //makes sure only server/host runs this script

//*********Receive parameters:
_GLradius = param [0,100]; //_this select 0; 	//radius from Game Logics for the scripts
LVSspots = param [1,[]];//_this select 1; 		//array of "empty" Game Logics/Target Objects

//*********Adjustable variables:
_minDis = 200; 				//min. distance between players and new task location
_extraChance = 100;			//chance for extra task/hostile reinforcements
_extraPatrolType = 2;		//patrol type for extra task units (1=hunt player group, 2=guard task area)
_updateTask = true;			//show or do not show update task -notification when reinforcements engages area
_backupPercentage = 50;		//when hostile units is only this % left, possible reinforcements will engage area
_engagePercentage = 35;		//when hostile units is only this % left, they will attack player group
//***Extra task chances: (make sure these equals 100 !)
_heliChance = 50; 			//chance for hostile chopper backup
_infChance = 50; 	//NOT USED
//******Militarize - parameters: 
_milSide = 2; 				//side
_milMen = [true,false];				//spawn men
_milVehicles = [false,false,false];	//spawn vehicles
_milStill = false;			//stay still
_milMenRatio = [5,6];		//men ratio
_milVehRatio = [0,4];		//vehicle ratio
_milSkills = 0.5;			//skills
_milGroup = "nil";			//group
_milInit = "nil";			//init
_milID = 1;					//id (dont change this)
_milSmokes = true;			//smokes & chems
_milDoors = false;			//door handling
//******FillHouse - parameters: 
_fihSide = 2;				//side
_fihPatrol = true;			//patrol
_fihPtype = 1;				//patrol type
_fihSrate = 15;				//spawn rate
_fihSkills = _milSkills;	//skills
_fihGroup = "nil";			//group
_fihInit = "nil";			//init
_fihID = 2;					//id (dont change this)
//******Extra task: chopper - parameters: 
_choExact = false;			//exact
_choSide = 2;				//side
_choType = 4;				//chopper type
_choCaptive = false;		//captive
_choPatrol = true;			//patrol 
_choDistance = 2200;		//distance
_choPrecise = true;			//precise
_choCycle = false;			//cycle
_choGrpSize = 2+(random 6);	//group size
_choSkills = _milSkills;	//skills
_choSmoke = [false,_milSmokes,false,false]; //smokes etc
_choGroup = "nil";			//group
_choInit = "nil";			//init
_choID = 3;					//id (dont change this)
//******Extra task: infantry - parameters:
_infMinDis = 300;			//minimum distance 
_infMaxDis = 400;			//maximum distance
_infSide = 1;				//side
_infSize = [4,4];			//group size (same old syntax, [amount,random amount])
_infID = 4;					//id (dont change this)
//******Classnames:
_classModuleFilters = "nil";
//******Other:
_mp = if(isMultiplayer)then{true;}else{false;};

//Prepare functions:
if(isNil("LV_RandomSpot"))then{LV_RandomSpot = compile preprocessFile "\TBMod_zusatzStuff\LV\functions\LV_fnc_randomSpot.sqf";};

while{true}do{ //main loop, which loops "forever", but:
	if(isNil("LVSspots"))exitWith{}; //stops if LVSspots is set to nil
	_origAmount = 0;

	_players = if (isMultiplayer) then {playableUnits} else {[player]};
	
	_sleepDelay = 5+(random 2); //random sleep time before new task
	sleep _sleepDelay; //make it sleep

	//*********Find valid spot for a new task:
	_validSpots = []; //make empty array where we storage all GameLogics which as valid distance to players
	while{(count _validSpots) < 1}do{
		for[{_x1=0},{_x1 < (count LVSspots)},{_x1 = _x1 + 1;}]do{ //loop thru all GameLogics
			_spotValid = true;
			{
				if((_x distance (LVSspots select _x1)) <= _minDis)then{_spotValid = false;};
			}forEach _players; //loop thru all players and check the line above with them
			if(_spotValid)then{ //if _spotValid was changed to false, then some player was too near this GameLogic, but if not:
				_validSpots set[(count _validSpots), (LVSspots select _x1)]; //set this GameLogic into our array of valid ones
			};
		};
		sleep 1;
	};

	_newSpot = (selectRandom _validSpots); //pick a random GameLogic from valid array
	
	//*********Execute militarize.sqf and fillHouse.sqf in selected GameLogic:
	_GLpos = getPos _newSpot;
	_customInit = format["nul = [this, %1, %2, %3, %4, %5, %6, %7, %8, %9, %8, %11, %12, %13, %14] execVM 'LV\militarize.sqf';",
				_milSide,_GLradius,_milMen,_milVehicles,_milStill,_milMenRatio,_milVehRatio,_milSkills,_milGroup,_milInit,_milID,_milSmokes,_milDoors,_classModuleFilters];
	waitUntil{sleep 1; !isNil("LVgroup1")};
	waitUntil{sleep 1; ({alive _x}count units LVgroup1) > 0};
	_origAmount = _origAmount + ({alive _x} count units LVgroup1);
	
	_areaBuildings = nearestObjects [_newSpot, ["house"], _GLradius]; //check if area has buildings 
	_useFillHouse = false;
	if((count _areaBuildings) > 0)then{ //and if it has:
		_useFillHouse = true;
		_customInit = format["nul = [this, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10] execVM 'LV\fillHouse.sqf';",
					_fihSide,_fihPatrol,_fihPtype,_fihSrate,_GLradius,_fihSkills,_fihGroup,_fihInit,_fihID,_classModuleFilters];
		waitUntil{sleep 1; !isNil("LVgroup2")};
		waitUntil{sleep 1; ({alive _x}count units LVgroup2) > 0};
		_origAmount = _origAmount + ({alive _x} count units LVgroup2);
	};
	//*********Add new task:
	["NewTask", _players, ["Clear area from hostile military!", "Clear area", "ATTACK"], getPos _newSpot, "ASSIGNED", 0, true, true] call BIS_fnc_setTask;

	_chance = floor(random 100);
	//*********Check task progress:
	_uLimit = (_origAmount / 100) * _backupPercentage;
	_eLimit = (_origAmount / 100) * _engagePercentage;
	_engage = false;
	while{true}do{ 	//loop in
		sleep 5; 	//5s cycle
		_enemyCountMilitarize = ({alive _x} count units LVgroup1); //count alive militarize units
		if((_useFillHouse))then{ //if fillhouse if used:
			_enemyCountFillHouse = ({alive _x} count units LVgroup2); //count alive fillhouse units
			_enemyCount = (_enemyCountMilitarize + _enemyCountFillHouse); //count militarize units + fillhouse units
		}else{ _enemyCount = _enemyCountMilitarize;}; //if no fillhouse used, then use only militarize unit count
		if(_enemyCount == 0)exitWith{};
		
		if((_enemyCount < _uLimit)&&(_chance < _extraChance))exitWith{}; //if alive units < _backupPercentage, break this loop and continue script
		if(!_engage)then{
		if(_enemyCount < _eLimit)then{ //if alive units < _engagePercentage, units will attack player group:
			PLgrp = (group (_players select 0));
			if(_enemyCountMilitarize > 0)then{
				{
					_x setVariable ["target0",PLgrp,false];
					_x setVariable ["mDis0", 1000, false];
					_x setVariable ["breakPatrol",true];
					nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}forEach units LVgroup1;
			};
			if(_enemyCountFillHouse > 0)then{
				{
					_x setVariable ["target0",PLgrp,false];
					_x setVariable ["mDis0", 1000, false];
					_x setVariable ["breakPatrol",true];
					nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}forEach units LVgroup2;
			};
			_engage = true;
		};
		};
	};
	
	//*********Possible extra tasks: 
	
	if(_chance < _extraChance)then{
		_origAmount = _enemyCount;
		_chance = floor(random (100));
	//*********Possible extra task - hostile backup chopper: 
		if(_chance <= _heliChance)then{
			PLgrp = (group (_players select 0));
			_choType = selectRandom [1,2,3,4];
			if(_extraPatrolType == 1)then{ //chase player group
				_customInit = format["nul = [this,%1,%2,%3,%4,%5,PLgrp,'random',%6,%7,%8,%9,%10,%11,%12,%13,%14,%15,false,%16] execVM 'LV\reinforcementChopper.sqf';",
						_choExact,_choSide,_choType,_choCaptive,_choPatrol,_choDistance,_choPrecise,_choCycle,_choGrpSize,_choSkills,_choSmoke,_choGroup,_choInit,_choID,_mp,_classModuleFilters];
			};
			if(_extraPatrolType == 2)then{ //engage task area
				_customInit = format["nul = [this,%1,%2,%3,%4,false,PLgrp,'random',%5,%6,%7,%8,%9,%10,%11,%12,%13,%14,false,%15] execVM 'LV\reinforcementChopper.sqf';",
						_choExact,_choSide,_choType,_choCaptive,_choDistance,_choPrecise,_choCycle,_choGrpSize,_choSkills,_choSmoke,_choGroup,_choInit,_choID,_mp,_classModuleFilters];
				waitUntil{sleep 1; !isNil("LVgroup3")};
				waitUntil{sleep 1; ({alive _x}count units LVgroup3) > 0};
				_wp1 = LVgroup3 addWaypoint [_newSpot, 0];
				_wp1 setWaypointType "SAD";
				_wp1 setWaypointBehaviour "COMBAT";
				_wp1 setWaypointCombatMode "RED";
				_wp1 setWaypointSpeed "FULL";
			};
			waitUntil{sleep 1; !isNil("LVgroup3")};
			waitUntil{sleep 1; ({alive _x}count units LVgroup3) > 0};
			_origAmount = _origAmount + ({alive _x} count units LVgroup3);
			_eLimit = (_origAmount / 100) * _engagePercentage;

			if (_updateTask) then {
				["NewTask"] call BIS_fnc_deleteTask;
				["NewTask", _players, ["Hostile patrol is near!", "Defend area", "DEFEND"], getPos _newSpot, "ASSIGNED", 0, true, true] call BIS_fnc_setTask;
			};

			_engage = false;
			while{true}do{
				sleep 5;
				_enemyCountMilitarize = ({alive _x} count units LVgroup1);
				_enemyCountFillHouse = ({alive _x} count units LVgroup2);
				_enemyCountChopper = ({alive _x} count units LVgroup3);
				_enemyCount = _enemyCountMilitarize + _enemyCountFillHouse + _enemyCountChopper;
				if(_enemyCount == 0)exitWith{};
				if(!_engage)then{
				if(_enemyCount < _eLimit)then{ //if alive units < _engagePercentage, units will attack player group:
					PLgrp = (group (_players select 0));
					if(_enemyCountMilitarize > 0)then{
						{
							_x setVariable ["target0",PLgrp,false];
							_x setVariable ["mDis0", 1000, false];
							_x setVariable ["breakPatrol",true];
							nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
						}forEach units LVgroup1;
					};
					if(_enemyCountFillHouse > 0)then{
						{
							_x setVariable ["target0",PLgrp,false];
							_x setVariable ["mDis0", 1000, false];
							_x setVariable ["breakPatrol",true];
							nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
						}forEach units LVgroup2;
					};
					if(_enemyCountChopper > 0)then{
						{
							_x setVariable ["target0",PLgrp,false];
							_x setVariable ["mDis0", 1000, false];
							_x setVariable ["breakPatrol",true];
							nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
						}forEach units LVgroup3;
					};
					_engage = true;
				};
				};
			};
		};
	
	//*********Possible extra task - hostile infantry group:
		if(_chance > _heliChance)then{
			_sPos = [(getPos _newSpot),(_infMaxDis - _infMinDis),_infMinDis,_players] call LV_RandomSpot;
			_customInit = format ["nul = [%1,%2,%3,%4,%5,nil,nil,false] execVM 'LV\LV_functions\LV_fnc_menGroup.sqf';",_sPos,_infSide,_infSize,_infID,_classModuleFilters];
			
			waitUntil{sleep 5; !isNil("LVgroup4")};
			waitUntil{sleep 1; ({alive _x}count units LVgroup4) > 0};
			if(_extraPatrolType == 1)then{ //chase player group
				PLgrp = (group (_players select 0));
				{
					_x setVariable ["target0",PLgrp,false];
					_x setVariable ["mDis0", 1000, false];
					nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}forEach units LVgroup4;
			};
			if(_extraPatrolType == 2)then{ //engage task area
				_wp1 = LVgroup4 addWaypoint [_newSpot, 0];
				_wp1 setWaypointType "SAD";
				_wp1 setWaypointBehaviour "AWARE";
				_wp1 setWaypointCombatMode "RED";
				_wp1 setWaypointSpeed "FULL";
			};
			waitUntil{sleep 1; !isNil("LVgroup4")};
			waitUntil{sleep 1; ({alive _x}count units LVgroup4) > 0};
			_origAmount = _origAmount + ({alive _x} count units LVgroup4);
			_eLimit = (_origAmount / 100) * _engagePercentage;

			if (_updateTask) then {
				["NewTask"] call BIS_fnc_deleteTask;
				["NewTask", _players, ["Hostile patrol is near!", "Defend area", "DEFEND"], getPos _newSpot, "ASSIGNED", 0, true, true] call BIS_fnc_setTask;
			};

			_engage = false;
			while{true}do{
				sleep 5;
				_enemyCountMilitarize = ({alive _x} count units LVgroup1);
				_enemyCountFillHouse = ({alive _x} count units LVgroup2);
				_enemyCountInfantry = ({alive _x} count units LVgroup4);
				_enemyCount = _enemyCountMilitarize + _enemyCountFillHouse + _enemyCountInfantry;
				if(_enemyCount == 0)exitWith{};
				if(!_engage)then{
				if(_enemyCount < _eLimit)then{ //if alive units < _engagePercentage, units will attack player group:
					PLgrp = (group (_players select 0));
					if(_enemyCountMilitarize > 0)then{
						{
							_x setVariable ["target0",PLgrp,false];
							_x setVariable ["mDis0", 1000, false];
							_x setVariable ["breakPatrol",true];
							nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
						}forEach units LVgroup1;
					};
					if(_enemyCountFillHouse > 0)then{
						{
							_x setVariable ["target0",PLgrp,false];
							_x setVariable ["mDis0", 1000, false];
							_x setVariable ["breakPatrol",true];
							nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
						}forEach units LVgroup2;
					};
					if(_enemyCountInfantry > 0)then{
						{
							_x setVariable ["target0",PLgrp,false];
							_x setVariable ["mDis0", 1000, false];
							_x setVariable ["breakPatrol",true];
							nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
						}forEach units LVgroup4;
					};
					_engage = true;
				};
				};
			};
		};
		
		
	};
	["NewTask", _players, ["Hostile patrol is near!", "Defend area", "DEFEND"], getPos _newSpot, "SUCCEEDED", 0, true, true] call BIS_fnc_setTask;
	["NewTask"] call BIS_fnc_deleteTask;
};