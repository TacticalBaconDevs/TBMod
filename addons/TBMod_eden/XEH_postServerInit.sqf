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
                            (weaponState _this) params ["", "_muzzel", "_mode"];
                            _this forceWeaponFire [_muzzel, _mode];
                            uiSleep (0.2 + random 1);
                        };
                    };
                };
            }
            forEach TB_shootUnits;
        }, 5] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
