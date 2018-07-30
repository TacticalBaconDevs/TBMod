/*
	Author: Willi "shukari" Graff
*/
params ["_groupNumber", "_startTask"];

if (!isNil "TB_ausbildung_subTask" && {!scriptDone TB_ausbildung_subTask}) then {terminate TB_ausbildung_subTask};

if (_startTask) then
{
	TB_ausbildung_subTask = [_groupNumber] spawn
	{
		params ["_groupNumber"];
		
		hint format ["Kurs %1 gestartet!", _groupNumber];
		playSound "ACE_Sound_Click";

		private _start = diag_tickTime;
		waitUntil {0 == {_x animationPhase "Terc" == 0} count (TB_targetGroups select (_groupNumber - 1))};
		hint format ["Kurs %1 beendet mit einer Zeit von: %2s", _groupNumber, diag_tickTime - _start];
	};
};
