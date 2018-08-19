/*
    Author: Eric Ruhland
*/
if !(call TB_fnc_isTBMission) exitWith {};

[
	"TB_informAdminsandZeus",
 	{
 		if ((call BIS_fnc_admin) != 0 || !isNull (getAssignedCuratorLogic player)) then
 		{
 			systemChat _this;
 		};
 	};
] call CBA_fnc_addEventHandler;


if (!isServer) exitWith {};

[
	"TB_addZeus",
 	{
 		private _player = _this;
 		private _moderatorModule = (createGroup sideLogic) createUnit ["ModuleCurator_F", getPos _player, [], 0, ""];
  		_player assignCurator _moderatorModule;
  		_player setVariable ["TB_Admin_Zeus", _moderatorModule, true];
 	}
] call CBA_fnc_addEventHandler;
