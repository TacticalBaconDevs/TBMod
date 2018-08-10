/*
    Author: Willi "shukari" Graff
*/
params ["_logic", "", "_activated"];

private _pos = getPos _logic;
deleteVehicle _logic;

if !(local _logic) exitWith {};
if !(_activated) exitWith {};

(missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];

if (_mouseOverType != "OBJECT") then
{
    systemChat "Kranfahrzeug muss ein Objekt sein!";
}
else
{
    _mouseOverUnit setVariable ["TBMod_Building_Cranwagen", true, true];
};

true
