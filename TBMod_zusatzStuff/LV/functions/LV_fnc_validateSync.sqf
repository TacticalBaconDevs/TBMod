//LV_fnc_validateSync.sqf - validates synced objects of module and returns possible target and ref. to classes module. //SPUn | Kaarto Media
private ["_classModule","_tPos","_logic","_res"];
_logic = param [0,objNull];
_tPos = synchronizedObjects _logic;
_classModule = objNull;
if(count _tPos == 0)then{
	_tPos = _logic;
}else{
	private ["_syncedCopy"];
	_syncedCopy = _tPos;
	if(count _syncedCopy == 1)then{
		if(typeOf (_syncedCopy select 0) == "KM_ClassesModule")then{
			_classModule = _syncedCopy select 0;
			_tPos = _logic;
		}else{
			if(typeName (_syncedCopy select 0) != "OBJECT" || typeOf (_syncedCopy select 0) != "EmptyDetector")then{ _tPos = _syncedCopy select 0; }else{_tPos = _logic;};
		};
	}else{
		private ["_i","_syncedCount"];
		_syncedCount = count _syncedCopy;
		for "_i" from 0 to (_syncedCount - 1) do{
			if(typeOf (_syncedCopy select _i) == "KM_ClassesModule")then{
				_classModule = _syncedCopy select _i;
			}else{
				if(typeName (_syncedCopy select _i) != "OBJECT" || typeOf (_syncedCopy select _i) != "EmptyDetector")then{ _tPos = _syncedCopy select _i; };
			};
		};
		if(_tPos isEqualTo _syncedCopy)then{_tPos = _logic;};
	};
};

_res = [_classModule,_tPos];
_res;