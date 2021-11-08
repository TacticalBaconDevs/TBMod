#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_shortName", ""], ["_custom", true]];

if !(_shortName isEqualType "") then {_shortName = ACE_player getVariable ["TB_rolle", ""]};
if (_shortName isEqualTo "") then {_shortName = ACE_player getVariable ["TB_rolle", ""]};

// Customnames
private _missionVar = missionNamespace getVariable ["TB_customName", []];
private _arsenalType = ACE_player getVariable ["TB_arsenalType", ""];
if (_custom) then
{
    if (_arsenalType == "CUSTOM") then {_missionVar = missionNamespace getVariable ["TB_customName_custom", []]};
    if (_arsenalType == "Themen") then {_missionVar = missionNamespace getVariable ["TB_customName_themen", []]};
};

switch (_shortName) do
{
    case "lead": {_missionVar param [0, "Truppführer"]};
    case "grena": {_missionVar param [1, "Grenadier"]};
    case "sani": {_missionVar param [2, "Kampfsanitäter"]};
    case "mg": {_missionVar param [3, "Unterstützungsschütze"]};
    case "spreng": {_missionVar param [4, "Sprengmeister"]};
    case "aaat": {_missionVar param [5, "Anti-Fahrzeug"]};
    case "trag": {_missionVar param [6, "Munitionsträger"]};
    case "dmr": {_missionVar param [7, "Gruppenaufklärer"]};
    case "pilot": {_missionVar param [8, "Pilot"]};
    case "sniper": {_missionVar param [9, "AufklärerSniper"]};
    case "spotter": {_missionVar param [10, "AufklärerSpotter"]};
    case "jtac": {_missionVar param [11, "DrohnenOP"]};
    case "arzt": {_missionVar param [12, "Arzt"]};
    case "rifle": {_missionVar param [13, "Waffenspezialist"]};
    case "pionier": {_missionVar param [14, "Pionier"]};
};
