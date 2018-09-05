/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: shukari
*/

// DynSimulation ist blöd
if (true) exitWith {};

params [["_input", false, [false]]];

if (!TB_enableAdvSimulationManager && _input) then {TB_enableAdvSimulationManager = true};
if (!TB_enableAdvSimulationManager) exitWith {};

// Trigger
{_x triggerDynamicSimulation false} forEach allUnits;
{_x triggerDynamicSimulation false} forEach vehicles;
{_x triggerDynamicSimulation true} forEach playableUnits;

// Enable DynSimulation
{_x enableDynamicSimulation true} forEach allGroups;
{_x enableDynamicSimulation true} forEach vehicles;
{_x enableDynamicSimulation false} forEach playableUnits;

// Settings
enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 500;
"Vehicle" setDynamicSimulationDistance 500;
"EmptyVehicle" setDynamicSimulationDistance 500;
"Prop" setDynamicSimulationDistance 500;
"IsMoving" setDynamicSimulationDistanceCoef 1.5;

["cameraView", {
    params ["_unit", "_cameraView"];
    
    private _objViewdistance = getObjectViewDistance select 0;
    
    if (_cameraView isEqualTo "GUNNER") then // Scoped
    {
        "Group" setDynamicSimulationDistance (_objViewdistance - (_objViewdistance * fog));
        "Vehicle" setDynamicSimulationDistance (_objViewdistance - (_objViewdistance * fog));
        "EmptyVehicle" setDynamicSimulationDistance (_objViewdistance - (_objViewdistance * fog));
    }
    else // Not scoped
    {
        "Group" setDynamicSimulationDistance ((_objViewdistance * 0.8) - (_objViewdistance * fog));
        "Vehicle" setDynamicSimulationDistance ((_objViewdistance * 0.8) - (_objViewdistance * fog));
        "EmptyVehicle" setDynamicSimulationDistance ((_objViewdistance * 0.5) - (_objViewdistance * fog));
    };
}] call CBA_fnc_addPlayerEventHandler;

// [{
    // {
        // if (side _x != blufor && dynamicSimulationEnabled _x && {_x distance player < 6000}) then
        // {
            // private _visibility = [vehicle player, "VIEW", vehicle _x] checkVisibility [eyePos player, eyePos _x];
            
            // if (_visibility > 0.8) then
            // {
                // (group _x) enableDynamicSimulation false;
                // {if (vehicle _x != _x) then {(vehicle _x) enableDynamicSimulation false}} forEach (units _x);
            // };
        // };
    // }
    // forEach allUnits;
// }, 1, []] call CBA_fnc_addPerFrameHandler;

// [{
    // if (cameraView isEqualTo "GUNNER") then // Scoped
    // {
        // "Group" setDynamicSimulationDistance (viewDistance - (viewDistance * fog));
        // "Vehicle" setDynamicSimulationDistance (viewDistance - (viewDistance * fog));
        // "EmptyVehicle" setDynamicSimulationDistance (viewDistance - (viewDistance * fog));
    // }
    // else // Not scoped
    // {
        // "Group" setDynamicSimulationDistance ((viewDistance * 0.8) - (viewDistance * fog));
        // "Vehicle" setDynamicSimulationDistance ((viewDistance * 0.8) - (viewDistance * fog));
        // "EmptyVehicle" setDynamicSimulationDistance ((viewDistance * 0.5) - (viewDistance * fog));
    // };
// }, 1, []] call CBA_fnc_addPerFrameHandler;
