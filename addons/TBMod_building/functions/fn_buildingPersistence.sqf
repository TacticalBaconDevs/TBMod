/*
    Author: shukari
*/
params ["_save", "_number", ["_dontAddToArray", false]];

if !(_number in [1,2,3,4,5]) exitWith {systemChat "Wähle einen Slot zwischen 1-5"};

// getten
if (_save) then
{
    if (isNil "TB_persistent_buildings") exitWith {systemChat "Nichts zum Dauerspeichern verfügbar!"};
    private _array = [];
    
    {
        _x params ["_obj", "_big"];
        if (!isNil "_obj" && {!isNull _obj}) then {_array pushBack [_big, typeOf _obj, getPos _obj, getDir _obj, simulationEnabled _obj, _obj getVariable ["TB_building_addInfos", []]]};
        false;
    }
    count TB_persistent_buildings;
    
    profileNamespace setVariable [format ["TB_persistent_buildings_%1", _number], _array];
    
    systemChat format ["Es wurde alles in Slot %1 gespeichert!", _number];
}
else //laden
{
    private _array = profileNamespace getVariable [format ["TB_persistent_buildings_%1", _number], []];
    
    if (_array isEqualTo []) exitWith {systemChat "Nichts zum Laden verfügbar!"};
    if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};
    
    {
        _x params ["_big", "_classname", "_pos", "_dir", "_sim", "_addInfos"];
        
        private _obj = createVehicle [_classname, [0, 0, 0], [], 0, "NONE"];
        
        _obj setDir _dir;
        _obj setPos _pos;
        
        private _params = [_obj];
        _params append _addInfos;
        
        if (_big) then
        {
            _params spawn TB_fnc_initItemBig;
        }
        else
        {
            _params spawn TB_fnc_initItem;
        };
        
        if (!_sim) then
        {
            _obj enableSimulation false;
            [_obj, false] remoteExecCall ["enableSimulationGlobal", 2];
        };
        
        if (!_dontAddToArray) then {TB_persistent_buildings pushBack [_obj, _big]};
        
        // Medic
        if ((typeOf _obj) in ["Land_Medevac_house_V1_F", "Land_MedicalTent_01_white_generic_open_F"]) then
        {
            _obj setVariable ["ace_medical_isMedicalFacility", true, true];
        };
        
        // Antenne
        if ((typeOf _obj) in ["Land_TTowerSmall_1_F"]) then
        {
            [_obj, 10000] call TFAR_antennas_fnc_initRadioTower;
        };
        
        // Antenne
        if ((typeOf _obj) in ["Land_BarGate_F"]) then
        {
            [_obj, false] remoteExecCall ["allowDamage", _obj];
        };
        
        // Repair
        if ((typeOf _obj) in ["B_Slingload_01_Repair_F"]) then
        {
            _obj enableRopeAttach false;
        };
        
        false;
    }
    count _array;
    
    publicVariable "TB_persistent_buildings";
    
    systemChat format ["Es wurde alles aus Slot %1 geladen!", _number];
};
