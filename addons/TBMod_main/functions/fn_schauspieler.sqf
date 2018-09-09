/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Authors: shukari, Eric Ruhland
*/
if (player getVariable ["TBMod_main_enableschauspieler",false]) then {
    [] spawn
    {
        private _markers = [];

        waitUntil
        {
            waitUntil {uiSleep 2; visibleMap};
            
            {deleteMarkerLocal _x} forEach _markers;
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
                
                if !((vehicle _x) in _vehicles) then
                {
                    _marker = createMarkerLocal [format ["%1_marker", random 999999], visiblePosition _x];
                    _marker setMarkerColorLocal _color;
                    _marker setMarkerTypeLocal (["mil_start", "hd_arrow"] select (vehicle _x == _x));
                    _marker setMarkerDirLocal (getDir (vehicle _x));
                    _marker setMarkerSizeLocal [0.75,0.75];
                    _markers pushBack _marker;
                    _vehicles pushBack (vehicle _x);
                }; 
            }
            forEach allUnits;
            
            uiSleep 0.1;
            false;
        };
    };
    
    private _actionschauspieler = ["Schauspieler", "Schauspieler", "", {}, {true}] call ace_interact_menu_fnc_createAction;
    private _actionarsenal = ["Arsenal", "Arsenal", "", {[player, player, true] call ace_arsenal_fnc_openBox},{true}] call ace_interact_menu_fnc_createAction;
    private _actiongarage = ["Garage", "Garage", "",{
        _vehicle = createVehicle ["Land_HelipadEmpty_F", player getPos [10, getDir player], [], 0, "CAN_COLLIDE"]; 
        ["Open", [true, _vehicle]] call RHS_fnc_garage;
    },{true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _actionschauspieler] call ace_interact_menu_fnc_addActionToObject;
    [player, 1, ["ACE_SelfActions", "Schauspieler"], _actionarsenal] call ace_interact_menu_fnc_addActionToObject;
    [player, 1, ["ACE_SelfActions", "Schauspieler"], _actiongarage] call ace_interact_menu_fnc_addActionToObject;
    
    addMissionEventHandler ["MapSingleClick", {
        params ["_units", "_pos", "_alt", "_shift"];
        if (_alt && _shift) then {(vehicle player) setPosATL _pos};
    }];
};