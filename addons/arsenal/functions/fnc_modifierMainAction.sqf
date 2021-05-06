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
if (_arsenalType in ["USA", "BW", "RUSS", "UK"]) then {TB_blacklistRollen = ["dmr"]};

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
        if (worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter", "Cam_Lao_Nam"]) then
        {
            if (worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter"]) then
                {
                    // BRD
                    TB_blacklistRollen_themen = ["spreng", "dmr", "sniper", "spotter", "grena"];
                    TB_customName_themen = ["Truppführer","","Kampfsanitäter","MG3-Schütze","","Anti-Tank","Muniträger","","Pilot","","","Besatzung","Feldarzt","Waffenspez","Sprengspezialist"];
                }
                else
                {
                    // SOG
                    TB_blacklistRollen_themen = ["spreng","aaat", "dmr", "sniper", "spotter", "jtac"];
                    TB_customName_themen = ["Truppführer","Grenadier","Kampfsanitäter","MG-Schütze","","","Muniträger","","Pilot","","","","Feldarzt","Heckenschütze","Sprengspezialist"];
                };
        }
        else
        {
            // Vanilla-COP
            //TB_blacklistRollen_themen = ["grena", "mg", "spreng", "aaat", "trag", "sniper", "spotter", "jtac", "arzt", "pionier"];
            //TB_customName_themen = ["Hauptkommissar","","Kommissar-Sani","","","","","Oberkommissar","Polizeiobermeister-Flug","","","","","Polizeimeister",""];

            // WoMi Polizei
            TB_blacklistRollen_themen = ["grena", "mg", "dmr", "spreng", "aaat", "trag", "sniper", "spotter", "jtac", "pionier"];
            TB_customName_themen = ["Polizist","","Polizist-Sani","","","","","","Polizeipilot","","","","SWAT-Sani","SWAT",""];
        };
    };
    if (_side == independent) exitWith
    {
        // LDF
        TB_blacklistRollen_themen = ["spreng", "dmr"];
    };

    if (_side == opfor) exitWith {};
};

private _rolle = _player getVariable ["TB_rolle", ""];
private _condition = (_rolle != "") && ((getText (configFile >> "CfgVehicles" >> typeOf _target >> "arsenalType")) == _player getVariable ["TB_arsenalType", ""]);
_actionData set [1, ["TB-Arsenal", [_rolle] call FUNC(getRollenName)] select _condition];
