/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
// vergleiche configs
private _first = configfile >> "CfgGesturesMale" >> "States" >> "tb_radioSR";
private _second = configfile >> "CfgGesturesMale" >> "States" >> "tb_radioLR";
private _attribute = [];
diag_log format ["### Vergleich -> %1 | %2 ###", configName _first, configName _second];
{_attribute pushBackUnique (configName _x)} forEach (configProperties [_first, "true", true]);
{_attribute pushBackUnique (configName _x)} forEach (configProperties [_second, "true", true]);
{
    private _valueFirst = (_first >> _x) call BIS_fnc_getCfgData;
    private _valueSecond = (_second >> _x) call BIS_fnc_getCfgData;
    
    if !(_valueFirst isEqualTo _valueSecond) then
    {
        diag_log format ["%1 -> %2 | %3", _x, _valueFirst, _valueSecond];
        systemChat format ["%1 -> %2 | %3", _x, _valueFirst, _valueSecond];
    };
}
forEach _attribute;


// getValues for Vests
private _resultset = [];
{
    _resultset pushBack _x;
    private _value = (([[configfile >> "CfgWeapons" >> _x], ["passthrough", "armor", "maximumload"]] call BIS_fnc_configExtremes) select 1);
    _value = _value apply {if (_x < 1) then {parseNumber ((_x * 100) toFixed 0)} else {_x}};
    _resultset pushBack _value;
} forEach [
    "rhsusf_mbav_medic", 
    "rhsusf_mbav_mg", 
    "rhsusf_mbav_grenadier", 
    "rhsusf_mbav_rifleman", 
    "rhsusf_mbav_light", 
    "rhsusf_mbav"
];
_resultset;


