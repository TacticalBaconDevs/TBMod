#define AAR_VERSION        1.02
#define GUI_MAP            (_display displayctrl 2201)
#define GUI_BACKGROUND        (_display displayctrl 1000)
#define GUI_TIMELINE        (_display displayctrl 1900)
#define GUI_TOP            (_display displayctrl 1100)
#define GUI_LIST_MISSIONS    (_display displayctrl 2100)
#define GUI_LIST_SESSIONS    (_display displayctrl 2101)
#define GUI_IDC            (_display displayctrl _idc)
#define PROFILE_AAR_VARNAME    "BIS_fnc_diagAAR_data"
#define PROFILE_AAR        (profilenamespace getvariable [PROFILE_AAR_VARNAME,[]])

#define ID_META_VERSION        0
#define ID_META_SEED        1
#define ID_META_PLAYER        2
#define ID_META_PLAYERNAME    3
#define ID_META_UNITS        4
#define ID_META_DELAY        5

#define ID_VAR_UNIT        0
#define ID_TYPEOF        1
#define ID_SIDE            2
#define ID_DAMAGE        3
#define ID_POSITION        4
#define ID_DIRECTION        5
#define ID_COMMANDER        6

#define RGB_SELECTED        1,0,0
#define RGB_DISABLED        0,0,0
#define COLOR_SELECTED        [RGB_SELECTED,1]
#define COLOR_SELECTED_FADED    [RGB_SELECTED,0.1]
#define COLOR_DISABLED        [RGB_DISABLED,0.4]
#define COLOR_DISABLED_FADED    [RGB_DISABLED,0.05]
#define COLOR_DEATH        [0,0,0,1]
#define ICON_SIZE        32

//--- Function called before display - create display and terminate
if (count _this == 0) exitwith {createdialog "RscDisplayAAR"};

disableserialization;
_mode = _this param [0,"Init",[displaynull,"",0]];
_this = _this param [1,[]];

switch _mode do {


    case "Init": {
        _display = _this select 0;

        //--- UI Event Handlers
        _display displayaddeventhandler ["keydown","['Display_keydown',_this] call bis_fnc_diagAAR;"];
        GUI_TIMELINE ctrladdeventhandler ["SliderPosChanged","['Timeline_sliderposchanged',_this] call bis_fnc_diagAAR;"];
        GUI_LIST_MISSIONS ctrladdeventhandler ["lbselchanged","['ListMissions_lbselchanged',_this] call bis_fnc_diagAAR;"];
        GUI_LIST_SESSIONS ctrladdeventhandler ["lbselchanged","['ListSessions_lbselchanged',_this] spawn bis_fnc_diagAAR;"];
        GUI_MAP ctrladdeventhandler ["draw","['draw',_this] call bis_fnc_diagAAR;"];

        //--- Display meta data
        GUI_TOP ctrlsetstructuredtext parsetext format [
            "<t align='right' color='#88ffffff' font='PuristaLight'>Splendid <t color='#ff0000'>AAR</t> <t size='0.65'>v%1</t></t>",
            AAR_VERSION
        ];

        //--- Init variables
        BIS_fnc_diagAAR_showLabels = 0;

        ["Init_List",[_display]] call bis_fnc_diagAAR;
    };

    //--- Init
    case "Init_List": {

        //--- GUI Init
        _display = _this select 0;
        _diagAAR = PROFILE_AAR;

        //--- No data found - terminate
        if (count _diagAAR == 0) exitwith {
            _display closedisplay 2;
            "No AAR recordings found" spawn bis_fnc_errorMsg;
        };

        //--- Load missions
        lbclear GUI_LIST_MISSIONS;
        lbclear GUI_LIST_SESSIONS;
        for "_i" from 0 to (count _diagAAR - 1) step 3 do {
            if (_i < count _diagAAR) then { //--- ToDo: Investigate overflow
                _missionMeta = _diagAAR select (_i + 1);
                _missionWorld = _missionMeta select 0;
                if (_missionWorld == worldname) then {
                    _add = GUI_LIST_MISSIONS lbadd format ["%1.%2",_diagAAR select _i,_missionWorld];
                    GUI_LIST_MISSIONS lbsetvalue [_add,_i]
                };
            };
        };

        //--- No data found for current world - terminate
        if (lbsize GUI_LIST_MISSIONS == 0) exitwith {
            _display closedisplay 2;
            ["No AAR recordings found for world '%1'",worldname] spawn bis_fnc_errorMsg;
        };

        //--- Select first item
        lbsort GUI_LIST_MISSIONS;
        GUI_LIST_MISSIONS lbsetcursel 0;
    };


    //--- Pressed keys
    case "Display_keydown": {
        _display = _this select 0;
        _key = _this select 1;
        _shift = _this select 2;
        _result = false;
        //_key call bis_fnc_log;

        switch _key do {

            //--- Escape
            case 1: {
                [_display] spawn {
                    disableserialization;
                    cuttext ["","black in",0.01];
                    _result = (["Do you really want to quit AAR?",nil,"Yes","No"] call bis_fnc_guimessage); //--- ToDo: Localize
                    if (_result) then {
                        (_this select 0) closedisplay 2;
                    };
                };
                _result = true;
            };

            //--- I (Info)
            case 23: {
                BIS_fnc_diagAAR_showLabels = (BIS_fnc_diagAAR_showLabels + 1) % 4;
            };

            //--- Space
            case 57: {
                BIS_fnc_diagAAR_stepAdd = if (BIS_fnc_diagAAR_stepAdd > 0) then {0} else {1};
                _stepAdd = BIS_fnc_diagAAR_stepAdd;
                GUI_BACKGROUND ctrlsettextcolor ([[0,0,0,0.3],[0,0,0,1]] select _stepAdd);
                GUI_BACKGROUND ctrlcommit 0.2;
                _result = true;
            };

            //--- Delete
            case 211: {
                if (_shift) then {
                    //--- Delete all sessions in mission
                    [_display] spawn {
                        disableserialization;
                        _display = _this select 0;
                        cuttext ["","black in",0.01];
                        _result = ([format ["Do you really want to delete all recordings for mission '%1'?",GUI_LIST_MISSIONS lbtext (lbcursel GUI_LIST_MISSIONS)],nil,nil,["Yes","No"]] call bis_fnc_guimessage) select 0;
                        if (_result) then {
                            _diagAAR = PROFILE_AAR;
                            _missionId = (lbcursel GUI_LIST_MISSIONS) * 3;
                            _missionArray = _diagAAR select (_missionId + 2);
                            _diagAAR set [_missionId + 0,"DELETE"];
                            _diagAAR set [_missionId + 1,"DELETE"];
                            _diagAAR set [_missionId + 2,"DELETE"];
                            _diagAAR = _diagAAR - ["DELETE"];
                            profilenamespace setvariable [PROFILE_AAR_VARNAME,_diagAAR];

                            //--- Refresh
                            ["Init_List",[_display]] call bis_fnc_diagAAR;
                        };
                    };
                } else {
                    //--- Delete current session
                    [_display] spawn {
                        disableserialization;
                        _display = _this select 0;
                        cuttext ["","black in",0.01];
                        _result = ([format ["Do you really want to delete recording '%1'?",GUI_LIST_SESSIONS lbtext (lbcursel GUI_LIST_SESSIONS)],nil,nil,["Yes","No"]] call bis_fnc_guimessage) select 0;
                        if (_result) then {
                            _diagAAR = PROFILE_AAR;
                            _recordID = (lbcursel GUI_LIST_SESSIONS);
                            _missionId = (lbcursel GUI_LIST_MISSIONS) * 3;
                            _missionArray = _diagAAR select (_missionId + 2);

                            _missionArray set [_recordID,"DELETE"];
                            _missionArray = _missionArray - ["DELETE"];
                            _diagAAR set [_missionId + 2,_missionArray];

                            //--- Refresh
                            ["Init_List",[_display]] call bis_fnc_diagAAR;
                        };
                    };
                };
            };
        };
        _result
    };

    //--- Timeline slider moved
    case "Timeline_sliderposchanged": {
        _sliderPos = (_this select 1) / 10;
        BIS_fnc_diagAAR_step = round (((BIS_fnc_diagAAR_stepCount - 1) * _sliderPos) - 1) max 0;
        BIS_fnc_diagAAR_stepForced = true;
    };

    //--- Mission listbox
    case "ListMissions_lbselchanged": {
        _ctrl = _this select 0;
        _display = ctrlparent _ctrl;
        _diagAAR = PROFILE_AAR;

        _missionId = (GUI_LIST_MISSIONS lbvalue (lbcursel GUI_LIST_MISSIONS));
        _missionName = _diagAAR select (_missionId);
        _missionArray = +(_diagAAR select (_missionId + 2));

        if (count _missionArray == 0) exitwith {["No AAR recordings found for mission '%1'",_missionName] spawn bis_fnc_errorMsg;};

        lbclear GUI_LIST_SESSIONS;
        for "_i" from 0 to (count _missionArray - 1) do {
            _recordArray = _missionArray select (_i);
            _recordMeta = _recordArray select 0;
            _recordPlayerName = _recordMeta select ID_META_PLAYERNAME;

            _add = GUI_LIST_SESSIONS lbadd (_recordPlayerName + " " + str _i);
            GUI_LIST_SESSIONS lbsetvalue [_add,_i];
        };
        //lbsort GUI_LIST_SESSIONS;
        GUI_LIST_SESSIONS lbsetcursel (lbsize GUI_LIST_SESSIONS - 1);

        //--- Analyze and visualize paths
        BIS_fnc_diagAAR_mapInit = [];
        _posFirst = [];
        {
            _recordArray = _x;
            _recordMeta = _recordArray select 0;
            _recordVersion = _recordMeta select ID_META_VERSION;
            _recordSeed = _recordMeta select ID_META_SEED;
            _recordPlayer = _recordMeta select ID_META_PLAYER;
            _recordPlayerName = _recordMeta select ID_META_PLAYERNAME;
            _recordUnits = _recordMeta select ID_META_UNITS;
            _recordDelay = _recordMeta select ID_META_DELAY;

            //--- Remove recording meta
            _recordArray set [0,-1];
            _recordArray = _recordArray - [-1];
            _recordArrayCount = count _recordArray;

            _recordMap = [];

            _posOld = [];
            {
                _step = _foreachindex;
                _stepTime = _x select 0;
                _record = _x select 1;

                _var = _record select 0;
                if (_var == _recordPlayer) then {
                    _pos = _record select ID_POSITION;
                    _dir = _record select ID_DIRECTION;

                    //--- Save paths
                    if (count _posOld > 0) then {

                        _colorLine = if (count _posOld == 4) then {_posOld resize 3; COLOR_SELECTED_FADED} else {COLOR_SELECTED};

                        //--- Lines between steps
                        _recordMap set [
                            count _recordMap,
                            [_posOld,_pos,_colorLine]
                        ];

                        //--- Static for too long?
                        if (_pos distance _posOld < 5) then {
                            _recordMap set [
                                count _recordMap,
                                [_pos,5,5,0,COLOR_SELECTED_FADED,"#(argb,8,8,3)color(1,1,1,1)"]
                            ];
                        };

                        //--- Detect end
                        if (_step == (count _recordArray - 1)) then {
                            _recordMap set [
                                count _recordMap,
                                [gettext (configfile >> "cfgmarkers" >> "mil_end" >> "icon"),COLOR_SELECTED,_pos,ICON_SIZE/2,ICON_SIZE/2,_dir+180,([_stepTime / 60,"HH:MM"] call bis_fnc_timetostring),false]
                            ];
                        };

                        //--- Death
                        _damage = _record select ID_DAMAGE;
                        if (_damage >= 1) then {
                            _recordMap set [
                                count _recordMap,
                                [gettext (configfile >> "CfgInGameUI" >> "MPTable" >> "Columns" >> "Killed" >> "picture"),COLOR_SELECTED,_pos,ICON_SIZE/2,ICON_SIZE/2,0,([_stepTime / 60,"HH:MM"] call bis_fnc_timetostring),false]
                            ];
                            _pos = _pos + [true];
                        };
                    } else {
                        //--- Start / Load
                        if (count _posFirst == 0) then {_posFirst = _pos;};
                        _recordMap set [
                            count _recordMap,
                            [gettext (configfile >> "cfgmarkers" >> "mil_start" >> "icon"),COLOR_SELECTED,_pos,ICON_SIZE/2,ICON_SIZE/2,_dir,([_stepTime / 60,"HH:MM"] call bis_fnc_timetostring),false]
                        ];
                    };
                    _posOld = _pos;
                };
            } foreach _recordArray;
            BIS_fnc_diagAAR_mapInit set [count BIS_fnc_diagAAR_mapInit,_recordMap];
        } foreach _missionArray;

        //--- Move map to init pos
        GUI_MAP ctrlmapanimadd [0,0.07,_posFirst];
        ctrlmapanimcommit GUI_MAP;
    };

    //--- Session listbox (initiate AAR)
    case "ListSessions_lbselchanged": {
        startloadingscreen [""];
        if (isnil "BIS_fnc_diaAAR_sessionID") then {BIS_fnc_diaAAR_sessionID = -1;};
        BIS_fnc_diaAAR_sessionID = BIS_fnc_diaAAR_sessionID + 1;
        _sessionId = BIS_fnc_diaAAR_sessionID;

        _ctrl = _this select 0;
        _display = ctrlparent _ctrl;
        _diagAAR = PROFILE_AAR;

        ctrlsetfocus GUI_MAP;

        //--- Get mission
        _missionId = (GUI_LIST_MISSIONS lbvalue (lbcursel GUI_LIST_MISSIONS));
        _missionName = _diagAAR select (_missionId);
        _missionMeta = _diagAAR select (_missionId + 1);
        _missionArray = +_diagAAR select (_missionId + 2);

        //--- Get recording
        _recordID = (lbcursel GUI_LIST_SESSIONS);
        _recordArray = _missionArray select (_recordID);
        _recordArrayCount = count _recordArray;

        //--- Get recording meta
        _recordMeta = _recordArray select 0;
        _recordVersion = _recordMeta select ID_META_VERSION;
        _recordSeed = _recordMeta select ID_META_SEED;
        _recordPlayer = _recordMeta select ID_META_PLAYER;
        _recordPlayerName = _recordMeta select ID_META_PLAYERNAME;
        _recordUnits = _recordMeta select ID_META_UNITS;
        _recordDelay = _recordMeta select ID_META_DELAY;

        if (typename _recordUnits == typename true) then {_recordUnits = [0,1] select _recordUnits;};

        //--- Remove recording meta
        _recordArray set [0,-1];
        _recordArray = _recordArray - [-1];
        _recordArrayCount = count _recordArray;

        //--- Init variables which can be accessed from GUI
        BIS_fnc_diagAAR_step = -1;
        BIS_fnc_diagAAR_stepAdd = 1;
        BIS_fnc_diagAAR_stepForced = false;
        BIS_fnc_diagAAR_stepCount = _recordArrayCount;
        _delay = 1;

        //--- Initial scan
        _deaths = [];
        _stepTime = 0;
        _stepTimeOld = 0;
        _posFirst = [];

        {
            _step = _foreachindex;
            _stepTime = _x select 0;
            {
                if (_foreachindex > 0) then {
                    _var = _x select 0;
                    if (_var == _recordPlayer) then {

                        //--- Detect start
                        _pos = _x select ID_POSITION;
                        if (count _posFirst == 0) then {_posFirst = _pos;};

                        //--- Detect death
                        _damage = _x select ID_DAMAGE;
                        if (_damage >= 1) then {_deaths set [count _deaths,_step];};
                    };
                };
            } foreach _x;
        } foreach _recordArray;

        //--- Reset slidebar deaths
        for "_i" from 0 to 10 do {
            _idc = parsenumber ("1138" + str _i);
            GUI_IDC ctrlsetbackgroundcolor [0,0,0,0];
            GUI_IDC ctrlcommit 0;
        };

        //--- Show deaths on slidebar
        _sliderPos = ctrlposition GUI_TIMELINE;
        _sliderW = 0.96;
        _sliderPosX = (_sliderPos select 0) + (_sliderPos select 2) * ((1 - _sliderW)/2);
        _sliderPosW = (_sliderPos select 2) * _sliderW;
        {
            _pos = _x / (_recordArrayCount - 1);
            _posX = _sliderPosX + _sliderPosW * _pos;
            _posW = (_sliderPosW / (_recordArrayCount - 1));
            if ((_posX + _posW) > (_sliderPosX + (_sliderPos select 2))) then {
                _posW = (_sliderPosX + (_sliderPos select 2)) - _posX;
            };
            _idc = parsenumber ("1138" + str _foreachindex);
            _controlPos = ctrlposition (_display displayctrl _idc);
            _controlPos set [0,_posX];
            _controlPos set [2,_posW];
            GUI_IDC ctrlsetposition _controlPos;
            GUI_IDC ctrlsetbackgroundcolor [1,0,0,0.4];
            GUI_IDC ctrlcommit 0;
        } foreach _deaths;

        endloadingscreen;

        //////////////////////////////////////////////////////////////////////////////////////////////////
        //--- Play
        while {!isnull _display && _sessionID == BIS_fnc_diaAAR_sessionID} do {

            BIS_fnc_diagAAR_step = (BIS_fnc_diagAAR_step + BIS_fnc_diagAAR_stepAdd) min (_recordArrayCount - 1);
            BIS_fnc_diagAAR_step = round BIS_fnc_diagAAR_step;
            _array = _recordArray select BIS_fnc_diagAAR_step;

            //--- Show time
            _arrayTime = _array select 0;
            _array = _array - [_arrayTime];
            _forced = BIS_fnc_diagAAR_stepForced;
            GUI_BACKGROUND ctrlsettext ([_arrayTime / 60,"HH:MM"] call bis_fnc_timetostring);
            if !(_forced) then {
                GUI_TIMELINE slidersetposition ((BIS_fnc_diagAAR_step / ((_recordArrayCount - 1) max 1)) * 10);
            };


            BIS_fnc_diagAAR_mapMission = [];
            {
                _unit = _x select ID_VAR_UNIT;
                _type = _x select ID_TYPEOF;
                _sideId = _x select ID_SIDE;
                _damage = _x select ID_DAMAGE;
                _position = _x select ID_POSITION;
                _direction = _x select ID_DIRECTION;
                _commander = _x select ID_COMMANDER;

                _icon = gettext (configfile >> "cfgvehicles" >> _type >> "icon");
                _vehicleIcon = gettext (configfile >> "CfgVehicleIcons" >> _icon);
                if (_vehicleIcon != "") then {
                    _icon = _vehicleIcon;
                };
                _color = _sideId call bis_fnc_sidecolor;
                if (_damage >= 1) then {_color = COLOR_DEATH;};
                _sizeX = if (!_commander && _recordUnits == 1) then {0} else {ICON_SIZE}; //--- Hide units in vehicles
                _sizeY = _sizeX;
                _text = (["",_unit,_type,str _damage] select BIS_fnc_diagAAR_showLabels);
                _isPlayer = _unit == _recordPlayer;

                BIS_fnc_diagAAR_mapMission set [
                    count BIS_fnc_diagAAR_mapMission,
                    [
                        [_icon,_color,_position,_sizeX,_sizeY,_direction,_text,false],
                        _isPlayer
                    ]
                ];
            } foreach _array;

            //--- Wait
            BIS_fnc_diagAAR_stepForced = false;
            _time = diag_ticktime + _delay;
            waituntil {
                diag_ticktime > _time
                ||
                BIS_fnc_diagAAR_stepForced
            };
        };

        (format ["AAR Session %1 Terminated",_sessionID]) call bis_fnc_logFormat;
    };

    //--- Map icons
    case "draw": {
        _map = _this select 0;
        _display = ctrlparent _map;
        _recordID = (lbcursel GUI_LIST_SESSIONS);

        //--- Draw paths
        {
            _isSelected = _foreachindex == _recordID;
            {
                _drawParams = +_x;
                switch (count _drawParams) do {
                    case 3: { //--- Line
                        if !(_isSelected) then {_drawParams set [2,COLOR_DISABLED];};
                        _map drawline _drawParams;
                    };
                    case 6: { //--- Ellipse
                        if !(_isSelected) then {_drawParams set [4,COLOR_DISABLED_FADED];};
                        _map drawellipse _drawParams;
                    };
                    case 8: { //--- Icon
                        if !(_isSelected) then {_drawParams set [1,COLOR_DISABLED];};
                        _map drawicon _drawParams;
                    };
                };
            } foreach _x;
        } foreach BIS_fnc_diagAAR_mapInit;

        //--- Draw units
        {

            _drawParams = _x select 0;
            _isPlayer = _x select 1;
            _map drawicon _drawParams;
            if (_isPlayer) then {
                _map drawicon [
                    gettext (configfile >> "cfgingameui" >> "islandmap" >> "iconPlayer"),
                    getarray (configfile >> "cfgingameui" >> "islandmap" >> "colorMe"),
                    _drawParams select 2,
                    ICON_SIZE,
                    ICON_SIZE,
                    0,
                    "",
                    false
                ];
            };
        } foreach BIS_fnc_diagAAR_mapMission;
    };
};