/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

private _pos = getPos _logic;
deleteVehicle _logic;

if !(local _logic) exitWith {};
if !(_activated) exitWith {};
if !(canSuspend) exitWith {_this spawn TB_fnc_moduleNachschubAbwurf};

private _dialogResult = ["Nachschubmenge", [
        ["Nachschubmenge", "", "2000", true]
    ]] call Ares_fnc_showChooseDialog;
if (_dialogResult isEqualTo []) exitWith {};
_dialogResult params ["_menge"];

_menge = parseNumber _menge;
if (_menge < 0 || _menge > 10000) exitWith {systemChat "Menge muss zwischen 0-10000 liegen."};

(missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];

if (_mouseOverType != "OBJECT") then
{
    systemChat "Resoucenfahrzeug muss ein Objekt sein!";
}
else
{
    _mouseOverUnit setVariable ["TBMod_Building_PlaceablesCargo", _menge, true];
};

true
