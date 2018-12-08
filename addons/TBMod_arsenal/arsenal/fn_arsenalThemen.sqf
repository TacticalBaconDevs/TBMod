/*
    Author: shukari
*/

private _patches = configfile >> "CfgPatches";
if (isClass (_patches >> "uns_main")) exitWith {call TB_fnc_arsenalUSAVietnam};

call TB_fnc_arsenalRUSSSimple;
