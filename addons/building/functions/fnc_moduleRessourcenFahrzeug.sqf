#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
deleteVehicle _logic;

(missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];
if (_mouseOverType != "OBJECT") exitWith {systemChat "Resoucenfahrzeug muss ein Objekt sein!"};

[
    "Nachschubmenge",
    [
        [
            "SLIDER",
            ["Nachschubmenge", "Die Menge, die an Ressourcen zum Bauen im Fahrzeug ist."],
            [100, 10000, _mouseOverUnit getVariable [QGVAR(resourcenCargo), 2000], 0],
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
            _mouseOverUnit setVariable [QGVAR(resourcenCargo), round _menge, true];
        };
    }
] call zen_dialog_fnc_create;

true
