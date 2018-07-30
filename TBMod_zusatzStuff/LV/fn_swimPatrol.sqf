///////Simple Patrol script vH 1.0 - SPUn / LostVar
//
//*simple water patrol
//*Syntax: nul = [this] execVM "LV\patrol-vE.sqf";
//     or: nul = [this,center] execVM "LV\patrol-vE.sqf";
//*center : [position array] (center point of patrol, f.ex. (getMarkerPos "marker1")) DEFAULT: (getPos _unit) = unit's starting position
//		  or "marker"
//		  or unit/object
params [
		["_unit", objNull, [objNull]],
		["_center", nil, ["", [], objNull]]
	];

if (isNil "_center") then {_center = getPos _unit};

private _newPos = getPos _unit;
private _run = true;

private _newCenter;
while {_run} do {
	if (_center isEqualType []) then {
		_newCenter = _center;
	} else {
		if (_center in allMapMarkers) then {
			_newCenter = getMarkerPos _center;
		} else {
			_newCenter = getPos _center;
		};
	};

	_pDir = random 360;
    _pRange = random 300;
    _newPos = [(_newCenter select 0) + (sin _pDir) * _pRange, (_newCenter select 1) + (cos _pDir) * _pRange, 0];
   
	if (!surfaceIsWater _newPos) then {
		_dir = ((_newCenter select 0) - (_newPos select 0)) atan2 ((_newCenter select 1) - (_newPos select 1));
		_randomWay = floor (random 2); 
		while {!surfaceIsWater _newPos} do {
			if (_randomWay == 0) then {_dir = _dir + 20} else {_dir = _dir - 20};
			if (_dir < 0) then {_dir = _dir + 360}; 
			_newPos = [(_newCenter select 0) + (sin _dir) * _pRange, (_newCenter select 1) + (cos _dir) * _pRange, 0];
		};
	};
	
    _pos = _newPos;
		
    {
        _x doMove _newPos;
        _x setBehaviour "SAFE";
        _x limitSpeed 1;
    } foreach (crew _unit);
	
	if ({alive _x} count (crew _unit) == 0) exitWith {_run = false};
    waitUntil {unitReady _unit || _unit distance _pos < 30};

    uiSleep (5 + (random 10));
};

