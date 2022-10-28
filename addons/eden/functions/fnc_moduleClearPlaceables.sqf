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

if (!is3DEN && {_mode == "init"}) then
{
    // Check for Objects
    private _syncObjs = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")};

    if (_isActivated) then
    {
        private _clearArray = call compile (_logic getVariable ["clearArray", "[]"]);

        EGVAR(building,clearPlaceables) append _clearArray;
        EGVAR(building,clearPlaceables) append _syncObjs;

        EGVAR(building,clearPlaceables) = EGVAR(building,clearPlaceables) arrayIntersect EGVAR(building,clearPlaceables);
        publicVariable QEGVAR(building,clearPlaceables);
    };
};
