#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_items"];

// Spieler Whitelist
_items append (switch (getPlayerUID player) do
{
    case "76561198029318101": {["G_Aviator"]}; // shukari
    case "76561198040057152": {[]}; // Culli
    case "76561198047437015": {["G_Aviator"]}; // Mike Range
    case "76561198053478498": {[]}; // Sponst

    case "76561198066861232": {["H_Beret_EAF_01_F"]}; // Darky
    case "76561198049880123": {[]}; // Eron

    case "76561198032526435": {[]}; // Makuro
    case "76561198074489907": {["G_Goggles_VR"]}; // Mordl
    case "76561198139487000": {[]}; // HerrPinguin
    case "76561198089664421": {[]}; // Jaleck
    case "76561197986271628": {[]}; // Nimrod
    case "76561198807543909": {[]}; // wermu(t)91
    case "76561198203984875": {[]}; // TimeToPlay
    case "76561198063263886": {[]}; // Rabbat
    case "76561198060879499": {[]}; // Robert Merritt
    case "76561198067143167": {["G_Aviator"]}; // Thor
    case "76561198127241859": {["G_Tactical_Clear", "TB_headgear_beanie_eric", "rhs_xmas_antlers", "H_WirelessEarpiece_F"]}; // Eric

    default {[]};
});

private _generalstab = [
        "76561198029318101",
        "76561198040057152",
        "76561198047437015",
        "76561198053478498"
    ];

private _ausbilder = [
        "76561198049880123",
        "76561198066861232"
    ] + _generalstab;

private _truppfuehrer = [
        "76561198032526435",
        "76561198074489907",
        "76561198063263886",
        "76561198060879499",
        "76561198139487000",
        "76561198089664421",
        "76561197986271628",
        "76561198203984875",
        "76561198127241859",
        "76561198067143167",
        "76561198807543909"
    ] + _ausbilder;

// Generalstabs Whitelist
if (getPlayerUID player in _generalstab) then
{
    _items append [

    ];
};

// Ausbilder Whitelist
if (getPlayerUID player in _ausbilder) then
{
    _items append [
        "V_Rangemaster_belt"
    ];
};

// Gruppen / Truppführer
if (getPlayerUID player in _truppfuehrer) then
{
    _items append [
        // Barrets (Vanilla)
        "H_Beret_blk",
        "H_Beret_Colonel",
        "H_Beret_gen_F",
        "H_Beret_02",

        // Barrets (BWA3)
        "BWA3_Beret_Falli",
        "BWA3_Beret_HFlieger",
        "BWA3_Beret_Jaeger",
        "BWA3_Beret_PzAufkl",
        "BWA3_Beret_PzGren",
        "BWA3_Beret_Pz",
        "BWA3_Beret_Wach_Blau",
        "BWA3_Beret_Wach_Gruen",

        // Barrets (RHS)
        "rhs_beret_mp1",
        "rhs_beret_mp2",
        "rhs_beret_vdv1",
        "rhs_beret_vdv2",
        "rhs_beret_vdv3",
        "rhs_beret_milp",
        "rhsgref_un_beret",

        // Barrets (CDLC)
        "lxWS_H_Beret_Colonel"
    ];
};

_items
