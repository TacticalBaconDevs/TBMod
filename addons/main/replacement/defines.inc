#define TEXT_DOOR_CLOSED                        (localize "STR_a3_to_editTerrainObject21")
#define TEXT_DOOR_OPENED                        (localize "STR_a3_to_editTerrainObject22")
#define TEXT_DOOR_LOCKED                        (localize "STR_a3_to_editTerrainObject23")

#define STATE_UNDEFINED                            -1
#define STATE_UNDAMAGED                            0
#define STATE_DAMAGED1                            1
#define STATE_DAMAGED2                            2
#define STATE_DAMAGED3                            3
#define STATE_DESTROYED                            4
#define STATE_HIDDEN                            5

#define WARNING_3DEN(text)                        [text,1,(count text)/15 + 1] call bis_fnc_3DENNotification;["[x] %1",text] call bis_fnc_logFormat
#define DISTANCE_DETECTION                        25
#define DISTANCE_HIGHLIGHT                        50

#define COLOR_HIGHLIGHT                            [1,0,1,1]
#define COLOR_DISABLED                            [0.8,0.8,0.8,0.8]

#define COLOR_DOOR_CLOSED                        COLOR_DISABLED
#define COLOR_DOOR_OPENED                        COLOR_HIGHLIGHT
#define COLOR_DOOR_LOCKED                        COLOR_HIGHLIGHT            //[1,0.2,0.2,1]

#define ICON3D_DOOR_CLOSED                        "\A3\Modules_F\Data\EditTerrainObject\icon3d_doorClosed32_ca.paa"
#define ICON3D_DOOR_OPENED                        "\A3\Modules_F\Data\EditTerrainObject\icon3d_doorOpened32_ca.paa"
#define ICON3D_DOOR_LOCKED                        "\A3\Modules_F\Data\EditTerrainObject\icon3d_doorLocked32_ca.paa"

#define TEXTURE_DOOR_CLOSED                        "\A3\Modules_F\Data\EditTerrainObject\textureDoor_closed_ca.paa"
#define TEXTURE_DOOR_OPENED                        "\A3\Modules_F\Data\EditTerrainObject\textureDoor_opened_ca.paa"
#define TEXTURE_DOOR_LOCKED                        "\A3\Modules_F\Data\EditTerrainObject\textureDoor_locked_ca.paa"

#define MAP_TYPES_BUILDING                        ["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"]
#define MAP_TYPES_VEGETATION                    ["TREE","SMALL TREE","BUSH"]
#define MAP_TYPES_WALL                            ["WALL","FENCE"]
#define MAP_TYPES_MISC                            ["ROCK","ROCKS","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","CROSS","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE","QUAY","HIDE","BUSSTOP","ROAD","FOREST","TRANSMITTER","STACK","TOURISM","WATERTOWER","TRACK","MAIN ROAD","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","TRAIL"]

#define BUILDING_UNKNOWN                        -1
#define BUILDING_PARENT                            0
#define BUILDING_CHILD                            1

#define DOOR_INDEX_MIN                            1
#define DOOR_INDEX_MAX                            24
#define DOOR_ROWS                                3
#define DOOR_COLUMNS                            8
#define DOOR_FLAGS_EMPTY                        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

#define DOOR_STATE_CLOSED                        0        //ctrl
#define DOOR_STATE_LOCKED                        1        //shift
#define DOOR_STATE_OPENED                        2        //alt

#define INSTANT_ANIMATE_DOORS_3DEN                false

/*
#define SET_OBJVAR(object,variable,value)        (object setVariable [variable,value, true])
#define GET_OBJVAR(object,variable,defvalue)    (object getVariable [variable,defvalue])
*/

#define SET_OBJVAR(object,variable,value)        (missionNamespace setVariable [str object + variable,value, true])
#define GET_OBJVAR(object,variable,defvalue)    (missionNamespace getVariable [str object + variable,defvalue])

#define SETUP_DOOR(building,id,state)\
building setVariable [format ["bis_disabled_door_%1", id + 1], [0,1,0] select state, true];\
building animateSource [format ["door_%1_sound_source", id + 1], [0,0,1] select state, true];\
building animateSource [format ["door_%1_noSound_source", id + 1], [0,0,1] select state, true];

#define SETUP_DOOR_PREVIEW(building,id,state)\
building animateSource [format ["door_%1_sound_source", id + 1], [0,0,1] select state, false];\
building animateSource [format ["door_%1_noSound_source", id + 1], [0,0,1] select state, false];