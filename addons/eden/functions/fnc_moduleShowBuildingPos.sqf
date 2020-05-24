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

if (is3DEN && _mode == "attributesChanged3DEN") then
{
    private _building = (nearestObjects [_logic, ["House", "Building"], 5, true]) select {!(_x isKindOf "CBA_BuildingPos") && !(_x isKindOf "VR_Helper_base_F")};
    if !(_building isEqualTo []) then
    {
        {
            if (!TB_onlyCBA) then
            {
                {
                    TB_activeSelectors pushBack (create3DENEntity ["Object", "VR_3DSelector_01_exit_F", _x]);
                }
                forEach (_x buildingPos -1);
            };

            {
                TB_activeSelectors pushBack (create3DENEntity ["Object", "VR_3DSelector_01_default_F", _x]);
            }
            forEach (([_x] call CBA_fnc_buildingPositions) - (_x buildingPos -1));
        }
        forEach _building;
    }
    else
    {
        private _near = (nearestObjects [_logic, [], 5, true]) select {!(_x isKindOf "CBA_BuildingPos") && !(_x isKindOf "VR_Helper_base_F")};

        if !(_near isEqualTo []) then
        {
            {
                private _msg = format ["%1 - %2", typeOf x, [configFile >> "CfgVehicles" >> typeOf x, true] call BIS_fnc_returnParents];
                diag_log _msg;
                systemChat _msg;
            }
            forEach _near;
        }
        else
        {
            {deleteVehicle _x; delete3DENEntities [_x]} forEach TB_activeSelectors;
            TB_activeSelectors = [];
            systemChat "TB_activeSelectors leer gemacht!";
        };
    };
};

_logic spawn {uiSleep 0.5; deleteVehicle _this; delete3DENEntities [_this];};
