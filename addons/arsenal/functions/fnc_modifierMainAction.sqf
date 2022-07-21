#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

private _arsenalType = _player getVariable ["TB_arsenalType", ""];

// Arsenale Rollen blockieren
GVAR(blacklistRollen) = [];
if (_arsenalType in ["USA", "BW", "RUSS", "UK"]) then {GVAR(blacklistRollen) = ["dmr"]};
if (_arsenalType in ["VANILLA"]) then {GVAR(blacklistRollen) = ["rifle"]};

GVAR(blacklistRollen_themen) = [];
// GVAR(customName_themen): ["Truppführer", "Grenadier", "Kampfsanitäter", "Unterstützungsschütze", "Sprengmeister", "Anti-Fahrzeug", "Munitionsträger", "Gruppenaufklärer", "Pilot", "AufklärerSniper", "AufklärerSpotter", "DrohnenOP", "Arzt", "Schütze", "Pionier"]
GVAR(customName_themen) = [];
if (_arsenalType == "Themen") then
{
    private _patches = configfile >> "CfgPatches";
    private _side = side ACE_player;

    if (isClass (_patches >> "uns_main")) exitWith {GVAR(blacklistRollen_themen) = ["jtac", "sniper", "spotter", "rifle"]};
    if (isClass (_patches >> "ASZ_PersoneIT_A3")) exitWith {GVAR(blacklistRollen_themen) = ["dmr"]};
    if (isClass (_patches >> "SWOP_Main")) exitWith {GVAR(blacklistRollen_themen) = ["jtac", "sniper", "spotter", "pionier", "dmr"]};

    if (_side == blufor) exitWith
    {
        private _worldName = toLower worldName;
        if (_worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter", "cam_lao_nam"]) then
        {
            if (_worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter"]) then
            {
                // BRD
                GVAR(blacklistRollen_themen) = ["spreng", "dmr", "sniper", "spotter", "grena"];
                GVAR(customName_themen) = ["Truppführer","","Kampfsanitäter","MG3-Schütze","","Anti-Tank","Muniträger","","Pilot","","","Besatzung","Feldarzt","Waffenspez","Sprengspezialist"];
            }
            else
            {
                // SOG
                GVAR(blacklistRollen_themen) = ["spreng","aaat", "dmr", "sniper", "spotter", "jtac"];
                GVAR(customName_themen) = ["Truppführer","Grenadier","Kampfsanitäter","MG-Schütze","","","Muniträger","","Pilot","","","","Feldarzt","Waffenspez","Sprengspezialist"];
            };
        }
        else
        {
            // Vanilla-COP
            //GVAR(blacklistRollen_themen) = ["grena", "mg", "spreng", "aaat", "trag", "sniper", "spotter", "jtac", "arzt", "pionier"];
            //GVAR(customName_themen) = ["Hauptkommissar","","Kommissar-Sani","","","","","Oberkommissar","Polizeiobermeister-Flug","","","","","Polizeimeister",""];

            // WoMi Polizei
            GVAR(blacklistRollen_themen) = ["grena", "mg", "dmr", "spreng", "aaat", "trag", "sniper", "spotter", "jtac", "pionier"];
            GVAR(customName_themen) = ["Polizist","","Polizist-Sani","","","","","","Polizeipilot","","","","SWAT-Sani","SWAT",""];
        };
    };
    if (_side == independent) exitWith
    {
        // LDF
        GVAR(blacklistRollen_themen) = ["spreng", "dmr"];
    };

    if (_side == opfor) exitWith {};
};

// Missionbauer Blacklists
if (!isNil "TB_blacklistRollen" && {TB_blacklistRollen isEqualType []}) then
{
    GVAR(blacklistRollen) append TB_blacklistRollen;
    GVAR(blacklistRollen) arrayIntersect GVAR(blacklistRollen);

    GVAR(blacklistRollen_themen) append TB_blacklistRollen;
    GVAR(blacklistRollen_themen) arrayIntersect GVAR(blacklistRollen_themen);

    GVAR(customName_themen) append TB_blacklistRollen;
    GVAR(customName_themen) arrayIntersect GVAR(customName_themen);
};

private _rolle = _player getVariable ["TB_rolle", ""];
private _condition = (_rolle != "") && ((getText (configOf _target >> "arsenalType")) == _player getVariable ["TB_arsenalType", ""]);
_actionData set [1, ["TB-Arsenal", [_rolle] call FUNC(getRollenName)] select _condition];
