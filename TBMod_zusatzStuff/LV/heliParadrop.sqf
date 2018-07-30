/*
				***		ARMA3Alpha HELI PARADROP v2.5 - by SPUn / Kaarto Media	***
	
					Spawns chopper which delivers paradrop group to scene
				
		Calling the script:
		
			default: 		nul = [this] execVM "LV\heliParadrop.sqf";
			
			custom: 		nul = [spot, side, allowDamage, captive, distance, direction, flyby, fly height, jump distance,
								group size, jump delay, open height, smokes, flares, chems, patrol, target, cycle, skills,
								group, custom init, ID, MP, doors, classes] execVM "LV\heliParadrop.sqf";
								
	Parameters:
	
spot 	= 	drop spot 		(name of marker or object or unit, or position array) 									DEFAULT: --
side 	= 	1 or 2 or 3		(1 = west, 2 = east, 3 = independent)													DEFAULT: 2
allowDamage = 	true/false	(allow or disallow damage for chopper)													DEFAULT: true
captive 	= 	true/false 	(if true, enemies wont notice chopper) 													DEFAULT: false
distance 	= 	number 		(from how far chopper comes from) 														DEFAULT: 1500
direction 	= 	"random" or 0-360 (direction where chopper comes from, use quotes with random!) 					DEFAULT: "random"
flyby	=	true/false		(true = chopper just flies thru target, false = stays still while dropping units)		DEFAULT: true
fly height	= number 		(how high chopper flies)																DEFAULT: 200
jump distance =	number 		(how many meters before target location units starts jumping out of heli)				DEFAULT: 150
group size	= number 		(how many units is in para drop group)													DEFAULT: 8
jump delay	= number 		(how many seconds is the delay between jumps)											DEFAULT: 0.5
open height = number		(in which height units opens their parachutes)											DEFAULT: 50
smokes	=	true/false		(will units throw cover smokes (on 10m height))											DEFAULT: false
flares	=	true/false		(will units throw flares (on 30m height))												DEFAULT: false	
chems	=	true/false		(will units throw chemlights (on 30m height))											DEFAULT: false
patrol 	= 	true/false 		(if false, units wont patrol in any way <- handy if you set (group player) as *group) 	DEFAULT: true
target 	= 	patrol target 	(patrolling target for infantry group, options:											DEFAULT: player
							unit 	= 	units name, ex: enemyunit1
							marker 	= 	markers' name, ex: "marker01" (remember quotes with markers!)
							marker array = array of markers in desired order, ex: ["marker01","marker02","marker03"]
							group	= 	groups name, ex: (group enemy1)	OR BlueGroup17
							group array, ex: [(group player), (group blue2)]
							["PATROL",center position,radius] = uses patrol-vD.sqf, ex: ["PATROL",(getPos player),150]										
cycle 		= 	true or false (if true and target is array of markers, unit will cycle these markers) 				DEFAULT: false
skills 		= 	"default" 	(default AI skills) 																	DEFAULT: "default"
				or	number	=	0-1.0 = this value will be set to all AI skills, ex: 0.8
				or	array	=	all AI skills invidiually in array, values 0-1.0, order:
						[aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 
						ex: 	[0.75,0.5,0.6,0.85,0.9,1,1,0.75,1,1] 
group 		= 	group name OR nil (if you want units in existing group, set it here. if this is left empty, new group is made) 	DEFAULT: nil
custom init = 	"init commands" (if you want something in init field of units, put it here) 									DEFAULT: nil
				NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST use ' or "" instead of ",
					ex: "hint 'this is hint';"
ID 			= 	number (if you want to delete units this script creates, you'll need ID number for them)						DEFAULT: nil
MP			= 	true/false	true = 'drop spot' will automatically be one of alive non-captive players							DEFAULT: false
doors		=	true/false	true = units will close doors behind them while patrolling											DEFAULT: false
classes		=	array	(classes from config_aissp.hpp, defines which unit classnames are being used)							DEFAULT: ["ALL"]
						 
EXAMPLE: 	nul = [player, 2, false, true, 1000, "random", true, 500, 200, 6, 1, 50, true, false, true, true, player, false, 0.75, nil, nil, 1,false] execVM "LV\heliParadrop.sqf";
*/
if (!isServer)exitWith{};
private ["_mp","_grp","_heliType","_men","_grp2","_center","_man1","_man2","_landingSpot","_side","_flyHeight","_openHeight","_jumpDelay","_jumperAmount","_heliDistance","_heliDirection","_flyBy","_allowDamage","_BLUmen","_OPFmen","_INDmen","_choppers","_landingSpotPos","_spos","_heli","_crew","_dir","_flySpot","_jumpDistanceFromTarget","_captive","_smokes","_flares","_chems","_skls","_cPosition","_cRadius","_patrol","_target","_cycle","_skills","_customInit","_grpId","_wp0","_wp1","_doorHandling","_input","_logic","_isActivated"];

private ["_tMarker","_mGroup","_classModule","_classModuleFilters","_tPos"];

_landingSpot = param [0];
_side = param [1,2];
_allowDamage = param [2,true];
_captive = param [3,false];
_heliDistance = param [4,1500];
_heliDirection = param [5,"random"];
_flyBy = param [6,true];
_flyHeight = param [7,200];
_jumpDistanceFromTarget = param [8,150];
_jumperAmount = param [9,8];
_jumpDelay = param [10,0.5];
_openHeight = param [11,50];
_smokes = param [12,false];
_flares = param [13,false];
_chems = param [14,false];
_patrol = param [15,true];
_target = param [16,player];
_cycle = param [17,false];
_skills = param [18,"default"];;
_grp2 = param [19,nil];
_customInit = param [20,nil];
_grpId = param [21,nil];
_mp = param [22,false];
_doorHandling = param [23,false];
_classModuleFilters = param [24,["ALL"]];

//Prepare functions:
if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV\LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV\LV_functions\LV_fnc_vehicleInit.sqf";};
if(_mp)then{if(isNil("LV_GetPlayers"))then{LV_GetPlayers = compile preprocessFile "LV\LV_functions\LV_fnc_getPlayers.sqf";};};
if(isNil("LV_classnames"))then{LV_classnames = compile preprocessFile "LV\LV_functions\LV_fnc_classnames.sqf";};
if(isNil("LV_validateClassArrays"))then{LV_validateClassArrays = compile preprocessFile "LV\LV_functions\LV_fnc_validateClassArrays.sqf";};


//Classnames:
_choppers = ([_classModuleFilters,[(_side), 3]] call LV_classnames);

//Side related group creation:
switch(_side)do{
	case 1:{
		_center = createCenter west;
		_grp = createGroup west;
		if(isNil("_grp2"))then{_grp2 = createGroup west;}else{_grp2 = _grp2;};
	};
	case 2:{
		_center = createCenter east;
		_grp = createGroup east;
		if(isNil("_grp2"))then{_grp2 = createGroup east;}else{_grp2 = _grp2;};
	};
	case 3:{
		_center = createCenter resistance;
		_grp = createGroup resistance;
		if(isNil("_grp2"))then{_grp2 = createGroup resistance;}else{_grp2 = _grp2;};
	};
};

_choppers = [_choppers] call LV_validateClassArrays;
if((count _choppers) == 0)then{
	_choppers = ([[],[(_side), 3]] call LV_classnames);
};
_heliType = selectRandom _choppers;
if(typeName _heliType == "ARRAY")then{_heliType = selectRandom _heliType;};

_men = ([_classModuleFilters,[(_side), 6]] call LV_classnames);
_men = [_men] call LV_validateClassArrays;
if((count _men) == 0)then{
	_men = ([[],[(_side), 6]] call LV_classnames);
};
_men = selectRandom _men;

if(_mp)then{
	_landingSpot = call LV_GetPlayers;
	_landingSpotPos = getPos (selectRandom _landingSpot);
	_landingSpot = _landingSpotPos;
}else{
	//Check if target is marker/object/position
	if(_landingSpot in allMapMarkers)then{
		_landingSpotPos = getMarkerPos _landingSpot;
	}else{
		if (typeName _landingSpot == "ARRAY") then{
			_landingSpotPos = _landingSpot;
		}else{
			_landingSpotPos = getPos _landingSpot;
		};
	};
};

//Spawn chopper
if(typeName _heliDirection == "STRING")then{_heliDirection = random 360;};
_spos = [(_landingSpotPos select 0) + (sin _heliDirection) * _heliDistance, (_landingSpotPos select 1) + (cos _heliDirection) * _heliDistance, _flyHeight];
_heli = createVehicle [_heliType, _spos, [], 0, "FLY"];
_heli allowDamage _allowDamage;
_crew = [_heli,_grp] call bis_fnc_spawncrew;
if(_captive)then{
	_heli setCaptive true;
	{ _x setCaptive true; } forEach units _grp;
};
 
//_grp setBehaviour "CARELESS";

//Count angle between chopper and target, and end spot for chopper
_dir = ((_landingSpotPos select 0) - (_spos select 0)) atan2 ((_landingSpotPos select 1) - (_spos select 1));
_flySpot = [(_landingSpotPos select 0) + (sin _dir) * _heliDistance, (_landingSpotPos select 1) + (cos _dir) * _heliDistance, _flyHeight];

//Heli to go
if(_flyBy)then{
	_wp0 = _grp addWaypoint [_landingSpotPos, 0, 1];
	[_grp,0] setWaypointBehaviour "CARELESS";
	[_grp,0] setWaypointCompletionRadius 60;
	_wp1 = _grp addWaypoint [_flySpot, 0, 2];
	[_grp,1] setWaypointBehaviour "CARELESS";
	[_grp,1] setWaypointCompletionRadius 60;
}else{
	_wp0 = _grp addWaypoint [_landingSpotPos, 0, 1];
	[_grp,0] setWaypointBehaviour "CARELESS";
	[_grp,0] setWaypointCompletionRadius 60;
};
_heli flyInHeight _flyHeight;

//Make heli & crew dissapear if something goes wrong or if heli is at its end spot
[_heli,_grp,_flySpot,_landingSpotPos,_heliDistance] spawn {
	params ["_heli","_grp","_flySpot","_landingSpotPos","_heliDistance"];
	while{([_heli, _flySpot] call BIS_fnc_distance2D)>200}do{
		if(!alive _heli || !canMove _heli)exitWith{};
		sleep 5;
	};
	waitUntil{([_heli, _landingSpotPos] call BIS_fnc_distance2D)>(_heliDistance * .5)};
	{ deleteVehicle _x; } forEach units _grp;
	deleteVehicle _heli;
};

//Wait till it's close enough
waitUntil{([_heli, _landingSpotPos] call BIS_fnc_distance2D)<_jumpDistanceFromTarget};

//Create para group
for "_i" from 1 to _jumperAmount step 1 do{
	_man1 = selectRandom _men;
	_man2 = _grp2 createUnit [_man1, [(getPos _heli) select 0,(getPos _heli) select 1, ((getPos _heli) select 2) - 3], [], 0, "NONE"];
	_man2 setPos [(getPos _heli) select 0,(getPos _heli) select 1, ((getPos _heli) select 2) - 3];
	if(typeName _skills != "STRING")then{_skls = [_man2,_skills] call LV_ACskills;};
	if(!isNil("_customInit"))then{ 
		[_man2,_customInit] spawn LV_vehicleInit;
	};
	[_man2,_heli,_openHeight,_smokes,_flares,_chems] spawn{
		params ["_man2","_heli","_openHeight","_smokes","_flares","_chems","_smoke","_flare","_chem","_para"];
		waitUntil{((getPos _man2)select 2)<_openHeight};
		_para = createVehicle ["NonSteerable_Parachute_F", position _man2, [], ((direction _heli)-25+(random 50)), 'NONE'];
		_para setPos (getPos _man2);
		_man2 moveInDriver _para;
		
		if(_smokes)then{
			waitUntil{((getPos _man2)select 2)<10};
			_smoke = "SmokeShell" createVehicle (getPos _man2);
		};
		if(_flares)then{
			waitUntil{((getPos _man2)select 2)<30};
			_flare = "F_40mm_Red" createVehicle [(getPos _man2) select 0,(getPos _man2) select 1,0]; //Chemlight_red
		};
		if(_chems)then{
			waitUntil{((getPos _man2)select 2)<30};
			_chem = "Chemlight_red" createVehicle (getPos _man2);
		};
	};
	_man2 allowFleeing 0;
	sleep _jumpDelay;
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp2",_grpId];
};

//If it wasnt a flyby, send heli to its end spot
if(!_flyBy)then{ 
	_wp1 = _grp addWaypoint [_flySpot, 0, 2];
	[_grp,1] setWaypointBehaviour "CARELESS";
	[_grp,1] setWaypointCompletionRadius 60;
};

//Patrol stuff for para group
if(_patrol)then{
	if(typeName _target == "ARRAY")then{ //TARGET is array
		if((!((_target select 0) in allMapMarkers))&&(!((_target select 0) in allGroups)))then{
			if((typeName (_target select 0)) == "STRING")then{
				if((_target select 0) == "PATROL")then{ ////USE patrol-vD.sqf
					{
						_cPosition = _target select 1;
						_cRadius = _target select 2;
						nul = [_x,_cPosition,_cRadius,_doorHandling] execVM "LV\patrol-vD.sqf";
					}forEach units _grp2;
				};
			};
		}else{ //TARGET is array of Markers or Groups
			{ 
				_x setVariable ["target0",_target,false];
				_x setVariable ["mDis0", 1000, false];
				if(_cycle)then{
					nul = [_x,true] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}else{
					nul = [_x,false] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				};
				sleep 2;
			}forEach units _grp2;
		};
	}else{
		if(_target in allMapMarkers)then{ /////TARGET is single Marker
			{ _x doMove getMarkerPos _target; } forEach units _grp2;
		}else{
				{ ////TARGET is single Unit/Object
					_x setVariable ["target0",_target,false];
					_x setVariable ["mDis0", 1000, false];
					nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}forEach units _grp2;
		};
	};
}else{
	//If patrol is set to false, units will idle. Additionally you can set custom actions here:
	
};