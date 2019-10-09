#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"}) then
{
    // Check for Radios
    private _syncRadios = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")};
    if (_syncRadios isEqualTo []) exitWith {systemChat "ModuleRadio hat keine gesyncten Radios"};

    {
        private _prevTrigger = _x getVariable ["trigger", objNull];
        if (!isNull _prevTrigger) then {deleteVehicle _prevTrigger};
    }
    forEach _syncRadios;

    if (_isActivated) then
    {
        private _sound = _logic getVariable ["sound", "RadioAmbient1"];
        private _dauer = _logic getVariable ["dauer", -1];
        private _radius = _logic getVariable ["radius", 10];
        private _inside = _logic getVariable ["inside", false];
        private _volume = _logic getVariable ["volume", 5];

        // Pfad zum Sound
        if (".ogg" find _sound != -1 || ".wss" find _sound != -1) then
        {
            _dauer = _dauer;
            _sound = _sound;
        }
        else // Config zum Sound
        {
            _dauer = getNumber (configFile >> "CfgMusic" >> _sound >> "duration");
            _sound = (getArray (configFile >> "CfgMusic" >> _sound >> "sound") # 0) + ".wss";
        };

        if (_dauer <= 0) exitWith
        {
            private _msg = "Achtung die Dauer ist nicht gesetzt oder kann nicht aus der Konfig geladen werden!";
            hint _msg;
            systemChat _msg;
        };

        {
            private _trg = createTrigger ["EmptyDetector", getPos _x, false];

            _x setVariable ["trigger", _trg, true];
            _trg setVariable ["values", [_sound, _dauer, _radius, _inside, _volume], true];

            _trg setTriggerArea [_radius, _radius, 0, false];
            _trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
            _trg setTriggerStatements ["this", "
                thisTrigger setVariable ['active', true, true];

                if (isNull (thisTrigger getVariable ['scriptHandle', scriptNull])) then
                {
                    thisTrigger setVariable ['scriptHandle', [thisTrigger, thisTrigger getVariable ['values', []]] spawn {
                        (_this # 1) params ['_sound', '_dauer', '_radius', '_inside', '_volume'];
                        waitUntil {
                            playSound3D [_sound, _this # 0, _inside, getPosASL (_this # 0), _volume, 1, _radius * 0.8];
                            uiSleep _dauer;
                            !((_this # 0) getVariable ['active', false])
                        };
                    }];
                };
            ", "thisTrigger setVariable ['active', nil, true]"];
        }
        forEach _syncRadios;
    };
};
