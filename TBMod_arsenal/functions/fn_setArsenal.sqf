/*
    Author: Willi "shukari" Graff
    
    Aufgerufen durch: fn_changeRolle
*/
params ["_ammoBox"];

if (isNull _ammoBox) exitWith {};

// Check zum Überspringen
private _type = getText (configFile >> "CfgVehicles" >> typeOf _ammoBox >> "arsenalType");
if (_type in ["", "CUSTOM"]) exitWith {};

// Arsenalitems laden
private _allItems = call (switch (_type) do
{
    case "USA": {TB_fnc_arsenalUSA};
    case "RUSS": {TB_fnc_arsenalRUSS};
    case "BW": {TB_fnc_arsenalBW};
    case "VANILLA-BLUE": {TB_fnc_arsenalVANILLA};
    default {hint "Schwerer Fehler #200"};
});

ace_arsenal_cameraPosition = [4, -8, 15, [0, 0, 1]];

// Box cleanen & Items hinzufügen
[_ammoBox, false] call ace_arsenal_fnc_removeBox;
[_ammoBox, true, false] call ace_arsenal_fnc_removeVirtualItems;
[_ammoBox, _allItems, false] call ace_arsenal_fnc_addVirtualItems;

// Virtuelle Items auf dem Spieler sichern und andere Arsenale syncen
private _tbCargo = _ammoBox getVariable 'ace_arsenal_virtualItems';
ACE_player setVariable ["TB_arsenalCargo", _tbCargo];

// Arsenale syncen
{
    if ([_x] call TB_fnc_isArsenalType && {!(_tbCargo isEqualTo (_x getVariable ['ace_arsenal_virtualItems', []]))}) then
    {
        _x setVariable ['ace_arsenal_virtualItems', _tbCargo];
    };
    
    false;
}
count (entities (typeOf _ammoBox));
