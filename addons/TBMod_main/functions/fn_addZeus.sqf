/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
*/
[
    "TB_informAdminsandZeus",
    {
        params ["_msg"];
        if ((call BIS_fnc_admin) != 0 || !isNull (getAssignedCuratorLogic player) ||
            (getPlayerUID player) in TB_lvl3) then {systemChat _msg};
    }
] call CBA_fnc_addEventHandler;


if (!isServer) exitWith {};

[
    "TB_addZeus",
    {
        params ["_player"];
        private _moderatorModule = (createGroup sideLogic) createUnit ["ModuleCurator_F", getPos _player, [], 0, ""];
        _player assignCurator _moderatorModule;
        _player setVariable ["TB_Admin_Zeus", _moderatorModule, true];
    }
] call CBA_fnc_addEventHandler;
