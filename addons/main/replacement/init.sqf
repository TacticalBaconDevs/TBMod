#include "\a3\modules_f\Environment\EditTerrainObject\defines.inc"
/*--------------------------------------------------------------------------------------------------

    Setups given terrain object.

--------------------------------------------------------------------------------------------------*/
if (!isServer) exitWith {};

#define SETUP_DOOR(building,id,state)\
building setVariable [format ["bis_disabled_door_%1", id + 1], [0,1,0] select state, true];\
building animateSource [format ["door_%1_sound_source", id + 1], [0,0,1] select state, true];\
building animateSource [format ["door_%1_noSound_source", id + 1], [0,0,1] select state, true];

private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
private _module = _input param [0,objNull,[objNull]];

/*
if (_mode != "eh_draw3d") then
{
    ["[ ] Init: %1",_this] call bis_fnc_logFormat;
};
*/

switch _mode do
{
    case "eh_draw3d":
    {
        private _module = ((get3DENSelected "logic") select {typeOf _x == "ModuleEditTerrainObject_F"}) param [0,objNull];
        if (isNull _module) exitWith {};

        private _building = _module getVariable ["#building",objNull];

        if (isNull _building) exitWith {};

        //draw bbox
        private _bbox = GET_OBJVAR(_building,"#bbox",[]);
        if (count _bbox == 0) then
        {
            _bbox = ["getBuildingBBox",[_module,_building]] call bis_fnc_moduleEditTerrainObject;
            SET_OBJVAR(_building,"#bbox",_bbox);
        };
        {drawLine3D _x} forEach _bbox;

        //get positions for door icons
        private _doorPositions = GET_OBJVAR(_building,"#doorPositions",nil);
        if (isNil{_doorPositions}) then
        {
            _doorPositions = ["getBuildingDoors",[_module,_building]] call bis_fnc_moduleEditTerrainObject;
            SET_OBJVAR(_building,"#doorPositions",_doorPositions);
        };

        if (count _doorPositions == 0) exitWith {};

        private _doorFlags = _building getVariable ["#doorFlags", DOOR_FLAGS_EMPTY];

        //draw line connecting module and building
        _module = getPos _module; _module set [2,1];
        _building = getPos _building; _building set [2,1];
        drawLine3D [_module,_building,COLOR_HIGHLIGHT];

        //draw 3d icons on door positions
        if (get3DENCamera distance _building > DISTANCE_HIGHLIGHT) exitWith {};

        private ["_icon","_state","_color"];

        {
            _state = _doorFlags select _forEachIndex;

            _icon = [ICON3D_DOOR_CLOSED,ICON3D_DOOR_LOCKED,ICON3D_DOOR_OPENED] select _state;
            _color = [COLOR_DOOR_CLOSED,COLOR_DOOR_LOCKED,COLOR_DOOR_OPENED] select _state;

            drawIcon3D ["", _color, _x, 0.6, -0.85, 0, str (_forEachIndex + 1), 2, 0.045, "RobotoCondensedBold","right",false];
            drawIcon3D [_icon, _color, _x, 0.8, 0.8, 0, "", 2];
        }
        forEach _doorPositions;
    };

    // Default object init
    case "init":
    {
        //add 'BuildingChanged' eh to monitor building transitions
        private _ehBuildingChanged = missionNamespace getVariable ["bis_fnc_moduleEditTerrainObject_ehBuildingChanged",-1];
        if (_ehBuildingChanged == -1) then
        {
            _ehBuildingChanged = addMissionEventHandler ["BuildingChanged",
            {
                params ["_previous","_current","_isRuin"];

                private _parent = objNull;
                private _child = objNull;

                //detect parent and child buildings
                if ((_previous getVariable ["#instanceType",BUILDING_UNKNOWN]) + (_current getVariable ["#instanceType",BUILDING_UNKNOWN]) == -2) then
                {
                    _previous setVariable ["#instanceType",BUILDING_PARENT];
                    _current setVariable ["#instanceType",BUILDING_CHILD];

                    _parent = _previous;
                    _child = _current;
                }
                else
                {
                    if (_previous getVariable ["#instanceType",BUILDING_UNKNOWN] == BUILDING_PARENT) then
                    {
                        _current setVariable ["#instanceType",BUILDING_CHILD];

                        _parent = _previous;
                        _child = _current;
                    }
                    else
                    {
                        if (_current getVariable ["#instanceType",BUILDING_UNKNOWN] == BUILDING_PARENT) then
                        {
                            _previous setVariable ["#instanceType",BUILDING_CHILD];

                            _parent = _current;
                            _child = _previous;
                        }
                        else
                        {
                            //["[x] None of the buildings %1 and %2 are parent!",typeOf _previous,typeOf _current] call bis_fnc_error;
                        };
                    };
                };

                //create refference to child and parent buildings
                _current setVariable ["#child",_child];
                _current setVariable ["#parent",_parent];
                _previous setVariable ["#child",_child];
                _previous setVariable ["#parent",_parent];

                //set variable name
                private _varName = _previous getVariable ["#name",""];
                if (_varName != "") then
                {
                    _current setVariable ["#name",_varName];
                    missionNamespace setVariable [_varName,_current,true];
                };

                //execute server/SP init code
                if (!isNull _parent) then
                {
                    private _initCode = _previous getVariable ["#initServer",""];
                    if (_initCode != "") then
                    {
                        _current setVariable ["#initServer",""];
                        _current call compile _initCode;
                    };
                };

                //execute global init code
                if (!isNull _parent) then
                {
                    private _initCode = _previous getVariable ["#init",""];
                    if (_initCode != "") then
                    {
                        _current setVariable ["#init",""];

                        [_current,compile _initCode] remoteExecCall ["bis_fnc_call", 0, true];
                    };
                };

                //allow damage
                private _allowDamage = _previous getVariable ["#allowDamage",true];
                if (!_allowDamage) then
                {
                    _current allowDamage _allowDamage;
                    _current setVariable ["#allowDamage",_allowDamage];
                };

                //setup all doors
                private _doorFlags = _parent getVariable ["#doorFlags", DOOR_FLAGS_EMPTY];

                {
                    SETUP_DOOR(_current,_forEachIndex,_x);
                }
                forEach _doorFlags;
            }];

            missionNamespace setVariable ["bis_fnc_moduleEditTerrainObject_ehBuildingChanged",_ehBuildingChanged];
        };

        if (!is3DEN) then
        {
            //get parent buidling
            private _building = ["getBuilding",[_module]] call bis_fnc_moduleEditTerrainObject;
            if (isNull _building) exitWith {};

            //set door states
            private _doorFlags = ["decodeDoorFlags",[_module]] call bis_fnc_moduleEditTerrainObject;
            _building setVariable ["#doorFlags", _doorFlags];

            {
                SETUP_DOOR(_building,_forEachIndex,_x);
            }
            forEach _doorFlags;

            //get state value
            private _value = _module getVariable ["#state",STATE_UNDAMAGED];

            if (_value in [STATE_DAMAGED1,STATE_DAMAGED2,STATE_DAMAGED3]) then
            {
                private _noHitzone1 = !isClass(configOf _building >> "HitPoints" >> "Hitzone_1_hitpoint");
                private _noHitzone2 = !isClass(configOf _building >> "HitPoints" >> "Hitzone_2_hitpoint");

                switch (_value) do
                {
                    case STATE_DAMAGED1:
                    {
                        if (_noHitzone1) then
                        {
                            _value = STATE_UNDAMAGED;
                        };
                    };
                    case STATE_DAMAGED2:
                    {
                        if (_noHitzone2) then
                        {
                            _value = STATE_UNDAMAGED;
                        };
                    };
                    case STATE_DAMAGED3:
                    {
                        if (_noHitzone1 || _noHitzone2) then
                        {
                            _value = STATE_UNDAMAGED;
                        };
                    };
                };
            };

            //set variable name
            private _varName = _module getVariable ["#name",""];
            if (_varName != "") then
            {
                if (_value in [STATE_UNDEFINED,STATE_UNDAMAGED,STATE_HIDDEN]) then
                {
                    missionNamespace setVariable [_varName,_building,true];
                }
                else
                {
                    _building setVariable ["#name",_varName];
                };
            };

            private _initCode = _module getVariable ["#initServer",""];
            if (_initCode != "") then
            {
                if (_value in [STATE_UNDEFINED,STATE_UNDAMAGED,STATE_HIDDEN]) then
                {
                    _building call compile _initCode;
                }
                else
                {
                    _building setVariable ["#initServer",_initCode];
                };
            };

            private _allowDamage = _module getVariable ["#allowDamage",true];
            if (!_allowDamage) then
            {
                if (_value in [STATE_UNDEFINED,STATE_UNDAMAGED,STATE_HIDDEN]) then
                {
                    _building allowDamage _allowDamage;
                }
                else
                {
                    _building setVariable ["#allowDamage",_allowDamage];
                };
            };

            //execute global init code
            private _initCode = _module getVariable ["#init",""];
            if (_initCode != "") then
            {
                if (_value in [STATE_UNDEFINED,STATE_UNDAMAGED,STATE_HIDDEN]) then
                {
                    [_building,compile _initCode] remoteExecCall ["bis_fnc_call", 0, true];
                }
                else
                {
                    _building setVariable ["#init",_initCode];
                };
            };

            //apply state change
            switch (_value) do
            {
                case STATE_DESTROYED:
                {
                    _building setDamage [1,false];
                };
                case STATE_DAMAGED1:
                {
                    _building setHitpointDamage ["Hitzone_1_hitpoint",1,false];
                };
                case STATE_DAMAGED2:
                {
                    _building setHitpointDamage ["Hitzone_2_hitpoint",1,false];
                };
                case STATE_DAMAGED3:
                {
                    _building setHitpointDamage ["Hitzone_1_hitpoint",1,false];
                    _building setHitpointDamage ["Hitzone_2_hitpoint",1,false];
                };
                case STATE_HIDDEN:
                {
                    _building hideObjectGlobal true;
                    _building allowDamage false;
                };
                default
                {
                    _building setDamage [0,false];
                };
            };

            //delete module
            deleteVehicle _module;
        }
        else
        {
            //add 'Draw3D' eh to ease operations with module
            private _ehDraw3D = missionNamespace getVariable ["bis_fnc_moduleEditTerrainObject_ehDraw3D",-1];
            if (_ehDraw3D == -1) then
            {
                _ehDraw3D = addMissionEventHandler ["Draw3D",{["eh_draw3d"] call bis_fnc_moduleEditTerrainObject}];
                missionNamespace setVariable ["bis_fnc_moduleEditTerrainObject_ehDraw3D",_ehDraw3D];
            };
        };
    };
    // When some attributes were changed (including position and rotation)
    case "attributesChanged3DEN":
    {
        private _initialized = _module getVariable ["#initialized",false];
        if (!_initialized) then
        {
            ["init",[_module]] call bis_fnc_moduleEditTerrainObject;
            _module setVariable ["#initialized",true];
        };

        //get current building
        _building = ["getBuilding",[_module]] call bis_fnc_moduleEditTerrainObject;
        _module setVariable ["#building",_building];

        //handle previous vs. current buildings and react to change
        private _buildingPrev = _module getVariable ["#buildingPrev",objNull];
        if (!isNull _buildingPrev && {_building != _buildingPrev}) then
        {
            _buildingPrev setDamage [0,false];
            _buildingPrev hideObjectGlobal false;
            SET_OBJVAR(_buildingPrev,"#managedBy",objNull);

            //close all doors
            _buildingPrev setVariable ["#doorFlags", nil];
            for "_doorID" from DOOR_INDEX_MIN to DOOR_INDEX_MAX do
            {
                SETUP_DOOR_PREVIEW(_buildingPrev,_doorID-1,DOOR_STATE_CLOSED);
            };
        };

        //do not progess any further if there is no valid building
        if (isNull _building) exitWith {};

        //get and store building bbox
        private _bbox = GET_OBJVAR(_building,"#bbox",[]);
        if (count _bbox == 0) then
        {
            _bbox = ["getBuildingBBox",[_module,_building]] call bis_fnc_moduleEditTerrainObject;
            SET_OBJVAR(_building,"#bbox",_bbox);
        };

        //get and store building door positions
        private _doorPositions = GET_OBJVAR(_building,"#doorPositions",[]);
        if (count _doorPositions == 0) then
        {
            _doorPositions = ["getBuildingDoors",[_module,_building]] call bis_fnc_moduleEditTerrainObject;
            SET_OBJVAR(_building,"#doorPositions",_doorPositions);
        };

        //mark building as managed by given module
        SET_OBJVAR(_building,"#managedBy",_module);

        //snap module to building
        private _buildingPos = getPos _building; _buildingPos set [2,0];
        _module set3DENAttribute ["position",_buildingPos];

        //update damage state only if the value changes
        private _value = (_module get3DENAttribute "#state") param [0,STATE_UNDAMAGED];
        private _valuePrev = _module getVariable ["#valuePrev",STATE_UNDEFINED];

        //get door states and flags
        private _doorFlags = ["decodeDoorFlags",[_module]] call bis_fnc_moduleEditTerrainObject;
        _building setVariable ["#doorFlags", _doorFlags];

        //parent: set door state and animate
        {
            SETUP_DOOR_PREVIEW(_building,_forEachIndex,_x);
        }
        forEach _doorFlags;

        //child: set door state and animate
        private _child = _building getVariable ["#child",objNull];
        if (isNull objNull && {_child != _building}) then
        {
            _child setVariable ["#doorFlags", _doorFlags];

            {
                SETUP_DOOR_PREVIEW(_child,_forEachIndex,_x);
            }
            forEach _doorFlags;
        };

        if (_value != _valuePrev || _building != _buildingPrev) then
        {
            _building setDamage [0,false];
            _building hideObjectGlobal false;

            switch (_value) do
            {
                case STATE_DESTROYED:
                {
                    _building setDamage [1,false];
                };
                case STATE_DAMAGED1:
                {
                    _building setHitpointDamage ["Hitzone_1_hitpoint",1,false];
                };
                case STATE_DAMAGED2:
                {
                    _building setHitpointDamage ["Hitzone_2_hitpoint",1,false];
                };
                case STATE_DAMAGED3:
                {
                    _building setHitpointDamage ["Hitzone_1_hitpoint",1,false];
                    _building setHitpointDamage ["Hitzone_2_hitpoint",1,false];
                };
                case STATE_HIDDEN:
                {
                    _building hideObjectGlobal true;
                };
            };

            _module setVariable ["#valuePrev",_value];
            _module setVariable ["#buildingPrev",_building];
        };
    };
    // When added to the world (e.g., after undoing and redoing creation)
    case "registeredToWorld3DEN":
    {


    };
    // When removed from the world (i.e., by deletion or undoing creation)
    case "unregisteredFromWorld3DEN":
    {
        //revert building state to default
        private _building = _module getVariable ["#buildingPrev",objNull];
        _building setDamage [0,false];
        _building hideObjectGlobal false;
        SET_OBJVAR(_building,"#managedBy",objNull);

        //close all doors
        _building setVariable ["#doorFlags", nil];
        for "_doorID" from DOOR_INDEX_MIN to DOOR_INDEX_MAX do
        {
            SETUP_DOOR_PREVIEW(_building,_doorID-1,DOOR_STATE_CLOSED);
        };

        //remove 'Draw3D' eh if last module is removed
        private _modules = (all3DENEntities param [3,[]]) select {typeOf _x == "ModuleEditTerrainObject_F" && {_x != _module}};
        if (count _modules == 0) then
        {
            private _ehDraw3D = missionNamespace getVariable ["bis_fnc_moduleEditTerrainObject_ehDraw3D",-1];

            if (_ehDraw3D != -1) then
            {
                removeMissionEventHandler ["Draw3D",_ehDraw3D];

                missionNamespace setVariable ["bis_fnc_moduleEditTerrainObject_ehDraw3D",-1];
            };
        };
    };
    // When connection to object changes (i.e., new one is added or existing one removed)
    case "connectionChanged3DEN":
    {


    };
    // When object is being dragged
    case "dragged3DEN":
    {
        private _building = ["getBuilding",[_module]] call bis_fnc_moduleEditTerrainObject;

        _module setVariable ["#building",_building];
    };

    case "getBuilding":
    {
        private _filter = _module getVariable ["#filter",0];
        private _filterFlags = _filter call bis_fnc_decodeFlags2;
        private _objectMapTypes = [];

        {
            if (_x == 1) then
            {
                _objectMapTypes append ([MAP_TYPES_BUILDING,MAP_TYPES_WALL,MAP_TYPES_VEGETATION,MAP_TYPES_MISC] select _forEachIndex);
            };
        }
        forEach _filterFlags;

        if (count _objectMapTypes == 0) exitWith {objNull};

        private _buildings = nearestTerrainObjects [_module,_objectMapTypes,DISTANCE_DETECTION,true,true];

        //get nearest building in DISTANCE_DETECTION that is not hidden
        _buildings = _buildings select {_x distance2D _module < DISTANCE_DETECTION};

        //filter out buildings that are already managed by other 'EditTerrainObject' modules
        _buildings = _buildings select {_m = GET_OBJVAR(_x,"#managedBy",objNull); isNull _m || {_module == _m}};

        //use 1st object
        private _selected = _buildings param [0,objNull];

        _selected
    };

    case "getBuildingDoors":
    {
        private _building = _input param [1,objNull,[objNull]];
        if (isNull _building) exitWith {[]};

        //configfile >> "CfgVehicles" >> "Land_i_House_Small_01_b_blue_F" >> "UserActions" >> "OpenDoor_1"
        private _cfg = configOf _building >> "UserActions";

        if !(isClass _cfg) exitWith {[]};

        private _positions = [];
        private _position = "";

        for "_doorID" from DOOR_INDEX_MIN to DOOR_INDEX_MAX do
        {
            _position = getText(_cfg >> format["OpenDoor_%1",_doorID] >> "position");

            if (_position == "") exitWith {};

            _positions pushBack _position;
        };

        if (count _positions == 0) exitWith {[]};

        _positions = _positions apply {_building modelToWorld (_building selectionPosition _x)};

        _positions
    };

    case "getBuildingBBox":
    {
        private _building = _input param [1,objNull,[objNull]];
        if (isNull _building) exitWith {[]};

        private _bbox = boundingBoxReal _building;
        _bbox params ["_point1","_point2"];

        _point1 params ["_x1","_y1","_z1"];
        _point2 params ["_x2","_y2","_z2"];

        #define A        (_building modelToWorldVisual [_x1,_y1,_z1])
        #define B        (_building modelToWorldVisual [_x2,_y1,_z1])
        #define C        (_building modelToWorldVisual [_x2,_y1,_z2])
        #define D        (_building modelToWorldVisual [_x1,_y1,_z2])
        #define E        (_building modelToWorldVisual [_x1,_y2,_z1])
        #define F        (_building modelToWorldVisual [_x2,_y2,_z1])
        #define G        (_building modelToWorldVisual [_x2,_y2,_z2])
        #define H        (_building modelToWorldVisual [_x1,_y2,_z2])

        private _edges =
        [
            [A,B,COLOR_HIGHLIGHT],
            [B,C,COLOR_HIGHLIGHT],
            [C,D,COLOR_HIGHLIGHT],
            [D,A,COLOR_HIGHLIGHT],
            [E,F,COLOR_HIGHLIGHT],
            [F,G,COLOR_HIGHLIGHT],
            [G,H,COLOR_HIGHLIGHT],
            [H,E,COLOR_HIGHLIGHT],
            [A,E,COLOR_HIGHLIGHT],
            [B,F,COLOR_HIGHLIGHT],
            [C,G,COLOR_HIGHLIGHT],
            [D,H,COLOR_HIGHLIGHT]
        ];

        _edges
    };

    //["encodeDoorFlags",[_module,[0,1,3,1,1,0,1,3,1,1,0,1,3,1,1,..]]] call bis_fnc_moduleEditTerrainObject;
    case "encodeDoorFlags":
    {
        private _flags = _input param [1,DOOR_FLAGS_EMPTY,[[]]];

        /*
        //safechecking should not be needed
        if (count _flags != DOOR_INDEX_MAX) then
        {
            _flags resize DOOR_INDEX_MAX;
            _flags = _flags apply {if (isNil{_x}) then {DOOR_STATE_CLOSED} else {_x}};
        };
        */

        private _value = [(_flags select [0,8]) call bis_fnc_encodeFlags4,(_flags select [8,8]) call bis_fnc_encodeFlags4,(_flags select [16,8]) call bis_fnc_encodeFlags4];

        _value
    };
    //["decodeDoorFlags",[_module,[256,52,104]]] call bis_fnc_moduleEditTerrainObject;
    //["decodeDoorFlags",[_module,256]] call bis_fnc_moduleEditTerrainObject;
    case "decodeDoorFlags":
    {
        private _value = _input param [1,_module getVariable ["#doorStates",[0,0,0]],[123,[]]];
        private _flags = [];

        //retype from old tech using single numeric value (with indexes from 0-15), each index can have one ot the 2 values (opened/closed)
        if (_value isEqualType 123) then
        {
            _flags = ([_value,DOOR_INDEX_MAX] call bis_fnc_decodeFlags2) apply {if (_x == 0) then {DOOR_STATE_CLOSED} else {DOOR_STATE_OPENED}};
        }
        //handle new tech with 3 values with indexes 0-7 (3 rows & 8 columns), each index can have one ot the 3 values (opened/locked/closed)
        else
        {
            {_flags append ([_x,DOOR_COLUMNS] call bis_fnc_decodeFlags4);} forEach _value;
        };

        _flags
    };

    case "objectDoors_onMouseButtonUp":
    {
        (_input select 1) params ["_ctrlAttribute","_mouseButton","","","_shiftKey","_ctrlKey","_altKey"];

        /*
        LMB     - cycle: DOOR_STATE_CLOSED - DOOR_STATE_LOCKED - DOOR_STATE_OPENED
        RMB     - DOOR_STATE_CLOSED

        Ctrl     - DOOR_STATE_CLOSED
        Shift     - DOOR_STATE_LOCKED
        Alt        - DOOR_STATE_OPENED
        */

        private _state = _ctrlAttribute getVariable ["#state",DOOR_STATE_CLOSED];

        if (_shiftKey || _ctrlKey || _altKey) then
        {
            _state = switch (true) do
            {
                case _altKey: {DOOR_STATE_OPENED};
                case _shiftKey: {DOOR_STATE_LOCKED};
                case _ctrlKey: {DOOR_STATE_CLOSED};
            };
        }
        else
        {
            if (_mouseButton == 0) then
            {
                _state = [DOOR_STATE_CLOSED,DOOR_STATE_LOCKED,DOOR_STATE_OPENED] select ((_state + 1) % 3);
            }
            else
            {
                _state = DOOR_STATE_CLOSED;
            };
        };

        _ctrlAttribute setVariable ["#state",_state];
        _ctrlAttribute ctrlSetText ([TEXTURE_DOOR_CLOSED,TEXTURE_DOOR_LOCKED,TEXTURE_DOOR_OPENED] select _state);
        _ctrlAttribute ctrlSetTooltip ([TEXT_DOOR_CLOSED,TEXT_DOOR_LOCKED,TEXT_DOOR_OPENED] select _state);
    };

    case "objectDoors_attributeLoad":
    {
        private _ctrlAttribute = _input param [1,controlNull,[controlNull]];
        private _value = _input param [2,0,[123,[]]];

        private _flags = ["decodeDoorFlags",[_module,_value]] call bis_fnc_moduleEditTerrainObject;

        private _ctrlCheckboxes = _ctrlAttribute controlsGroupCtrl 100;

        {
            private _ctrlCheckbox = _ctrlCheckboxes controlsGroupCtrl (101+_forEachIndex);

            if (_x != 0) then
            {
                _ctrlCheckbox setVariable ["#state",_x];
                _ctrlCheckbox ctrlSetText ([TEXTURE_DOOR_CLOSED,TEXTURE_DOOR_LOCKED,TEXTURE_DOOR_OPENED] select _x);
            };

            _ctrlCheckbox ctrlSetTooltip ([TEXT_DOOR_CLOSED,TEXT_DOOR_LOCKED,TEXT_DOOR_OPENED] select _x);
        }
        forEach _flags;

        private _building = ["getBuilding",[_module]] call bis_fnc_moduleEditTerrainObject;
        private _available = if (isNull _building) then
        {
            0
        }
        else
        {
            getNumber(configOf _building >> "numberOfDoors")
        };

        _available = _available min DOOR_INDEX_MAX;

        for "_doorID" from 1 to DOOR_INDEX_MAX do
        {
            _ctrlCheckbox = _ctrlCheckboxes controlsGroupCtrl (100+_doorID);
            if (_doorID <= _available) then {_ctrlCheckbox ctrlSetFade 0} else {_ctrlCheckbox ctrlSetFade 0.85};
            _ctrlCheckbox ctrlCommit 0;
        };
    };

    case "objectDoors_attributeSave":
    {
        private _ctrlAttribute = _input param [1,controlNull,[controlNull]];
        private _ctrlCheckboxes = _ctrlAttribute controlsGroupCtrl 100;

        private _flags = [];

        for "_idc" from 101 to (100+DOOR_INDEX_MAX) do
        {
            _flags pushBack ((_ctrlCheckboxes controlsGroupCtrl _idc) getVariable ["#state",DOOR_STATE_CLOSED]);
        };

        private _value = ["encodeDoorFlags",[_module,_flags]] call bis_fnc_moduleEditTerrainObject;

        _value
    };

    case "objectTypeFilter_attributeLoad":
    {
        private _ctrlAttribute = _input param [1,controlNull,[controlNull]];
        private _value = _input param [2,1,[123]];

        private _ctrlCheckboxes = _ctrlAttribute controlsGroupCtrl 100;
        private _flags = _value call bis_fnc_decodeFlags2;

        {
            if (_x == 1) then
            {
                private _ctrlCheckbox = _ctrlCheckboxes controlsGroupCtrl (101+_forEachIndex);
                _ctrlCheckbox cbSetChecked true;
            };
        }
        forEach _flags;
    };
    case "objectTypeFilter_attributeSave":
    {
        private _ctrlAttribute = _input param [1,controlNull,[controlNull]];
        private _ctrlCheckboxes = _ctrlAttribute controlsGroupCtrl 100;
        private _flags = [];
        private _value = 0;

        for "_idc" from 101 to 104 do
        {
            if (cbChecked(_ctrlCheckboxes controlsGroupCtrl _idc)) then
            {
                _flags pushBack 1;
            }
            else
            {
                _flags pushBack 0;
            };
        };

        _value = _flags call bis_fnc_encodeFlags2;

        _value
    };

    case "objectState_attributeLoad":
    {
        private _ctrlAttribute = _input param [1,controlNull,[controlNull]];
        private _value = _input param [2,1,[123]];

        private _ctrlCheckboxes = _ctrlAttribute controlsGroupCtrl 100;
        private _ctrlCheckbox = _ctrlCheckboxes controlsGroupCtrl (101+_value);

        private _building = ["getBuilding",[_module]] call bis_fnc_moduleEditTerrainObject;

        private _noHitzone1 = !isClass(configOf _building >> "HitPoints" >> "Hitzone_1_hitpoint");
        private _noHitzone2 = !isClass(configOf _building >> "HitPoints" >> "Hitzone_2_hitpoint");

        if (_noHitzone1) then
        {
            (_ctrlCheckboxes controlsGroupCtrl 102) ctrlSetFade 0.85;
            (_ctrlCheckboxes controlsGroupCtrl 102) ctrlCommit 0;
        };
        if (_noHitzone2) then
        {
            (_ctrlCheckboxes controlsGroupCtrl 103) ctrlSetFade 0.85;
            (_ctrlCheckboxes controlsGroupCtrl 103) ctrlCommit 0;
        };
        if (_noHitzone1 || _noHitzone2) then
        {
            (_ctrlCheckboxes controlsGroupCtrl 104) ctrlSetFade 0.85;
            (_ctrlCheckboxes controlsGroupCtrl 104) ctrlCommit 0;
        };

        _ctrlCheckbox cbSetChecked true;
    };
    case "objectState_attributeSave":
    {
        private _ctrlAttribute = _input param [1,controlNull,[controlNull]];
        private _ctrlCheckboxes = _ctrlAttribute controlsGroupCtrl 100;
        private _flags = [];
        private _value = 0;

        for "_idc" from 101 to 106 do
        {
            if (cbChecked(_ctrlCheckboxes controlsGroupCtrl _idc)) exitWith {_value = _idc - 101;};
        };

        _value
    };
    case "objectState_onCheckedChanged":
    {
        private _ctrlCheckboxData = _input param [1,[],[[]]];
        private _ctrlCheckbox = _ctrlCheckboxData param [0,controlNull,[controlNull]];
        private _ctrlCheckboxes = ctrlParentControlsGroup _ctrlCheckbox;

        for "_idc" from 101 to 106 do
        {
            (_ctrlCheckboxes controlsGroupCtrl _idc) cbSetChecked false;
        };

        _ctrlCheckbox cbSetChecked true;
    };
};