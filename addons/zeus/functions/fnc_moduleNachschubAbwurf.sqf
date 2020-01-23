#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};

private _nachschubsKistenNamen = TB_nachschubsKisten apply {[_x] call EFUNC(main,displayName)};
[
    "Nachschub auswählen",
    [
        [
            "LIST",
            "Nachschub",
            [TB_nachschubsKisten, _nachschubsKistenNamen, 0, 10]
        ],
        [
            "SLIDER",
            "Abwurfhöhe",
            [50, 5000, 100, 0]
        ],
        [
            "CHECKBOX",
            "Windkorrektur (experimentell)",
            true
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_classname", "_alt", "_windKorrektur"];
        _args params ["_pos"];

        if (_classname select [0, 3] == "###") exitWith {systemChat "Bitte wähle eine Kiste aus, keine Kategorie!"; true};

        private _parachute = createVehicle ["B_Parachute_02_F", [0, 0, 0], [], 0, 'FLY'];
        private _supplyBox = createVehicle [_classname, [0, 0, 0], [], 0, "FLY"];

        if (_windKorrektur) then
        {
            _pos set [2, _alt];
            private _windSpeed = [AGLToASL _pos, true, true, true] call ace_weather_fnc_calculateWindSpeed;
            _pos = (_pos getPos [_windSpeed * (_alt * 0.25), (((wind select 0) atan2 (wind select 1)) - 180) + 360]);
        };

        _pos set [2, _alt];
        _parachute setPos _pos;

        _supplyBox attachTo [_parachute, [0, 0, 1]];
        _supplyBox allowDamage false;

        [_supplyBox] spawn
        {
            params ["_supplyBox"];

            waitUntil {((getPosATL _supplyBox) select 2) < 150};

            private _smoke = createVehicle ["SmokeShell", [0, 0, 1000], [], 0, "FLY"];
            _smoke attachTo [_supplyBox, [0, 0, 0]];

            waitUntil {((getPosATL _supplyBox) select 2) < 20};

            deleteVehicle _smoke;
            _smoke = createVehicle ["SmokeShellBlue", [0, 0, 1000], [], 0, "FLY"];
            _smoke attachTo [_supplyBox, [0, 0, 0]];

            // Sicherheitsvorkehrung
            uiSleep 5;
            if (((getPosATL _supplyBox) select 2) < 0) then
            {
                private _pos = getPos _supplyBox;
                _pos set [2, 0];
                _supplyBox setPos _pos;
            };
        };
    },
    {},
    [_pos]
] call zen_dialog_fnc_create;

true
