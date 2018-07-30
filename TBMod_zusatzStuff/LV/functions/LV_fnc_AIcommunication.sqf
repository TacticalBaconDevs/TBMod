//ARMA3Alpha function LV_fnc_AIcommunication v1.0 - by SPUn / Kaarto Media
//Makes AI communicate via reveal command with other same sided groups
private["_i","_i2","_i3","_wGroup","_eGroup","_iGroup","_temp1"];
while{true}do{
	_i = 0;
	while{_i < ((count LV_AI_westGroups) - 1)}do{
		_i2 = 0;
		_wGroup = LV_AI_westGroups select _i;
		while{_i2 < ((count LV_AI_eastGroups) - 1)}do{
			_i3 = 0;
			_eGroup = LV_AI_eastGroups select _i2;
			while{_i3 < ((count LV_AI_indeGroups) - 1)}do{
				_iGroup = LV_AI_indeGroups select _i3;
			
				{
					if((_wGroup knowsAbout _x) > 1)then{
						_temp1 = _x;
						//hint "WEST SPOTTED EAST";
						{
							if(count (units _x) > 0)then{
								if((_x knowsAbout _temp1)<0.5)then{
									_x reveal [_temp1, 1.6];
									//hint format["WEST GROUP INFORMS %1",_x];
								};
								sleep 2;
							};
						}forEach LV_AI_westGroups;
					};
					if((_iGroup knowsAbout _x) > 1)then{
						_temp1 = _x;
						//hint "RESISTANCE SPOTTED EAST";
						{
							if(count (units _x) > 0)then{
								if((_x knowsAbout _temp1)<0.5)then{
									_x reveal [_temp1, 1.6];
									//hint format["RESISTANCE GROUP INFORMS %1",_x];
								};
								sleep 2;
							};
						}forEach LV_AI_indeGroups;
					};
				}forEach units _eGroup;
				sleep 0.3;
				{
					if((_eGroup knowsAbout _x) > 1)then{
						_temp1 = _x;
						//hint "EAST SPOTTED WEST";
						{
							if(count (units _x) > 0)then{
								if((_x knowsAbout _temp1)<0.5)then{
									_x reveal [_temp1, 1.6];
									//hint format["EAST GROUP INFORMS %1",_x];
								};
								sleep 2;
							};
						}forEach LV_AI_eastGroups;
					};
					if((_iGroup knowsAbout _x) > 1)then{
						_temp1 = _x;
						//hint "RESISTANCE SPOTTED WEST";
						{
							if(count (units _x) > 0)then{
								if((_x knowsAbout _temp1)<0.5)then{
									_x reveal [_temp1, 1.6];
									//hint format["RESISTANCE GROUP INFORMS %1",_x];
								};
								sleep 2;
							};
						}forEach LV_AI_indeGroups;
					};
				}forEach units _wGroup;
				sleep 0.3;
				{
					if((_eGroup knowsAbout _x) > 1)then{
						_temp1 = _x;
						//hint "EAST SPOTTED RESISTANCE";
						{
							if(count (units _x) > 0)then{
								if((_x knowsAbout _temp1)<0.5)then{
									_x reveal [_temp1, 1.6];
									//hint format["EAST GROUP INFORMS %1",_x];
								};
								sleep 2;
							};
						}forEach LV_AI_eastGroups;
					};
					if((_wGroup knowsAbout _x) > 1)then{
						_temp1 = _x;
						//hint "WEST SPOTTED RESISTANCE";
						{
							if(count (units _x) > 0)then{
								if((_x knowsAbout _temp1)<0.5)then{
									_x reveal [_temp1, 1.6];
									//hint format["WEST GROUP INFORMS %1",_x];
								};
								sleep 2;
							};
						}forEach LV_AI_westGroups;
					};
				}forEach units _iGroup;
				
				_i3 = _i3 + 1;
				sleep 0.3;
			};
			_i2 = _i2 + 1;
			sleep 0.3;
		};
		_i = _i + 1;
		sleep 0.3;
	};
	sleep 6;
};