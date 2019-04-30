/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

// ThemenArsenale Rollen blockieren
TB_blacklistRollen_themen = [];
TB_customName_themen = [];
if ((_player getVariable ["TB_arsenalType", ""]) == "Themen") then
{
    private _patches = configfile >> "CfgPatches";
    if (isClass (_patches >> "uns_main")) exitWith {TB_blacklistRollen_themen = ["jtac", "sniper", "spotter", "rifle"]};
    if (isClass (_patches >> "SWOP_Main")) exitWith {TB_blacklistRollen_themen = ["sniper", "spotter", "rifle"]};

    private _side = side ACE_player;
    if (_side == blufor) exitWith
    {
        // Vanilla-COP
        // TB_blacklistRollen_themen = ["grena", "mg", "spreng", "aaat", "trag", "sniper", "spotter", "jtac", "arzt", "pionier"];
        // TB_customName_themen = ["Hauptkommissar","","Kommissar-Sani","","","","","Oberkommissar","Polizeiobermeister-Flug","","","","","Polizeimeister",""];
        // BRD
        TB_blacklistRollen_themen = ["rifle", "spreng", "sniper", "spotter", "jtac", "pilot"];
        TB_customName_themen = ["","","","","","","","","","","","","","",""];
    };

    if (_side == opfor) exitWith {};
};

private _rolle = _player getVariable ["TB_rolle", ""];
private _condition = (_rolle != "") && ((getText (configFile >> "CfgVehicles" >> typeOf _target >> "arsenalType")) == _player getVariable ["TB_arsenalType", ""]);
_actionData set [1, ["TB-Arsenal", [_rolle] call TB_fnc_getRollenName] select _condition];
