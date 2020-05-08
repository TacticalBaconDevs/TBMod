#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

call FUNC(setDisplayValues);

missionNamespace setVariable ["#EM_SMin", -60];
missionNamespace setVariable ["#EM_SMax", 0];

missionNamespace setVariable ["#EM_Values", []];

[QUOTE(ADDON), "OnTangent", {
    params ["_unit", "_class", "_transType", "_add", "_down"];

    private _freq = "";

    if (_transType == 0) then
    {
        _freq = [call TFAR_fnc_activeSwRadio, ([(call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwChannel, (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getAdditionalSwChannel] select _add) + 1] call TFAR_fnc_GetChannelFrequency;
    };

    if (_transType == 1) then
    {
        _freq = [call TFAR_fnc_activeLrRadio, ([(call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrChannel, (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getAdditionalLrChannel] select _add) + 1] call TFAR_fnc_GetChannelFrequency;
    };

    if (_freq != "") then {
        private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x && _x != _unit};

        if (_down) then {_values pushBack _unit};

        [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;
    };
}, ObjNull] call TFAR_fnc_addEventHandler;

["cameraView", {
    params ["_unit", "_mode"];

    if (_mode == "GUNNER") then
    {
        diwako_dui_main_toggled_off = true;
        [QGVAR(hudToggled), [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    }
    else
    {
        diwako_dui_main_toggled_off = false;
        [QGVAR(hudToggled), [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addPlayerEventHandler;

[{call FUNC(findTransmitter)}, 0] call CBA_fnc_addPerFrameHandler;

// Interaktionen
private _mainAction = ["SpectrumDevice", "SpectrumDevice", "", {}, {(currentWeapon _player) find "hgun_esd_" != -1}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _mainAction] call ace_interact_menu_fnc_addActionToObject;

private _mainAction = ["Reset", "Reset", "", {[] call FUNC(setDisplayValues)}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "SpectrumDevice"], _mainAction] call ace_interact_menu_fnc_addActionToObject;

private _mainAction = ["Bereiche", "Bereiche", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "SpectrumDevice"], _mainAction] call ace_interact_menu_fnc_addActionToObject;

for "_i" from 0 to 500 step 100 do
{
    private _name = format ["%1-%2MHz", _i, _i + 100];
    private _action = [_name, _name, "", {[_this#2] call FUNC(setDisplayValues)}, {true}, nil, [_i, _i + 100]] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "SpectrumDevice", "Bereiche"], _action] call ace_interact_menu_fnc_addActionToObject;
};

["MouseButtonDown", {["MouseButtonDown", _this] call FUNC(spectrumActions)}] call CBA_fnc_addDisplayHandler;
["MouseButtonUp", {["MouseButtonUp", _this] call FUNC(spectrumActions)}] call CBA_fnc_addDisplayHandler;
["MouseZChanged", {["MouseZChanged", _this] call FUNC(spectrumActions)}] call CBA_fnc_addDisplayHandler;

// Texte
/*private _spectrumDisplay = uiNamespace getVariable "rscweaponspectrumanalyzergeneric";
(_spectrumDisplay displayctrl 4006) ctrlSetText "123";
(_spectrumDisplay displayctrl 4007) ctrlSetText "       456";
(_spectrumDisplay displayctrl 4008) ctrlSetText "              789";*/
