/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];

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
        [_saves select _nameIdx] call TB_fnc_persistenceEDEN;
    };
}

true;
