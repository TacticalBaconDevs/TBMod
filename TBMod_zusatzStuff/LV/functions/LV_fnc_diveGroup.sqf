//ARMA3Alpha function LV_fnc_diveGroup v2.0 - by SPUn / Kaarto Media (included by FX2K)
//Spawns infantry group and returns its leader
private ["_hq","_pos","_side","_size","_men","_amount","_grp","_i","_man1","_man","_leader","_classModuleFilters","_clean"];
_pos = param [0,[0,0,0]];
_side = param [1,0];
_size = param [2,6];
_grpId = param [3,nil];
_classModuleFilters = param [4,[]];		
_syncedUnit = param [5,nil];
_dissapearDistance = param [6,nil];
_clean = param [7,false];

_men = [];

if(typeName _size == "ARRAY")then{
	_amount = ((random (_size select 0)) + (_size select 1));
}else{
	_amount = _size;
};

switch(_side)do{
	case 0:{
		_hq = createCenter west;
		_grp = createGroup west;
	};
	case 1:{
		_hq = createCenter east;
		_grp = createGroup east;
	};
	case 2:{
		_hq = createCenter resistance;
		_grp = createGroup resistance;
	};
};

_men = ([_classModuleFilters,[(_side + 1), 7]] call LV_classnames);

_men = [_men] call LV_validateClassArrays;
if((count _men) == 0)then{
	_men = ([[],[(_side + 1), 7]] call LV_classnames);
};

_men = selectRandom _men;

_i = 0; 
for "_i" from 0 to _amount do {
	_man1 = selectRandom _men;
	_man = _grp createUnit [_man1, _pos, [], 0, "NONE"];
	if(_clean)then{
		_man setVariable ["syncedUnit",_syncedUnit,false];
		_man setVariable ["dissapearDistance",_dissapearDistance,false];
		_man addEventHandler ["killed", {_this execVM "\modules_km\LV\LV_functions\LV_fnc_ACAIkilled.sqf"}];
	};
	sleep 0.3 ;
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp",_grpId];
};

_leader = leader _grp;
_leader