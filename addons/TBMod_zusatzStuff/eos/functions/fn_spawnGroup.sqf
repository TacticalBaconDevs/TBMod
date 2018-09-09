/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)
  
    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {};

params [
        "_pos",
        "_grpSize",
        "_faction",
        "_side"
    ];

private _pool = [_faction, parseNumber (surfaceiswater _pos)] call TB_EOS_fnc_unitPools;
private _grp = createGroup _side;

for "_i" from 1 to round (_grpSize) do
{
    _grp createUnit [selectRandom _pool, _pos, [], 6, "FORM"];
};

_grp
