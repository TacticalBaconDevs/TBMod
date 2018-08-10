/*
    Author: Willi "shukari" Graff
*/
params [
        "_obj1",
        "_obj2",
        ["_attribute", []],
        ["_sim", true]
    ];

if (_obj2 isEqualType objNull) then {_obj2 = typeOf _obj2};

if !(_attribute isEqualTo []) then
{
    {_attribute set [_forEachIndex, [_x, _obj1 getVariable _x]]} forEach _attribute;
};

private _pos = getPos _obj1;
private _dir = getDir _obj1;
deleteVehicle _obj1;

private _obj2 = createVehicle [_obj2, [0, 0, 0], [], 0, "NONE"];

_obj2 setDir _dir;
_obj2 setPos _pos;

if (!_sim) then {[_readyObj, false] remoteExecCall ["enableSimulationGlobal", 2]};

if !(_attribute isEqualTo []) then
{
    {
        _x params ["_key", "_value"];
        _obj2 setVariable [_key, _value, true];
    }
    forEach _attribute;
};

_obj2;