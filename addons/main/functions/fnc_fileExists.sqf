#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_file"];

/*
// CBA ( https://github.com/CBATeam/CBA_A3 )
// the macro FILE_EXISTS as function
private _return = false;
private _control = (uiNamespace getVariable ["RscDisplayMain", displayNull]) ctrlCreate ["RscHTML", -1];
if (isNull _control) then {
    _return = loadFile _file != "";
} else {
    _control htmlLoad _file;
    _return = ctrlHTMLLoaded _control;
    ctrlDelete _control;
};
*/

fileExists _file
