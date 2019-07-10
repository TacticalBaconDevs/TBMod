#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

private _arsenalType = _player getVariable ["TB_arsenalType", ""];

// Arsenale Rollen blockieren
TB_blacklistRollen = [];
if (_arsenalType == "USA") then {TB_blacklistRollen = ["dmr"]};

TB_blacklistRollen_themen = [];
// TB_customName_themen: ["Truppführer", "Grenadier", "Kampfsanitäter", "Unterstützungsschütze", "Sprengmeister", "Anti-Fahrzeug", "Munitionsträger", "Gruppenaufklärer", "Pilot", "AufklärerSniper", "AufklärerSpotter", "DrohnenOP", "Arzt", "Schütze", "Pionier"]
TB_customName_themen = [];
if (_arsenalType == "Themen") then
{
    private _patches = configfile >> "CfgPatches";
    private _side = side ACE_player;

    if (isClass (_patches >> "uns_main")) exitWith {TB_blacklistRollen_themen = ["jtac", "sniper", "spotter", "rifle"]};

    if (_side == blufor) exitWith
    {
        if (worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter"]) then
        {
            // BRD
            TB_blacklistRollen_themen = [ "sani", "spreng", "dmr", "pilot", "sniper", "spotter", "jtac", "rifle"];
            TB_customName_themen = ["Truppführer","Schütze + DM22A1","","MG3-Schütze","","Anti-Tank","Muniträger","","","","","","Feldarzt","","Sprengspezialist"];
        }
        else
        {
            // Vanilla-COP
            TB_blacklistRollen_themen = ["grena", "mg", "spreng", "aaat", "trag", "sniper", "spotter", "jtac", "arzt", "pionier"];
            TB_customName_themen = ["Hauptkommissar","","Kommissar-Sani","","","","","Oberkommissar","Polizeiobermeister-Flug","","","","","Polizeimeister",""];
        };
    };

    if (_side == opfor) exitWith {};
};

private _rolle = _player getVariable ["TB_rolle", ""];
private _condition = (_rolle != "") && ((getText (configFile >> "CfgVehicles" >> typeOf _target >> "arsenalType")) == _player getVariable ["TB_arsenalType", ""]);
_actionData set [1, ["TB-Arsenal", [_rolle] call FUNC(getRollenName)] select _condition];
