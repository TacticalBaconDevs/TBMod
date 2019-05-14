/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    // Check for Soldiers
    private _syncObjs = (synchronizedObjects _logic) select {_x isKindOf "CAManBase"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoShootingRange braucht gesyncte Soldaten!"};

    {_x setVariable ["acex_headless_blacklist", true, true]} forEach _syncObjs;

    [{
        params ["_syncObjs"];

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
        forEach _syncObjs;
    }, 5, _syncObjs] call CBA_fnc_addPerFrameHandler;
};
