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
        private _volume = _logic getVariable ["volume", 3];
        private _eigenerSound = _logic getVariable ["eigener", 3];

        // eigene Pfade
        if (_eigenerSound) then // _sound find "a3\" == -1 && _sound find "A3\" == -1 && _sound find "\" == -1
        {
            // derzeit noch dev aber sonst: https://community.bistudio.com/wiki/getMissionPath
            private _str = str missionConfigFile;
            _soundPath = _str select [0, count _str - 15];
            if (_sound select [0, 1] == "\") then {_sound = _sound select [1]};
            _sound = _soundPath + _sound;
        };

        // Konfigvalue
        if (_sound find "\" == -1) then
        {
            private _dauerCfg = getNumber (configFile >> "CfgMusic" >> _sound >> "duration");
            if (_dauerCfg > 0 && _dauer <= 0) then {_dauer = _dauerCfg};
            if (_dauerCfg > 0 && _dauerCfg > _dauer && !isMultiplayer) then {hint "Achtung, es wurde eine Dauer eingestellt, die kleiner als die aus der Konfig ist, es kann zu Überscheidungen bei der Loop kommen!"};

            _sound = getArray (configFile >> "CfgMusic" >> _sound >> "sound") # 0;
            if (_sound find ".ogg" == -1 && _sound find ".wss" == -1) then {_sound = _sound + ".wss"};
        };

        // darf nicht mit \ starten
        if (_sound select [0, 1] == "\") then {_sound = _sound select [1]};

        if (_dauer <= 0) exitWith
        {
            private _msg = "[ModuleRadio] Achtung die Dauer ist nicht gesetzt oder kann nicht aus der Konfig geladen werden!";
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
                            playSound3D [_sound, _this # 0, _inside, getPosASL (_this # 0), _volume, 1, _radius];
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
