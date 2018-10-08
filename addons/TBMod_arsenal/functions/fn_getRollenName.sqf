/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
params [["_shortName", ""]];

if !(_shortName isEqualType "") then {_shortName = ACE_player getVariable ['TB_rolle', '']};
if (_shortName isEqualTo "") then {_shortName = ACE_player getVariable ['TB_rolle', '']};
private _customName = (ACE_player getVariable ["TB_arsenalType", ""]) == "CUSTOM";

private _return = "FEHLER_#204";
if (_customName && !isNil "TB_customName") then {
    _return = switch (_shortName) do {
        case "lead": {TB_customName select 0};
        case "grena": {TB_customName select 1};
        case "sani": {TB_customName select 2};
        case "mg": {TB_customName select 3};
        case "spreng": {TB_customName select 4};
        case "aaat": {TB_customName select 5};
        case "trag": {TB_customName select 6};
        case "dmr": {TB_customName select 7};
        case "pilot": {TB_customName select 8};
        case "sniper": {TB_customName select 9};
        case "spotter": {TB_customName select 10};
        case "jtac": {TB_customName select 11};
        case "arzt": {TB_customName select 12};
        case "rifle": {TB_customName select 13};
        case "pionier": {TB_customName select 14};
        default {"FEHLER #203"};
    };
} else {
    _return = switch (_shortName) do {
        case "lead": {"Truppführer"};
        case "grena": {"Grenadier"};
        case "sani": {"Kampfsanitäter"};
        case "mg": {"Unterstützungsschütze"};
        case "spreng": {"Sprengmeister"};
        case "aaat": {"Anti-Fahrzeug"};
        case "trag": {"Munitionsträger"};
        case "dmr": {"Gruppenaufklärer"};
        case "pilot": {"Pilot"};
        case "sniper": {"AufklärerSniper"};
        case "spotter": {"AufklärerSpotter"};
        case "jtac": {"DrohnenOP"};
        case "arzt": {"Arzt"};
        case "rifle": {"Schütze"};
        case "pionier": {"Pionier"};
        default {"FEHLER #201"};
    };
};

_return
