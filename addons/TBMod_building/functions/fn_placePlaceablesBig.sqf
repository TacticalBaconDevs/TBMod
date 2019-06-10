#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    based on ideas by: KokaKolaA3
*/
params [
    ["_buildingName", "", [""]],
    ["_zusatz", [20, 250], [[]]],
    ["_kran", false, [true]],
    ["_spiegeln", false, [true]]
];
_zusatz params ["_zeit", "_resourcen"];

if (_buildingName isEqualTo "") exitWith {systemChat "Schwerer Fehler (TB_building_fnc_placePlaceablesBig)"};

if (_kran && {((nearestObjects [ACE_player, [], 15]) select {_x getVariable ["TBMod_Building_kranWagen", false]}) isEqualTo []}) exitWith {systemChat "Kein Kranwagen in der Nähe"};

((nearestObjects [ACE_player, [], 20]) select {(_x getVariable ["TBMod_Building_resourcenCargo", -1]) >= _resourcen}) params [["_truck", objNull]];
if (isNull _truck) exitWith {systemChat "Kein Resourcentruck mit genügend Resourcen in der Nähe"};

private _resc = _truck getVariable ["TBMod_Building_resourcenCargo", -1];
_truck setVariable ["TBMod_Building_resourcenCargo", _resc - _resourcen, true];

private _building = createVehicle [_buildingName, ACE_player modelToWorld [0, 5, 0], [], 0, "CAN_COLLIDE"];
private _specialDir = [0, 180] select _spiegeln;
_building setDir _specialDir;

private _bbr = boundingBoxReal _building;
private _attachPos = ((abs (((_bbr # 1) # 1) - ((_bbr # 0) # 1))) / 2 + 2) min 9;
private _pos = ACE_player modelToWorld [0, _attachPos, 0];
_building setPos _pos;

[_building, _resourcen] call FUNC(initItemBig);
[_building, true, [0, _attachPos, 0], _specialDir, true] call ace_dragging_fnc_setCarryable;

waitUntil {_building distance2D _pos < 10};
[ACE_player, _building] call ace_dragging_fnc_startCarry;
waitUntil {ACE_player getVariable ["ace_dragging_isCarrying", false]};

if (isNil "TB_building_displayEH") then
{
    TB_building_displayEH = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
        params ["", "_key"];

        private _carrayobj = ACE_player getVariable ["ace_dragging_carriedObject", objNull];
        if (_key != 1 || isNull _carrayobj) exitWith {};

        _carrayobj setVariable ["TB_building_abbruch", true, true];
        [ACE_player, _carrayobj] call ace_dragging_fnc_dropObject_carry;
    }];
};

[_building, _zeit, _truck, _resourcen] spawn
{
    params ["_building", "_zeit", "_truck", "_resourcen"];

    ["Bauen", "Abbrechen", "Heben/Senken"] call ace_interaction_fnc_showMouseHint;
    waitUntil {
        if (ACE_player distance _truck > 20) then
        {
            private _carrayobj = ACE_player getVariable ["ace_dragging_carriedObject", objNull];
            if (isNull _carrayobj) exitWith {};

            _carrayobj setVariable ["TB_building_abbruch", true, true];
            [ACE_player, _carrayobj] call ace_dragging_fnc_dropObject_carry;
        };

        !(ACE_player getVariable ["ace_dragging_isCarrying", false])
    };

    [_building, false] call ace_dragging_fnc_setCarryable;
    [_building, true] remoteExecCall ["hideObjectGlobal", [0, -2] select isDedicated];

    if !(_building getVariable ["TB_building_abbruch", false]) then {[ACE_player, "AinvPknlMstpSnonWrflDnon_medic"] call ace_common_fnc_doAnimation};

    [
        _zeit,
        [_building, _truck, _resourcen],
        {
            (_this select 0) params ["_building", "_truck", "_resourcen"];

            [ACE_player, "", 1] call ace_common_fnc_doAnimation;

            [_building, false] remoteExecCall ["hideObjectGlobal", [0, -2] select isDedicated];

            if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};
            TB_persistent_buildings pushBack [_building, true];
            publicVariable "TB_persistent_buildings";
        },
        {
            (_this select 0) params ["_building", "_truck", "_resourcen"];

            _truck setVariable ["TBMod_Building_resourcenCargo", (_truck getVariable ["TBMod_Building_resourcenCargo", 0]) + _resourcen, true];

            [ACE_player, "", 1] call ace_common_fnc_doAnimation;
            deleteVehicle _building;
        },
        "Baue",
        {
            (_this select 0) params ["_building", "_truck", "_resourcen"];
            ACE_player distance _truck < 20 && !(_building getVariable ["TB_building_abbruch", false])
        },
        ["isnotdead", "isnotinside", "isnothandcuffed", "isnotsurrendering", "isnotswimming", "isnotonladder", "isnotunconscious", "isnotrefueling", "isnotescorting", "isnotdragging", "isnotsitting"]
        // Alle Exceptions: ["isnotdead", "notonmap","isnotinside","isnotinzeus","isnotswimming","isnotonladder","isnotunconscious","isnotrefueling","isnotescorting","isnothandcuffed","isnotsurrendering","isnotdragging","isnotcarrying","isnotsitting"]
    ] call ace_common_fnc_progressBar;
};
