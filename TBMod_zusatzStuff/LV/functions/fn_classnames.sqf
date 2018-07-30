/*
	0: filters (array) : classes from config_aissp.hpp
	1: type =
		1 = Cars
		2 = Tanks
		3 = Helis
		4 = Planes
		5 = Ships
		6 = Men
		7 = Divers
*/

params [
		["_filters", [], [[]]],
		["_type", 0, [0]]
	];

private _missionCfg = getMissionConfig "config_aissp" >> "classPresets";		
private _addonCfg = configfile >> "config_aissp" >> "classPresets";		
private _results = [];
{
	private _cfg = nil;
	if (isClass (_addonCfg >> _x)) then {_cfg = _addonCfg};
	if (isClass (_missionCfg >> _x)) then {_cfg = _missionCfg};
	
	if (!isNil "_cfg") then {
		private _typeValue = switch (_type) do {
			case 1: {"cars"};
			case 2: {"tanks"};
			case 3: {"helicopters"};
			case 4: {"planes"};
			case 5: {"ships"};
			case 6: {"men"};
			case 7: {"divers"};
		};
		
		_results append (getArray (_cfg >> _x >> _typeValue));
	};
} forEach _filters;

_results;