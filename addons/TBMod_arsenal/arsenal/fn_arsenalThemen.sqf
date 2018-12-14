/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
private _side = side ACE_player;

if (_side == blufor) then
{
    private _patches = configfile >> "CfgPatches";
    if (isClass (_patches >> "uns_main")) exitWith {call TB_fnc_arsenalUSAVietnam};
    if (isClass (_patches >> "SWOP_Main")) exitWith {call TB_fnc_arsenalSWOPRebuplik};
    
    call TB_fnc_arsenalVANILLACOP;
};

if (_side == opfor) then
{
    call TB_fnc_arsenalRUSSSimple;
};
