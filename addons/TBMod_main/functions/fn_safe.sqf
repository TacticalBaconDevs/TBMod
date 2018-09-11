/*
    Author: shukari
*/
params ["_mode"];
if (isDedicated) exitWith {};

// if (isNil "TB_jip_safe" && {!canSuspend}) exitWith {_this spawn TB_fnc_safe};
// if (isNil "TB_jip_safe") then {
    // private _time = diag_tickTime + 10;
    // waitUntil {!isNil "TB_jip_safe" || _time < diag_tickTime};
    // if (_time < diag_tickTime) then {TB_jip_safe = false; publicVariable "TB_jip_safe";};
// };

// für init
// if (isNil "_mode" && {!TB_jip_safe}) exitWith {};
// if (isNil "_mode" && {TB_jip_safe}) then {_mode = true};

if (_mode) then
{
    if (isNil "TB_FiredMan") then
    {
        TB_FiredMan = player addEventHandler ["FiredMan", {
            params ["", "_weapon", "", "", "_ammo", "", "_obj"];
            (format ["[SafeStart] %1 hat mit %2 geschossen!", profileName, [_weapon] call TB_fnc_displayName]) remoteExecCall ["systemChat"];
            deleteVehicle _obj;
        }];
    };
    
    if (isNil "TB_firedPlayer") then
    {
        TB_firedPlayer = ["ace_firedPlayer", {
            if (_weapon == "Throw") then {
                (format ["[SafeStart] %1 hat mit %2 geworfen!", profileName, [_ammo] call TB_fnc_displayName]) remoteExecCall ["systemChat"];
                deleteVehicle _projectile;
            };
        }] call CBA_fnc_addEventHandler;
    };
    
    // if (!TB_jip_safe) then
    // {
        // TB_jip_safe = true;
        // publicVariable "TB_jip_safe";
    // };
    
    if (isNil "TB_safeInfo") then {TB_safeInfo = [] spawn {waitUntil {uiSleep 60; systemChat format ["[SafeStart] ist immer noch aktiv!"]; false}}};
    
    systemChat "[SafeStart] Deine Munition wurde aus Sicherheitsgründen durch Luft ersetzt!";
}
else
{
    if (!isNil "TB_FiredMan") then {player removeEventHandler ["FiredMan", TB_FiredMan]};
    if (!isNil "TB_firedPlayer") then {["ace_firedPlayer", TB_firedPlayer] call CBA_fnc_removeEventHandler};
    
    // if (TB_jip_safe) then
    // {
        // TB_jip_safe = false;
        // publicVariable "TB_jip_safe";
    // };
    
    if (!isNil "TB_safeInfo") then {terminate TB_safeInfo};
    
    systemChat "[SafeStart] Deine Munition ist nun wieder tödlich!";
};
