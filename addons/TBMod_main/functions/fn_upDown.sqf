/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Original by: JohnnyBoy ( https://forums.bohemia.net/forums/topic/190815-updated-v11-jboy-combat-up-down-script/ )
    Modified for TBMod
*/
params ["_unit"];

if (isPlayer _unit || !alive _unit || !local _unit) exitwith {};
if (_unit getVariable ["TB_upDown_modus", -1] >= 0) exitwith {};

// Setup Unit
doStop _unit;
[_unit, "PATH"] remoteExecCall ["disableAI", _unit];
_unit setVariable ["acex_headless_blacklist", true, true];
_unit setVariable ["TB_upDown_modus", 1];

// Setup function
if (isNil "TB_fnc_upDownEH") then {
    TB_fnc_upDownEH = {
        private _unitOriginalStance = unitPos _unit;
        private _iterations = 0;
        private _time = diag_tickTime + 300;
        ["UP", "MIDDLE"] params ["_stanceStart", "_stanceDef"];

        waitUntil
        {
            _unit setUnitPos ([_stanceStart, _stanceDef] select ((unitPos _unit == _stanceStart) || getSuppression _unit > 0.1));

            uiSleep (3 + (random 7));

            if (isNull (_unit findNearestEnemy _unit)) then {_iterations = _iterations + 1};

            !alive _unit || _iterations > 8 || _time < diag_tickTime
        };

        if (alive _unit) then
        {
            _unit setUnitPos _unitOriginalStance;
            _unit setVariable ["TB_upDown_modus", 1];
        };
    };
};

// Set Eventhandler
_unit addEventHandler ["FiredNear", {
    params ["_unit"];

    if (_unit getVariable ["TB_upDown_modus", -1] <= 1) then
    {
        _unit setVariable ["TB_upDown_modus", 2];
        [] spawn TB_fnc_upDownEH;
    };
}];
