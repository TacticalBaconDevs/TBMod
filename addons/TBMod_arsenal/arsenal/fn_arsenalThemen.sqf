/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _patches = configfile >> "CfgPatches";
private _side = side ACE_player;

if (isClass (_patches >> "uns_main")) exitWith {call TB_fnc_arsenalUSAVietnam};

if (_side == blufor) exitWith
{
    if (worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter"]) then
    {
        call TB_fnc_arsenalBRD;
    }
    else
    {
        call TB_fnc_arsenalVANILLACOP;
    };
};

if (_side == opfor) exitWith {call TB_fnc_arsenalRUSSSimple};
