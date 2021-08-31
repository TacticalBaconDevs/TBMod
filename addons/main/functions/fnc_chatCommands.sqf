#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus, #fps, #safe, #hideGroup, #setGroup, #kompass, #clearCache, #hideGUI, #spectator(s), #sniper";
}, "all"] call CBA_fnc_registerChatCommand;

["tasten", {
    systemChat "SHIFT + ENDE -> [LVL0] TFAR vom Spieler lösen, folgt der ZeusCam";
    systemChat "STRG + ENDE  -> [LVL2] GCAM";
    systemChat "SHIFT + STRG + ENDE -> [LVL2] Spectator";
    systemChat "ALT + ENDE   -> [LVL3] Zeus in der Mission erstellen";
}, "all"] call CBA_fnc_registerChatCommand;

["rechte", {
    if (getPlayerUID player in (call TB_lvl3)) exitWith {systemChat "### Rechte Level -> LVL3 (Admin)"};
    if (getPlayerUID player in (call TB_lvl2)) exitWith {systemChat "### Rechte Level -> LVL2 (Spezi)"};
    systemChat "### Rechte Level -> LVL1 (Normalo)"
}, "all"] call CBA_fnc_registerChatCommand;

["zeus", {
    systemChat format ["Aktive Zeus: %1", ((allCurators select {isPlayer (getAssignedCuratorUnit _x)}) apply {name (getAssignedCuratorUnit _x)}) joinString ", "];
}, "all"] call CBA_fnc_registerChatCommand;

["spectators", {
    systemChat format ["Spectator: %1", (([] call ace_spectator_fnc_players) select {alive _x}) apply {name _x}];
}, "all"] call CBA_fnc_registerChatCommand;

["hideGUI", {
    diwako_dui_main_toggled_off = !diwako_dui_main_toggled_off;
    ["diwako_dui_main_hudToggled", [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    systemChat format ["HUD ist nun %1", ["sichtbar" , "unsichtbar"] select diwako_dui_main_toggled_off];
}, "all"] call CBA_fnc_registerChatCommand;

["sniper", {
    private _weapon = currentWeapon ACE_player;
    private _magazine = currentMagazine ACE_player;
    private _ammo = getText (configfile >> "CfgMagazines" >> _magazine >> "ammo");
    private _ammoCFG = configFile >> "CfgAmmo" >> _ammo;
    private _muzzleVelocity = getArray (_ammoCFG >> "ACE_muzzleVelocities") # 0;
    private _tempLookup = [-15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35];
    private _shifts = getArray (_ammoCFG >> "ACE_ammoTempMuzzleVelocityShifts");
    if (_weapon == "" || _magazine == "") exitwith {systemChat "Habe eine Waffe mit Magazin ausgerüstet."};

    _s_title =  "<t color='#dea412' size='1.6' align='center'>Informationen für Sniper</t><br/><br/>";  
    _s_map = format ["<t color='#3388ff' align='left'>Map:</t> <t align='right'> %1 </t><br/>", worldName];
    _s_Lat = format ["<t color='#3388ff' align='left'>Latitude:</t> <t align='right'> %1° </t><br/>", ace_common_maplatitude];
    _s_weapon = format ["<t color='#3388ff' align='left'>Weapon:</t> <t align='right'> %1 </t><br/>", _weapon];
    _s_bore = format ["<t color='#3388ff' align='left'>Bore:</t> <t align='right'> %1 cm </t><br/>", [ACE_player, 0] call ace_scopes_fnc_getBoreHeight];
    _s_twist = format ["<t color='#3388ff' align='left'>Barrel Twist:</t> <t align='right'> %1 inch </t><br/>", (getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_barrelTwist")) / 25.4];
    _s_bullet = format ["<t color='#3388ff' align='left'>Bullet:</t> <t align='right'> %1</t><br/>", _ammo];
    _s_bullet_mass = format ["<t color='#3388ff' align='left'>Bullet Mass:</t> <t align='right'> %1 grains</t><br/>", getNumber (_ammoCFG >> "ACE_bulletMass")];
    _s_bullet_diam = format ["<t color='#3388ff' align='left'>Bullet Diam:</t> <t align='right'> %1 inch</t><br/>", getNumber (_ammoCFG >> "ACE_caliber")];
    _s_bullet_c1 = format ["<t color='#3388ff' align='left'>C1 Coefficient:</t> <t align='right'> %1</t><br/>", getArray (_ammoCFG >> "ACE_ballisticCoefficients") # 0];
    _s_bullet_Velocity = format ["<t color='#3388ff' align='left'>Muzzle velocity:</t> <t align='right'> %1 m/s</t><br/>", _muzzleVelocity];
    
    hint parsetext (_s_title + _s_map + _s_Lat +_s_weapon + _s_Bore + _s_twist + _s_bullet + _s_bullet_mass +_s_bullet_diam + _s_bullet_c1 + _s_bullet_Velocity);

    systemChat "Muzzle velocity table:";
    for "_i" from 0 to 10 do
    {
        systemChat format ["%1°C  :  %2m/s", _tempLookup # _i, _muzzleVelocity + _shifts # _i];
    };
}, "all"] call CBA_fnc_registerChatCommand;

["fps", {
    if (player in (call BIS_fnc_listCuratorPlayers)) then
    {
        GVAR(fpsMonitor_zeus) = !GVAR(fpsMonitor_zeus);
        systemChat format ["Zeus-FPS ist nun %1aktiviert!", ["de", ""] select GVAR(fpsMonitor_zeus)];
    }
    else
    {
        systemChat "Dieser Befehl ist nur für ZeusSpieler relevant!";
    };
}, "all"] call CBA_fnc_registerChatCommand;

["safe", {
    if ((call BIS_fnc_admin) == 0 && isNull (getAssignedCuratorLogic player) && !((getPlayerUID player) in (call TB_lvl2))) exitWith {systemChat "Du hast keine Rechte für diesen Befehl!"};

    switch (_this select 0) do
    {
        case "1":
        {
            [true] remoteExec [QFUNC(safe)];
            systemChat "SafeStart wurde global aktiviert!";
        };
        case "0":
        {
            [false] remoteExec [QFUNC(safe)];
            systemChat "SafeStart wurde global deaktiviert!";
        };
        default
        {
            systemChat format ["SafeStart wurde global %1aktiviert!", ["de", ""] select (isNil QGVAR(safeInfo))];
            [isNil QGVAR(safeInfo)] remoteExec [QFUNC(safe)];
        };
    };

    ["TB_informAdminsAndZeus", ["%1 hat den SAFE Status geändert!", profileName]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["hideGroup", {
    if ((call BIS_fnc_admin) == 0 && isNull (getAssignedCuratorLogic player) && !((getPlayerUID player) in (call TB_lvl2))) exitWith {systemChat "Du hast keine Rechte für diesen Befehl!"};

    switch (_this select 0) do
    {
        case "1":
        {
            (group player) setVariable ["ace_map_hideBlueForceMarker", true, true];
            systemChat "Gruppe ist nun unsichtbar!";
        };
        case "0":
        {
            (group player) setVariable ["ace_map_hideBlueForceMarker", false, true];
            systemChat "Gruppe ist nun unsichtbar!";
        };
        default
        {
            systemChat format ["Gruppe ist nun %1sichtbar!", ["un", ""] select ((group player) getVariable ["ace_map_hideBlueForceMarker", false])];
            (group player) setVariable ["ace_map_hideBlueForceMarker", !((group player) getVariable ["ace_map_hideBlueForceMarker", false]), true];
        };
    };

    ["TB_informAdminsAndZeus", ["%1 hat die Gruppe '%2' %3sichtbar gemacht!", profileName, groupId (group player), ["", "un"] select ((group player) getVariable ["ace_map_hideBlueForceMarker", false])]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["setGroup", {
    if ((call BIS_fnc_admin) == 0 && isNull (getAssignedCuratorLogic player) && !((getPlayerUID player) in (call TB_lvl2))) exitWith {systemChat "Du hast keine Rechte für diesen Befehl!"};

    params ["_grpName"];
    if (_grpName == "") exitWith {systemChat "Kein Name wurde angegeben!"};

    private _unit = cursorObject;
    if (!isPlayer _unit) then {_unit = objNull};
    if (isNull _unit) then {_unit = ACE_player};

    systemChat format ["Gruppe '%1', mit Leader %3, heißt nun '%2'!", groupId (group _unit), _grpName, [leader _unit] call ace_common_fnc_getName];
    ["TB_informAdminsAndZeus", ["%1 hat die Gruppe '%2' von %4 auf '%3' umbenannt!", profileName, groupId (group _unit), _grpName, [leader _unit] call ace_common_fnc_getName]] call CBA_fnc_globalEvent;

    (group _unit) setGroupIdGlobal [_grpName];
}, "all"] call CBA_fnc_registerChatCommand;

["settings", {
    if ((call BIS_fnc_admin) == 0 && isNull (getAssignedCuratorLogic player) && !((getPlayerUID player) in (call TB_lvl2))) exitWith {systemChat "Du hast keine Rechte für diesen Befehl!"};
    if (serverTime >= (20 * 60)) exitWith
    {
        private _msg = format ["[BÖSE] %1 wollte %2min nach Serverrestart die Settings verändern", profileName, serverTime / 60];
        ["[error pos]"+ _msg] remoteExecCall ["diag_log"];
        [_msg] remoteExecCall ["systemChat"];
        ["TB_informAdminsAndZeus", _msg] call CBA_fnc_globalEvent;
    };

    [
        2,
        {
            (((["", "Hard", "WL", "WoMi"] apply {format ["stuff\defaultSettings%1.txt", _x]}) select {[_x] call FUNC(fileExists)}) apply {[_x, preprocessFile _x]}) select {_x # 1 != ""};
        }, {
            params ["_return"];

            // TODO: ggf Hardcoded eine rein? ändere die aber zu oft ^^ ggf htmlload aus repo raus?
            // TODO: profileNameSpace ist einen Option die ich aber nicht mag ;D
            if (_return isEqualTo []) exitWith {systemChat "Die Mission hat keine Settings zum Laden!"};

            [
                "Settings laden",
                [
                    [
                        "CHECKBOX",
                        ["Bist du sicher das du das darfst?", "Wenn du diese Aktion ohne triftigen Grund ausführst, wird das ernste Konsequenzen haben!"],
                        false,
                        true
                    ],
                    [
                        "LIST",
                        ["Settings", "Settings aus der Mission"],
                        [_return, _return apply {_x # 0}, 0, 4],
                        true
                    ]
                ],
                {
                    params ["_values", "_args"];
                    _values params ["_allowed", "_file"];

                    if (!_allowed) exitWith {systemChat "Abbruch"};
                    [_file # 1, ["mission", "server"] select isDedicated] call CBA_settings_fnc_import;

                    systemChat format ["Settings aus '%1' wurden eingeladen!", _file # 0];
                    ["TB_informAdminsAndZeus", ["%1 hat die Settings aus '%2' geladen!", profileName, _file # 0]] call CBA_fnc_globalEvent;
                },
                {},
                []
            ] call zen_dialog_fnc_create;
        }
    ] call FUNC(transfer);
}, "all"] call CBA_fnc_registerChatCommand;

if !(getPlayerUID player in (call TB_lvl2)) exitWith {};

["spectator", {
    //if (isNil "TB_spectator") then {TB_spectator = false};
    //TB_spectator = !TB_spectator;

    // https://ace3mod.com/wiki/framework/spectator-framework.html
    [allPlayers, []] call ace_spectator_fnc_updateUnits;
    [[side player], player call BIS_fnc_enemySides] call ace_spectator_fnc_updateSides;
    [[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
    [[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
    [2, player, -2] call ace_spectator_fnc_setCameraAttributes;
    [true, false, false] call ace_spectator_fnc_setSpectator;

    ["TB_informAdminsAndZeus", ["%1 hat den Spectator gestartet!", profileName]] call CBA_fnc_globalEvent;
    //systemChat format ["Spectator ist nun %1aktiviert!", ["de" , ""] select TB_spectator];
}, "all"] call CBA_fnc_registerChatCommand;

["dancetime", {
    private _prevStatus = player getVariable [QGVAR(danceTime), false];
    player setVariable [QGVAR(danceTime), !_prevStatus, true];

    if (!_prevStatus) then
    {
        [{
            systemChat "Du hast DanceTime noch an!";
            if !(player getVariable [QGVAR(danceTime), false]) then {[_this # 1] call CBA_fnc_removePerFrameHandler;};
        }, 5] call CBA_fnc_addPerFrameHandler;
    };

    systemChat format ["Du hast die DanceTime %1aktiviert!", ["de", ""] select !_prevStatus];
    ["TB_informAdminsAndZeus", ["%1 hat die DanceTime %2aktiviert!", profileName, ["de", ""] select !_prevStatus]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

if !(getPlayerUID player in (call TB_lvl3)) exitWith {};

["clearCache", {
    params ["_target"];
    [] remoteExec [QEFUNC(persistence,clearCache), [player, 2] select (_target == "server")];

   ["TB_informAdminsAndZeus", ["%1 hat den Cache gecleared (%2)!", profileName, ["Lokal", "Server"] select (_target == "server")]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;
