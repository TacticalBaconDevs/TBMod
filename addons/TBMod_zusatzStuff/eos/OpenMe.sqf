EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";


if (isnil "server") then {hint "YOU MUST PLACE A GAME LOGIC NAMED SERVER!";};

eos_fnc_getunitpool= compile preprocessfilelinenumbers "eos\UnitPools.sqf";
call compile preprocessfilelinenumbers "eos\AI_Skill.sqf";

EOS_Deactivate = {
    params ["_mkr"];
    
    {
        _x setMarkerColor "colorblack";
        _x setMarkerAlpha 0;
    }
    foreach _mkr;
};


// TODO stacked
onplayerConnected {
    _eosMarkers=server getvariable "EOSmarkers";

    {
        _x setMarkerAlpha (MarkerAlpha _x);
        _x setMarkercolor (getMarkercolor _x);
    }
    forEach _eosMarkers;
};

/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";    // Colour of marker after completion
hostileColor="colorRed";    // Default colour when enemies active
bastionColor="colorOrange";    // Colour for bastion marker

null = [["EOS_00"],[4,1],[4,1],[0,0],[0],[0],[0,0],[3,1,550,EAST,FALSE]] call EOS_Spawn; // Mix 1
null = [["EOS_00"],[2,1],[4,1],[0,0],[0],[0],[0,0],[2,1,550,EAST,FALSE]] call EOS_Spawn; // Mix 2
null = [["EOS_00"],[2,1],[2,1],[0,0],[0],[0],[0,0],[6,1,550,EAST,FALSE]] call EOS_Spawn; // Spider

null = [["EOS_01"],[2,1],[5,0],[0,0],[0],[0],[0,0],[5,1,150,EAST,FALSE]] call EOS_Spawn; // Walker
null = [["EOS_01"],[0,0],[2,0],[0,0],[0],[0],[0,0],[6,1,150,EAST,FALSE]] call EOS_Spawn; // Spider

null = [["EOS_02"],[4,1],[4,1],[0,0],[0],[0],[0,0],[0,1,550,EAST,FALSE]] call EOS_Spawn; // Slow
null = [["EOS_02"],[4,1],[4,1],[0,0],[0],[0],[0,0],[1,1,550,EAST,FALSE]] call EOS_Spawn; // Medium
null = [["EOS_02"],[0,0],[4,0],[0,0],[0],[0],[0,0],[7,1,550,EAST,FALSE]] call EOS_Spawn; // Demons

null = [["EOS_03"],[0,0],[12,0],[0,0],[0],[0],[0,0],[10,1,550,EAST,FALSE]] call EOS_Spawn; // Mix 4

null = [["EOS_04"],[4,0],[6,0],[0,0],[0],[0],[0,0],[10,1,750,EAST,FALSE]] call EOS_Spawn; // Mix 4

null = [["EOS_05"],[3,0],[6,0],[0,0],[0],[0],[0,0],[3,1,750,EAST,FALSE]] call EOS_Spawn; // Mix 1


null = [["BAS_zone_0"],[4,1],[0,0],[0],[0,0],[3,1,EAST,TRUE],[240,2,360,TRUE,FALSE]] call Bastion_Spawn; // Walker

null = [["BAS_zone_1"],[8,1],[0,0],[0],[0,0],[0,1,EAST,TRUE],[60,6,600,TRUE,FALSE]] call Bastion_Spawn; // Slow
null = [["BAS_zone_1"],[3,1],[0,0],[0],[0,0],[1,1,EAST,TRUE],[180,6,900,TRUE,FALSE]] call Bastion_Spawn; // Medium
null = [["BAS_zone_1"],[6,1],[0,0],[0],[0,0],[5,1,EAST,TRUE],[600,6,900,TRUE,FALSE]] call Bastion_Spawn; // Walker
null = [["BAS_zone_1"],[6,0],[0,0],[0],[0,0],[1,1,EAST,TRUE],[660,6,1200,TRUE,FALSE]] call Bastion_Spawn; // Demons
null = [["BAS_zone_2"],[8,0],[0,0],[0],[0,0],[6,1,EAST,TRUE],[900,4,1200,TRUE,FALSE]] call Bastion_Spawn; // Spider
null = [["BAS_zone_2"],[4,1],[0,0],[0],[0,0],[5,1,EAST,TRUE],[90,4,9000,TRUE,FALSE]] call Bastion_Spawn; // Walker
null = [["BAS_zone_2"],[6,0],[0,0],[0],[0,0],[4,1,EAST,TRUE],[60,4,600,TRUE,FALSE]] call Bastion_Spawn; // Crawler

null = [["BAS_zone_3"],[4,1],[0,0],[0],[0,0],[10,1,EAST,TRUE],[240,6,600,TRUE,FALSE]] call Bastion_Spawn; // Mix 2