/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Todo: gespeicherte Position verbessern
*/

params [
        ["_save", false, [false]],
        ["_storagearray", [], [[], [], [], []]]
    ];


if (_save) then
{
    private _objectarray = ((allMissionObjects "Static") + (allMissionObjects "Thing")) select {isNil {_x getVariable "TB_building_addInfos"} && !(_x in vehicles)};
    _objectarray = _objectarray arrayIntersect _objectarray; // doppelte elemenieren
    
    // sorting
    _objectarray = _objectarray apply {[(getPosASL _X) select 2, _x]};
    _objectarray sort true;
    _objectarray = _objectarray apply {_x select 1};
    
    {
        private _array = [
                typeOf _x,
                getPosASL _x,
                vectorDir _x,
                vectorUp _x,
                getDir _x,
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
        _x params ["_classname", "_pos", "_dir", "_up", "_dirsimple", "_sim", "_name"];

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

        if (!_sim) then {_obj enableSimulationGlobal false};
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Objekte wurden %1", ["geladen.", "gespeichert."] select(_save)]) remoteExecCall ["systemChat"];
