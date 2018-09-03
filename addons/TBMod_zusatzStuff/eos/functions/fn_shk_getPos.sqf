params ["_origo", "_dir", "_dist"];

if (_dir isEqualType []) then
{
    if ((_dir select 0) > (_dir select 1)) then {_dir set [1, (_dir select 1) + 360]};
    _dir = (_dir select 0) + random ((_dir select 1) - (_dir select 0));
};

if (_dist isEqualType []) then {
    _dist = (_dist select 0) + random ((_dist select 1) - (_dist select 0));
};

[(_origo select 0) + (_dist * sin _dir), (_origo select 1) + (_dist * cos _dir), 0];
