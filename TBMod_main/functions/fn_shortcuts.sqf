#include "\TBMod_main\defineDIKCodes.inc"
/*
	Author: Willi "shukari" Graff
*/
waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	params ["", "_code", "_shift", "_ctrl", "_alt"];

	_ret = false;
	
	if !(getPlayerUID player in (TB_lvl3 + TB_lvl2)) exitWith {_ret};

	// ENDE + STRG
	if (_code == DIK_END && {_ctrl}) then
	{
		[ACE_player] spawn TB_fnc_showGCAM;
		systemChat "GCAM gestartet!";
		_ret = true;
	};
	
	// ENDE + SHIFT
	if (_code == DIK_END && {_shift}) then
	{
		if (isNil "TB_main_spectator") then {TB_main_spectator = false};
		
		TB_main_spectator = !TB_main_spectator;
		
		//[ACE_player, TB_main_spectator] call TFAR_fnc_forceSpectator;
		ACE_player setVariable ["TFAR_curatorCamEars", TB_main_spectator, true];
		
		systemChat format ["TFAR-Spectator: %1", TB_main_spectator];
		
		_ret = true;
	};
	
	if !(getPlayerUID player in TB_lvl3) exitWith {_ret};
	
	// ALT + STRG
	if (_code == DIK_END && {_alt}) then
	{
		systemChat "DEAKTIVIERTE FUNKTION!";
		// if (isNil "ace_zeus_zeus") exitWith {
			// if (!isNull (getAssignedCuratorLogic player)) exitWith {systemChat "Du hast bereits einen Zeus!"};
			
			// ["ace_zeus_zeusCreatedInfoAdmins", profileName] call CBA_fnc_globalEvent;
			// ace_zeus_zeus = objNull;
			// ["ace_zeus_createZeus", ACE_player] call CBA_fnc_serverEvent;
			// systemChat "Zeus erstellt";
			// _ret = true;
		// };
		
		// if (!isNil "ace_zeus_zeus" && {!isNull ace_zeus_zeus}) exitWith {
			// ["ace_zeus_zeusDeletedInfoAdmins", profileName] call CBA_fnc_globalEvent;
			// deleteVehicle ace_zeus_zeus;
			// ace_zeus_zeus = nil;
			// systemChat "Zeus gelöscht";
			// _ret = true;
		// };
	};
	
	_ret;
}];
