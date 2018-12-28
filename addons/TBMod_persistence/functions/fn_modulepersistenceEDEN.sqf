/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
_mode = param [0,"",[""]];
_input = param [1,[],[[]]];
_activatet = false;
_logic = _input param [0,objNull,[objNull]];
switch _mode do {
    // Default object init
    case "init": {  
        _activatet = true;
    };
    
    case "attributesChanged3DEN": {
        _activatet = true;
    };
    
    case "registeredToWorld3DEN": {
        _activatet = true;
    };

   
};

if (!_activatet) exitWith {true};

_logic spawn {
    params ["_logic"];
    private _saves = profileNamespace getVariable ["TB_persistence_savednames",[]]; 
    private _dialogResult2 = 
    [ 
        "Persistence", 
        [ 
            ["Save Name", _saves, 0] 
        ] 
    ] call Ares_fnc_showChooseDialog; 
 
    if (_dialogResult2 isEqualTo []) exitWith{ delete3DENEntities [_logic]; systemChat "[TBMod_persistence] Abbruch";}; 
 
    _dialogResult2 params ["_nameidx"]; 
    [_saves select _nameidx] call TB_fnc_persistenceEDEN; 
    delete3DENEntities [_logic];
}
