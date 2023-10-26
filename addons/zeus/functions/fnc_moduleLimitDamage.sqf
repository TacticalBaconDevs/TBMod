#include "../script_component.hpp"
/*
 * Author: Schwaggot
 * Modified by: TBMod ( https://github.com/TacticalBaconDevs/TBMod )
 * Zeus module callback for limiting wounds of unit, e.g., applying tourniquets
 * and bandaging wounds.
 *
 * Arguments:
 * 0: Placed module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _logic call TBMod_zeus_fnc_moduleLimitWounds
 */
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
private _target = attachedTo _logic;
deleteVehicle _logic;

if (!alive _target) exitWith {true};

(_target call FUNC(getNumOpenWounds)) params ["_numOpenWounds"];

if (_numOpenWounds <= 0) exitWith {systemChat format ["%1 braucht keine Hilfe!", [_target] call ace_common_fnc_getName]};

[
    format ["%1 mit %2 Wunden heilen", [_target] call ace_common_fnc_getName, _numOpenWounds],
    [
        [
            "COMBO",
            ["Abbinden", "Die Arme und Beine abbinden"],
            [[0, 1, 2], ["nicht", "random/teils", "vollständig"], 1]
        ],
        [
            "COMBO",
            ["Verbinden", "Verbinden von Wunden, primär Kopf und Körper"],
            [[0, 1, 2], ["nicht", "random/teils", "vollständig"], 1]
        ]
    ],
    {
        params ["_values", "_args"];
        _values params ["_abbinden", "_verbinden"];
        _args params ["_numOpenWounds", "_target"];

        private _bandages = if (_verbinden > 0) then {[_target, _verbinden == 2] call FUNC(bandageRandomWound)} else {0};
        private _tourniquets = if (_abbinden > 0) then {[_target, _abbinden == 2] call FUNC(applyTourniquets)} else {0};
        
        systemChat format ["%1 hatte %2 Wunden und hat %3 Tourniquets erhalten und %4 mal bandagiert!", [_target] call ace_common_fnc_getName, _numOpenWounds, _tourniquets, _bandages];
    },
    {},
    [_numOpenWounds, _target]
] call zen_dialog_fnc_create;
