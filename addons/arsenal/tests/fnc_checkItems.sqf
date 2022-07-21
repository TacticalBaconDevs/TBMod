#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_player", player]];

private _blacklist = ["tfar", "_used", "_pip"];
private _msg = "";
private _loadout = (([getUnitLoadout _player, ""] call EFUNC(main,uniqueArray)) select {_x != ""}) apply {toLower _x};
private _arsenalType = _player getVariable ["TB_arsenalType", ""];
private _rolle = _player getVariable ["TB_rolle", ""];

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

//[_allItems] call FUNC(whitelist);
_allItems = ((_allItems arrayIntersect _allItems) select {_x != ""}) apply {toLower _x};

if !(_arsenalType in ["", "CUSTOM"]) then
{
    private _config = configFile >> "CfgWeapons";
    {
        private _checkItem = _x;
        if (({_checkItem find (toLower _x) != -1} count _blacklist) == 0 && {!(_checkItem in _allItems)}
                && {({private _base = toLower (getText (_config >> _x >> "baseweapon")); _base != "" && {_base in _allItems}} count _configs) != 0}) then
        {
            _msg = format ["%1, %3[%2]", _msg, _checkItem, [_checkItem] call EFUNC(main,displayName)];
        };
    }
    forEach _loadout;
};

_msg
