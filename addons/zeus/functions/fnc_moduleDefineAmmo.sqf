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

private _mags = magazines _unit;
if (_mags isEqualTo []) exitWith {true};

[
    "Magazines",
    [
        [
            "EDIT",
            "Magazines",
            [str _mags],
            true
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_value"];
        _args params ["_unit", "_mags"];

        private _compValue = call compile _value;
        if (_value != '[]' && _value != '' && !(_mags isEqualTo _compValue)) then
        {
            _unit setVehicleAmmoDef 0;

            {
                _x params ['_ammo', ['_amount', 999999]];
                _unit addMagazine [_ammo, _amount];
            }
            forEach _compValue;

            reload _unit;
            systemChat "DefineAmmo wurde ausgeführt, es dauert kurz bis das Fahrzeug nachgeladen hat!";
        }
        else
        {
            systemChat "DefineAmmo wurde nicht ausgeführt, es gab einen Fehler bei der Eingabe!";
        }
    },
    {},
    [_unit, _mags]
] call zen_dialog_fnc_create;

true
