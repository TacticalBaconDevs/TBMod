#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define BLACKLIST ["ACE_BFT_", "trace_", "tb_eos"]
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    {
        private _marker = _x;

        if (BLACKLIST findIf {([toLower _marker, toLower _x] call CBA_fnc_find) != -1} == -1 && markerShape _x != "POLYLINE") then
        {
            _storagearray pushBack [
                    _marker,
                    markerPos _x,
                    markerColor _x,
                    markerSize _x,
                    markerType _x,
                    markerAlpha _x,
                    markerBrush _x,
                    markerDir _x,
                    markerShape _x,
                    markerText _x
                ];
        };
    }
    forEach allMapMarkers;
}
else // load
{
    
    (allMapMarkers select {(_x select [0, 13]) == "_USER_DEFINED"}) call CBA_fnc_deleteEntity;
    (allMapMarkers select {BLACKLIST findIf {([toLower _x] call CBA_fnc_find) != -1} == -1}) call CBA_fnc_deleteEntity;
    {
        _x params ["_marker", "_pos", "_color", "_size", "_type", "_alpha", "_brush", "_dir", "_shape", "_text"];

        private _newMarker = createMarker [_marker, _pos];
        _newMarker setMarkerColor _color;
        _newMarker setMarkerSize _size;
        if !(_type isEqualTo "") then {_newMarker setMarkerType _type};
        _newMarker setMarkerAlpha _alpha;
        _newMarker setMarkerBrush _brush;
        _newMarker setMarkerDir _dir;
        _newMarker setMarkerShape _shape;
        _newMarker setMarkerText _text;
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Marker wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
