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
    // Check for Objects
    private _syncObjs = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")};
    _syncObjs append (synchronizedWaypoints _logic);

    private _hoehe = _logic getVariable ["hoehe", 150];
    private _startSpeed = _logic getVariable ["startSpeed", 5];
    private _deleteAfter = _logic getVariable ["deleteAfter", 60];
    private _flareType = _logic getVariable ["flareType", "F_40mm_White"];
    private _positionen = call compile (_logic getVariable ["positionen", "[]"]);
    private _delay = _logic getVariable ["delay", 1];

    _syncObjs append _positionen;

    [_hoehe, _startSpeed, _deleteAfter, _flareType, _syncObjs, _delay] spawn
    {
        params ["_hoeheInMetern", "_sinkgeschwindigkeit", "_loeschenNachSekunden", "_flareType", "_pos", "_verzoegerung"];

        {
            if (_x isEqualType objNull) then {_x = getPos _x};
            if (_x isEqualType "") then {_x = getMarkerPos _x};

            _x set [2, _hoeheInMetern];
            private _flare = createVehicle [_flareType, _x, [], 0, "CAN_COLLIDE"];
            _flare setVelocity [0, 0, _sinkgeschwindigkeit * -1];

            if (_loeschenNachSekunden > 0) then
            {
                [_flare, _loeschenNachSekunden] spawn
                {
                    params ["_flare", "_loeschenNachSekunden"];
                    uiSleep _loeschenNachSekunden;
                    if (!isNil "_flare" && !isNull _flare) then {deleteVehicle _flare};
                };
            };

            uiSleep _verzoegerung;
        }
        forEach _pos;
    };
};
