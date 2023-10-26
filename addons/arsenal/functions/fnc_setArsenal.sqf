#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_ammoBox", ["_rolle", ""]];

if (isNull _ammoBox) exitWith {};

// Check zum Überspringen
private _type = getText (configOf _ammoBox >> "arsenalType");
if (_type in ["", "CUSTOM"]) exitWith {};

// Arsenalitems laden
private _allItems = call (switch (_type) do
{
    case "USA": {FUNC(arsenalUSA)};
    case "UK": {FUNC(arsenalUK)};
    case "RUSS": {FUNC(arsenalRUSS)};
    case "BW": {FUNC(arsenalBW)};
    case "VANILLA": {FUNC(arsenalVANILLA)};
    case "Themen": {FUNC(arsenalThemen)};
    default {hint "Schwerer Fehler #300 | Arsenaltyp unbekannt"; {[]}};
});

// COLLING
_allItems append [
    "ACE_WaterBottle",
    "ACE_Canteen"
];

// MEDIC STUFF
_allItems append [
    "ACE_packingBandage",
    "ACE_quikclot",

    "kat_Painkiller",
    "kat_Carbonate",

    "ACE_salineIV_250",
    "ACE_salineIV_500",

    "ACE_bodyBag",
    "kat_guedel",

    "ACE_tourniquet"
];

if (_rolle in ["sani", "arzt", "pilot"]) then
{
    _allItems append [
        "ACE_fieldDressing",
        "ACE_packingBandage",
        "ACE_elasticBandage",

        "ACE_morphine",
        "ACE_epinephrine",
        "ACE_adenosine",

        "ACE_plasmaIV",
        "ACE_plasmaIV_500",
        "ACE_plasmaIV_250",

        "ACE_bodyBag",
        "ACE_surgicalKit",
        "adv_aceCPR_AED",
        "kat_Pulseoximeter",

        "TB_med_venenkatheter",
        "kat_IV_16",
        "kat_aatKit",
        "kat_accuvac",
        "kat_AED ",
        "kat_X_AED",
        "kat_amiodarone",
        "kat_atropine",
        "kat_chestSeal",
        "kat_IO_FAST",
        "kat_larynx",
        "kat_lidocaine",
        "kat_naloxone",
        "kat_nitroglycerin",
        "kat_norepinephrine",
        "kat_phenylephrine",
        "kat_stethoscope",
        "kat_TXA"
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

#ifdef DEBUG_MODE_FULL
    // check all items
    /*
        TFAR ILBE Assault Pack: tfw_
    */
    private _ignore = {{(toLower _this) find _x == 0} count (["tfw_"] apply {toLower _x}) == 0};
    private _missingItems = _allItems select {([_x] call ace_common_fnc_getConfigName) == "" && {_x call _ignore}};
    if (count _missingItems > 0) then
    {
        systemChat format ["MissingItems: %1 | %2 | %3 -> %4", count _missingItems, _rolle, _type, _missingItems];
        diag_log format ["MissingItems: %1 | %2 | %3 -> %4", count _missingItems, _rolle, _type, _missingItems];
    };
    
#endif

[_allItems] call FUNC(whitelist);

ace_arsenal_cameraPosition = [4, -8, 15, [0, 0, 1]];

// Box cleanen & Items hinzufügen
[_ammoBox, false] call ace_arsenal_fnc_removeBox;
[_ammoBox, true, false] call ace_arsenal_fnc_removeVirtualItems;
[_ammoBox, _allItems, false] call ace_arsenal_fnc_addVirtualItems;

// Virtuelle Items auf dem Spieler sichern und andere Arsenale syncen
private _tbCargo = _ammoBox getVariable "ace_arsenal_virtualItems";
ACE_player setVariable [QGVAR(arsenalCargo), _tbCargo];

// Arsenale syncen
{
    if ([_x] call FUNC(isArsenalType) && {_tbCargo isNotEqualTo (_x getVariable ["ace_arsenal_virtualItems", []])}) then
    {
        _x setVariable ["ace_arsenal_virtualItems", _tbCargo];
    };
}
forEach (entities (typeOf _ammoBox));
