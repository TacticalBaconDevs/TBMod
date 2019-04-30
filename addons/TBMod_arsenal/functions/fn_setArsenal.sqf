/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_ammoBox", ["_rolle", ""]];

if (isNull _ammoBox) exitWith {};

// Check zum Überspringen
private _type = getText (configFile >> "CfgVehicles" >> typeOf _ammoBox >> "arsenalType");
if (_type in ["", "CUSTOM"]) exitWith {};

// Arsenalitems laden
private _allItems = call (switch (_type) do
{
    case "USA": {TB_fnc_arsenalUSA};
    case "RUSS": {TB_fnc_arsenalRUSS};
    case "BW": {TB_fnc_arsenalBW};
    case "VANILLA": {TB_fnc_arsenalVANILLA};
    case "Themen": {TB_fnc_arsenalThemen};
    case "SWOPReb": {TB_fnc_arsenalSWOPRebuplik}; // only for crash help
    default {hint "Schwerer Fehler #200"; []};
});

// MEDIC STUFF
_allItems append [
    "ACE_fieldDressing",

    "ACE_atropine",
    "ACE_adenosine",

    "ACE_salineIV",
    "ACE_salineIV_500",
    "ACE_salineIV_250",

    "ACE_tourniquet"
];

if (_rolle in ["sani", "arzt", "pilot"]) then
{
    _allItems append [
        "ACE_packingBandage",
        "ACE_elasticBandage",
        "ACE_quikclot",

        "ACE_epinephrine",
        "ACE_morphine",

        "ACE_plasmaIV",
        "ACE_plasmaIV_500",
        "ACE_plasmaIV_250",

        "ACE_bodyBag",
        "ACE_surgicalKit",
        "adv_aceCPR_AED"
    ];
};

if (_rolle == "arzt") then
{
    _allItems append [
        "ACE_personalAidKit",

        "ACE_bloodIV",
        "ACE_bloodIV_500",
        "ACE_bloodIV_250"
    ];
};

[_allItems] call TB_fnc_whitelist;

ace_arsenal_cameraPosition = [4, -8, 15, [0, 0, 1]];

// Box cleanen & Items hinzufügen
[_ammoBox, false] call ace_arsenal_fnc_removeBox;
[_ammoBox, true, false] call ace_arsenal_fnc_removeVirtualItems;
[_ammoBox, _allItems, false] call ace_arsenal_fnc_addVirtualItems;

// Virtuelle Items auf dem Spieler sichern und andere Arsenale syncen
private _tbCargo = _ammoBox getVariable "ace_arsenal_virtualItems";
ACE_player setVariable ["TB_arsenalCargo", _tbCargo];

// Arsenale syncen
{
    if ([_x] call TB_fnc_isArsenalType && {!(_tbCargo isEqualTo (_x getVariable ["ace_arsenal_virtualItems", []]))}) then
    {
        _x setVariable ["ace_arsenal_virtualItems", _tbCargo];
    };
}
forEach (entities (typeOf _ammoBox));
