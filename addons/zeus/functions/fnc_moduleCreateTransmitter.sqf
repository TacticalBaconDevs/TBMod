#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _unit = attachedTo _logic;
deleteVehicle _logic;

if (!alive _unit) exitWith {true};

[
    "Transmitter erstellen",
    [
        [
            "CHECKBOX",
            ["Random", "Setzt eine zufällige Frequenz zwischen 100-500, sonst angegebenen Wert"],
            true
        ],
        [
            "Slider",
            ["Frequenz", "Wenn Random=true dann ist dies die Mitte, sonst ist es die Frequenz"],
            [0, 500, 300, 2]
        ],
        [
            "CHECKBOX",
            ["Dauersender", "Sendet die ganze Zeit oder nur in bestimmten Abständen"],
            true
        ],
        [
            "Slider",
            ["Delay", "Wenn kein Dauersender, dann ist das der Abstand, in Sekunden, in dem NICHT gesendet wird"],
            [1, 900, 15, 0]
        ],
        [
            "Slider",
            ["Dauer", "Wenn kein Dauersender, dann ist das der Abstand, in Sekunden, in dem GESENDET wird"],
            [1, 900, 30, 0]
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_random", "_freq", "_dauersender", "_delay", "_dauer"];
        _args params ["_unit"];

        if (_random) then {_freq = random [100, (_freq max 110) min 490, 500]};

        private _condition = nil;
        if (!_dauersender) then {_condition = compile format ["[%1, %2]", _delay, _dauer]};

        TRACE_4("createSenderZEUS",_freq, _condition, _delay, _dauer);
        [_unit, _freq, _condition] call TBMod_spectrum_fnc_createTransmitter;
    },
    {},
    [_unit]
] call zen_dialog_fnc_create;

true
