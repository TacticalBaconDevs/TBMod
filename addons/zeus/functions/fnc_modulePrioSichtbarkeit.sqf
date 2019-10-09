#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};

if (isNil QGVAR(featureType)) then
{
    GVAR(featureType) = [];
    publicVariable QGVAR(featureType);
};

{
    _x setFeatureType 0;
    [_x, 0] remoteExec ["setFeatureType"];
} forEach GVAR(featureType);

GVAR(featureType) = [];
publicVariable QGVAR(featureType);

{
    if (_x setFeatureType 2) then {
        [_x, 2] remoteExec ["setFeatureType"];
        GVAR(featureType) pushBackUnique _x;
    };
} forEach (nearestObjects [_pos, [], 300]);

publicVariable QGVAR(featureType);

systemChat "Alle Objekte im Umkreis von 300m sind nun von extrem weit sichtbar, ggf für Jets!";

true
