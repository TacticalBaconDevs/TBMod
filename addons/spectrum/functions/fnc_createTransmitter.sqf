#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Name: TBMod_spectrum_fnc_createTransmitter
    Examples:
        [cursorObject] call TBMod_spectrum_fnc_createTransmitter
            - Dauersender auf random Freq
        [cursorObject, random [420, 443, 480]] call TBMod_spectrum_fnc_createTransmitter
            - Dauersender auf eigener RandomFreq
        [cursorObject, "412.21", {}] call TBMod_spectrum_fnc_createTransmitter
            - auf Freq "412.21" mit Standardwerten: Delay=random [45, 60, 90], Dauer=random [5, 10, 20], Delete=false
        [cursorObject, nil, {[10, 5, false]}] call TBMod_spectrum_fnc_createTransmitter
            - auf random Freq mit Werten [10, 5, false]

    _condition return: [next delay, dauer des an seins, entfernen]
        Conditioncheck ist jede Sekunde, wenn dauer kleiner wird nach der Sekunde erst ausgeführt
*/
params ["_obj", ["_freq", [1, 200, 450]], "_condition"];

if (_freq isEqualType []) then {_freq = random _freq};
if (_freq isEqualType 0) then {_freq = _freq toFixed 2};

if (isNil "_condition") then
{
    private _values = (GVAR(transmitters) getVariable [_freq, []]) select {!isNil "_x" && alive _x};
    _values pushBackUnique _obj;
    [GVAR(transmitters), _freq, _values] call CBA_fnc_setVarNet;
}
else
{
    if (isNil QGVAR(condTransmitter)) then {GVAR(condTransmitter) = []};

    private _time = (_obj call _condition) param [0, random [45, 60, 90]];
    GVAR(condTransmitter) pushBack [CBA_missionTime + _time, _condition, _obj, _freq];

    if (isNil QGVAR(condTransmitterPFH)) then
    {
        GVAR(condTransmitterPFH) = [LINKFUNC(conditionTransmitterPFH), 1] call CBA_fnc_addPerFrameHandler;
    };
};
