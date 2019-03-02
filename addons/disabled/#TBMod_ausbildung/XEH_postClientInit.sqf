#include "\TBMod_main\defineDIKCodes.inc"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

// get all Targets
TB_targetGroups = [[],[],[],[],[],[],[],[],[]];
{
    private _target = _x;
    private _groups = _target getVariable ["TB_ausbildung_popUpTargets", ""];

    if (_groups isEqualType "" && {!(_groups in ["", "0"])}) then
    {
        {
            if (_target isKindOf "TargetP_Inf_F") then
            {
                (TB_targetGroups select ((parseNumber _x) - 1)) pushBackUnique _target;
            }
            else
            {
                (TB_targetGroups select ((parseNumber _x) - 1)) pushBackUnique [typeOf _target, getDir _target, getPos _target, _target];
            };

            false;
        }
        count (_groups splitString ",");
    };

    false;
}
count (allMissionObjects "ALL");

// Tastaturshortcuts
[] spawn
{
    if (TB_targetGroups isEqualTo [[],[],[],[],[],[],[],[],[]]) exitWith {};
    waitUntil {!isNull (findDisplay 46)};
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        params ["", "_code", "_shift", "_ctrl", "_alt"];

        _ret = false;

        if !(getPlayerUID player in ["_SP_PLAYER_", "76561198029318101", "76561198015612608", "76561198040057152", "76561198047437015",
            "76561198068568975", "76561198083373558"]) exitWith {_ret};

        // if (!isNil "TB_ausbildung_block" && {TB_ausbildung_block}) exitWith {};
        // TB_ausbildung_block = true;

        switch (_code) do
        {
            case DIK_F1:
            {
                if (_ctrl && !_alt) then {[1, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[1, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[1, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F2:
            {
                if (_ctrl && !_alt) then {[2, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[2, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[2, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F3:
            {
                if (_ctrl && !_alt) then {[3, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[3, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[3, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F4:
            {
                if (_ctrl && !_alt) then {[4, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[4, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[4, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F5:
            {
                if (_ctrl && !_alt) then {[5, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[5, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[5, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F6:
            {
                if (_ctrl && !_alt) then {[6, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[6, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[6, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F7:
            {
                if (_ctrl && !_alt) then {[7, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[7, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[7, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F8:
            {
                if (_ctrl && !_alt) then {[8, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[8, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[8, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
            case DIK_F9:
            {
                if (_ctrl && !_alt) then {[9, true] call TB_fnc_manageTargets; _ret = true;};
                if (!_ctrl && _alt) then {[9, false] call TB_fnc_manageTargets; _ret = true;};
                // if (_ctrl && _alt) then {[9, true, true] call TB_fnc_manageTargets; _ret = true;};
            };
        };

        // [] spawn
        // {
            // uiSleep 0.3;
            // TB_ausbildung_block = false;
        // };

        _ret;
    }];
};
