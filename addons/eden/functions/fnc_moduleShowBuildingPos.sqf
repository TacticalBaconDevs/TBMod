#include "../script_component.hpp"
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

if (isNil "TB_activeSelectors") then {TB_activeSelectors = []};
if (isNil "TB_onlyCBA") then {TB_onlyCBA = false};

if (is3DEN) then
{
    private _building = nearestObjects [_logic, ["House", "Building"], 5, true];
    if !(_building isEqualTo []) then
    {
        {
            if (!TB_onlyCBA) then
            {
                {
                    TB_activeSelectors pushBack (createVehicle ["VR_3DSelector_01_exit_F", _x, [], 0, "CAN_COLLIDE"]);
                }
                forEach (_x buildingPos -1);
            };

            {
                TB_activeSelectors pushBack (createVehicle ["VR_3DSelector_01_default_F", _x, [], 0, "CAN_COLLIDE"]);
            }
            forEach ((_x buildingPos -1) - ([_x] call CBA_fnc_buildingPositions));
        }
        forEach _building;
    }
    else
    {
        private _near = nearestObjects [_logic, [], 5, true];

        if !(_near isEqualTo []) then
        {
            {
                diag_log format ["%1 - %2", typeOf x, [configFile >> "CfgVehicles" >> typeOf x, true] call BIS_fnc_returnParents];
            }
            forEach _near;
        }
        else
        {
            {deleteVehicle _x} forEach TB_activeSelectors;
            TB_activeSelectors = [];
            systemChat "TB_activeSelectors leer gemacht!";
        };
    };
};

_logic spawn {uiSleep 1; deleteVehicle _this; delete3DENEntities [_this];};
