/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)
  
    Complete rewrite and modification:
        shukari
*/
params ["_grp", "_skillArray"];

if (isNull _grp) exitWith {};

private _skillset = tb_server getVariable _skillArray;
{
    private _unit = _x;
    {
        _unit setSkill [_x, (_skillset select _forEachIndex) + (random 0.2) - (random 0.2)];
    }
    forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];
}
forEach (units _grp);
