#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original code from: https://github.com/SceptreOfficial/Simplex-Support-Services
    Modified by http://tacticalbacon.de
*/
params ["_mode", "_params"];

if (isNil "SSS_support" || isNil "SSS_support_fnc_transportDoFastrope") exitWith {
    systemChat "Simplex-Support-Services ist nicht vorhanden!";
};

switch (_mode) do
{
    case "init":
    {
        _params params ["_vehicle"];

        private _actions = [];
        _actions pushBack [QGVAR(fastRopeAdd), "Add Group", "", {["addGroup", [_target, _player]] call FUNC(fastRope)}, {["canAddGroup", [_target, _player]] call FUNC(fastRope)}];
        _actions pushBack [QGVAR(fastRopeRemove), "Remove Group", "", {["removeGroup", [_target, _player]] call FUNC(fastRope)}, {["canRemoveGroup", [_target, _player]] call FUNC(fastRope)}];
        _actions pushBack [QGVAR(fastRopeShow), "Show Units", "", {["showUnits", [_target, _player]] call FUNC(fastRope)}, {true}];
        _actions pushBack [QGVAR(fastRopeStart), "Start FR", "", {["startFR", [_target, _player]] call FUNC(fastRope)}, {["canStartFR", [_target, _player]] call FUNC(fastRope)}];

        // Build interactions
        private _parent = [QGVAR(fastRopeParent), "TB FastRope", "", {}, {true}] call ace_interact_menu_fnc_createAction;
        [_vehicle,  1, ["ACE_SelfActions"], _parent] call ace_interact_menu_fnc_addActionToObject;
        {
            [_vehicle,  1, ["ACE_SelfActions", QGVAR(fastRopeParent)], _x call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToObject;
        }
        forEach _actions;

        true
    };

    case "canAddGroup":
    {
        _params params ["_vehicle", "_player"];

        private _ropeUnits = _vehicle getVariable ["SSS_fastropeUnits", []];
        _ropeUnits = _ropeUnits select {alive _x && _x in _vehicle};
        private _copilotTurrets = (allTurrets _vehicle) select {getNumber ([_vehicle, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0};
        private _copilots = _copilotTurrets apply {_vehicle turretUnit _x};

        !(driver _vehicle == _player || currentPilot _vehicle == _player || gunner _vehicle == _player || commander _vehicle == _player && _player in _copilots) &&
            leader _player == _player && !(_player in _ropeUnits)
    };

    case "addGroup":
    {
        _params params ["_vehicle", "_group"];

        if (_group isEqualType objNull) then {_group = group _group};
        private _ropeUnits = _vehicle getVariable ["SSS_fastropeUnits", []];
        _ropeUnits append (units _group);
        _vehicle setVariable ["SSS_fastropeUnits", _ropeUnits select {alive _x && _x in _vehicle}, true];

        systemChat format ["Die Gruppe '%1' wurde zum Abseilen hinzugefügt!", groupId _group];
    };

    case "canRemoveGroup":
    {
        _params params ["_vehicle", "_player"];

        private _ropeUnits = _vehicle getVariable ["SSS_fastropeUnits", []];
        _ropeUnits = _ropeUnits select {alive _x && _x in _vehicle};
        private _copilotTurrets = (allTurrets _vehicle) select {getNumber ([_vehicle, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0};
        private _copilots = _copilotTurrets apply {_vehicle turretUnit _x};

        !(driver _vehicle == _player || currentPilot _vehicle == _player || gunner _vehicle == _player || commander _vehicle == _player && _player in _copilots) &&
            leader _player == _player && _player in _ropeUnits
    };

    case "removeGroup":
    {
        _params params ["_vehicle", "_group"];

        if (_group isEqualType objNull) then {_group = group _group};
        private _ropeUnits = _vehicle getVariable ["SSS_fastropeUnits", []];
        _ropeUnits = _ropeUnits select {!((group _x) isEqualTo _group) && alive _x && _x in _vehicle};
        _vehicle setVariable ["SSS_fastropeUnits", _ropeUnits, true];

        systemChat format ["Die Gruppe '%1' wurde vom Abseilen entfernt!", groupId _group];
    };

    case "showUnits":
    {
        _params params ["_vehicle"];

        private _ropeUnits = _vehicle getVariable ["SSS_fastropeUnits", []];
        _ropeUnits = (_ropeUnits select {alive _x && _x in _vehicle}) apply {name _x};
        systemChat format ["Abgeseilt werden: %1", _ropeUnits joinString ", "];
    };

    case "initRopes":
    {
        _params params ["_vehicle"];
        private _ropes = _vehicle getVariable [QGVAR(ropes), []];
        _ropes = _ropes select {count _x == 3 && alive (_x # 0) && alive (_x # 1) && alive (_x # 2)};

        if !(_ropes isEqualTo []) exitWith {true};

        private _centerOfMass = getCenterOfMass _vehicle;

        {
            private _vector = _centerOfMass vectorAdd [_x, 0, 0];
            _vector set [2, (0 boundingBoxReal _vehicle) # 0 # 2];

            private _hook = createVehicle ["ace_fastroping_helper",_vehicle modelToWorldVisual _vector,[],0,"CAN_COLLIDE"];
            _hook allowDamage false;
            _hook attachTo [_vehicle, _vector];

            private _end = createVehicle ["ace_fastroping_helper",_vehicle modelToWorldVisual _vector,[],0,"CAN_COLLIDE"];
            _end allowDamage false;

            private _rope = ropeCreate [_hook, [0,0,0], _end, [0,0,0], 1];
            ropeUnwind [_rope, 7, ((getPosVisual _vehicle) # 2) - 0.5];

            _ropes pushBack [_hook, _rope, _end];
        }
        forEach [0.8, -0.8];

        _vehicle setVariable [QGVAR(ropes), _ropes, true];
        true
    };

    case "canStartFR":
    {
        _params params ["_vehicle", "_player"];

        private _ropeUnits = _vehicle getVariable ["SSS_fastropeUnits", []];
        _ropeUnits = _ropeUnits select {alive _x && _x in _vehicle};
        private _height = (getPosVisual _vehicle) # 2;
        private _copilotTurrets = (allTurrets _vehicle) select {getNumber ([_vehicle, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0};
        private _copilots = _copilotTurrets apply {_vehicle turretUnit _x};

        (driver _vehicle == _player || currentPilot _vehicle == _player || gunner _vehicle == _player || commander _vehicle == _player && _player in _copilots)
            && !(_ropeUnits isEqualTo []) && _height < 50 && _height > 5 && speed _vehicle < 10
    };

    case "startFR":
    {
        _params params ["_vehicle"];

        private _ropes = _vehicle getVariable [QGVAR(ropes), []];
        if (_ropes isEqualTo []) exitWith
        {
            ["initRopes", _params] call FUNC(fastRope);
            ["startFR", _params] call FUNC(fastRope);
        };

        [
            {
                (getPosVisual ((_this # 1) param [2, objNull])) # 2 < 10
            },
            {
                [{
                    params ["_args", "_PFHID"];
                    _args params ["_vehicle", "_ropes"];
                    private _fastropeUnits = (_vehicle getVariable ["SSS_fastropeUnits",[]]) select {alive _x};

                    if (_fastropeUnits isEqualTo [] || !alive _vehicle || !alive driver _vehicle) exitWith
                    {
                        [_PFHID] call CBA_fnc_removePerFrameHandler;

                        _vehicle setVariable ["SSS_fastropeUnits", nil, true];

                        {
                            _x params ["_hook", "_rope", "_end"];

                            _hook ropeDetach _rope;
                            deleteVehicle _hook;
                            _end ropeDetach _rope;
                            deleteVehicle _end;

                            [{ropeDestroy _this}, _rope, 10] call CBA_fnc_waitAndExecute;
                        }
                        forEach _ropes;
                    };

                    private _unit = selectRandom (_fastropeUnits select {!(_x getVariable ["SSS_fastroping", false])});
                    if (isNil "_unit") exitWith {};

                    _unit setVariable ["SSS_fastroping", true, true];
                    [_vehicle, _unit, _ropes] remoteExecCall ["SSS_support_fnc_transportDoFastrope", _unit];
                }, 1.5, _this] call CBA_fnc_addPerFrameHandler;
            },
            [_vehicle, _ropes],
            10,
            {
                systemChat "Vorgang abgebrochen! Das Seil ist mehr als 10m über dem Boden.";
            }
        ] call CBA_fnc_waitUntilAndExecute;
    };

    default {
        systemChat format ["Es wurde nicht der richtige Modus übergeben: %1", _this];
    };
};
