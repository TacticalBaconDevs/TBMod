/*
    Author: Willi "shukari" Graff
*/
if !(call TB_fnc_isTBMission) exitWith {};

TB_serverBuild = productVersion select 3;
publicVariable "TB_serverBuild";

TB_disconnectCache = [];
publicVariable "TB_disconnectCache";
