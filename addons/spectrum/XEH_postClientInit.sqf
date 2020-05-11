#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

missionNamespace setVariable ["#EM_FMin", 20];
missionNamespace setVariable ["#EM_FMax", 530];

missionNamespace setVariable ["#EM_SMin", -60];
missionNamespace setVariable ["#EM_SMax", 0];

missionNamespace setVariable ["#EM_SelMin", 0];
missionNamespace setVariable ["#EM_SelMax", 0];

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

    if (_freq != "") then {GVAR(transmitters) setVariable [_freq, [nil, ACE_player] select _down]};
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
