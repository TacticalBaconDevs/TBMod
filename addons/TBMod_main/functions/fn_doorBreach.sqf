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

    if (_ammo == "rhs_ammo_12g_slug" && {_weapon in ["rhs_weap_M590_8RD", "rhs_weap_M590_5RD"]}) then {
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

//["CAManBase", "HitPart", {
//    {
//        _x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
//
//        if (typeOf _projectile == "rhsusf_40mm_Practice") then {
//            [_target, [2, 0] select (isPlayer _target), [5, 2] select (isPlayer _target)] remoteExec ["rhs_fnc_flashbang_effect", _target];
//        };
//    }
//    forEach _this;
//}] call CBA_fnc_addClassEventHandler;
