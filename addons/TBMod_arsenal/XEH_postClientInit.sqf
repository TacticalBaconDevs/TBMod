/*
    Author: shukari
*/

// initalisiert die TB Rolle nach dem spawnen
[] spawn TB_fnc_waitUntilLoaded;

// Variablen
if (isNil "TB_blacklistRollen_custom") then {TB_blacklistRollen_custom = []};
if (isNil "TB_blacklistRollen_themen") then {TB_blacklistRollen_themen = []};

["ace_arsenal_displayClosed", {
    if (!isNil "TB_arsenal_kiste") then {TB_arsenal_kiste hideObject false};
}] call CBA_fnc_addEventHandler;

["ace_arsenal_displayOpened", {
    if (!isNil "TB_arsenal_kiste") then {TB_arsenal_kiste hideObject true};
    //(ace_arsenal_virtualItems select 2) append ["ACE_1Rnd_82mm_Mo_HE", "ACE_1Rnd_82mm_Mo_Smoke", "ACE_1Rnd_82mm_Mo_Illum"];
}] call CBA_fnc_addEventHandler;
