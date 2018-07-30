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
	_x setSkill ["aimingAccuracy", _skillArray#0];
	_x setSkill ["aimingShake", _skillArray#1];
    _x setSkill ["aimingSpeed", _skillArray#2];
    _x setSkill ["spotDistance", _skillArray#3];
    _x setSkill ["spotTime", _skillArray#4];
    _x setSkill ["courage", _skillArray#5];
    _x setSkill ["commanding", _skillArray#6];
    _x setSkill ["general", _skillArray#7];
	_x setSkill ["endurance", _skillArray#8];
	_x setSkill ["reloadspeed", _skillArray#9];
} forEach units _group;