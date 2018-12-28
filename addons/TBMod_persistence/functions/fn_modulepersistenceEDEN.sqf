/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
0 spawn {
    private _saves = profileNamespace getVariable ["TB_persistence_savednames",[]]; 
    private _dialogResult2 = 
    [ 
        "Persistence", 
        [ 
            ["Save Name", _saves, 0] 
        ] 
    ] call Ares_fnc_showChooseDialog; 
 
    if (_dialogResult2 isEqualTo []) exitWith{systemChat "[TBMod_persistence] Abbruch"}; 
 
    _dialogResult2 params ["_nameidx"]; 
    [_saves select _nameidx] call TB_fnc_persistenceEDEN; 
}
