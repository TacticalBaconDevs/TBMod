#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Info:
    Hier muss für Themenarsenale zur richtigen Seite und Bedingung das Arsenal geladen werden, sonst kommt:
    Fehlt diese Zeile, kommt der Fehler "Kein virtuelles Objekt verfügbar"
*/
private _patches = configfile >> "CfgPatches";
private _side = side ACE_player;

if (isClass (_patches >> "uns_main")) exitWith {call FUNC(arsenalUSAVietnam)};
if (isClass (_patches >> "ASZ_PersoneIT_A3")) exitWith {call FUNC(arsenalIT)};
if (isClass (_patches >> "SWOP_Main")) exitWith {call FUNC(arsenaSW_Clone)};

if (_side == blufor) exitWith
{
    switch (toLower worldName) do
    {
        case "gm_weferlingen_summer";
        case "gm_weferlingen_winter": {call FUNC(arsenalBRD)};
        case "cam_lao_nam": {call FUNC(arsenalSOG)};
        default {call FUNC(arsenalVANILLACOP)};
    };
};

if (_side == independent) exitWith {call FUNC(arsenalLDF)};

if (_side == opfor) exitWith {call FUNC(arsenalRUSSSimple)};
