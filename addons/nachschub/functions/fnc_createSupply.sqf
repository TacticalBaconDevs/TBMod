#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target", "_item"];

if (_target getVariable ['TBMod_Nachschub_kisten', -1] != -1) then
{
    _target setVariable ['TBMod_Nachschub_kisten', (_target getVariable ['TBMod_Nachschub_kisten', 0]) - 1, true];
};

private _obj = createVehicle [_item, ACE_player, [], 0, "NONE"];
[_obj, false] remoteExecCall ["allowDamage", _obj];
_obj setPosAsl (getPosAsl ACE_player);

if (ACE_player distance2D _target < 3) then // && ((ACE_player getRelDir _target) + 90) mod 360 < 180
{
    systemChat "Du stehst zu dicht am Vorratslager!";
    deleteVehicle _obj;
};

// Transfer to ArmaInventar Aktion
[_obj, 0, ["ACE_MainActions"], GVAR(transferAction)] call ace_interact_menu_fnc_addActionToObject;

[_obj, true] remoteExecCall ["allowDamage", _obj];
[ACE_player, _obj] call ace_dragging_fnc_startCarry;
