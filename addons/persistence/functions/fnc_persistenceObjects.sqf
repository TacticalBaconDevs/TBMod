#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_save", false, [false]],
        ["_storagearray", [], [[]]]
    ];

if (_save) then
{
    private _objectarray = ((allMissionObjects "Static") + (allMissionObjects "Thing")) select {!(_x in vehicles)};
    _objectarray = _objectarray arrayIntersect _objectarray; // doppelte elemenieren

    // sorting
    _objectarray = _objectarray apply {[(getPosASL _X) select 2, _x]};
    _objectarray sort true;
    _objectarray = _objectarray apply {_x select 1};
    private _array = [];

    {
        _array = [
                typeOf _x,
                getPosASL _x,
                vectorDir _x,
                vectorUp _x,
                simulationEnabled _x
            ];

        if (vehicleVarName _x != "") then {_array pushBack (vehicleVarName _x)};

        _storagearray pushBack _array;
    }
    forEach _objectarray;
}
else // load
{
    {
        _x params ["_classname", "_pos", "_dir", "_up", "_sim", "_name"];

        private _obj = (if (isNil "_name") then
            {
                createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
            }
            else
            {
                missionNamespace getVariable [_name, objNull];
            });

        _obj setVectorDirAndUp [_dir, _up];
        _obj setPosASL _pos;
        if (!(_obj in TB_persistence_tempSimulationDisabled)) then {
            _obj enableSimulationGlobal _sim;
        };

        if ((typeOf _obj) in ["Land_BarGate_F"]) then {
            [_obj, false] remoteExecCall ["allowDamage", _obj];
            _obj addEventHandler ["HandleDamage", {0}];
        };
       
        // Medic
        if ((typeOf _obj) in ["Land_Medevac_house_V1_F", "Land_MedicalTent_01_white_generic_open_F", "Land_Stretcher_01_F", "Land_IntravenStand_01_2bags_F", "Land_MedicalTent_01_floor_light_F"]) then
        {
            _obj setVariable ["ace_medical_isMedicalFacility", true, true];
        };
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Objekte wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
