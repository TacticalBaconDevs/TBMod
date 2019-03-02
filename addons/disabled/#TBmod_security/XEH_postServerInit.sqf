/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

TB_security_neededverify = [];

["TB_security_sendverify",
{
    private _hash = _this select 0;
    private _player = _this select 1;
    if (_hash == TB_securityHash) exitWith
    {
        private _find = [TB_security_neededverify, getPlayerUID _player] call BIS_fnc_findNestedElement;
        if !(_find isEqualTo []) then
        {
            TB_security_neededverify deleteAt (_find select 0);
        };
    };

    ["TB_informAdminsAndZeus", format["%1 failed to verifySignature", name _player]] call CBA_fnc_globalEvent;
    private _find = [TB_security_neededverify, getPlayerUID _player] call BIS_fnc_findNestedElement;
    if !(_find isEqualTo []) then
    {
        TB_security_neededverify deleteAt (_find select 0);
    };
}] call CBA_fnc_addEventHandler;

addMissionEventHandler ["PlayerConnected", {

    _this spawn
    {
        TB_Debug =  _this;
        params ["_id", "_uid", "_name", "_jip", "_owner"];
        waitUntil {
          !isNil "TB_securityHash"
        };
        sleep 5;
        TB_security_neededverify pushBack [_uid, _name, CBA_missionTime];
        ["TB_security_verify", _uid] call CBA_fnc_globalEvent;
    };
}];

[] spawn
{
    TB_securitySalt = floor random 1000000;
    private _filesarray = call TB_fnc_files;
    TB_securityHash = [_filesarray, TB_securitySalt] call TB_fnc_hash;
    publicVariable "TB_securitySalt";
    ["TB_informAdminsAndZeus", format["Hashwert wurde mit Salt %1 berechnet", TB_securitySalt]] call CBA_fnc_globalEvent;


    while {true} do {
        sleep 20;
        {
            if((_x select 2) < (CBA_missionTime - 180)) then
            {
                ["TB_informAdminsAndZeus", format["%1 timed out on verifySignature", _x select 1]] call CBA_fnc_globalEvent;
                private _find = [TB_security_neededverify, _x select 0] call BIS_fnc_findNestedElement;
                if !(_find isEqualTo []) then
                {
                TB_security_neededverify deleteAt (_find select 0);
                };

            };
        } forEach TB_security_neededverify;
    };
};