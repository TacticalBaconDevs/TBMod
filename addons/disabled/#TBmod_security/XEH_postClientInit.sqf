/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/

["TB_security_verify", 
{
    _this spawn {
        if (getPlayerUID player != _this) exitWith {};
        private _filesarray = call TB_fnc_files; 
         private _hash = [_filesarray, TB_securitySalt] call TB_fnc_hash;
         ["TB_security_sendverify", [_hash, player]] call CBA_fnc_serverEvent;
    };
}] call CBA_fnc_addEventHandler;

