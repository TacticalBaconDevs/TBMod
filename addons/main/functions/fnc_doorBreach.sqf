#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (!GVAR(doorBreach) && _input) then {GVAR(doorBreach) = true};
if (!GVAR(doorBreach)) exitWith {};

player addEventHandler ["FIRED", {
    params ["", "_weapon", "", "", "_ammo"];

    if (!GVAR(doorBreach)) exitWith {player removeEventHandler ["FIRED", _thisEventHandler]};

    if (_ammo in ["rhs_ammo_12g_slug","B_12Gauge_Slug_NoCartridge", "TB_rhs_ammo_40mm_Slug", "TB_ammo_MPR_Slug", "ACE_12Gauge_Pellets_Submunition_No4_Buck"]) then
    {
        private _objs = [cursorObject, "GEOM"] intersect [ASLToAGL (eyePos player), screenToWorld [0.5, 0.5]];

        if (_objs isNotEqualTo []) then
        {
            (_objs select 0) params ["_door", "_distance"];

            if (_distance <= 7 && {(_door select [0, 4]) == "door"}) then
            {
                private _doorStr = "door_" + (_door select [5, 1]);
                cursorObject setVariable ["bis_disabled_" + _doorStr, 0, true];
                cursorObject animateSource [_doorStr + "_sound_source", 1, 5];
            };
        };
    };
}];
