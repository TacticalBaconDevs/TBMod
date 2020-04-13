#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if !(call EFUNC(main,isTBMission)) exitWith {};

[
    QGVAR(coef_global),
    "SLIDER",
    ["MedicSystemCoef", "Bestimmt die Zeiten für medizinische Aktionen (kleiner = weniger Zeit)"],
    ["TBMod", QUOTE(COMPONENT)],
    [0.1, 2, 1, 1]
] call CBA_fnc_addSetting;

[
    QGVAR(fatalDamageSource_player),
    "LIST",
    "FatalDamageSource Player",
    ["TBMod", QUOTE(COMPONENT)],
    [[0, 1, 2, 3, 4], ["Only large hits to vital organs", "Sum of trauma", "Either", "No Fatals", "ACE_VALUE"], 4],
    false,
    {
        if (_this < 4 && !isDedicated) then {player setVariable ["ace_medical_fatalDamageSource", _this, true]};
    }
] call CBA_fnc_addSetting;

// DEBUG Code
#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers "z\ace\addons\medical\dev\debugDisplay.sqf";
    call compile preprocessFileLineNumbers "z\ace\addons\medical\dev\watchVariable.sqf";

    ["ace_medical_FatalVitals", {(format ["%1 -> FatalVitals damit im %2", name _this, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;
    ["ace_medical_Bleedout", {(format ["%1 -> Bleedout damit im %2", name _this, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;
    ["ace_medical_FatalInjury", {(format ["%1 -> FatalInjury damit im %2", name _this, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;

    // TODO: extension logging cardic gründe
#endif

ADDON = true;
