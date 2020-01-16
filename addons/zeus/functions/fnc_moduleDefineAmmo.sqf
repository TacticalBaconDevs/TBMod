#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
private _unit = attachedTo _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};
if (isNull _unit || !alive _unit) exitWith {true};

private _mags = magazines _unit;
if (_mags isEqualTo []) exitWith {true};

[
    "Magazines",
    [
        [
            "EDIT",
            "Magazines",
            [str _mags]
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_value"];
        _args params ["_unit"];

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
        };
    },
    {},
    [_unit]
] call zen_dialog_fnc_create;

true
