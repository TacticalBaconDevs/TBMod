#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _pos = getPos _logic;
deleteVehicle _logic;

(missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];

if (_mouseOverType != "OBJECT") then
{
    systemChat "Kranfahrzeug muss ein Objekt sein!";
}
else
{
    _mouseOverUnit setVariable [QGVAR(kranWagen), true, true];
};

true
