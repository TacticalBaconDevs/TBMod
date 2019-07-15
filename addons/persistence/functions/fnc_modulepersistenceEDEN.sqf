#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];

// On-Use-Eden Module, darf nicht direkt gelöscht werden
_input spawn
{
    uiSleep 1;
    params [["_logic", objNull, [objNull]]];
    if (!isNull _logic) then {delete3DENEntities [_logic]};
};

private _activated = switch _mode do
{
    case "init";
    case "attributesChanged3DEN";
    case "registeredToWorld3DEN": {true};
    default {false};
};

if (!_activated) exitWith {true};

[] spawn
{
    private _saves = profileNamespace getVariable ["TB_persistence_savedNames", []];
    private _dialogResult = [
            "Persistence",
            [
                ["Save Name", _saves, 0]
            ]
        ] call Ares_fnc_showChooseDialog;

    if (_dialogResult isEqualTo []) then
    {
        systemChat "[TBMod_persistence] Abbruch";
    }
    else
    {
        _dialogResult params ["_nameIdx"];
        [_saves select _nameIdx] call FUNC(persistenceEDEN);
    };
};

true;
