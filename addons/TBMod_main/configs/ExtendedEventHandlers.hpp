class Extended_PostInit_EventHandlers
{
    class TBMod_main
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_postClientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_postServerInit.sqf'";
    };
};

class Extended_PreInit_EventHandlers
{
    class TBMod_main
    {
        init = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_preInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_preServerInit.sqf'";
    };
};

// Fahrzeuge beim Spawn leer machen
class Extended_Init_EventHandlers
{
    class LandVehicle
    {
        class TB_main_removeCargo
        {
            initPost = "params ['_vehicle']; if !(_vehicle getVariable ['TB_main_disableCargoCleanup', false]) then {clearBackpackCargoGlobal _vehicle; clearItemCargoGlobal _vehicle; clearMagazineCargoGlobal _vehicle; clearWeaponCargoGlobal _vehicle;};";
        };
    };
    
    class Air
    {
        class TB_main_removeCargo
        {
            initPost = "params ['_vehicle']; if !(_vehicle getVariable ['TB_main_disableCargoCleanup', false]) then {clearBackpackCargoGlobal _vehicle; clearItemCargoGlobal _vehicle; clearMagazineCargoGlobal _vehicle; clearWeaponCargoGlobal _vehicle;};";
        };
    };
    
    class Ship
    {
        class TB_main_removeCargo
        {
            initPost = "params ['_vehicle']; if !(_vehicle getVariable ['TB_main_disableCargoCleanup', false]) then {clearBackpackCargoGlobal _vehicle; clearItemCargoGlobal _vehicle; clearMagazineCargoGlobal _vehicle; clearWeaponCargoGlobal _vehicle;};";
        };
    };
    
    class TB_spezial_fobBase
    {
        class TB_main_onlyOne
        {
            serverInit = "params ['_vehicle']; {if !(_x isEqualTo _vehicle) then {deleteVehicle _x}; false} count (entities (typeOf _vehicle)); if (isNil 'TB_main_fobs') then {TB_main_fobs = []}; private _displayname = getText (configFile >> 'CfgVehicles' >> typeOf _vehicle >> 'displayName'); TB_main_fobs set [getNumber (configFile >> 'CfgVehicles' >> typeOf _vehicle >> 'fobNumber'), [_displayname, _vehicle]];  publicVariable 'TB_main_fobs'; private _marker = createMarker [_displayname, getPos _vehicle]; _marker setMarkerText _displayname; _marker setMarkerType 'hd_flag'; (format ['%1 wurde errichtet!', _displayname]) remoteExecCall ['systemChat']";
        };
    };
};