#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// ### RECHTE & ChatCommands
TB_lvl3 = compileFinal (str [
    "_SP_PLAYER_",
    "76561198029318101", /* shukari */
    "76561198053478498", /* Sponst */
    "76561198040057152", /* Culli */
    "76561198047437015" /* BeLink */
]);

TB_lvl2 = compileFinal (str ((call TB_lvl3) + [
    "76561198066861232", /* Darky */
    "76561198127241859", /* Eric */
    "76561198049880123" /* Eron */
]));

// Default Values
if (isNil QEGVAR(medical,coef)) then {EGVAR(medical,coef) = 1};

// UGV Smoke Ammo
[
    "TB_UGV_01_rcws_F", // Wenn mehr Car oder Landvehicle
    "fired",
    {
        params ["_vehicle", "", "", "", "_ammo", "", "_projectile", ""];

        if (local _vehicle && {_ammo isEqualTo "TB_G_40mm_Smoke"} && {!isNull _projectile}) then
        {
            private _smokeColor = _vehicle getVariable [QGVAR(smoke), "SmokeShell"];
            private _smoke = createVehicle [_smokeColor, [0,0,0] , [], 0, "CAN_COLLIDE"];
            _smoke setMass 1;
            [_smoke, true] remoteExecCall ["hideObjectGlobal", 2];
            _smoke attachTo [_projectile, [0,0,0]];
            TRACE_1("Smoke attached",_smokeColor);

            [_projectile, _vehicle] spawn
            {
                params ["_projectile", "_vehicle"];
                private _pos = getPos _projectile;
                private _time = time + 4;

                waitUntil {
                    if !((getPos _projectile) isEqualTo [0,0,0]) then {_pos = getPos _projectile};
                    TRACE_3("Smoke waitUntil",alive _projectile,_pos,_vehicle distance _projectile);
                    !alive _projectile
                };

                TRACE_4("2nd smoke backup0",_time <= time,_time,time,_pos);
                if (_time <= time) then
                {
                    private _smokeColor = _vehicle getVariable [QGVAR(smoke), "SmokeShell"];
                    private _smoke = createVehicle [_smokeColor, [0,0,0] , [], 0, "CAN_COLLIDE"];
                    _smoke setMass 1;
                    _smoke setPos _pos;
                };
            };
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

// CBA Settings
// https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf

[
    QGVAR(debug_lvl),
    "LIST",
    ["Debug Level", "Zeigt massig Debuginformationen an"],
    ["TBMod", QUOTE(COMPONENT)],
    [[0, 1, 2, 3], ["aus", "RPT", "RPT+systemChat", "RPT+systemChat+Hint"], 0]
] call CBA_fnc_addSetting;

[
    "TB_inkognitoSystem",
    "CHECKBOX",
    ["Inkognito System", "Erlaubt mehre Ausrüstungen und wechsel zu zivilen Sachen"],
    ["TBMod", QUOTE(COMPONENT)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(crashHelfer),
    "CHECKBOX",
    "Crashhelfer",
    ["TBMod", QUOTE(COMPONENT)],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(doorBreach),
    "CHECKBOX",
    "Door Breach",
    ["TBMod", QUOTE(COMPONENT)],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(recoilSystem),
    "CHECKBOX",
    "RecoilSystem",
    ["TBMod", QUOTE(COMPONENT)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(recoilCoef),
    "SLIDER",
    "recoilCoef",
    ["TBMod", QUOTE(COMPONENT)],
    [0.1, 2, 1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(recoilStart),
    "SLIDER",
    "recoilStart",
    ["TBMod", QUOTE(COMPONENT)],
    [0.1, 2, 0.5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(fpsMonitor_client),
    "CHECKBOX",
    "fpsMonitor_client",
    ["TBMod", QUOTE(COMPONENT)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fpsMonitor_zeus),
    "CHECKBOX",
    "fpsMonitor_zeus",
    ["TBMod", QUOTE(COMPONENT)],
    true
] call CBA_fnc_addSetting;

ADDON = true;
