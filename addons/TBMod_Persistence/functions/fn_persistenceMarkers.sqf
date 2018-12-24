/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
*/

params [
        ["_save", false, [false]],
        ["_storagearray", [], [[], [], [], []]]
    ];


if (_save) then
{
    {
        if ((_x select [0, 13]) == "_USER_DEFINED") then {
            (_storagearray select 1) pushBack [
                _x,
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
    } forEach allMapMarkers;
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
    forEach (_storagearray select 1);
};

(format ["[TBMod_persistence] Marker wurden %1", ["geladen.", "gespeichert."] select(_save)]) remoteExecCall ["systemChat"];
