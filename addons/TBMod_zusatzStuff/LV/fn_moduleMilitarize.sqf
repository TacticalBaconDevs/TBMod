params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];
 
// diag_log format ["[DEBUG] %1", _this];
// systemChat format ["[DEBUG] %1", _this];

if (!is3DEN && {_mode == "init"} && {_isActivated}) then {
    // Konverter String to Array
    {
        private _value = _logic getVariable _x;
        if (!isNil "_value") then {_logic setVariable [_x, call compile _value]};
    } forEach ["filterClass", "infCoef", "vehCoef"];

    {
        diag_log format ["###DEBUG3: %1 -> %2 -> %3", _x, typeName (_logic getVariable _x), _logic getVariable _x];
    }
    forEach (allVariables _logic);
    
    // Objecte im Bereich kriegen
    // _area = [getPos _logic];
    // _area append (_logic getVariable ["objectarea", []]);
    // _objects = (entities [["house"], []]) inAreaArray _area;
    
    (_logic getVariable ["objectarea", []]) params [["_w", 150], ["_h", 150]];
    private _radius = _w min _h;
    
    [
        getPos _logic,
        _logic getVariable ["filterClass", ["customClass1"]],
        _logic getVariable ["side", 2],
        _logic getVariable ["radius", _radius], //150
        [_logic getVariable ["menSpawnLand", true], _logic getVariable ["menSpawnWater", false]],
        [_logic getVariable ["vehSpawnLand", true], _logic getVariable ["vehSpawnWater", false], _logic getVariable ["vehSpawnAir", false]],
        !(_logic getVariable ["patrol", true]),
        _logic getVariable ["infCoef", [10,5]],
        _logic getVariable ["vehCoef", [0,1]],
        _logic getVariable ["skill", -1],
        _logic getVariable ["smokeChems", false],
        _logic getVariable ["doorHandling", false],
        _logic getVariable ["dynSim", false]
    ] spawn TB_LV_fnc_militarize;
};

true