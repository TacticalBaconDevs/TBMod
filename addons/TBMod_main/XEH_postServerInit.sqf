/*
    Author: Willi "shukari" Graff
*/
enableEnvironment [false, true];
enableSaving [false, false];

// if (isDedicated && serverName find "TacticalBacon.de" == -1 && isNil "TB_ichBinEinCoolerClan") then
// {
    // [] spawn
    // {
        // waitUntil
        // {
            // uiSleep (10 * 60);
            // if (!isNil "TB_ichBinEinCoolerClan") exitWith {};
            // "[TacticalBacon.de] Ihr verwendet einen Mod, der nicht für euch zugelassen ist, fragt uns doch einfach ob ihr ihn nutzen dürft!" remoteExecCall ["systemChat"];
            // {_x setDamage (random 1); _x setFuel (random 1); false} count vehicles;
            // {_x hideObjectGlobal true} forEach (playableUnits + allMissionObjects "All");
            // !isNil "TB_ichBinEinCoolerClan"
        // };
    // };
// };

if !(call TB_fnc_isTBMission) exitWith {};

if (TB_crashHelfer) then {[true] spawn TB_fnc_crashHelferServer};

[
    "TB_addZeus",
    {
        _this spawn 
        {
            params ["_player"];
            
            private _moderatorModule = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
            _moderatorModule addCuratorEditableObjects [vehicles + allUnits, true];
            _player assignCurator _moderatorModule;
            _player setVariable ["TB_Admin_Zeus", _moderatorModule, true];
            
            ["TB_informAdminsandZeus", format["%1 wurde zum Zeus", name _player]] call CBA_fnc_globalEvent;
            "Zeus wurde erstellt!" remoteExec ["systemChat", _player];
        };
    }
] call CBA_fnc_addEventHandler;
