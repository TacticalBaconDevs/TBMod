#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _log = [];
_log pushBack "Test 'kistenCheckTest' beginnt...";

// Kisten Checken
private _naschschubConfigs = configProperties [configFile >> "CfgVehicles", "isClass _x && {(configName _x) select [0, 3] == 'TB_'}
        && {getNumber (_x >> 'scope') == 2} && {(getText (_x >> 'editorCategory')) isEqualTo 'EdCat_TB_MainCat_supply'}", false];
{
    if (configName _x find "_WL_" == -1) then
    {
        private _obj = createVehicle [configName _x, [0,0,0], [], 0, "CAN_COLLIDE"];
        if ([_obj] call ace_dragging_fnc_getweight >= 600) then {_log pushBack (format ["%1(%2)", configName _x, [_obj] call ace_dragging_fnc_getweight])};
        deleteVehicle _obj;
    };
}
forEach _naschschubConfigs;

_log pushBack "Test 'kistenCheckTest' beendet!";
_log
