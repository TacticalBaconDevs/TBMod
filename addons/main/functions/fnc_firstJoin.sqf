#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// General - Viewdistance einstellen
if (ace_viewdistance_viewDistanceOnFoot == 0) then {["ace_viewdistance_viewDistanceOnFoot", 3, 0, "client", true] call CBA_settings_fnc_set};
if (ace_viewdistance_viewDistanceLandVehicle == 0) then {["ace_viewdistance_viewDistanceLandVehicle", 5, 0, "client", true] call CBA_settings_fnc_set};
if (ace_viewdistance_viewDistanceAirVehicle == 0) then {["ace_viewdistance_viewDistanceAirVehicle", 9, 0, "client", true] call CBA_settings_fnc_set};

// Update 1
if (profileNamespace getVariable ["TB_firstJoin", -1] < 1) then
{
    // MedicStuff
    ["ace_medical_menuTypeStyle", 2, 0, "client", true] call CBA_settings_fnc_set;
    ["ace_medical_menuTypeStyleSelf", false, 0, "client", true] call CBA_settings_fnc_set;

    systemChat "[UPDATE 1] Es wurden Anpassungen an deinen 'ACE3 Medical'-Einstellungen ausgeführt.";
    profileNamespace setVariable ["TB_firstJoin", 1];
    saveProfileNamespace;
};
