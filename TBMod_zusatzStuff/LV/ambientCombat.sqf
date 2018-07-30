/*
				***		ARMA3Alpha AMBIENT COMBAT SCRIPT v3.2 - by SPUn / Kaarto Media	***
				
			Creates ambient combat around defined objects/units with multiple customizable features.
			
		Calling the script:
		
				default: 	nul = [] execVM "\TBMod_zusatzStuff\LV\ambientCombat.sqf";
				custom: 	nul = [min range, max range, min delay, max delay, groups, side ratios, center unit, vehicle chance,
								air vehicle chance, water units, AI skills, communication, dissapear distance, custom init,
								patrol type, MP, clean, classes] execVM "\TBMod_zusatzStuff\LV\ambientCombat.sqf";
								
	Parameters:
		
		min range 			= 	number 		(meters, minimum range from center unit for AI to spawn) 			DEFAULT: 450
		max range 			= 	number 		(meters, maximum range from center unit for AI to spawn) 			DEFAULT: 900
		min delay 			= 	number 		(seconds, minimum spawning delay for AI) 							DEFAULT: 30
		max delay 			= 	number 		(seconds, maximum spawning delay for AI) 							DEFAULT: 300
		groups 				= 	number 		(how many AI groups can be alive at the same time) 					DEFAULT: 6
		side ratios			=	array		([west ratio, east ratio, ind ratio])								DEFAULT: [1,1,1]
											each ratio value is number between 0.0 - 1.0
		center unit(s) 		= 	unit/array	(unit/object/array which is center of all action) 					DEFAULT: player
		vehicle chance		=	0-100		(%-chance for vehicles to spawn)									DEFAULT: 40
		air vehicle chance	=	0-100		(%-chance for air vehicles to spawn)								DEFAULT: 20
		water units			= 	true/false	(if true, also water units are being spawned)						DEFAULT: false
		AI skills 			= 	"default" 	(default AI skills) 												DEFAULT: "default"
							or	number		(0-1.0 - this value will be set to all AI skills)
							or	array		(all AI skills invidiually in array, values 0-1.0, order:)
								[aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general,
								endurance,reloadSpeed]
		communication 		= 	true/false 	(if true, then AI groups will communicate and inform each others about enemies) DEFAULT: 0
		dissapearDistance 	= 	number 		(distance from center unit where AI units/groups will dissapear) 	DEFAULT: 2500
								NOTE: Make sure this is bigger than *maxRange !		
		custom init 		= 	"init commands" (if you want something in init field of units, put it here) 	DEFAULT: nil
								NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST 
								use ' or "" instead of ". EXAMPLE: "hint 'this is hint';"
		patrol type			=	1 or array 	(1 = doMove for each unit individually)								DEFAULT: 1
								array = ["waypointBehaviour","waypointType"] = waypoint for group 
								ex: ["AWARE","SAD"]
		MP					= 	true/false	(true = 'center unit' will automatically be an array of human		DEFAULT: false
								players and everything will be synced around them)
		clean 				=	true/false 	(true = automatic cleanup function for dead units)					DEFAULT: true
		classes				=	array		(classes from config_aissp.hpp, defines which unit classnames are 	DEFAULT: ["ALL"]
											being used)
								
		Fully customized example:
				nul = [150,600,10,30,8,[0,1,1],player,50,10,false,[0.2,0.3,0.1,0.55,0.25,1,1,0.25,1,1],true,800,"hint format['spawning unit: %1',this];",
					["AWARE","SAD"],false,true,["ALL"]] execVM "LV\ambientCombat.sqf";
					
*/
if (!isServer)exitWith{};
private ["_patrolType","_customInit","_communication","_eastGroups","_westGroups","_skills","_syncedUnit","_groupAmount","_grp","_minRange","_maxRange","_minTime","_maxTime","_centerPos","_range","_dir","_spawnPos","_side","_menOrVehicle","_timeDelay","_skls","_spotValid","_leftSides","_fullRatio","_perRatio","_westRatio","_eastRatio","_indeRatio","_lossRatio","_indeGroups","_sideRatios","_dissapearDistance","_waterUnitChance","_landOrAir","_mp","_tempPos","_isFlat","_d1","_m","_avoidArray","_input","_logic","_isActivated","_vehicleChance","_airVehicleChance","_waterUnits","_classModule","_classModuleFilters","_clean"];

_minRange = param [0,450];
_maxRange = param [1,900];
_minTime = param [2,30];
_maxTime = param [3,300];
_groupAmount = param [4,6];
_sideRatios = param [5,[1,1,1]]; 
_syncedUnit = param [6,player];
_vehicleChance = param [7,40];
_airVehicleChance = param [8,20];
_waterUnits = param [9,false];
_skills = param [10,0.3];
_communication = param [11,true];
_dissapearDistance = param [12,1500];
_customInit = param [13,nil];
_patrolType = param [14,1];
_mp = param [15,false];
_clean = param [16,true];
_classModuleFilters = param [17,["ALL"]];

if(isNil("LV_classnames"))then{LV_classnames = compile preprocessFile "LV\LV_functions\LV_fnc_classnames.sqf";};
if(isNil("LV_validateClassArrays"))then{LV_validateClassArrays = compile preprocessFile "LV\LV_functions\LV_fnc_validateClassArrays.sqf";};

if(isNil("LV_fullLandVehicle"))then{LV_fullLandVehicle = compile preprocessFile "LV\LV_functions\LV_fnc_fullLandVehicle.sqf";};
if(isNil("LV_fullAirVehicle"))then{LV_fullAirVehicle = compile preprocessFile "LV\LV_functions\LV_fnc_fullAirVehicle.sqf";};
if(isNil("LV_fullWaterVehicle"))then{LV_fullWaterVehicle = compile preprocessFile "LV\LV_functions\LV_fnc_fullWaterVehicle.sqf";};
if(isNil("LV_menGroup"))then{LV_menGroup = compile preprocessFile "LV\LV_functions\LV_fnc_menGroup.sqf";};
if(isNil("LV_diveGroup"))then{LV_diveGroup = compile preprocessFile "LV\LV_functions\LV_fnc_diveGroup.sqf";};
if(isNil("LV_ACpatrol"))then{LV_ACpatrol = compile preprocessFile "LV\LV_functions\LV_fnc_ACpatrol.sqf";};
if(isNil("LV_ACcleanUp"))then{LV_ACcleanUp = compile preprocessFile "LV\LV_functions\LV_fnc_ACcleanUp.sqf";};
if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV\LV_functions\LV_fnc_ACskills.sqf";};
if(_communication)then{if(isNil("LV_AIcommunication"))then{LV_AIcommunication = compile preprocessFile "LV\LV_functions\LV_fnc_AIcommunication.sqf";};};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV\LV_functions\LV_fnc_vehicleInit.sqf";};
if(isNil("LV_RandomSpot"))then{LV_RandomSpot = compile preprocessFile "LV\LV_functions\LV_fnc_randomSpot.sqf";};
if(_mp)then{if(isNil("LV_GetPlayers"))then{LV_GetPlayers = compile preprocessFile "LV\LV_functions\LV_fnc_getPlayers.sqf";};};
if(isNil("LV_FindLandPosition"))then{LV_FindLandPosition = compile preprocessFile "LV\LV_functions\LV_fnc_findLandPosition.sqf";};
if(isNil("LV_IsInMarker"))then{LV_IsInMarker = compile preprocessFile "LV\LV_functions\LV_fnc_isInMarker.sqf";};

if(isNil("LV_ACS_activeGroups"))then{LV_ACS_activeGroups = [];}; 
if(isNil("LV_AI_westGroups"))then{LV_AI_westGroups = [];}; 
if(isNil("LV_AI_eastGroups"))then{LV_AI_eastGroups = [];}; 
if(isNil("LV_AI_indeGroups"))then{LV_AI_indeGroups = [];}; 

if(!(isNil("ACpatrol")))then{terminate ACpatrol;};
if(!(isNil("ACcleanUp")))then{terminate ACcleanUp;};
if(_communication)then{
	if(!(isNil("ACcommunication")))then{terminate ACcommunication;};
	ACcommunication = [] spawn LV_AIcommunication;
};
ACcleanUp = [_syncedUnit,_dissapearDistance,_mp] spawn LV_ACcleanUp;
ACpatrol = [_syncedUnit,_maxRange,_patrolType,_mp] spawn LV_ACpatrol;

/*fnc_Create_Marker = { //[position,color]
	private["_pos","_color","_nameValid","_num","_name","_marker"];
	_pos = _this select 0;
	_color = _this select 1;
	if(isNil("LV_Markers"))then{LV_Markers = [];};
	_nameValid = false;
	while{!_nameValid}do{
		_num = round(random 10000);
		_name = ("lvmarker"+(str _num));
		if(!(_name in LV_Markers))then{_nameValid = true;};
	};
	_marker = createMarker[_name,_pos];
	_name setMarkerShape "ICON";
	_name setMarkerType "mil_dot";
	_name setMarkerColor _color;
	LV_Markers set[(count LV_Markers),_name];
};*/

while{true}do{
	if(_maxTime == _minTime)then{
		_timeDelay = _maxTime;
	}else{
		_timeDelay = (random(_maxTime - _minTime)) + _minTime;
	};
	sleep _timeDelay;
	if({({alive _x} count units _x > 0) } count LV_ACS_activeGroups < _groupAmount)then{
		if({({alive _x} count units _x > 0) } count LV_ACS_activeGroups  == (_groupAmount - 1))then{sleep _timeDelay;};
		
			if(_mp)then{ _syncedUnit = call LV_GetPlayers;};
			_spotValid = false;
			while{!_spotValid}do{
				_spotValid = true;
				if(((typeName _syncedUnit) == "ARRAY")||(_mp))then{
					_centerPos = getPos (_syncedUnit call BIS_fnc_selectRandom);
				}else{
					_centerPos = getPos _syncedUnit;
				};
				
				if(_maxRange == _minRange)then{
					_range = _maxRange;
				}else{
					_range = (random(_maxRange - _minRange)) + _minRange;
				};
				_dir = random 360;
				_spawnPos = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
				
				if(surfaceIsWater _spawnPos)then{
					_isFlat = []; 	
					_d1 = 0;	
					while{count _isFlat == 0}do{ //check if there's land at _maxRange
						_tempPos = [(_centerPos select 0) + (sin _d1) * _maxRange, (_centerPos select 1) + (cos _d1) * _maxRange, 0];
						_isFlat = _tempPos isFlatEmpty [2,-1,1,2,0,false];
						_d1 = _d1 + 45;
						if(_d1 == 360)exitWith{};
					};
					if(count _isFlat > 0)then{
						if(_waterUnits)then{
							_spawnPos = _isFlat;
						}else{
							if(!_waterUnits && surfaceIsWater _spawnPos)exitWith{_spotValid = false;};
						};					
					};
				};
				if(((typeName _syncedUnit) == "ARRAY")||(_mp))then{
					{
						if((_x distance _spawnPos) < _minRange)exitWith{_spotValid = false;};
					}forEach _syncedUnit;
				};
				
				_avoidArray = [];
				for "_i" from 0 to 30 do {
					if(_i == 0)then{_m = "ACavoid";}else{_m = ("ACavoid_" + str _i);};
					if(_m in allMapMarkers)then{_avoidArray set[(count _avoidArray),_m];};
				};
				{
					if([_spawnPos,_x] call LV_IsInMarker)exitWith{_spotValid = false;};
				}forEach _avoidArray;
				
				
			};

		//Handle side ratios -> decide side:
		_fullRatio = (_sideRatios select 0) + (_sideRatios select 1) + (_sideRatios select 2);
		_perRatio = _groupAmount / _fullRatio;
		_westRatio = floor((_sideRatios select 0) * _perRatio);
		_eastRatio = floor((_sideRatios select 1) * _perRatio);
		_indeRatio = floor((_sideRatios select 2) * _perRatio);
		_lossRatio = _groupAmount - _westRatio - _eastRatio - _indeRatio;
		
		_westGroups = {(side _x) == west} count LV_ACS_activeGroups; 
		_eastGroups = {(side _x) == east} count LV_ACS_activeGroups;
		_indeGroups = {(side _x) == resistance} count LV_ACS_activeGroups;
		//hint format["w: %1, e: %2, i: %3",_westGroups,_eastGroups,_indeGroups];
		if(_westGroups < _westRatio)then{
			_side = 0;
		}else{
			if(_eastGroups < _eastRatio)then{
				_side = 1;
			}else{
				if(_indeGroups < _indeRatio)then{
					_side = 2;
				}else{
					_leftSides = [];
					if(_westRatio > 0)then{if((_sideRatios select 0) > 0)then{_leftSides set[(count _leftSides),0];};};
					if(_eastRatio > 0)then{if((_sideRatios select 1) > 0)then{_leftSides set[(count _leftSides),1];};};
					if(_indeRatio > 0)then{if((_sideRatios select 2) > 0)then{_leftSides set[(count _leftSides),2];};};
					if(count _leftSides > 1)then{
						_side = selectRandom _leftSides;
						{
							if(_x > _side)then{ _side = _x; };
						}forEach _leftSides;
					}else{_side = _leftSides select 0;};
					//hint format["extra group's side: %1",_side];
				};
			};
		};
		
		_menOrVehicle = floor(random 100);
		if(_menOrVehicle <= _vehicleChance)then{
			if(surfaceIsWater _spawnPos && _waterUnits)then{
				_grp = [_spawnPos, _side + 1,_classModuleFilters,_syncedUnit,_dissapearDistance,_clean] call LV_fullWaterVehicle;
			}else{
				if(surfaceIsWater _spawnPos && !_waterUnits)then{
					_grp = [_spawnPos, _side + 1,_classModuleFilters,_syncedUnit,_dissapearDistance,_clean] call LV_fullAirVehicle;
				}else{
					_landOrAir = floor(random 100);
					if(_landOrAir <= _airVehicleChance)then{
						_grp = [_spawnPos, _side + 1,_classModuleFilters,_syncedUnit,_dissapearDistance,_clean] call LV_fullAirVehicle;
					}else{
						_grp = [_spawnPos, _side + 1,_classModuleFilters,_syncedUnit,_dissapearDistance,_clean] call LV_fullLandVehicle;
					};
				};
			};
		}else{
			if(surfaceIsWater _spawnPos)then{
				_grp = [_spawnPos, _side, [10,3],nil,_classModuleFilters,_syncedUnit,_dissapearDistance,_clean] call LV_diveGroup;
			}else{
				_grp = [_spawnPos, _side, [10,3],nil,_classModuleFilters,_syncedUnit,_dissapearDistance,_clean] call LV_menGroup;
			};
		};
		if(typeName _skills != "STRING")then{_skls = [_grp,_skills] call LV_ACskills;};
		LV_ACS_activeGroups set [(count LV_ACS_activeGroups), (group _grp)];
		
		switch(_side)do{
			case 0:{
				LV_AI_westGroups set [(count LV_AI_westGroups), (group _grp)];
				//[_spawnPos, "COLORBLUE"] call fnc_Create_Marker;
			};
			case 1:{
				LV_AI_eastGroups set [(count LV_AI_eastGroups), (group _grp)];
				//[_spawnPos, "COLORRED"] call fnc_Create_Marker;
			};
			case 2:{
				LV_AI_indeGroups set [(count LV_AI_indeGroups), (group _grp)];
				//[_spawnPos, "COLORGREEN"] call fnc_Create_Marker;
			};
		};
		
		if(!isNil("_customInit"))then{ 
			{
				[_x,_customInit] spawn LV_vehicleInit;
			} forEach units group _grp;
		};
	};
};