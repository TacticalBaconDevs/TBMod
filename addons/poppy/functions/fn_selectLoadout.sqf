#include "..\script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
	Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de
*/

params ["_unit"];

private _config       = missionConfigFile >> "CfgLoadouts";
private _variableName = vehicleVarName _unit;
private _className    = typeOf _unit;
private _sideConfig   = [side group _unit] call FUNC(getSideConfig);

switch (true) do {
    case (isClass (_config >> _variableName)): {
        if !(_variableName isKindOf [_sideConfig, _config]) then {
            ["The loadout for """ + _variableName + """ does not inherit from """ + _sideConfig + """."] call FUNC(logWarning);
        };
        _variableName
    };
    case (isClass (_config >> _className)): {
        if !(_className isKindOf [_sideConfig, _config]) then {
            ["The loadout for """ + _className + """ does not inherit from """ + _sideConfig + """."] call FUNC(logWarning);
        };
        _className
    };
    case (isClass (_config >> _sideConfig)): {
        ["""" + _className + """ does not have a class specific loadout. Applying """ + _sideConfig + """ loadout."] call FUNC(logWarning);
        _sideConfig
    };
    default {
        ["""" + _className + """ does not have a class specific loadout. Applying default loadout."] call FUNC(logWarning);
        ""
    };
};
