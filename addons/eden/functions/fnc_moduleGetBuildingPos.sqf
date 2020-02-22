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
    private _buildings = nearestObjects [_logic, ["House", "Building"], 5, true];
    if !(_buildings isEqualTo []) then
    {
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

            private _customPositions = nearestObjects [_building, ["CBA_buildingPos"], _diameter, true] apply {
                _x buildingPos 0
            } select {
                private _customPositionTop = _building worldToModel _x;
                private _customPositionSide = +_customPositionTop;
                _customPositionSide pushBack (_customPositionSide deleteAt 1); // swap y and z

                _customPositionTop inPolygon _polygonTop && _customPositionSide inPolygon _polygonSide
            };

            private _output = typeOf _building;
            {
                _output = format ["%1, %2", _output, _building worldToModel _x];
            }
            forEach _customPositions;

            diag_log text format ["[%1]", _output];
            copyToClipboard format ["[%1]", _output];
            systemChat (typeOf _building +" kopiert!");
        }
        forEach _buildings;
    };
};

_logic spawn {uiSleep 1; deleteVehicle _this; delete3DENEntities [_this];};
