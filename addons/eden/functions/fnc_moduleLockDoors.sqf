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

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    private _objectarea = _logic getVariable ["objectarea", []];
    _objectarea params [["_width", 500], ["_height", 500]];

    private _percent = _logic getVariable ["percent", 100];
    private _area = [getPos _logic];
    _area append _objectarea;

    {
        _x params ["_building"];

        {
            private _source = configName _x;
            private _content = _source splitString "_";

            if (toLower (_content # 2) == "sound" && {floor (random 100) <= _percent}) then //TODO: in ARRAY und door und sound check ggf nur
            {
                private _doorName = "bis_disabled_" + ((_content select [0,2]) joinString "_");
                _building animateSource [_source, 0, true];
                _building setVariable [_doorName, 1, true];

                #ifdef DEBUG_MODE_FULL
                _markerName = createMarker ["door"+ str (random 999), _building];
                _markerName setMarkerType "hd_dot";
                #endif
            };
        }
        forEach ([configFile >> "CfgVehicles" >> typeOf _building >> "AnimationSources", 0] call BIS_fnc_returnChildren);
    }
    forEach ((nearestObjects [_logic, ["House", "Building"], _width max _height]) inAreaArray _area);
};
