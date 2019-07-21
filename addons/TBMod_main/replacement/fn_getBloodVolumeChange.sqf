#include "\z\ace\addons\medical\script_component.hpp"
/*
 * Author: Glowbal
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Global Sync Values (bloodbags) <BOOL>
 *
 * Return Value:
 * Blood volume change (in % total) <NUMBER>
 *
 * Example:
 * [bob, true] call ACE_medical_fnc_getBloodVolumeChange
 *
 * Public: No
 */

/*
    IV Change per second calculation:
    250ml should take 60 seconds to fill. 250/60 = 4.166.
    Basic medical is 10x (will take 6 seconds for 250ml)
 */
#define IV_CHANGE_PER_SECOND         ([41.66, 4.166] select (GVAR(level) >= 2))

params ["_unit", "_syncValues"];

private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), 100];
private _bloodVolumeChange = -([_unit] call FUNC(getBloodLoss));

if (!isNil {_unit getVariable QGVAR(ivBags)}) then {
    if (_bloodVolume < 100) then {
        private _bloodBags = _unit getVariable [QGVAR(ivBags), []];
        _bloodBags = _bloodBags apply {
            _x params ["_bagVolumeRemaining"];

            // CHANGE START
            private _inFacility = [_unit] call ace_medical_fnc_isInMedicalFacility;
            private _inVehicle = [_unit] call ace_medical_fnc_isInMedicalVehicle;
            private _boost = [1, 10] select ((_unit getVariable ["TB_cpr_boost", 0]) > 0);
            private _influence = (([1, 1.5] select _inVehicle) max ([1, 2.5] select _inFacility)) * _boost;

            //private _bagChange = IV_CHANGE_PER_SECOND min _bagVolumeRemaining; // absolute value of the change in miliLiters
            private _bagChange = ((IV_CHANGE_PER_SECOND * 2) * _influence) min _bagVolumeRemaining;
            ["RemainIV: %1 | ChangeIV: %2 | InfluCoef: %3 | InFac: %4 | InVeh: %5 | Boost: %6", _bagVolumeRemaining, _bagChange, _influence, _inFacility, _inVehicle, _unit getVariable ["TB_cpr_boost", 0]] call TB_main_fnc_debug;
            _unit setVariable ["TB_cpr_boost", ((_unit getVariable ["TB_cpr_boost", 0]) - 1) max 0];
            // CHANGE ENDE

            _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;
            _bloodVolumeChange = _bloodVolumeChange + (_bagChange / 70); // ((bag change in ml) / (body total:7000ml)) out of 100 percent
            if (_bagVolumeRemaining < 0.01) then {
                []
            } else {
                [_bagVolumeRemaining];
            };
        };
        _bloodBags = _bloodBags - [[]]; // remove empty bags
        if (_bloodBags isEqualTo []) then {
            _unit setVariable [QGVAR(ivBags), nil, true]; // no bags left - clear variable (always globaly sync this)
        } else {
            _unit setVariable [QGVAR(ivBags), _bloodBags, _syncValues];
        };
    } else {
        _unit setVariable [QGVAR(ivBags), nil, true]; // blood volume = 100% - clear variable (always globaly sync this)
    };
};

_bloodVolumeChange;
