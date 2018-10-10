/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
*/

[
    {
        {
           if ((units _x) equals []) then {deleteGroup _x};
        } forEach allGroups;
    },
    1800
] call CBA_fnc_addPerFrameHandler;
