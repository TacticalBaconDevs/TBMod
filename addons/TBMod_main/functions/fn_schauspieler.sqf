/*
    Author: Willi "shukari" Graff
*/
if (str player in ["schauspieler1", "schauspieler2", "schauspieler3", "schauspieler4", "schauspieler5", "schauspieler6"]) then {
    [] spawn
    {
        private _markers = [];

        waitUntil
        {
            waitUntil {uiSleep 2; visibleMap};
            
            {deleteMarkerLocal _x; false} count _markers;
            _markers = [];
            private _vehicles = [];
            
            {
                private _color = switch (side _x) do
                {
                    case west: {["colorBLUFOR", "ColorBlue"] select (isPlayer _x)};
                    case east: {"colorOPFOR"};
                    case independent: {"ColorGUER"};
                    default {"ColorCIV"};
                };
                
                if !((vehicle _x) in _vehicles) then {
                    _marker = createMarkerLocal [format ["%1_marker", random 999999], visiblePosition _x];
                    _marker setMarkerColorLocal _color;
                    _marker setMarkerTypeLocal (["mil_start", "hd_arrow"] select (vehicle _x == _x));
                    _marker setMarkerDirLocal (getDir (vehicle _x));
                    _marker setMarkerSizeLocal [0.75,0.75];
                    _markers pushBack _marker;
                    _vehicles pushBack (vehicle _x);
                };
                
                false;
            }
            count allUnits;
            
            uiSleep 0.1;
            false;
        };
    };
    
    private _addActions = {
        if (0 == {((player actionParams _x) select 0) isEqualTo "Arsenal"} count (actionIDs player)) then {
            player addAction ["Arsenal", {[player, player, true] call ace_arsenal_fnc_openBox}, nil, 0.3, false, false]; //["Open",true] spawn BIS_fnc_arsenal
            player addAction ["Garage", {
                _vehicle = createVehicle ["Land_HelipadEmpty_F", player getPos [10, getDir player], [], 0, "CAN_COLLIDE"]; 
                ["Open", [true, _vehicle]] call RHS_fnc_garage;
            }, nil, 0.1, false, false];
            player onMapSingleClick "if (_alt && _shift) then {(vehicle player) setPosATL _pos}";
        };
    };
    
    call _addActions;
    player addEventHandler ["Respawn", _addActions];
};