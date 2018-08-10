/*
                ***        ARMA3Alpha REINFORCEMENT CHOPPER SCRIPT v3.5 - by SPUn / Kaarto Media    ***
                        Position search parameters fix by -=XTRA=-
    
                Spawns chopper which transports infantry group to position and leaves after that
                
        Calling the script:
        
            default:         nul = [this] execVM "LV\reinforcementChopper.sqf";
            custom:         nul = [spot,exact,side,type,captive,patrol,target,direction,distance,precise,
                                cycle,groupSize,skills,smoke,group,custom init,ID,MP,doors,classes] execVM "LV\reinforcementChopper.sqf";
                                
    Parameters:
    
    spot     =     landing spot     (name of marker or object or unit, or position array)                                     DEFAULT: this
    exact     =     true or false     (true = tries landing exactly on *spot, false = finds place where it fits)                 DEFAULT: true
    side     =     1 or 2 or 3        (1 = west, 2 = east, 3 = independent)                                                    DEFAULT: 2
    type     =     number (0 - X)    (Depends on config)                                                                        DEFAULT: 0
                1 = first element in config array
                0 = random
    captive =     true/false         (if true, enemies wont notice them before chopper has landed)                             DEFAULT: false
    patrol     =     true/false         (if false, units wont patrol in any way <- handy if you set (group player) as *group)     DEFAULT: true
    target     =     patrol target     (patrolling target for infantry group, options:                                            DEFAULT: player
                                unit     =     units name, ex: enemyunit1
                                marker     =     markers' name, ex: "marker01" (remember quotes with markers!)
                                marker array = array of markers in desired order, ex: ["marker01","marker02","marker03"]
                                group    =     groups name, ex: (group enemy1)    OR BlueGroup17
                                group array, ex: [(group player), (group blue2)]
                                ["PATROL",center position,radius] = uses patrol-vD.sqf, ex: ["PATROL",(getPos player),150]
    direction     =     "random" or 0-360 (direction where chopper comes from, use quotes with random!)                                     DEFAULT: "random"
    distance     =     number (from how far KA60 comes from)                                                                                 DEFAULT: 1500
    precise     =     true or false (true = heli will land even in middle of war, false = heli might have air fights etc before landing)     DEFAULT: true
    cycle         =     true or false (if true and target is array of markers, unit will cycle these markers)                                 DEFAULT: false
    groupSize     =     1-8 (infantry groups' size)                                                                                         DEFAULT: 8
    skills         =     "default"     (default AI skills)                                                                                     DEFAULT: "default"
                or    number    =    0-1.0 = this value will be set to all AI skills, ex: 0.8
                or    array    =    all AI skills invidiually in array, values 0-1.0, order:
                        [aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 
                        ex:     [0.75,0.5,0.6,0.85,0.9,1,1,0.75,1,1]                     
    smoke        =    [LZ smoke, cover smokes, flare, chemlights] (if chopper uses these on landing spot)                                    DEFAULT: [false,false,false,false]
    group         =     group name OR nil (if you want units in existing group, set it here. if this is left empty, new group is made)         DEFAULT: nil
    custom init =     "init commands" (if you want something in init field of units, put it here)                                         DEFAULT: nil
                    NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST use ' or "" instead of ",
                         ex: "hint 'this is hint';"
    ID             =     number (if you want to delete units this script creates, you'll need ID number for them)                            DEFAULT: nil
    MP            =     true/false    true = 'landing spot' will automatically be one of alive non-captive players                            DEFAULT: false
    doors        =    true/false    true = units will close doors behind them while patrolling                                                DEFAULT: false
    classes        =    array    (classes from config_aissp.hpp, defines which unit classnames are being used)                                DEFAULT: ["ALL"]
    
    EXAMPLE:     nul = [player,false,2,3,false,true,player,"random",1000,true,false,8,0.75,[false,true,false,true],nil,nil,33,false,false,["ALL"]] execVM "LV\reinforcementChopper.sqf";
*/
if (!isServer)exitWith{};
private ["_BLUmen3","_mp","_smoke","_choppers","_OPFarrays","_BLUarrays","_INDgrp","_INDhq","_INDmen","_OPFmen2","_BLUmen2","_captive","_patrol","_heliT","_chopperTypes","_chopperType","_setInit2","_setInit","_c0","_customInit","_tPos","_exactPos","_skls","_skills","_grpSize","_cycle","_precise","_man2","_direction","_distance","_targetM","_i2","_heliPad","_targetPos","_side","_targetMarker","_BLUmen","_OPFmen","_men","_hq","_grp1","_grp2","_man1","_man","_dir","_range","_pos","_heli","_vehSpots","_i","_wp1","_input","_logic","_isActivated"];

private ["_tMarker","_mGroup","_smoo1","_smoo2","_smoo3","_smoo4","_classModule","_classModuleFilters"];

_tPos = param [0];
_exactPos = param [1,true];
_side = param [2,2];
_chopperType = param [3,0];
_captive = param [4,false];
_patrol = param [5,true];
_targetMarker = param [6,player];
_direction = param [7,"random"];
_distance = param [8,1500];
_precise = param [9,true];
_cycle = param [10,false];
_grpSize = param [11,8];
_skills = param [12,"default"];
_smoke = param [13,[false,false,false,false]];//[_smoo1,_smoo2,_smoo3,_smoo4];
_grp2 = param [14,nil];
//if(!isNil "_grp2")then{if(_grp2 == "nil")then{_grp2 = nil;};};
_customInit = param [15,nil];
if(!isNil "_customInit")then{if(_customInit == "nil")then{_customInit = nil;};};
_grpId = param [16,nil];
_mp = param [17,false];
_doorHandling = param [18,false];
_classModuleFilters = param [19,["ALL"]];

if(_mp)then{if(isNil("LV_GetPlayers"))then{LV_GetPlayers = compile preprocessFile "\TBMod_zusatzStuff\LV\functions\LV_fnc_getPlayers.sqf";};};

if(_mp)then{
    _tPos = call LV_GetPlayers;
    _targetPos = getPos (selectRandom _tPos);
}else{
    //Check if spot is marker, object, or position array:
    if(_tPos in allMapMarkers)then{
        _targetPos = getMarkerPos _tPos;
    }else{
        if (typeName _tPos == "ARRAY") then{
            _targetPos = _tPos;
        }else{
            _targetPos = getPos _tPos;
        };
    };
};

//LZ smoke
if((_smoke select 0))then{
    [_targetPos,_distance] spawn {
        private["_targetPos","_a","_timesLimit","_distance"];
        _targetPos = _this select 0;
        _distance = _this select 1;
        _a = 0;
        _timesLimit = ceil(_distance / 1000);
        while{_a < _timesLimit}do{
            _smoke1 = "SmokeShellGreen" createVehicle _targetPos;
            sleep 50;
            _a = _a + 1;
        };
    };
};

//Prepare functions:
if(isNil("LV_classnames"))then{LV_classnames = compile preprocessFile "LV\LV_functions\LV_fnc_classnames.sqf";};
if(isNil("LV_validateClassArrays"))then{LV_validateClassArrays = compile preprocessFile "LV\LV_functions\LV_fnc_validateClassArrays.sqf";};
if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV\LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_RandomSpot"))then{LV_RandomSpot = compile preprocessFile "LV\LV_functions\LV_fnc_randomSpot.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV\LV_functions\LV_fnc_vehicleInit.sqf";};

_choppers = ([_classModuleFilters,[(_side), 3]] call LV_classnames);

_chopperTypes = [];

//Side related group creation:
switch(_side)do{
    case 1:{
        _hq = createCenter west;
        _grp1 = createGroup west;
        if(isNil("_grp2"))then{_grp2 = createGroup west;}else{_grp2 = _grp2;};
    };
    case 2:{
        _hq = createCenter east;
        _grp1 = createGroup east;
        if(isNil("_grp2"))then{_grp2 = createGroup east;}else{_grp2 = _grp2;};
    };
    case 3:{
        _hq = createCenter resistance;
        _grp1 = createGroup resistance;
        if(isNil("_grp2"))then{_grp2 = createGroup resistance;}else{_grp2 = _grp2;};
    };
};

_chopperTypes = [_choppers] call LV_validateClassArrays;
if((count _chopperTypes) == 0)then{
    _chopperTypes = ([[],[(_side), 3]] call LV_classnames);
};
_chopperTypes = selectRandom _chopperTypes;

_men = ([_classModuleFilters,[(_side), 6]] call LV_classnames);
_men = [_men] call LV_validateClassArrays;
if((count _men) == 0)then{
    _men = ([[],[(_side), 6]] call LV_classnames);
};
_men = selectRandom _men;

//If *exact* is false, find landing spot which is not close another ones: //THIS block is fixed by GITS, now choppers should land!//yet another fix by SPUn
if(!_exactPos)then{
    if(isNil("REKA60padArray"))then{REKA60padArray = [];};
    _finding = 1;
    _ra = 0;//here
    while{_finding > 0}do{

            _tPos = [];
            while{count _tPos < 1}do{
                    //_spot = [_targetPos, _ra] call LV_RandomSpot;
                    //_tPos = _spot isFlatEmpty [12,-1,0.3,4,0,false,objnull];///here
                    _tPos = [_targetPos,0,(50+_ra),8,0,0.4,0] call BIS_fnc_findSafePos;
                    _ra = _ra + 10;//here
            };

            sleep 0.03;
            _targetPos = _tPos;
            _e1 = 0;
            _finding = 0;

            while{_e1<(count REKA60padArray)}do{
                    if(((REKA60padArray select _e1) distance _targetPos)<15)then{_finding = 1;};
                    _e1 = _e1 + 1;
            };
    };
    REKA60padArray set [(count REKA60padArray), _targetPos];
};

if(_chopperType == 0)then{
    _heliT = selectRandom _chopperTypes;
}else{
    _heliT = _chopperTypes select (_chopperType - 1);
};

_heliPad = createVehicle ["Land_helipadEmpty_F", _targetPos, [], 0, "NONE"]; 

if(typeName _direction == "STRING")then{_dir = random 360;}else{_dir = _direction;};
_range = _distance;
_pos = [(_targetPos select 0) + (sin _dir) * _range, (_targetPos select 1) + (cos _dir) * _range, 0];
_heli = createVehicle [_heliT, _pos, [], 0, "FLY"];

private ["_numCargo","_cfg"];
_cfg = (configFile >> "CfgVehicles" >> _heliT);
_numCargo = count("if ( isText(_x >> 'proxyType') && { getText(_x >> 'proxyType') isEqualTo 'CPCargo' } ) then {true};"configClasses ( _cfg >> "Turrets" )) + getNumber ( _cfg >> "transportSoldier" );

if(_grpSize > _numCargo)then{
    _vehSpots = _numCargo;
}else{
    _vehSpots = _grpSize;
};

_man1 = selectRandom _men;
_man = _grp1 createUnit [_man1, _pos, [], 0, "NONE"];
_man moveInDriver _heli;
_man setUnitRank "SERGEANT";
if(_precise)then{_man setBehaviour "CARELESS";};

[_man,_heli,_targetPos] spawn {
    private ["_man","_heli","_targetPos"];
    _man = _this select 0;
    _heli = _this select 1;
    _targetPos = _this select 2;
    waitUntil {sleep 1; !isNil "_man" && !isNil "_heli"};
    waitUntil {sleep 1; !alive _man || !canMove _heli || isNil "_man" || isNil "_heli"};
    if (true) exitWith {
        if (!isNil "_targetPos" && !isNil "REKA60padArray") then {
            if ((_heli distance _targetPos) > 50)then{REKA60padArray = REKA60padArray - [_targetPos];};
        };
        if(_heli distance _targetPos > 200)then{
            sleep 15;
            deleteVehicle _man;
            sleep 15;
            deleteVehicle _heli;
        };
    };
};

_i = 1; 
for "_i" from 1 to _vehSpots do {
    _man1 = selectRandom _men;
    _man2 = _grp2 createUnit [_man1, _pos, [], 0, "NONE"];
    if(typeName _skills != "STRING")then{_skls = [_man2,_skills] call LV_ACskills;};
    _man2 moveInCargo _heli;
    if(!isNil("_customInit"))then{ 
        [_man2,_customInit] spawn LV_vehicleInit;
    };
};
if((_vehSpots == 0)&&(_grpSize > 0))then{
    _man1 = selectRandom _men;
    _man2 = _grp2 createUnit [_man1, _pos, [], 0, "NONE"];
    if(typeName _skills != "STRING")then{_skls = [_man2,_skills] call LV_ACskills;};
    _man2 moveInTurret [_heli, [0]];
    if(!isNil("_customInit"))then{ 
        [_man2,_customInit] spawn LV_vehicleInit;
    }; 
};

if(!isNil("_grpId"))then{
    call compile format ["LVgroup%1 = _grp2",_grpId];
};

if(_captive)then{
    { _x setCaptive true; }forEach units _grp1;
    { _x setCaptive true; }forEach units _grp2;
};

_heli doMove _targetPos;
while { _heli distance _targetPos > 260 } do { sleep 4; };
(driver _heli) setBehaviour "CARELESS";
//while {!(unitReady _heli)}do{sleep 2;};
doStop _heli;
_heli disableAI "TARGET";_heli disableAI "AUTOTARGET";_heli allowFleeing 0;_heli setBehaviour "CARELESS";
_heli land "LAND"; //you can also try "GET OUT" (then it wont land, only hovers)
while { (getPos _heli) select 2 > 7 } do { sleep 2; };
_heli setFuel 0;

if((_smoke select 1))then{//Cover smoke
    [_targetPos,_heli] spawn {
        private["_targetPos","_a","_dir","_heli"];
        _targetPos = _this select 0;
        _heli = _this select 1;
        _dir = 0;
        _a = 0;
        while{_a < 16}do{
            _sPos = [((getPos _heli) select 0) + (sin _dir) * 12, ((getPos _heli) select 1) + (cos _dir) * 12, ((getPos _heli) select 2)];
            _smoke1 = "SmokeShell" createVehicle _sPos;
            _a = _a + 1;
            _dir = _dir + (360 / 16);
        };
    };
};
if((_smoke select 2))then{//Flare
    [_heli] spawn {
        private["_heli"];
        _heli = _this select 0;
        _flare = "F_40mm_Red" createVehicle [(getPos _heli) select 0,(getPos _heli) select 1,0];
    };
};
if((_smoke select 3))then{//Chemlights
        [_targetPos,_heli] spawn {
        private["_targetPos","_a","_dir","_heli"];
        _targetPos = _this select 0;
        _heli = _this select 1;
        _dir = 0;
        _a = 0;
        while{_a < 8}do{
            _sPos = [((getPos _heli) select 0) + (sin _dir) * 12, ((getPos _heli) select 1) + (cos _dir) * 12, ((getPos _heli) select 2)];
            _smoke1 = "Chemlight_red" createVehicle _sPos;
            _a = _a + 1;
            _dir = _dir + (360 / 8);
        };
    };
};

while { (getPos _heli) select 2 > 1 } do { sleep 1; };

if(_captive)then{
    { _x setCaptive false; }forEach units _grp1;
    { _x setCaptive false; }forEach units _grp2;
};

_grp2 leaveVehicle _heli;
{
    unassignVehicle _x;
    doGetOut _x; 
    _x setBehaviour "AWARE";
} forEach units _grp2;
_grp2 setCombatMode "RED";
while { (count (crew _heli)) > 1 } do { sleep 2;  };
_heli doMove _pos;

if(alive _heli)then{_heli setFuel 1;};

if(_patrol)then{
    if(typeName _targetMarker == "ARRAY")then{ //TARGET is array
        if((!((_targetMarker select 0) in allMapMarkers))&&(!((_targetMarker select 0) in allGroups)))then{
            if((typeName (_targetMarker select 0)) == "STRING")then{
                if((_targetMarker select 0) == "PATROL")then{ ////USE patrol-vD.sqf
                    {
                        _cPosition = _targetMarker select 1;
                        _cRadius = _targetMarker select 2;
                        nul = [_x,_cPosition,_cRadius,_doorHandling] execVM "LV\patrol-vD.sqf";
                    }forEach units _grp2;
                };
            };
        }else{ //TARGET is array of Markers or Groups
            { 
                _x setVariable ["target0",_targetMarker,false];
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
        if(_targetMarker in allMapMarkers)then{ /////TARGET is single Marker
            { _x doMove getMarkerPos _targetMarker; } forEach units _grp2;
        }else{
                { ////TARGET is single Unit/Object
                    _x setVariable ["target0",_targetMarker,false];
                    _x setVariable ["mDis0", 1000, false];
                    nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
                }forEach units _grp2;
        };
    };
}else{
    //If patrol is set to false, units will idle. Additionally you can set custom actions here:
    
};

while { (_heli distance _pos > 200) } do { sleep 4; };

if((!_exactPos)&&((_heli distance _targetPos) > 50))then{REKA60padArray = REKA60padArray - [_targetPos];};

if((_heli distance _pos < 200))exitWith{
    deleteVehicle _man;
    deleteVehicle _heli;
    waituntil {sleep 1;(count units _grp1)==0};
    deletegroup _grp1; 
};

//};