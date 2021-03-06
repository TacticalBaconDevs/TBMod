#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Information:
        Wenn die 'Bedingung' (Parameter2) erfüllt ist und nachdem dann der 'Delay' (Parameter3) um ist,
        wird alle 'CheckPause' (Parameter5) überprüft ob:
            - die KI auserhalb des 'RadiusPlayer' (Parameter4) ist UND
                - kein Spieler sie anschaut (Richtung schauen)
                - ODER die KI von keinem Spieler gesehen wird (verdeckt)
        ... dann wird die Gruppe gelöscht.

    Parameter:
    1:    Gruppe für die das gilt
    2:    Bedingung ab wann gechecked wird ob sichtbar usw, '_this' is die Gruppe (Parameter1) [Standard: {true}]
    3:    Verzögerung, nach der Bedingung bis checks kommen usw [Standard: 10]
    4:    ab welcher Entfernung werden KIs erst gelöscht [Standard: 100]
    5:    Bedingung, Sicht und Entferungscheck Pausendelay [Standard: 15]
*/
params [
        "_grp",
        ["_condition", {true}],
        ["_delay", 60],
        ["_radiusPlayer", 200],
        ["_checkPause", 15]
    ];

_grp deleteGroupWhenEmpty true;
_grp allowFleeing 0;
_grp setVariable ["acex_headless_blacklist", true, true];

[{
    params ["_grp", "_condition"];
    _grp call _condition
}, {
    params ["", "", "_delay"];

    [{
        params ["", "", "", "", "_checkPause"];

        [{
            params ["_args", "_idPFH"];
            _args params ["_grp", "", "", "_radiusPlayer"];

            private _units = units _grp;
            if (count _units == {
                    _ai = _x;
                    allPlayers findIf {_x distance _ai >= _radiusPlayer && {(_x getRelDir _ai) > 50 && (_x getRelDir _ai) < 310 || {[objNull, "VIEW"] checkVisibility [eyePos _x, eyepos _ai] < 0.1}}} != -1
                } count _units) then
            {
                {deleteVehicle _x} forEach _units;
            };

            if (isNull _grp || {(units _grp) isEqualTo []}) then
            {
                if (!isNull _grp) then {[_grp] remoteExecCall ["deleteGroup", groupOwner _grp]};
                [_idPFH] call CBA_fnc_removePerFrameHandler;
            };
        }, _checkPause, _this] call CBA_fnc_addPerFrameHandler;
    }, _this, _delay] call CBA_fnc_waitAndExecute;
}, _this] call CBA_fnc_waitUntilAndExecute;
