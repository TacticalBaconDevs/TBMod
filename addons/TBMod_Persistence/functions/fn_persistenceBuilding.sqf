/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
*/
params [
        ["_save", false, [false]],
        ["_name", "", [""]],
        ["_dontAddToArray", false, [false]]
    ];

if (!isServer) exitWith {"[TBMod_persistence] NUR auf dem Server ausführen" remoteExecCall ["systemChat"]};
if (_name == "") exitWith {"[TBMod_persistence] Kein Name angegeben" remoteExecCall ["systemChat"]};

if (_save) then
{
    if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};
    private _array = [];

    {
        _x params ["_obj", "_big"];

        if (!isNil "_obj" && {!isNull _obj}) then
        {
            _array pushBack [
                    _big,
                    typeOf _obj,
                    getPosASL _obj,
                    vectorDir _obj,
                    vectorUp _obj,
                    simulationEnabled _obj,
                    _obj getVariable ["TB_building_addInfos", []]
                ];
        };
    }
    forEach TB_persistent_buildings;

    profileNamespace setVariable [format ["TB_persistent_buildings_%1", _name], _array];
}
else //laden
{
    private _array = profileNamespace getVariable [format ["TB_persistent_buildings_%1", _name], []];

    if (_array isEqualTo []) exitWith {"[TBMod_persistence] Nichts zum Laden verfügbar!" remoteExecCall ["systemChat"]};
    if (isNil "TB_persistent_buildings") then {TB_persistent_buildings = []};

    {
        _x params ["_big", "_classname", "_pos", "_dir", "_up", "_sim", "_addInfos"];

        private _obj = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];

        _obj setVectorDirAndUp [_dir, _up];
        _obj setPosASL _pos;

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

        _obj enableSimulationGlobal _sim;

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
            _obj allowDamage false;
            _obj addEventHandler ["HandleDamage", {0}];
        };

        // Repair
        if ((typeOf _obj) in ["B_Slingload_01_Repair_F"]) then
        {
            _obj enableRopeAttach false;
        };
    }
    forEach _array;

    publicVariable "TB_persistent_buildings";
};

(format ["[TBMod_persistence] Es wurde alles aus Slot %1 ge%2.", _name, ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
