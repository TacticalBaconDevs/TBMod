#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _log = [];
_log pushBack "Test 'checkArsenalsTest' beginnt...";

player setVariable ["TB_arsenalType", "USA"];
player setVariable ["TB_rolle", "lead"];

[] call FUNC(arsenalUSA);
[] call FUNC(arsenalUK);
[] call FUNC(arsenalRUSS);
[] call FUNC(arsenalBW);
[] call FUNC(arsenalVANILLA);
[] call FUNC(arsenalThemen);

_log pushBack "Test 'checkArsenalsTest' beendet!";
_log
