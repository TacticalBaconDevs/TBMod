/*
    Author: shukari
*/

_return = false;

{
    private _text = toLower _x;
    
    if (_text find "tb" != -1 || _text find "tacticalbacon" != -1 || {_text find "bacon" != -1}
            || {_text find "tactical" != -1}|| {_text find "shukari" != -1}) exitWith {_return = true};
}
forEach [missionName, briefingName, getMissionConfigValue ["author", ""]]; //serverName

_return;
