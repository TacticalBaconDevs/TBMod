/*
    Author: Willi "shukari" Graff
*/
params ["_shoothouse","_garnision","_unitPoses","_zone"];
// private _shoothouse = "stadt"; 
// private _garnision = [sh_stadt1,sh_stadt2,sh_stadt3,sh_stadt4,sh_stadt5,sh_stadt6,sh_stadt7,sh_stadt8,sh_stadt9,sh_stadt10,sh_stadt11,sh_stadt12,sh_stadt13,sh_stadt14,sh_stadt15,sh_stadt16,sh_stadt17,sh_stadt18,sh_stadt19,sh_stadt20,sh_stadt21,sh_stadt22,sh_stadt23,sh_stadt24,sh_stadt25]; 
// private _unitPoses = ["sh_stadt26","sh_stadt27","sh_stadt28"];
// private _zone = "";
private _var = missionNamespace getVariable ["shoothouse_" + _shoothouse, true]; 
private _allUnits = missionNamespace getVariable ["shoothouse_units_" + _shoothouse, []]; 
private _units = ["rhs_msv_rifleman", "rhs_msv_grenadier", "rhs_msv_LAT", "rhs_msv_RShG2", "rhs_msv_machinegunner", "rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2", "rhs_msv_emr_machinegunner"]; 

{deleteVehicle _x} forEach _allUnits;
_allUnits = _allUnits - [objNull];

uiSleep 0.11;
(format ["Shoothouse %1 wird: %2", toUpper _shoothouse, ["gelöscht", "geladen"] select _var]) remoteExecCall ["systemChat"];

if (_var) then 
{ 
    {
        private _add = 0;
        private _obj = if (_x isEqualType objNull) then {_x} else {_add = 6; _x select 0};
        
        private _group = createGroup east; 
        for "_i" from 1 to (_add + 2 + random 3) do 
        { 
            private _unit = _group createUnit [selectRandom _units, [0,0,0], [], 0, "CAN_COLLIDE"]; 
            _allUnits pushBack _unit;
            _unit addeventhandler ["FiredNear",{[_this select 0, ["Up", "Middle"]] spawn TB_fnc_UpDown}];
        };

        // _group setBehaviour "SAFE";
        // _group setCombatMode "YELLOW";
        // _group setSpeedMode "LIMITED";

        [getPos _obj, units _group, _obj, true, true, false, false, true] call TB_fnc_ZenOccupyHouse; 
    } 
    forEach _garnision; 

    { 
        private _add = 0;
        private _obj = if (_x isEqualType objNull) then {_x} else {_add = 4; _x select 0};
    
        private _group = createGroup east; 
        for "_i" from 1 to (_add + 3 + random 3) do 
        { 
            private _unit = _group createUnit [selectRandom _units, [0,0,0], [], 0, "CAN_COLLIDE"]; 
            _unit setPos (getPos _obj); 
            _allUnits pushBack _unit;
        }; 

        [_group, getPos _obj, 30, nil, nil, "SAFE", nil, "LIMITED", nil, nil, [5, 10, 15]] call CBA_fnc_taskPatrol; 
    } 
    forEach _unitPoses;
    
    _allUnits = _allUnits - [objNull];

    null = [_zone,_shoothouse] spawn
    {
        params ["_zone","_shoothouse"];
        waitUntil {
                private _allUnits = missionNamespace getVariable ["shoothouse_units_" + _shoothouse, []];
                {deleteVehicle _x} forEach (_allUnits - (_allUnits inAreaArray _zone));
                _allUnits = _allUnits - [objNull];
                
                private _empty = (0 == {alive _x} count _allUnits);
                if (_empty) then {(format ["Shoothouse %1 wird ist vollständig erobert!", toUpper _shoothouse]) remoteExecCall ["systemChat"]};
                
                uiSleep 0.1;
                (missionNamespace getVariable ["shoothouse_" + _shoothouse, true]) || _empty
            };
    };
};

missionNamespace setVariable ["shoothouse_units_" + _shoothouse, _allUnits]; 
missionNamespace setVariable ["shoothouse_" + _shoothouse, !_var];
