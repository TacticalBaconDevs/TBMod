// *****************************************************
// ** JBOY_UpDown.sqf
// ** Version 1.1
// ** by JohnnyBoy, optimised by Willi "shukari" Graff
// *****************************************************
// [this] spawn TB_fnc_UpDown;
// this addeventhandler ["FiredNear", {[_this select 0, ["UP", "MIDDLE"]] spawn TB_fnc_UpDown}];
// this addeventhandler ["FiredNear", {[_this select 0, ["MIDDLE", "DOWN"]] spawn TB_fnc_UpDown}];
//
// *****************************************************
if (true) exitWith {}; // MUSS UMGEBAUT WERDEN
params ["_dude", ["_stances", []]];

if (isNull _dude) exitWith {};

_dude removeAllEventHandlers "FiredNear";

if (!isDedicated) exitwith {};
if (isPlayer _dude) exitwith {};
if (!alive _dude) exitWith {};
if (!canSuspend) exitWith {}; //_this spawn TB_fnc_UpDown

if (_stances isEqualTo []) then {_stances = ["UP", "MIDDLE"]};
_stances params ["_stanceStart", "_stanceDef"];

doStop _dude;
if (!isNull _dude) then {[_dude, "PATH"] remoteExecCall ["disableAI", _dude]};
_dude setVariable ["acex_headless_blacklist", true, true];
//(group _dude) setVariable ["acex_headless_blacklist", true, true];

private _dudeOriginalStance = unitPos _dude;
private _iterations = 0;
private _time = diag_tickTime + 300;

waitUntil
{
    _dude setUnitPos ([_stanceStart, _stanceDef] select ((unitPos _dude == _stanceStart) || getSuppression _dude > 0.1));
    
    uiSleep (3 + (random 7));
    
    if (isNull (_dude findNearestEnemy _dude)) then {_iterations = _iterations + 1};
    
    alive _dude && _iterations < 8 && _time < diag_tickTime
};

if (alive _dude) then
{
    _dude setUnitPos _dudeOriginalStance;
    _dude addEventHandler ["FiredNear", {[_this select 0, _stances] spawn TB_fnc_UpDown}];
};
