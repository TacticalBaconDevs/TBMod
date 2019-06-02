/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_groupNumber", "_up", ["_task", false]];

{
    if (_x isEqualType objNull) then
    {
        _x animate ["Terc", parseNumber !_up];
    }
    else
    {
        _x params ["_classname", "_dir", "_pos", "_prevObject"];
        private _newX = +_x;

        if !(isNull _prevObject) then {deleteVehicle _prevObject};

        if (_up) then
        {
            private _veh = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
            _veh setDir _dir;
            _veh setPos _pos;

            _newX set [3, _veh];
            ((TB_targetGroups select (_groupNumber - 1))) set [_forEachIndex, _newX];
        };
    };
}
forEach (TB_targetGroups select (_groupNumber - 1));

[_groupNumber, _task] remoteExecCall ["TB_fnc_runTask"];
