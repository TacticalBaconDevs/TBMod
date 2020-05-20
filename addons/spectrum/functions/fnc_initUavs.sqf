#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (!GVAR(enable)) exitWith {};

// initPost Code
private _obj = param [0, objNull];
if (_obj isEqualTo objNull && {!isNull _obj}) exitWith
{
    [_obj, random [420, 443, 480]] call FUNC(createTransmitter);
};

// Notfall, wenn nicht per InitPos abgefangen
private _objs = (allVariables GVAR(transmitters)) apply {GVAR(transmitters) getVariable _x};
{
    private _uav = _x;
    if (_objs findIf {_x find _uav != -1} != -1) then
    {
        diag_log format ["ERROR ACHTUNG_uav: Notfallcode wurde benutzt für %1", typeOf _uav];
        [_uav, random [420, 443, 480]] call FUNC(createTransmitter);
    };
}
forEach allUnitsUAV;
