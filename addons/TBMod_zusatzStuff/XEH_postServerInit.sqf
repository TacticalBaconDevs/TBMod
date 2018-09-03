/*
    Author: Willi "shukari" Graff
*/

if !(call TB_fnc_isTBMission) exitWith {};

if (isNil "tb_server") then
{
    tb_server = createVehicle ["Land_PenBlack_F", [0,0,0], [], 0, "CAN_COLLIDE"];
    [tb_server, false] remoteExec ["enableSimulationGlobal", 2];
    [tb_server, true] remoteExec ["hideObjectGlobal", 2];
    publicVariable "tb_server";
};

// INFANTRY SKILL
_InfskillSet = [
    0.25,        // aimingAccuracy
    0.45,        // aimingShake
    0.6,        // aimingSpeed
    0.4,         // spotDistance
    0.4,        // spotTime
    1,        // courage
    1,        // reloadSpeed
    1,        // commanding
    1        // general
];

// ARMOUR SKILL
_ArmSkillSet = [
    0.25,        // aimingAccuracy
    0.45,        // aimingShake
    0.6,        // aimingSpeed
    0.4,         // spotDistance
    0.4,        // spotTime
    1,        // courage
    1,        // reloadSpeed
    1,        // commanding
    1        // general
];

// LIGHT VEHICLE skill
_LigSkillSet = [
    0.25,        // aimingAccuracy
    0.45,        // aimingShake
    0.6,        // aimingSpeed
    0.4,         // spotDistance
    0.4,        // spotTime
    1,        // courage
    1,        // reloadSpeed
    1,        // commanding
    1        // general
];

// HELICOPTER SKILL
_AIRskillSet = [
    0.25,        // aimingAccuracy
    0.45,        // aimingShake
    0.6,        // aimingSpeed
    0.4,         // spotDistance
    0.4,        // spotTime
    1,        // courage
    1,        // reloadSpeed
    1,        // commanding
    1        // general
];

// STATIC SKILL
_STAskillSet = [
    0.25,        // aimingAccuracy
    0.45,        // aimingShake
    0.6,        // aimingSpeed
    0.4,         // spotDistance
    0.4,        // spotTime
    1,        // courage
    1,        // reloadSpeed
    1,        // commanding
    1        // general
];

tb_server setVariable ["INFskill",_InfskillSet,true];
tb_server setVariable ["ARMskill",_ArmSkillSet,true];
tb_server setVariable ["LIGskill",_LigSkillSet,true];
tb_server setVariable ["AIRskill",_AIRskillSet,true];
tb_server setVariable ["STAskill",_STAskillSet,true];

EOS_Deactivate = {
    params ["_mkr"];
    
    {
        _x setMarkerColor "colorblack";
        _x setMarkerAlpha 0;
    }
    forEach _mkr;
};

addMissionEventHandler ["PlayerConnected",
{
    {
        _x setMarkerAlpha (MarkerAlpha _x);
        _x setMarkercolor (getMarkercolor _x);
    }
    forEach (tb_server getvariable ["EOSmarkers", []]);
}];

/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call TB_EOS_fnc_spawn;
 [["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call TB_EOS_fnc_spawn;

EXAMPLE CALL - BASTION
 [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call TB_EOS_fnc_bastionSpawn;
 [["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call TB_EOS_fnc_bastionSpawn;
*/
VictoryColor="colorGreen";    // Colour of marker after completion
hostileColor="colorRed";    // Default colour when enemies active
bastionColor="colorOrange";    // Colour for bastion marker

[
    ["EOS_00"],
    [4,1],
    [4,1],
    [0,0],
    [0],
    [0],
    [0,0],
    [0,0,550,EAST,FALSE]
] spawn TB_EOS_fnc_spawn;

[
    ["BAS_zone_0"],
    [4,1],
    [0,0],
    [0],
    [0,0],
    [0,0,EAST,TRUE], // [FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT]
    [5,10,60,TRUE,FALSE] // [INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]
] spawn TB_EOS_fnc_bastionSpawn;

// [["EOS_00"],[2,1],[4,1],[0,0],[0],[0],[0,0],[2,1,550,EAST,FALSE]] call TB_EOS_fnc_spawn; // Mix 2
// [["EOS_00"],[2,1],[2,1],[0,0],[0],[0],[0,0],[6,1,550,EAST,FALSE]] call TB_EOS_fnc_spawn; // Spider

// [["EOS_01"],[2,1],[5,0],[0,0],[0],[0],[0,0],[5,1,150,EAST,FALSE]] call TB_EOS_fnc_spawn; // Walker
// [["EOS_01"],[0,0],[2,0],[0,0],[0],[0],[0,0],[6,1,150,EAST,FALSE]] call TB_EOS_fnc_spawn; // Spider

// [["EOS_02"],[4,1],[4,1],[0,0],[0],[0],[0,0],[0,1,550,EAST,FALSE]] call TB_EOS_fnc_spawn; // Slow
// [["EOS_02"],[4,1],[4,1],[0,0],[0],[0],[0,0],[1,1,550,EAST,FALSE]] call TB_EOS_fnc_spawn; // Medium
// [["EOS_02"],[0,0],[4,0],[0,0],[0],[0],[0,0],[7,1,550,EAST,FALSE]] call TB_EOS_fnc_spawn; // Demons

// [["EOS_03"],[0,0],[12,0],[0,0],[0],[0],[0,0],[10,1,550,EAST,FALSE]] call TB_EOS_fnc_spawn; // Mix 4

// [["EOS_04"],[4,0],[6,0],[0,0],[0],[0],[0,0],[10,1,750,EAST,FALSE]] call TB_EOS_fnc_spawn; // Mix 4

// [["EOS_05"],[3,0],[6,0],[0,0],[0],[0],[0,0],[3,1,750,EAST,FALSE]] call TB_EOS_fnc_spawn; // Mix 1


 // Walker

// [["BAS_zone_1"],[8,1],[0,0],[0],[0,0],[0,1,EAST,TRUE],[60,6,600,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Slow
// [["BAS_zone_1"],[3,1],[0,0],[0],[0,0],[1,1,EAST,TRUE],[180,6,900,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Medium
// [["BAS_zone_1"],[6,1],[0,0],[0],[0,0],[5,1,EAST,TRUE],[600,6,900,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Walker
// [["BAS_zone_1"],[6,0],[0,0],[0],[0,0],[1,1,EAST,TRUE],[660,6,1200,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Demons
// [["BAS_zone_2"],[8,0],[0,0],[0],[0,0],[6,1,EAST,TRUE],[900,4,1200,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Spider
// [["BAS_zone_2"],[4,1],[0,0],[0],[0,0],[5,1,EAST,TRUE],[90,4,9000,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Walker
// [["BAS_zone_2"],[6,0],[0,0],[0],[0,0],[4,1,EAST,TRUE],[60,4,600,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Crawler

// [["BAS_zone_3"],[4,1],[0,0],[0],[0,0],[10,1,EAST,TRUE],[240,6,600,TRUE,FALSE]] call TB_EOS_fnc_bastionSpawn; // Mix 2
