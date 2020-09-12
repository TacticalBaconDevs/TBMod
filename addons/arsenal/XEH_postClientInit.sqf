#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

["CBA_loadingScreenDone", {
    // initalisiert die TB Rolle nach dem spawnen
    [] call FUNC(waitUntilLoaded);
}] call CBA_fnc_addEventHandler;

// Variablen
if (isNil "TB_blacklistRollen") then {TB_blacklistRollen = []};
if (isNil "TB_blacklistRollen_custom") then {TB_blacklistRollen_custom = []};
if (isNil "TB_blacklistRollen_themen") then {TB_blacklistRollen_themen = []};

["ace_arsenal_displayClosed", {
    if (!isNil QGVAR(kiste)) then {GVAR(kiste) hideObject false};
}] call CBA_fnc_addEventHandler;

["ace_arsenal_displayOpened", {
    if (!isNil QGVAR(kiste)) then {GVAR(kiste) hideObject true};
}] call CBA_fnc_addEventHandler;

// kein Müll
[
    "CAManBase",
    "Put",
    {
        params ["_unit", "_container", "_item"];

        if (local _unit && {!((_unit nearEntities ["TB_arsenal_base", 6]) isEqualTo [])}) then
        {
            if (typeOf _container == "GroundWeaponHolder") then {deleteVehicle _container};
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

// Arsenal Extrabutton
[
    ["ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_tourniquet", "ACE_splint", "ACE_morphine", "ACE_adenosine", "ACE_atropine", "ACE_epinephrine", "ACE_plasmaIV",
        "ACE_plasmaIV_500", "ACE_plasmaIV_250", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_quikclot", "ACE_personalAidKit",
        "ACE_surgicalKit", "ACE_bodyBag", "adv_aceCPR_AED"],
    "Medical",
    QPATHTOF(pics\icon_medical.paa)
] call ace_arsenal_fnc_addRightPanelButton;
