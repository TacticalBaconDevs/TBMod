/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Generates a Hash of a Array<Arrray<Number>> and a Salt;
    
    Arguments:
	ToHash  Array<Arrray<Number>>
	Salt <NUmber>
    Return Value:
    Hash <Number>
*/

params ["_arr", "_salt"];
private _start = CBA_missionTime;
private _total = _salt;
private _temp = 0;
private _counter = 0;
{
private _a = _salt;  
private _b = _salt;  
private _i = 1; 
private _buffer = 0; 
  
{  
 	_buffer = _buffer + (_x ^ _i); 
 
	if(_i==3) then  
	{ 
   		_a = (_a + _buffer) % 18749;  
		_b = (_b * _buffer ) % 18749;  
   		_buffer = 0; 
   		_i = 1; 
 	}; 
 	_i = _i+1; 
 
 
	} forEach _x;  
  	_temp = [_a, _b] call BIS_fnc_bitwiseXOR;

	_total = (_total + _temp) % 18749;
	systemChat format ["Counter: %1 Size: %2", _counter, count _x];
	_counter = _counter + 1;
} forEach _arr;
systemChat format ["Result: %1 Time took: %2", _total, (CBA_missionTime - _start)];
_total
