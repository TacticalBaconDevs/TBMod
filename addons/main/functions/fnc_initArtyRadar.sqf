#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_radar", "_truck"];

if (!isNil "_truck") then
{
    _radar attachTo [_truck, [-0.05,-0.5,0.8]];
    _radar setObjectMaterialGlobal [0, ""];
    _radar setObjectTextureGlobal [0, ""];
};

if (isNil QGVAR(Radar_active)) then {GVAR(Radar_active) = true};
if (isNil QGVAR(Radar_range)) then {GVAR(Radar_range) = 2000};
if (isNil QGVAR(Radar_time)) then {GVAR(Radar_time) = 60};

if (isNil QFUNC(Radar_activeTarget)) then
{
    FUNC(Radar_activeTarget) = {
        params ["_radar", "_target"];
        alive _radar && {((getPosATL _target) param [2, 0]) > ((getPosATL _radar) param [2, 0])};
    };
};

if (isNil QFUNC(Radar_getTargetPos)) then
{
    FUNC(Radar_getTargetPos) = {
        private _pos = if ((unitAimPositionVisual _this) isEqualTo [0,0,0]) then {getPosVisual _this} else {unitAimPositionVisual _this};
        private _velocity = velocity _this;
        _pos vectorAdd (_velocity vectorMultiply 0.55);
    };
};

GVAR(arty_seekers) pushBackUnique ["RADAR", _radar, GVAR(Radar_range)];
[QGVAR(arty_seekers), GVAR(arty_seekers)] call CBA_fnc_publicVariable;

// make dumb
private _group = group (gunner _radar);
_group setBehaviour "CARELESS";
_group setCombatBehaviour "CARELESS";
_group enableAttack false;
{
    _x setBehaviour "CARELESS";
    _x setCombatBehaviour "CARELESS";
    _x setSkill 1;
    _x setVariable ["lambs_danger_disableAI", true, true];
    _x disableAI "AUTOCOMBAT";
    _x disableAI "AUTOTARGET";
}
forEach (units _group);

_group setVariable ["lambs_danger_disableGroupAI", true, true];

private _search = 0;
private _index = 0;
while {GVAR(Radar_active)} do
{
    private _target = _radar getVariable [QGVAR(arty_target), objNull];

    if (alive _target) then
    {
        _radar reveal [_target, 4];

        private _shotParent = (getShotParents _target) param [0, objNull];
        if (alive _shotParent) then
        {
            playSound3D ["a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\normal\230_genericradiomessages\genincoming1.ogg", _radar, false, getPosASL _radar, 5, 0.8, 300];

            _search = 0;
            private _startTime = diag_ticktime;
            while {[_radar, _target] call FUNC(Radar_activeTarget)} do
            {
                private _posVor = _target call FUNC(Radar_getTargetPos);
                _radar lookAt _posVor;
                _radar doWatch _posVor;

                if (_search <= 0) then
                {
                    playSound3D ["a3\sounds_f\vehicles\air\noises\heli_alarm_bluefor.wss", _radar, false, getPosASL _radar, 2, 1, 300];
                };

                _search = if (_search >= 2 / 0.01) then {0} else {_search + 1};
                uiSleep 0.01;
            };
            private _flyTime = diag_ticktime - _startTime;
            private _radarValues = _shotParent getVariable [QGVAR(Radar_values), []];

            // erstellen vom Marker
            if (_radarValues isEqualTo []) then
            {
                private _markerstr = createMarkerLocal [format ["radar_%1", random 999999], _shotParent];
                _markerstr setMarkerShapeLocal "ELLIPSE";
                _markerstr setMarkerColorLocal "ColorRed";
                _markerstr setMarkerAlphaLocal 0.6;
                _markerstr setMarkerTextLocal format ["Abschuss %1", floor (random 999)];
                _radarValues = [0, _markerstr, random 360];

                _shotParent addEventHandler ["Deleted", {
                    params ["_shotParent"];
                    deleteMarker ((_shotParent getVariable [QGVAR(Radar_values), []]) param [1]);
                }];
                _shotParent addEventHandler ["Killed", {
                    params ["_shotParent"];
                    deleteMarker ((_shotParent getVariable [QGVAR(Radar_values), []]) param [1]);
                }];
            };

            _radarValues params ["_savedFlyTime", "_markerstr", "_richtung"];
            _flyTime = _flyTime + _savedFlyTime;

            private _ungenauigkeit = linearConversion [0, GVAR(Radar_time), _flyTime, 1000, 25, true];
            _markerstr setMarkerPosLocal (_shotParent getPos [(floor (random 25)) + (500 * (_ungenauigkeit / 750)), _richtung]);
            _markerstr setMarkerSize [25 + _ungenauigkeit, 25 + _ungenauigkeit];

            //systemChat format ["Radar: MarkerUngenau: %1 | Flytime: %2 | Rest: %3", 25 + _ungenauigkeit, _flyTime, _radarValues];
            _shotParent setVariable [QGVAR(Radar_values), [_flyTime, _markerstr, _richtung], true];
        };
    } else {
        _search = if (_search >= 360) then {0} else {_search + 1};
        _radar lookAt (_radar getPos [20, _search]);
    };

    _index = if (_index >= 3) then {0} else {_index + 1};
    uiSleep 0.1;
};
