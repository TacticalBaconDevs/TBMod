/*
    Author: shukari
*/

_return = false;

{
    private _text = toLower _x;
    if (_text find "WL" != -1 || _text find "wl" != -1 || _text find "Warlord" != -1) exitWith {_return = true};
}
forEach [missionName, briefingName, getMissionConfigValue ["author", ""], serverName];

_return;
