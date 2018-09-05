/*
*     Author: KokaKolaA3
*     Modified: shukari
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
_zusatz params ["_zeit", "_resourcen"];

if (_tool && {!("ToolKit" in (items ACE_player))}) exitWith {systemChat "Du brauchst einen Werkzeugkasten zum Aufbauen!"};

// Aufbautruck
if (_kran && {(((nearestObjects [ACE_player, [], 15]) select {_x getVariable ["TBMod_Building_Cranwagen", false]}) isEqualTo [])}) exitWith {systemChat localize "STR_PLACE_NoCraneTruck"};

// Resourcentruck
private _trucks = (nearestObjects [ACE_player, [], 20]) select {(_x getVariable ["TBMod_Building_PlaceablesCargo", -1]) >= 0};
if (_trucks isEqualTo []) exitWith {systemChat localize "STR_PLACE_NoBuildTruck"};
_trucks = _trucks select {(_x getVariable ["TBMod_Building_PlaceablesCargo", -1]) >= _resourcen};
if (_trucks isEqualTo []) exitWith {systemChat "Es hat kein Resourcentruck genug Resourcen."};
private _truck = _trucks select 0;

private _resc = _truck getVariable ["TBMod_Building_PlaceablesCargo", -1];
if (_resc < _resourcen) exitWith {systemChat localize "STR_PLACE_EmptyBuildTruck"};
_truck setVariable ["TBMod_Building_PlaceablesCargo", _resc - _resourcen, true];

private _obj = createVehicle [_readyObj, [0, 0, 0], [], 0, "CAN_COLLIDE"];

[_obj, _resourcen] call TB_fnc_initItemBig;

private _specialDir = [0, 180] select _spiegeln;
_obj setDir _specialDir;

if (_attachPos == -1) then
{
    private _bbr = boundingBoxReal _obj;
    _attachPos = (abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2 + 2;
};

private _pos = player modelToWorld [0, _attachPos, 0];
_obj setPos _pos;

private _safeGewicht = missionNamespace getVariable ["ACE_maxWeightCarry", 1E11];
missionNamespace setVariable ["ACE_maxWeightCarry", 1E11];
[_obj, true, [0, _attachPos, 0], _specialDir] call ace_dragging_fnc_setCarryable;

waitUntil {_obj distance2D _pos < 5};
[ACE_player, _obj] call ace_dragging_fnc_startCarry;

private _nichtgebaut = {
        (_this select 0) params ["_obj", "_truck", "_resourcen"];
        
        _truck setVariable ["TBMod_Building_PlaceablesCargo", (_truck getVariable ["TBMod_Building_PlaceablesCargo", 0]) + _resourcen, true];
        
        [ACE_player, "", 1] call ace_common_fnc_doAnimation;
        deleteVehicle _obj;
    };

[_obj, _zeit, _sim, _truck, _resourcen, _nichtgebaut, _safeGewicht] spawn
{
    params ["_obj", "_zeit", "_sim", "_truck", "_resourcen", "_nichtgebaut", "_safeGewicht"];
    
    waitUntil {!(ACE_player getVariable ["ace_dragging_isCarrying", false])};
    [_obj, false] call ace_dragging_fnc_setCarryable;
    missionNamespace setVariable ["ACE_maxWeightCarry", _safeGewicht];
    
    if (!_sim) then
    {
        _obj enableSimulation false;
        [_obj, false] remoteExecCall ["enableSimulationGlobal", 2];
    };
    
    [_obj, true] remoteExecCall ["hideObjectGlobal", 2];
    
    [ACE_player, "AinvPknlMstpSnonWrflDnon_medic"] call ace_common_fnc_doAnimation;

    [_zeit, [ _obj, _truck, _resourcen], {
        (_this select 0) params ["_obj", "_truck", "_resourcen"];
        
        [ACE_player, "", 1] call ace_common_fnc_doAnimation;
        
        [_obj, false] remoteExecCall ["hideObjectGlobal", 2];
        
        if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};
        TB_persistent_buildings pushBack [_obj, true];
        publicVariable "TB_persistent_buildings";
    }, _nichtgebaut, localize "STR_PLACE_Build"] call ace_common_fnc_progressBar;
};
