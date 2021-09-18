#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// ### DevAbfrage
TB_serverBuild = productVersion select 3;
publicVariable "TB_serverBuild";

// ### CrashHelfer
TB_disconnectCache = [];
publicVariable "TB_disconnectCache";

[] spawn FUNC(initArtyLogic);
