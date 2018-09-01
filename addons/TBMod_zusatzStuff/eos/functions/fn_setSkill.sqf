params ["_grp", "_skillArray"];

private _skillset = server getVariable _skillArray;
{
    private _unit = _x;
    {
        _unit setSkill [_x, (_skillset select _forEachIndex) + (random 0.2) - (random 0.2)];
    }
    forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];
}
forEach (units _grp);
