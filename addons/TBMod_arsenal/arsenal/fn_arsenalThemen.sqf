/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
private _side = side ACE_player;
private _return = [];

if (_side == blufor) then
{
    private _patches = configfile >> "CfgPatches";
    if (isClass (_patches >> "uns_main")) exitWith {_return = call TB_fnc_arsenalUSAVietnam};
    if (isClass (_patches >> "SWOP_Main")) exitWith {_return = call TB_fnc_arsenalSWOPRebuplik};
    
    _return = call TB_fnc_arsenalVANILLACOP;
};

if (_side == opfor) then
{
    _return = call TB_fnc_arsenalRUSSSimple;
};

_return;
