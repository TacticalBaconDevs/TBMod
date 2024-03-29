#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    ["_buildingName", "", [""]],
    ["_zusatz", [20, 250], [[]]],
    ["_kran", false, [true]],
    ["_spiegeln", false, [true]]
];
_zusatz params ["_zeit", "_resourcen"];

if (_buildingName isEqualTo "") exitWith {systemChat "Schwerer Fehler in "+ QFUNC(placePlaceablesBig)};

private _kranTruck = objNull;
if (_kran) then {_kranTruck = ((nearestObjects [ACE_player, [], 20]) select {_x getVariable [QGVAR(kranWagen), false]}) param [0, objNull]};
if (_kran && {isNull _kranTruck}) exitWith {systemChat "Kein Kranwagen in der Nähe von 20m"};

private _truck = objNull;
if (!isNull _kranTruck) then {_truck = ((nearestObjects [_kranTruck, [], 25]) select {(_x getVariable [QGVAR(resourcenCargo), -1]) >= _resourcen}) param [0, objNull]};
if (isNull _truck) then {_truck = ((nearestObjects [ACE_player, [], 25]) select {(_x getVariable [QGVAR(resourcenCargo), -1]) >= _resourcen}) param [0, objNull]};
if (isNull _truck) exitWith {systemChat "Kein Resourcentruck mit genügend Resourcen in der Nähe von 25m"};

private _resc = _truck getVariable [QGVAR(resourcenCargo), -1];
_truck setVariable [QGVAR(resourcenCargo), _resc - _resourcen, true];

private _building = createVehicle [_buildingName, ACE_player modelToWorld [0, 5, 0], [], 0, "CAN_COLLIDE"];
private _specialDir = [0, 180] select _spiegeln;
_building setDir _specialDir;

private _bbr = boundingBoxReal _building;
private _attachPos = ((abs (((_bbr # 1) # 1) - ((_bbr # 0) # 1))) / 2 + 2) min 9;
private _pos = ACE_player modelToWorld [0, _attachPos, 0];
_building setPosASL (AGLToASL _pos);

[_building, _resourcen] call FUNC(initItemBig);
[_building, true, [0, _attachPos, 0], _specialDir, true] call ace_dragging_fnc_setCarryable;

[{
    params ["_building", "_pos"];
    _building distance2D _pos < 10
}, {
    params ["_building"];
    [ACE_player, _building] call ace_dragging_fnc_startCarry;

    [{ACE_player getVariable ["ace_dragging_isCarrying", false]}, {
        if (isNil QGVAR(displayEH)) then
        {
            // TODO: wieder deaktivieren?!?!?
            GVAR(displayEH) = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
                params ["", "_key"];

                private _carrayobj = ACE_player getVariable ["ace_dragging_carriedObject", objNull];
                if (_key != 1 || isNull _carrayobj) exitWith {};

                _carrayobj setVariable ["TB_building_abbruch", true, true];
                [ACE_player, _carrayobj] call ace_dragging_fnc_dropObject_carry;
            }];
        };

        ["Bauen", "Abbrechen", "Heben/Senken"] call ace_interaction_fnc_showMouseHint;

        [{
            params ["", "", "", "", "_truck"];
            if (ACE_player distance _truck > 20) then
            {
                private _carrayobj = ACE_player getVariable ["ace_dragging_carriedObject", objNull];
                if (isNull _carrayobj) exitWith {};

                _carrayobj setVariable ["TB_building_abbruch", true, true];
                [ACE_player, _carrayobj] call ace_dragging_fnc_dropObject_carry;
            };

            !(ACE_player getVariable ["ace_dragging_isCarrying", false])
        }, {
            params ["_building", "", "_zeit"];
            [_building, false] call ace_dragging_fnc_setCarryable;
            [_building, true] remoteExecCall ["hideObjectGlobal", [0, -2] select isDedicated];

            if !(_building getVariable ["TB_building_abbruch", false]) then {[ACE_player, "AinvPknlMstpSnonWrflDnon_medic"] call ace_common_fnc_doAnimation};

            [
                _zeit,
                _this,
                {
                    (_this # 0) params ["_building"];

                    [ACE_player, "", 1] call ace_common_fnc_doAnimation;

                    [_building, false] remoteExecCall ["hideObjectGlobal", [0, -2] select isDedicated];

                    if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};
                    TB_persistent_buildings pushBack [_building, true];
                    publicVariable "TB_persistent_buildings";
                },
                {
                    (_this # 0) params ["_building", "", "", "_resourcen", "_truck"];

                    _truck setVariable [QGVAR(resourcenCargo), (_truck getVariable [QGVAR(resourcenCargo), 0]) + _resourcen, true];

                    [ACE_player, "", 1] call ace_common_fnc_doAnimation;
                    deleteVehicle _building;
                },
                "Baue",
                {
                    (_this # 0) params ["_building", "", "", "", "_truck"];
                    ACE_player distance _truck < 20 && !(_building getVariable ["TB_building_abbruch", false])
                },
                ["isnotdead", "isnotinside", "isnothandcuffed", "isnotsurrendering", "isnotswimming", "isnotonladder", "isnotunconscious", "isnotrefueling", "isnotescorting", "isnotdragging", "isnotsitting"]
                // Alle Exceptions: ["isnotdead", "notonmap","isnotinside","isnotinzeus","isnotswimming","isnotonladder","isnotunconscious","isnotrefueling","isnotescorting","isnothandcuffed","isnotsurrendering","isnotdragging","isnotcarrying","isnotsitting"]
            ] call ace_common_fnc_progressBar;
        }, _this] call CBA_fnc_waitUntilAndExecute;
    }, _this] call CBA_fnc_waitUntilAndExecute;
}, [_building, _pos, _zeit, _resourcen, _truck]] call CBA_fnc_waitUntilAndExecute;
