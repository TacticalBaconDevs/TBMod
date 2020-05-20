#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _log = [];
_log pushBack "Test 'baseWeaponTest' beginnt...";

private _cfgWeapons = configfile >> "CfgWeapons";
{
    _x params ["_arsenalType", "_isLoaded"];

    _log pushBack (format ["Checke Arsenal '%1'", _arsenalType]);

    if ([] call _isLoaded) then
    {
        player setVariable ["TB_arsenalType", _arsenalType, true];
        player setVariable ["TB_rolle", nil, true];
        player setVariable ["TBMod_arsenal_arsenalCargo", nil];

        {
            private _rolle = _x;
            [_rolle, _arsenalType, objNull] call TBMod_arsenal_fnc_changeRolle;
            
            private _allItems = call (switch (_arsenalType) do
            {
                case "USA": {FUNC(arsenalUSA)};
                case "UK": {FUNC(arsenalUK)};
                case "RUSS": {FUNC(arsenalRUSS)};
                case "BW": {FUNC(arsenalBW)};
                case "VANILLA": {FUNC(arsenalVANILLA)};
                case "Themen": {FUNC(arsenalThemen)};
                default {{[]}};
            });
            
            {
                private _base = if (isClass (_cfgWeapons >> _x)) then {[_x] call BIS_fnc_baseWeapon} else {""};

                if (_base != "" && toLower _base != toLower _x) then {_log pushBack (format ["Check '%1' Fehler in defaultArsenal '%2' -> %3 [%4] ist keine BaseWeapon", _arsenalType, _rolle, _x, _base])};
            }
            forEach _allItems;
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

_log pushBack "Test 'baseWeaponTest' beendet!";
_log
