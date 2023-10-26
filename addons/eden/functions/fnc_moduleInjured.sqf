#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    prepair Module
    ServerPreInit -> InitPost Modul
*/
private _isEdenModule = (param [0]) isEqualType "";

if (_isEdenModule) then
{
    params [["_mode", "", [""]], ["_input", [], [[]]]];
    _input params [["_logic", objNull, [objNull]], ["_isActivated", true, [true]], ["_isCuratorPlaced", false, [true]]];
    if (is3DEN || {_mode != "init"} || {!_isActivated}) exitWith {};

    private _syncObjs = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector") && _x isKindOf "CAManBase"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "ModuleInjured braucht gesyncte Soldaten!"};

    [_logic, _syncObjs] spawn EFUNC(medical,injureModule);
}
else
{
    params ["_logic", "_units", "_activated"];

    if (!local _logic || !_activated) exitWith {true};
    private _unit = attachedTo _logic;
    if (!alive _unit) exitWith {deleteVehicle _logic};

    [
        "Verwundete",
        [
            [
                "CHECKBOX",
                ["Ganze Gruppe", "Für dieses Modul auf die gesamte Gruppe aus"],
                false
            ],
            [
                "SLIDER",
                ["Stärke", "Wie stark ist jede Verwundung"],
                [0, 1, 0.75, 2]
            ],
            [
                "SLIDER",
                ["Anzahl der Quellen", "Es geht um die Schadensquellen, also Schuss oder Explosion"],
                [0, 100, 5, 0]
            ],
            [
                "EDIT",
                ["Schadensquellen", "Welche Quellen random genutzt werden sollen"],
                ["['bullet', 'grenade', 'explosive', 'shell', 'stab', 'vehiclecrash']"],
                true
            ],
            [
                "EDIT",
                ["Wundort", "Wo die Quelle PRIMÄR wirken soll, es geht trotzdem auch auf benachbarte Orte"],
                ["['head', 'body', 'leftarm', 'rightarm', 'leftleg', 'rightleg']"],
                true
            ],
            [
                "CHECKBOX",
                ["Bewusstlos", "Alle Bewusstlos machen"],
                false
            ],
            [
                "CHECKBOX",
                ["Nicht sterben lassen", "Verhindert den Tod durch verbluten, geht nur wenn auch bewusstlos!"],
                true
            ],
            [
                "CHECKBOX",
                ["KI heilt sich nicht selber", "Verhindert das die KI sich verbindet"],
                true
            ]
        ],
        {
            params ["_values", "_args"];
            _values params ["_holeGroup", "_strength", "_anzahl", "_schadenTyp", "_wundOrte", "_bewusstlos", "_keepAlive", "_preventHealing"];
            _args params ["_logic", "_unit"];

            _logic setVariable ["strength", _strength, true];
            _logic setVariable ["anzahl", _anzahl, true];
            _logic setVariable ["schadenTyp", _schadenTyp, true];
            _logic setVariable ["wundOrte", _wundOrte, true];
            _logic setVariable ["bewusstlos", _bewusstlos, true];
            _logic setVariable ["keepAlive", _keepAlive, true];
            _logic setVariable ["preventHealing", _preventHealing, true];

            [_logic, [[_unit], units _unit] select _holeGroup] call EFUNC(medical,injureModule);
            deleteVehicle _logic;
        },
        {
            params ["_values", "_args"];
            _args params ["_logic"];
            deleteVehicle _logic;
        },
        [_logic, _unit]
    ] call zen_dialog_fnc_create;
};

true
