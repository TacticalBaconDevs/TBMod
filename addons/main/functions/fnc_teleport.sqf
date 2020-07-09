#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_obj", objNull, [objNull]],
        ["_time", 5, [0]],
        ["_messages", true, [true]]
    ];

if (_obj isKindOf "Man") then
{
    if (_obj isEqualTo ACE_player) exitWith {systemChat "Zu Dir selber teleportieren ist nicht hilfreich."};

    if (_messages) then
    {
        systemChat "Halte Dich bereit, Teleport wird vorbereitet...";
        format ["Achtung, %1 teleportet zu Dir!", profileName] remoteExecCall ["systemChat", _obj];
    };

    [{
        params ["_obj", "_time"];

        private _vehicle = vehicle _obj;
        if (_vehicle != _obj) then
        {
            if !(player moveInAny _vehicle) then
            {
                "Das Fahrzeug beim Ziel ist voll, warte etwas du wirst gleich teleportiert!" remoteExecCall ["systemChat", _obj];

                [LINKFUNC(teleport), _this, _time] call CBA_fnc_waitAndExecute;
            };
        }
        else
        {
            player setDir ((getDir _obj) + (10 - random 20));
            player setPosASL (AGLtoASL (_obj modelToWorld [0, -1, 0]));
        };
    }, _this, _time] call CBA_fnc_waitAndExecute;
}
else
{
    if (_obj isKindOf "TB_spezial_fobBase") then
    {
        player setDir ((getDir _obj) + (10 - random 20));
        player setPosASL (AGLtoASL (_obj modelToWorld [0, -2, 0]));
    }
    else
    {
        systemChat "Teleport nur auf Personen/Flaggen/FOBs möglich!";
    };
};
