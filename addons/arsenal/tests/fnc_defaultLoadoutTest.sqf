#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _log = ["Test 'defaultLoadoutTest' beginnt..."];

{
    _x params ["_arsenalType", "_isLoaded"];

    _log pushBack (format ["Checke Arsenal '%1'", _arsenalType]);

    if ([] call _isLoaded) then
    {
        player setVariable ["TB_arsenalType", _arsenalType, true];
        player setVariable ["TB_rolle", nil, true];
        player setVariable ["TBMod_arsenal_arsenalCargo", nil];

        {
            [_x, _arsenalType, objNull] call TBMod_arsenal_fnc_changeRolle;

            private _msg = [player] call FUNC(checkItems);
            if (_msg != "") then {_log pushBack (format ["Check '%1' Fehler in defaultArsenal '%2' -> %3", _arsenalType, _x, _msg select [2]])};
        }
        forEach ["lead", "grena", "sani", "mg", "spreng", "aaat", "trag", "dmr", "pilot", "sniper", "spotter", "jtac", "arzt", "rifle", "pionier"];
    }
    else
    {
        _log pushBack (format ["Mod vom Arsenal '%1' ist nicht geladen!", _arsenalType]);
    };
}
forEach [
    ["USA", {isClass (configfile >> "CfgPatches" >> "rhsusf_main")}],
    ["UK", {isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Weapons")}],
    ["RUSS", {isClass (configfile >> "CfgPatches" >> "rhs_main")}],
    ["BW", {isClass (configfile >> "CfgPatches" >> "bwa3_common")}],
    ["VANILLA", {true}]
];

_log pushBack "Test 'defaultLoadoutTest' beendet!";
_log
