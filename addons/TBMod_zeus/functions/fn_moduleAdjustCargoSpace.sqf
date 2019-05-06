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
if (isNull _unit) exitWith {systemChat "[TBMOD_zeus] No vehicle selected."; true};

_unit spawn {
    private _dialogResult = 
    [ 
        "TB Adjust Ace Cargo", 
        [ ["Cargo Space", "", "0"] ] 
    ] call Ares_fnc_showChooseDialog; 
    
    if (_dialogResult isEqualTo []) exitWith{};
    _dialogResult params ["_newSize"];
    _newSize = parseNumber (_dialogResult select 0);
    [_this, _newSize] call ace_cargo_fnc_setSpace;
};

true
