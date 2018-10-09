/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: shukari
*/
if !(call TB_fnc_isTBMission) exitWith {};

if (isNil "tb_server") then
{
    tb_server = createVehicle ["Land_PenBlack_F", [0,0,0], [], 0, "CAN_COLLIDE"];
    [tb_server, false] remoteExec ["enableSimulationGlobal", 2];
    [tb_server, true] remoteExec ["hideObjectGlobal", 2];
    publicVariable "tb_server";
};

tb_server setVariable ["INFskill", [
        0.25,   // aimingAccuracy
        0.45,   // aimingShake
        0.6,    // aimingSpeed
        0.4,    // spotDistance
        0.4,    // spotTime
        1,      // courage
        1,      // reloadSpeed
        1,      // commanding
        1       // general
    ], true];
tb_server setVariable ["ARMskill", [
        0.25,   // aimingAccuracy
        0.45,   // aimingShake
        0.6,    // aimingSpeed
        0.4,    // spotDistance
        0.4,    // spotTime
        1,      // courage
        1,      // reloadSpeed
        1,      // commanding
        1       // general
    ], true];
tb_server setVariable ["LIGskill", [
        0.25,   // aimingAccuracy
        0.45,   // aimingShake
        0.6,    // aimingSpeed
        0.4,    // spotDistance
        0.4,    // spotTime
        1,      // courage
        1,      // reloadSpeed
        1,      // commanding
        1       // general
    ], true];
tb_server setVariable ["AIRskill", [
        0.25,   // aimingAccuracy
        0.45,   // aimingShake
        0.6,    // aimingSpeed
        0.4,    // spotDistance
        0.4,    // spotTime
        1,      // courage
        1,      // reloadSpeed
        1,      // commanding
        1       // general
    ], true];
tb_server setVariable ["STAskill", [
        0.25,   // aimingAccuracy
        0.45,   // aimingShake
        0.6,    // aimingSpeed
        0.4,    // spotDistance
        0.4,    // spotTime
        1,      // courage
        1,      // reloadSpeed
        1,      // commanding
        1       // general
    ], true];

// vll Problem aus der Alpha, aber alles wird gesynct
// addMissionEventHandler ["PlayerConnected",
// {
    // {
        // _x setMarkerAlpha (MarkerAlpha _x);
        // _x setMarkercolor (getMarkercolor _x);
    // }
    // forEach (tb_server getvariable ["EOSmarkers", []]);
// }];
