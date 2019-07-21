#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus, #fps, #safe, #hideGroup, #setGroup, #kompass, #clearCache, #hideGUI, #spectator(s)";
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

if !(getPlayerUID player in (call TB_lvl2)) exitWith {};

["fps", {
    if (player in (call BIS_fnc_listCuratorPlayers)) then
    {
        TB_fpsMonitor_zeus = !TB_fpsMonitor_zeus;
        systemChat format ["Zeus-FPS ist nun %1aktiviert!", ["de", ""] select TB_fpsMonitor_zeus];
    }
    else
    {
        systemChat "Dieser Befehl ist nur für ZeusSpieler relevant!";
    };
}, "all"] call CBA_fnc_registerChatCommand;

["safe", {
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
            systemChat format ["SafeStart wurde global %1aktiviert!", ["de", ""] select (isNil "TB_safeInfo")];
            [isNil "TB_safeInfo"] remoteExec [QFUNC(safe)];
        };
    };

    ["TB_informAdminsAndZeus", ["%1 hat den SAFE Status geändert!", profileName]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["hideGroup", {
    switch (_this select 0) do {
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
    params ["_grpName"];
    if (_grpName == "") exitWith {systemChat "Kein Name wurde angegeben!"};

    private _unit = cursorObject;
    if (!isPlayer _unit) then {_unit = objNull};
    if (isNull _unit) then {_unit = ACE_player};

    systemChat format ["Gruppe '%1', mit Leader %3, heißt nun '%2'!", groupId (group _unit), _grpName, name (leader _unit)];
    ["TB_informAdminsAndZeus", ["%1 hat die Gruppe '%2' von %4 auf '%3' umbenannt!", profileName, groupId (group _unit), _grpName, name (leader _unit)]] call CBA_fnc_globalEvent;

    (group _unit) setGroupIdGlobal [_grpName];
}, "all"] call CBA_fnc_registerChatCommand;

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

if !(getPlayerUID player in (call TB_lvl3)) exitWith {};

["clearCache", {
    params ["_target"];
    [] remoteExec [QEFUNC(persistence,clearCache), [player, 2] select (_target == "server")];

   ["TB_informAdminsAndZeus", ["%1 hat den Cache gecleared (%2)!", profileName, ["Lokal", "Server"] select (_target == "server")]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["fuckyou", {
    TB_temp_uniqueArray =
    {
        params ["_arrayOrItem", "_type"];
        private _return = [];

        if (_arrayOrItem isEqualType []) then
        {
            {
                if (_x isEqualType []) then
                {
                    _return append ([_x, _type] call TB_temp_uniqueArray);
                }
                else
                {
                    if (isNil "_type" || {_x isEqualType _type}) then {_return pushBackUnique _x};
                };
            }
            forEach _arrayOrItem;
        }
        else
        {
            if (isNil "_type" || {_x isEqualType _type}) then {_return pushBackUnique _x};
        };

        _return arrayIntersect _return;
    };
    private _blacklist = ["tfar"];

    {
        private _msg = "";
        private _loadout = (([getUnitLoadout _x, ""] call TB_temp_uniqueArray) select {_x != ""}) apply {toLower _x};
        private _arsenalType = _x getVariable ["TB_arsenalType", ""];
        private _rolle = _x getVariable ["TB_rolle", ""];
        private _allItems = call (switch (_arsenalType) do
        {
            case "USA": {EFUNC(arsenal,arsenalUSA)};
            case "RUSS": {EFUNC(arsenal,arsenalRUSS)};
            case "BW": {EFUNC(arsenal,arsenalBW)};
            case "VANILLA": {EFUNC(arsenal,arsenalVANILLA)};
            case "Themen": {EFUNC(arsenal,arsenalThemen)};
            default {{[]}};
        });

        // MEDIC STUFF
        _allItems append [
            "ACE_fieldDressing",

            "ACE_atropine",
            "ACE_adenosine",

            "ACE_salineIV",
            "ACE_salineIV_500",
            "ACE_salineIV_250",

            "ACE_tourniquet"
        ];

        if (_rolle in ["sani", "arzt", "pilot"]) then
        {
            _allItems append [
                "ACE_packingBandage",
                "ACE_elasticBandage",
                "ACE_quikclot",

                "ACE_epinephrine",
                "ACE_morphine",

                "ACE_plasmaIV",
                "ACE_plasmaIV_500",
                "ACE_plasmaIV_250",

                "ACE_bodyBag",
                "ACE_surgicalKit",
                "adv_aceCPR_AED"
            ];
        };

        if (_rolle == "arzt") then
        {
            _allItems append [
                "ACE_personalAidKit",

                "ACE_bloodIV",
                "ACE_bloodIV_500",
                "ACE_bloodIV_250"
            ];
        };

        [_allItems] call EFUNC(arsenal,whitelist);
        _allItems = (_allItems arrayIntersect _allItems) apply {toLower _x};

        if !(_arsenalType in ["", "CUSTOM"]) then
        {
            {
                private _checkItem = _x;
                if (({_checkItem find (toLower _x) != -1} count _blacklist) <= 0 && {!(_checkItem in _allItems)}) then {_msg = format ["%1, %3[%2]", _msg, _checkItem, [_checkItem] call FUNC(displayName)]};
            }
            forEach _loadout;

            if !(_msg isEqualTo "") then {["TB_informAdminsAndZeus", ["%1 (%3) hat unerlaubte Gegenstände dabei (%2)", name _x, _msg select [2], _rolle]] call CBA_fnc_globalEvent};
        };
    }
    forEach allPlayers;
}, "all"] call CBA_fnc_registerChatCommand;
