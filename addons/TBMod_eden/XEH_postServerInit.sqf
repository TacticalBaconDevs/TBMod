/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

["TB_atmo_event_atmoShootingRange", {
    params ["_units"];

    TB_shootUnits = missionNamespace getVariable ["TB_shootUnits", []];
    TB_shootUnits append _units;
    TB_shootUnits = TB_shootUnits arrayIntersect TB_shootUnits;

    if (isNil "TB_shootLoop_id") then
    {
        TB_shootLoop_id = [{
            params ["_args", "_idPFH"];

            TB_shootUnits = TB_shootUnits select {alive _x};
            if (TB_shootUnits isEqualTo []) exitWith
            {
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                TB_shootLoop_id = nil;
            };

            {
                if (random 1 < 0.3) then
                {
                    _x spawn
                    {
                        _this setAmmo [currentWeapon _this, 999];

                        for "_i" from 0 to (1 + (random 2)) do
                        {
                            uiSleep (0.2 + random 3);
                            (weaponState _this) params ["", "_muzzel", "_mode"];
                            _this forceWeaponFire [_muzzel, _mode];
                        };
                    };
                };
            }
            forEach TB_shootUnits;
        }, 10] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;

["TB_atmo_event_amtoMortarSupport", {
    params ["_mortars"];

    TB_mortarUnits = missionNamespace getVariable ["TB_mortarUnits", []];
    TB_mortarUnits append _mortars;
    TB_mortarUnits = TB_mortarUnits arrayIntersect TB_mortarUnits;

    if (isNil "TB_mortarLoop_id") then
    {
        TB_mortarLoop_id = [{
            params ["_args", "_idPFH"];

            TB_mortarUnits = TB_mortarUnits select {alive _x};
            if (TB_mortarUnits isEqualTo []) exitWith
            {
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                TB_mortarLoop_id = nil;
            };

            {
                if (random 1 < 0.3) then
                {
                    _x setVehicleAmmoDef 1;
                    _x lookAt (_x getPos [10, random 180]);
                    _x spawn
                    {
                        uiSleep 5;
                        _this fire "mortar_82mm";
                    };

                    /*private _mag = (getArtilleryAmmo [_x]) param [0, ""];
                    private _artyPos = _x getVariable ["TB_lastArtyPos", [0, 0, 0]];

                    if !(_artyPos inRangeOfArtillery [[_x], _mag]) then
                    {
                        _artyPos = getPos _x;
                        while {!(_artyPos inRangeOfArtillery [[_x], _mag])} do {_artyPos set [0, (_artyPos # 0) + 2000]};
                        _x setVariable ["TB_lastArtyPos", _artyPos];
                    };

                    _x doArtilleryFire [_artyPos, _mag, 1];*/
                };
            }
            forEach TB_mortarUnits;
        }, 30] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;

["TB_atmo_event_atmoMortarSuppression", {
    params ["_targets"];

    TB_mortarSuppressTargets = missionNamespace getVariable ["TB_mortarSuppressTargets", []];
    TB_mortarSuppressTargets append _targets;
    TB_mortarSuppressTargets = TB_mortarSuppressTargets arrayIntersect TB_mortarSuppressTargets;

    if (isNil "TB_mortarSuppressLoop_id") then
    {
        TB_mortarSuppressLoop_id = [{
            params ["_args", "_idPFH"];

            TB_mortarSuppressTargets = TB_mortarSuppressTargets select {alive _x};
            if (TB_mortarSuppressTargets isEqualTo []) exitWith
            {
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                TB_mortarSuppressLoop_id = nil;
            };

            {
                if (random 1 < 0.2) then
                {
                    private _pos = getPos _x;
                    _pos set [2, 80 + (random 500)];
                    _mortar = createVehicle ["Sh_82mm_AMOS", _pos, [], 40, "CAN_COLLIDE"];
                    _mortar setVelocity [random 5, random 5, -10 - (random 30)];
                };
            }
            forEach TB_mortarSuppressTargets;
        }, 60] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;

["TB_atmo_event_atmoFireSuppression", {
    params ["_soldiers", "_targets"];

    TB_fireSuppressSoldiers = missionNamespace getVariable ["TB_fireSuppressSoldiers", []];
    TB_fireSuppressSoldiers append _soldiers;
    TB_fireSuppressSoldiers = TB_fireSuppressSoldiers arrayIntersect TB_fireSuppressSoldiers;

    if (isNil "TB_fireSuppressLoop_id") then
    {
        TB_fireSuppressLoop_id = [{
            params ["_args", "_idPFH"];
            _args params ["", "_targets"];

            TB_fireSuppressSoldiers = TB_fireSuppressSoldiers select {alive _x};
            if (TB_fireSuppressSoldiers isEqualTo []) exitWith
            {
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                TB_fireSuppressLoop_id = nil;
            };

            {
                _x setAmmo [currentWeapon _x, 999];

                if (random 1 < 0.2) then
                {
                    _target = selectRandom _targets;
                    _x doSuppressiveFire _target;
                };
            }
            forEach TB_fireSuppressSoldiers;
        }, 10, _this] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
