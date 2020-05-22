#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _array = ["tb", "tacticalbacon", "tactical", "bacon", "shukari"];
[serverName, getMissionConfigValue ["author", ""], missionName, briefingName] findIf {
    private _text = toLower _x;
    _array findIf {_text find (toLower _x) != -1} != -1
} != - 1;
