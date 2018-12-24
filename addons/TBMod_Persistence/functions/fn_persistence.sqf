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
        ["_number", 0, [0]]
    ];

if (!isServer) exitWith {"[TBMod_persistence] NUR auf dem Server ausführen" remoteExecCall ["systemChat"]};
if (!canSuspend) exitWith {"[TBMod_persistence] Skript muss per SPAWN ausgeführt werden" remoteExecCall ["systemChat"]};
if !(_number in [1,2,3,4,5]) exitWith {"[TBMod_persistence] Wähle einen Slot zwischen 1-5" remoteExecCall ["systemChat"]};

if (_save) then
{
    private _saveArray = [
        [],     // disconnectCache
        [],     // Markers
        [],     // Objects
        []      // Vehicles
    ];
    
    // save current players
    [_save, _number, _saveArray] spawn TB_fnc_persistencePlayers;

    // save marker
    [_save, _number, _saveArray] spawn TB_fnc_persistenceMarkers;

    //save objects
    [_save, _number, _saveArray] spawn TB_fnc_persistenceObjects;
    
    // save vehicles
    [_save, _number, _saveArray] spawn TB_fnc_persistenceVehicles;

    //save storagearray
    profileNamespace setVariable [format ["TB_persistence_%1", _number], _saveArray];

    (format ["[TBMod_persistence] Es wurde alles in Slot %1 gespeichert!", _number]) remoteExecCall ["systemChat"];

    //save TBMod_building stuff
    [true, _number] spawn TB_fnc_buildingPersistence;
}
else // load
{
    private _loadArray = profileNamespace getVariable [format ["TB_persistence_%1", _number], [[], [], [], []]];
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
    
    
    // das Löschen der Fahrzeuge dauert etwas, um Explosionen zu verhindern kurz warten
    uiSleep 1;

    // Objekte laden
    

    // Fahrzeuge organisieren
    

    // temp silumlierte Objekte wieder zurücksetzen
    {_x enableSimulationGlobal true} forEach TB_persistence_tempSimulationDisabled;

    //Teleport players
    [_save, _number, _loadArray] spawn TB_fnc_persistenceMarkers;

    [false, _number] spawn TB_fnc_buildingPersistence;
    
    (format ["[TBMod_persistence] Es wurde alles von Slot %1 geladen!", _number]) remoteExecCall ["systemChat"];
};
