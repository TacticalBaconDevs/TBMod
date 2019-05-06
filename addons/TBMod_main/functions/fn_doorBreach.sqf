/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (!TB_doorBreach && _input) then {TB_doorBreach = true};
if (!TB_doorBreach) exitWith {};

player addEventHandler ["FIRED", {
    if (!TB_doorBreach) exitWith {player removeEventHandler ["FIRED", _thisEventHandler]};

    params ["", "_weapon", "", "", "_ammo"];

    if (_ammo == "rhs_ammo_12g_slug" || _ammo == "TB_rhs_ammo_40mm_Slugshot") then {
        private _objs = [cursorObject, "GEOM"] intersect [asltoagl (eyepos player), screentoworld [0.5, 0.5]];
        if !(_objs isEqualTo []) then {
            (_objs select 0) params ["_door", "_distance"];

            if (_distance <= 5 && {(_door select [0, 4]) == "door"}) then {
                private _doorStr = "door_" + (_door select [5, 1]);
                cursorObject setVariable ["bis_disabled_" + _doorStr, 0, true];
                cursorObject animateSource [_doorStr + "_sound_source", 1, 5];
            };
        };
    };
}];
