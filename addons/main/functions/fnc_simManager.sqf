#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    TODO:
    - (firedHandler - wenn lange nicht geschossen sim disable)
    - (wenn kein target disable)
*/
BEGIN_COUNTER(simManager);

#ifdef DEBUG_MODE_FULL
//if (isNil QGVAR(debug)) then {};
#endif

private _players = call CBA_fnc_players;
private _maxRange = 6000; // TODO: von allen Spielern die max viewDistance
private _unit = objNull;
private _sim = false;
private _outRange = false;
private _noDirSight = false;
private _noSight = false;
private _static = false;
private _relDir = 0; // TODO: FOV für relDir -> getObjectFOV / getResolution

{
    _unit = _x;
    if (!isPlayer _unit) then
    {
        if (_unit getVariable [QGVAR(ignoreSimMgr), false]) exitWith {[_unit, true] remoteExecCall ["enableSimulationGlobal", 2]};
        if (!isNull (objectParent _unit)) exitWith {[_unit, true] remoteExecCall ["enableSimulationGlobal", 2]}; // in Fahrzeug

        _players findIf {
            _outRange = _x distance _unit >= 6000;
            _relDir = abs ((((getPos _x) vectorFromTo (getPos _unit)) call CBA_fnc_vectDir) - ((getCameraViewDirection _x) call CBA_fnc_vectDir));
            _noDirSight = _relDir > 50 && _relDir < 310;
            _noSight =  [_x, "VIEW"] checkVisibility [eyePos _x, eyepos _unit] < 0.1 || [_x, "VIEW"] checkVisibility [eyePos _x, AGLToASL (unitAimPosition _unit)] < 0.1;

            _outRange || _noDirSight || _noSight
        };
        _static = !(_unit checkAIFeature "PATH"); // TODO: doStop
        _patrol = currentWaypoint (group _unit) != count (waypoints _unit);

        _sim = true;
        if (_outRange) then {_sim = false};
        if (!_patrol && (_noDirSight || _noSight)) then {_sim = false};
        if (_static && (_noDirSight || _noSight)) then {_sim = false};

        if !(simulationEnabled _unit isEqualTo _sim) then
        {
            TRACE_7("simManagerUnit",_unit,_sim,_outRange,_noDirSight,_noSight,_static,_patrol);
            [_unit, _sim] remoteExecCall ["enableSimulationGlobal", 2];
            // TODO: cooldown und ggf delay damit einmal umschauen nicht alles aktiviert
        };
    };
}
foreach allUnits;

END_COUNTER(simManager);
