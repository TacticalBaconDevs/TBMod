#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_name", "", []],
        ["_toServer", true, []]
    ];

if (_name == "") exitWith {"[TBMod_persistence] Kein Name angegeben" remoteExecCall ["systemChat"]};

if (_toserver) then {
	TB_transerData = profileNamespace getVariable [format ["TB_persistence_%1", _name], []];
	[[_name, TB_transerData], 
	{
		params ["_name","_data"];

		profileNamespace setVariable [format ["TB_persistence_%1", _name], _data];
		_savednames = profileNamespace getVariable ["TB_persistence_savedNames", []];
		_savednames pushBackUnique _name;
		profileNamespace setVariable ["TB_persistence_savedNames", _savednames];

		saveProfileNamespace;
	}] remoteExec ["call", 2];
} else {
	
	[[_name, ACE_player], 
	{
		params ["_name", "_target"];

		TB_transerData = profileNamespace getVariable [format ["TB_persistence_%1", _name], []];

		[[_name, TB_transerData], 
			{
				params ["_name","_data"];

				profileNamespace setVariable [format ["TB_persistence_%1", _name], _data];
				_savednames = profileNamespace getVariable ["TB_persistence_savedNames", []];
				_savednames pushBackUnique _name;
				profileNamespace setVariable ["TB_persistence_savedNames", _savednames];

				saveProfileNamespace;
		}] remoteExec ["call", _target];
	}] remoteExec ["call", 2];
};