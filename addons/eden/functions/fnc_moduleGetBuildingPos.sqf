#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (is3DEN && _mode == "attributesChanged3DEN") then
{
    private _buildings = (nearestObjects [_logic, ["House", "Building"], 5, true]) select {!(_x isKindOf "CBA_BuildingPos") && !(_x isKindOf "VR_Helper_base_F")};
    {
        private _building = _x;

        // CODE FROM: https://github.com/CBATeam/CBA_A3/blob/master/addons/ai/fnc_buildingPositions.sqf
        (0 boundingBoxReal _building) params ["_pos1", "_pos2", "_diameter"];
        _pos1 params ["_x1", "_y1", "_z1"];
        _pos2 params ["_x2", "_y2", "_z2"];

        private _polygonTop = [
            [_x1, _y1, 0],
            [_x2, _y1, 0],
            [_x2, _y2, 0],
            [_x1, _y2, 0]
        ];

        private _polygonSide = [
            [_x1, _z1, 0],
            [_x2, _z1, 0],
            [_x2, _z2, 0],
            [_x1, _z2, 0]
        ];

        private _customPositions = nearestObjects [_building, ["VR_Helper_base_F"], _diameter, true] apply {
            [getPos _x, _x]
        } select {
            private _customPositionTop = _building worldToModel (_x # 0);
            private _customPositionSide = +_customPositionTop;
            _customPositionSide pushBack (_customPositionSide deleteAt 1); // swap y and z

            _customPositionTop inPolygon _polygonTop && _customPositionSide inPolygon _polygonSide
        };

        private _output = "";
        {
            private _type = typeOf (_x # 1);
            if (_type == "VR_3DSelector_01_default_F") then {_type = "CBA"};
            if (_type == "VR_3DSelector_01_exit_F") then {_type = "Vanilla"};
            if (_type == "VR_3DSelector_01_incomplete_F") then {_type = "Vanilla2"};

            private _tags = call compile (((_x # 1) get3DENAttribute "description") # 0);
            if (isNil "_tags") then {_tags = []};

            _output = format ["%1, [%2, %3, %4]", _output, _building worldToModel (_x # 0), str _type, _tags];
        }
        forEach _customPositions;

        diag_log text format ["[%1, [%2]]", str (typeOf _building), _output select [2]];
        copyToClipboard format ["[%1, [%2]]", str (typeOf _building), _output select [2]];
        systemChat (typeOf _building +" kopiert!");
    }
    forEach _buildings;
};

_logic spawn {uiSleep 0.5; deleteVehicle _this; delete3DENEntities [_this];};
