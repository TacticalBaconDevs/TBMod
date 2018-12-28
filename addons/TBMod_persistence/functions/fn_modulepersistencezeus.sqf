/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
deleteVehicle _logic;
if !(_activated) exitWith {true};
    
0 spawn { 
 
private _dialogResult = 
[ 
    "Persistence", 
    [ 
        ["Operation", ["Speichern","Laden"], 0] 
    ] 
] call Ares_fnc_showChooseDialog; 
if (_dialogResult isEqualTo []) exitWith{systemChat "[TBMod_persistence] Abbruch"}; 
 
_dialogResult params ["_operation"]; 
 
private _save = if (_operation == 0) then {true} else {false}; 
 
if(_save) then { 
    private _dialogResult2 = 
    [ 
        "Persistence", 
        [ 
            ["Save Name", "", ""] 
        ] 
    ] call Ares_fnc_showChooseDialog; 
 
    if (_dialogResult2 isEqualTo []) exitWith{systemChat "[TBMod_persistence] Abbruch"}; 
 
    _dialogResult2 params ["_name"]; 
    [_save, _name] call TB_fnc_persistence; 
    if(profileNamespace getVariable ["TB_persistence_savednames",[]] isEqualTo []) then { 
        profileNamespace setVariable ["TB_persistence_savednames",[_name]]; 
    } 
    else 
    { 
        profileNamespace getVariable ["TB_persistence_savednames",[]] pushBackUnique _name; 
    } 
 
}else
    { 
        private _saves = profileNamespace getVariable ["TB_persistence_savednames",[]]; 
        private _dialogResult2 = 
        [ 
            "Persistence", 
            [ 
                ["Save Name", _saves, 0] 
            ] 
        ] call Ares_fnc_showChooseDialog; 
 
        if (_dialogResult2 isEqualTo []) exitWith{}; 
 
        _dialogResult2 params ["_nameidx"]; 
        [_save, _saves select _nameidx] remoteExec ["TB_fnc_persistence", 2]; 
    };
}; 
