#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (!TB_inkognitoSystem && _input) then {TB_inkognitoSystem = true};
if (!TB_inkognitoSystem) exitWith {};

private _save = profileNamespace getVariable ["TB_umziehen", []];
if (count _save != 5) then
{
    profileNamespace setVariable ["TB_umziehen", nil];
}
else
{
    if (_save select 3 != missionName && _save select 4 == (getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"))) then {profileNamespace setVariable ["TB_umziehen", nil]};
};
if (isNil "TB_inkognitoSystem_station") then {TB_inkognitoSystem_station = ["Offroad_01_base_F"]};

// MainAction
private _mainAction = ["Anziehsachen", "Anziehsachen", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _mainAction] call ace_interact_menu_fnc_addActionToObject;

// Inkognito abfragen
private _actionSpeichernMil = ["Inkognito abfragen", "Inkognito abfragen", "", {systemChat format ["Du bist %1", ["bekannt", "inkognito"] select (captive ACE_player)]}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Anziehsachen"], _actionSpeichernMil] call ace_interact_menu_fnc_addActionToObject;
["ace_firedPlayer", {ACE_player setCaptive false}] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", {
    params ["_unit"];
    {
        [_x, false] remoteExecCall ["setCaptive", _x];
    }
    forEach (_unit targets [true, 300, [], 30]);
}] call CBA_fnc_addEventHandler;

// Funktionen
TB_umziehenFNC = {
    params ["_mode", "_save"];

    (profileNamespace getVariable ["TB_umziehen", []]) params ["", "", ["_currentMode", ""]];

    if (_currentMode isEqualTo _mode && !_save) exitWith {systemChat "Du hast dieses Loadout bereits an"};
    //if (_save && _mode isEqualTo "zivil" && {player getVariable ["TB_arsenalType", ""] != "CUSTOM"}) exitWith {(format ["%1 bitte auf CUSTOM Arsenal wechseln zum Speichern!", profileName]) remoteExecCall ["systemChat"]};
    //if (_save && _mode isEqualTo "mil" && {player getVariable ["TB_arsenalType", ""] == "CUSTOM"}) exitWith {(format ["%1 bitte auf ein normales Arsenal wechseln zum Speichern!", profileName]) remoteExecCall ["systemChat"]};

    if (!_save) then {[ACE_player, "AinvPknlMstpSnonWrflDnon_medic"] call ace_common_fnc_doAnimation};

    [[5, 0] select _save, [_mode, _save], {
        (_this select 0) params ["_inputMode", "_save"];

        private _saveData = profileNamespace getVariable ["TB_umziehen", []];

        private _intMode = 0;
        if (_inputMode isEqualTo "mil") then {_intMode = 1};

        if (_save) then
        {
            _saveData set [_intMode, [getUnitLoadout ACE_player, ACE_player getVariable ['TB_rolle', '']]];
        }
        else
        {
            _saveData set [parseNumber (_intMode == 0), [getUnitLoadout ACE_player, ACE_player getVariable ['TB_rolle', '']]];
            (_saveData select _intMode) params ["_loadout", "_rolle"];
            ACE_player setUnitLoadout _loadout;

            ACE_player setVariable ['TB_rolle', _rolle, true];
            [_rolle] call EFUNC(arsenal,setAttributes);
        };

        _saveData set [2, _inputMode];
        _saveData set [3, missionName];
        _saveData set [4, getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr")];
        profileNamespace setVariable ["TB_umziehen", _saveData];

        ACE_player setCaptive (_intMode == 0);
        [ACE_player, "", 1] call ace_common_fnc_doAnimation;
    }, {[ACE_player, "", 1] call ace_common_fnc_doAnimation;}, "Ziehe mich um"] call ace_common_fnc_progressBar;
};

// Laden
TB_condLaden = {
    params ["_mode"];
    (profileNamespace getVariable ["TB_umziehen", []]) params ["", "", ["_currentMode", ""]];
    !((nearestObjects [ACE_player, TB_inkognitoSystem_station, 7]) isEqualTo []) &&
        _currentMode != "" && !(_currentMode isEqualTo _mode)
};
private _actionLadenMil = ["Laden Militär", "Laden Militär", "", {["mil", false] spawn TB_umziehenFNC}, {["mil"] call TB_condLaden}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Anziehsachen"], _actionLadenMil] call ace_interact_menu_fnc_addActionToObject;
private _actionLadenZivil = ["Laden Zivil", "Laden Zivil", "", {["zivil", false] spawn TB_umziehenFNC}, {["zivil"] call TB_condLaden}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Anziehsachen"], _actionLadenZivil] call ace_interact_menu_fnc_addActionToObject;

// Speichern
private _condSpeichern = {!((nearestObjects [ACE_player, ["TB_arsenal_base"], 15]) isEqualTo [])};
private _actionSpeichernMil = ["Speichern Militär", "Speichern Militär", "", {["mil", true] spawn TB_umziehenFNC}, _condSpeichern] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Anziehsachen"], _actionSpeichernMil] call ace_interact_menu_fnc_addActionToObject;
private _actionSpeichernZivil = ["Speichern Zivil", "Speichern Zivil", "", {["zivil", true] spawn TB_umziehenFNC}, _condSpeichern] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Anziehsachen"], _actionSpeichernZivil] call ace_interact_menu_fnc_addActionToObject;

systemChat "[Einstellungen] Inkognitosystem an!";
