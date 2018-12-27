/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
#define BLACKLIST ["ACE_BFT_", "trace_", "_USER_DEFINED", "curatorInterface_"]
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    {
        private _marker = _x;

        if (BLACKLIST findIf {([_marker, _x] call CBA_fnc_find) != -1} == -1) then
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
    {
        _x params ["_marker", "_pos", "_color", "_size", "_type", "_alpha", "_brush", "_dir", "_shape", "_text"];

        private _newMarker = createMarker [_marker, _pos];
        _newMarker setMarkerColor _color;
        _newMarker setMarkerSize _size;
        _newMarker setMarkerType _type;
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
