#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};
if (!hasInterface) exitWith {};

// EM VALUES
call FUNC(setDisplayValues);
missionNamespace setVariable ["#EM_SMin", -60];
missionNamespace setVariable ["#EM_SMax", 0];
missionNamespace setVariable ["#EM_Values", []];

// Eventhandler
[QUOTE(ADDON), "OnTangent", LINKFUNC(tfarTransmitter), player] call TFAR_fnc_addEventHandler;

["MouseButtonDown", {["MouseButtonDown", _this] call FUNC(spectrumActions)}] call CBA_fnc_addDisplayHandler;
["MouseButtonUp", {["MouseButtonUp", _this] call FUNC(spectrumActions)}] call CBA_fnc_addDisplayHandler;
["MouseZChanged", {["MouseZChanged", _this] call FUNC(spectrumActions)}] call CBA_fnc_addDisplayHandler;

["cameraView", {
    diwako_dui_main_toggled_off = (_this # 1) == "GUNNER";
    [QGVAR(hudToggled), [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
}] call CBA_fnc_addPlayerEventHandler;

["weapon", {
    if (!GVAR(enable)) exitWith {};

    GVAR(receive) = (_this # 1) isKindOf ["hgun_esd_01_base_F", configFile >> "CfgWeapons"];

    if (GVAR(receive) && {isNil QGVAR(transmitterPFH)}) then
    {
        GVAR(transmitterPFH) = [LINKFUNC(findTransmitter), 0.5] call CBA_fnc_addPerFrameHandler;
    };
}, true] call CBA_fnc_addPlayerEventHandler;
