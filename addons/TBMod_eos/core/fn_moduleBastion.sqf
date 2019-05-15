#include "../script_macros.hpp"
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

if (!is3DEN && {_mode == "init"} && {_isActivated}) then {
    // Konverter String to Array
    {
        private _value = _logic getVariable _x;
        if (!isNil "_value" && _value isEqualType "") then {_logic setVariable [_x, call compile _value]};
    }
    forEach ["patrolInf", "lightVeh", "armorVeh", "helis", "side", "settings", "bastionSettings", "angriffsRichtung", "angriffsRichtungHeli"];

    (_logic getVariable ["objectarea", []]) params [["_w", 300], ["_h", 300]];
    // private _radius = _w min _h;

    private _marker = createMarker [format ["tb_eosBast_%1", random 999999], getPos _logic];
    _marker setMarkerSize [_w, _h];
    _marker setMarkerDir (getDir _logic);
    _marker setMarkerAlpha 0.8;
    if (_logic getVariable ["sichtbar", false]) then {_marker setMarkerShape "ELLIPSE"};

    private _settings = _logic getVariable ["settings", [0]];
    _settings pushBack (_logic getVariable ["side", EAST]);
    _settings pushBack (_logic getVariable ["heightCheck", true]);
    _settings pushBack (_logic getVariable ["activRadius", 500]);
    _settings pushBack (_logic getVariable ["heliAbspringen", false]);
    _settings pushBack (_logic getVariable ["helicopterHeight", 500]);
    _settings pushBack (_logic getVariable ["angriffsRichtung", [0, 360]]);
    _settings pushBack (_logic getVariable ["angriffsRichtungHeli", [0, 360]]);

    [
        _marker,
        _logic getVariable ["patrolInf", [0, 0]],
        _logic getVariable ["lightVeh", [0, 0]],
        _logic getVariable ["armorVeh", [0]],
        _logic getVariable ["helis", [0, 0]],
        _settings,
        _logic getVariable ["bastionSettings", [30, 3, 600, true, false]]
    ] spawn FUNC(bastionCore);
};

true
