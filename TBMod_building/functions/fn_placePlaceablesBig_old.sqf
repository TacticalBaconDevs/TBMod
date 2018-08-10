/*
*     Author: KokaKolaA3
*     Modified: Willi "shukari" Graff
* 
*     Place an object big infront of the ACE_player and organise all ACE3 settings
*
*     Arguments:
*         0: Objectclassnamen <ARRAY>
*        1: Tool <STRING>
*         2: Simulation <BOOL> (optional, default: true)
*         3: AttachPoint <ARRAY> (optional, default: [0, 1.5, 0])
*         4: [Zeit zum Aufbauen, Resourcen] <ARRAY> [<SCALAR>, <SCALAR>] (optional, default: [20, 250])
*         5: braucht Kranfahrzeug <BOOL> (optional, default: false)
*
*     Return Value:
*     None
*
*/
params [
    "_readyObj",
    ["_tool", false],
    ["_sim", true],
    ["_attachPos", -1],
    ["_zusatz", [20, 250]],
    ["_kran", false],
    ["_spiegeln", false]
];
_zusatz params ["", "_resourcen"];

if (_tool && {!("ToolKit" in (items ACE_player))}) exitWith {systemChat "Du brauchst einen Werkzeugkasten zum Aufbauen!"};

// Aufbautruck
if (isNil "TB_craneTrucks") then {TB_craneTrucks = ["B_APC_Tracked_01_CRV_F","rhsusf_M977A4_REPAIR_BKIT_usarmy_d","rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d","rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M1084A1P2_B_D_fmtv_usarmy","rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy","rhsusf_M1084A1P2_B_WD_fmtv_usarmy","rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy","rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd","rhsusf_M977A4_REPAIR_BKIT_usarmy_wd","rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M1078A1R_SOV_M2_D_fmtv_socom"]};
if (_kran && {((nearestObjects [ACE_player, TB_craneTrucks, 15]) isEqualTo [])}) exitWith {systemChat localize "STR_PLACE_NoCraneTruck"};

// Resourcentruck
private _trucks = (nearestObjects [ACE_player, [], 20]) select {(_x getVariable ["TBMod_Building_PlaceablesCargo", -1]) >= 0};
if (_trucks isEqualTo []) exitWith {systemChat localize "STR_PLACE_NoBuildTruck"};
_trucks = _trucks select {(_x getVariable ["TBMod_Building_PlaceablesCargo", -1]) > _resourcen};
if (_trucks isEqualTo []) exitWith {systemChat "Es hat kein Resourcentruck genug Resourcen."};
private _truck = _trucks select 0;

private _resc = _truck getVariable ["TBMod_Building_PlaceablesCargo", -1];
if (_resc < _resourcen) exitWith {systemChat localize "STR_PLACE_EmptyBuildTruck"};
_truck setVariable ["TBMod_Building_PlaceablesCargo", _resc - _resourcen, true];

private _specialDir = [0, 180] select _spiegeln;
private _readyObj = createVehicle [_readyObj, [0, 0, 0], [], 0, "NONE"];

if (_attachPos == -1) then
{
    private _bbr = boundingBoxReal _readyObj;
    _attachPos = (abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2 + 2;
};

[_readyObj, true, [0, _attachPos, 0], _specialDir] remoteExec ["ace_dragging_fnc_setCarryable", -2, true];
_readyObj setVariable ["ace_dragging_carryPosition", [0, _attachPos, 0], true];
_readyObj setVariable ["ace_dragging_carryDirection", _specialDir, true];

[ACE_player, _readyObj] call ace_dragging_fnc_startCarry;

[_this, _readyObj, _attachPos] spawn
{
    params ["_thisArgs", "_readyObj"];
    _thisArgs params [
        "",
        ["_tool", false],
        "",
        "",
        ["_zusatz", [20, 250]]
    ];
    
    waitUntil {!(ACE_player getVariable ["ace_dragging_isCarrying", false])};
    
    private _bbr = boundingBoxReal _readyObj;
    private _range = ((abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2) max ((abs (((_bbr select 1) select 0) - ((_bbr select 0) select 0))) / 2);
    
    private _beforeObj = [_readyObj, "TB_baustelle", [], false] call TB_fnc_replace;
    _beforeObj setVariable ['placeables_inBuilding', true, true];
    _beforeObj setVariable ['placeables_buildingReady', [typeOf _readyObj, _tool, _zusatz], true];
    _beforeObj setVariable ['placeables_range', _range, true];
    
    // _pos = getPos _beforeObj;
    // _pos set [2, 0];
    // [_beforeObj, true] remoteExecCall ["enableSimulationGlobal", 2];
    // _beforeObj setPos _pos;
    // [_beforeObj, false] remoteExecCall ["enableSimulationGlobal", 2];

    
    [_beforeObj, false] remoteExec ["ace_dragging_fnc_setCarryable", -2, true];
    [_beforeObj, false] remoteExec ["ace_dragging_fnc_setDraggable", -2, true];
};
