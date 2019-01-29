/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    ToDo:
    - Unsung Minen sind CfgAmmos auf dem Boden
        - zu finden per Default das ist dan aber alle CfgWeapons (allMissionObjects "Default")
    - minen werden als Modul gesetzt... die Mine ist eine _ammo und das Modul der sichtbare Bubble
*/
params [
        ["_save", false, [false]],
        ["_name", "", [""]],
        ["_localOverride", false, [false]]
    ];

if (!isServer && !_localOverride) exitWith {"[TBMod_persistence] NUR auf dem Server ausführen" remoteExecCall ["systemChat"]};
if (!canSuspend) exitWith {"[TBMod_persistence] Skript muss per SPAWN ausgeführt werden" remoteExecCall ["systemChat"]};
if (_name == "") exitWith {"[TBMod_persistence] Kein Name angegeben" remoteExecCall ["systemChat"]};

if (_save) then
{
    private _saveArray = [
        [],     // disconnectCache
        [],     // Markers
        [],     // Objects
        []      // Vehicles
    ];

    // save current players
    _saveArray set [0, [_save] call TB_fnc_persistencePlayers];

    // save marker
    _saveArray set [1, [_save] call TB_fnc_persistenceMarkers];

    // save objects
    _saveArray set [2, [_save] call TB_fnc_persistenceObjects];

    // save vehicles
    _saveArray set [3, [_save] call TB_fnc_persistenceVehicles];

    // save storagearray

    profileNamespace setVariable [format ["TB_persistence_%1", _name], _saveArray];

    // save TBMod_building stuff
    [true, _name] call TB_fnc_persistenceBuilding;

    saveProfileNamespace;
}
else // load
{
    private _loadArray = profileNamespace getVariable [format ["TB_persistence_%1", _name], [[], [], [], []]];

    private _objArray = (allMissionObjects "Static") + (allMissionObjects "Thing") + vehicles;
    _objArray = _objArray arrayIntersect _objArray;

    // vorhandene nicht benannte Fahrzeuge löschen
    (_objArray select {vehicleVarName _x == ""}) call CBA_fnc_deleteEntity;

    // Benutzermarker löschen
    (allMapMarkers select {(_x select [0, 13]) == "_USER_DEFINED"}) call CBA_fnc_deleteEntity;

    // benannte Fahrzeuge simulation temp deaktivieren
    TB_persistence_tempSimulationDisabled = [];
    {
        _x enableSimulationGlobal false;
        TB_persistence_tempSimulationDisabled pushBackUnique _x;
    }
    forEach (_objArray select {vehicleVarName _x != "" && simulationEnabled _x});

    // Marker laden
    [_save, _loadArray select 1] call TB_fnc_persistenceMarkers;

    // das Löschen der Fahrzeuge dauert etwas, um Explosionen zu verhindern kurz warten
    uiSleep 1;

    // Objekte laden
    [_save, _loadArray select 2] call TB_fnc_persistenceObjects;

    // Fahrzeuge organisieren
    [_save, _loadArray select 3] call TB_fnc_persistenceVehicles;

    // temp silumlierte Objekte wieder zurücksetzen
    {_x enableSimulationGlobal true} forEach TB_persistence_tempSimulationDisabled;

    // Teleport players
    [_save, _loadArray select 0] call TB_fnc_persistencePlayers;

    // Load TBMod_building stuff
    [false, _name] call TB_fnc_persistenceBuilding;
};

(format ["[TBMod_persistence] Es wurde Slot %1 ge%2.", _name, ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];

