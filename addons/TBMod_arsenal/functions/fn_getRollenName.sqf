/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_shortName", ""]];

if !(_shortName isEqualType "") then {_shortName = ACE_player getVariable ['TB_rolle', '']};
if (_shortName isEqualTo "") then {_shortName = ACE_player getVariable ['TB_rolle', '']};
if (_shortName isEqualTo "") exitWith {""};
private _arsenalType = ACE_player getVariable ["TB_arsenalType", ""];

private _return = "FEHLER_#204";
if (_arsenalType in ["CUSTOM", "Themen"]) exitWith
{
    private _varName = format ["TB_customName%1", ["_themen", ""] select (_arsenalType == "CUSTOM")];
    private _missionVar = missionNamespace getVariable _varName;
    if (isNil "_missionVar") exitWith {};
    
    _return = _missionVar select (switch (_shortName) do {
        case "lead": {0};
        case "grena": {1};
        case "sani": {2};
        case "mg": {3};
        case "spreng": {4};
        case "aaat": {5};
        case "trag": {6};
        case "dmr": {7};
        case "pilot": {8};
        case "sniper": {9};
        case "spotter": {10};
        case "jtac": {11};
        case "arzt": {12};
        case "rifle": {13};
        case "pionier": {14};
        default {0};
    });
    
    _return;
};

// Normale Namen
_return = switch (_shortName) do
{
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

_return;
