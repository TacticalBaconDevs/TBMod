#include "../script_macros.hpp"
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

if (_side == blufor) exitWith
{
    if (worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter"]) then
    {
        call FUNC(arsenalBRD);
    }
    else
    {
        call FUNC(arsenalVANILLACOP);
    };
};
if (_side == independent) exitWith {call FUNC(arsenalLDF)};

if (_side == opfor) exitWith {call FUNC(arsenalRUSSSimple)};
