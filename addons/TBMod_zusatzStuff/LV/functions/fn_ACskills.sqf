//ARMA3Alpha function LV_fnc_ACskills v0.8 - by SPUn / lostvar
//adjusts AI skills
params [
        ["_group", grpNull, [grpNull]],
        ["_skills", 0.5, [0, []]]
    ];

private _skillArray;
if (_skills isEqualType 0) then {
    _skillArray = [_skills,_skills,_skills,_skills,_skills,_skills,_skills,_skills,_skills,_skills];
} else {
    _skillArray = _skills;
};

{
    _x setSkill ["aimingAccuracy", _skillArray select 0];
    _x setSkill ["aimingShake", _skillArray select 1];
    _x setSkill ["aimingSpeed", _skillArray select 2];
    _x setSkill ["spotDistance", _skillArray select 3];
    _x setSkill ["spotTime", _skillArray select 4];
    _x setSkill ["courage", _skillArray select 5];
    _x setSkill ["commanding", _skillArray select 6];
    _x setSkill ["general", _skillArray select 7];
    _x setSkill ["endurance", _skillArray select 8];
    _x setSkill ["reloadspeed", _skillArray select 9];
} forEach units _group;