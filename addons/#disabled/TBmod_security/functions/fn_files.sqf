/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Returns Array<Arrray<Number>> of all file contents

    Arguments:

    Return Value:
    filecontents Array<Arrray<Number>>
*/

private _filestocheck = [];


// XEH Files Post
{
    {
      _filestocheck pushBack ((((getText _x) splitString " ") select 3 splitString toString [39] )joinString "");
    } forEach (configProperties [_x]);
} forEach ("(configName  _x find 'TBMod') != -1" configClasses (configfile >> "Extended_PostInit_EventHandlers"));

//XEH Files Pre
{
    {
        _filestocheck pushBack ((((getText _x) splitString " ") select 3 splitString toString [39] )joinString "");
    } forEach (configProperties [_x]);
} forEach ("(configName  _x find 'TBMod') != -1" configClasses (configfile >> "Extended_PreInit_EventHandlers"));

// Functions
{
    {
        private _path = getText (_x >> "file");
        {
            _filestocheck pushBack (_path + "\fn_" + (configName _x) + ".sqf");
        } forEach ("true" configClasses _x);
    } forEach ("true" configClasses _x);
} forEach ("(configName  _x find 'TBMod') != -1" configClasses (configfile >> "CfgFunctions"));


private _return = [];
{
    _return pushBack (toArray(loadFile _x));
} forEach _filestocheck;
_return;
