#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

private _pos = getPos _logic;
deleteVehicle _logic;

if !(local _logic) exitWith {};
if !(_activated) exitWith {};
if !(canSuspend) exitWith {_this spawn EFUNC(zeus,moduleNachschubAbwurf)};

[
    "Nachschubmenge",
    [
        [
            "SLIDER",
            ["Nachschubmenge", "Die Menge, die an Ressourcen zum Bauen im Fahrzeug ist."],
            [100, 10000, 2000, 0],
            true
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_menge"];

        (missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];

        if (_mouseOverType != "OBJECT") then
        {
            systemChat "Resoucenfahrzeug muss ein Objekt sein!";
        }
        else
        {
            _mouseOverUnit setVariable ["TBMod_Building_resourcenCargo", _menge, true];
        };
    }
] call zen_dialog_fnc_create;

true
