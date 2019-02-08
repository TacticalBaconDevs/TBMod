/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/

systemChat "### ChatCommands initalisiert. Nutze #help für Hilfe.";
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus, #fps, #safe, #hideGroup, #setGroup, #kompass, #clearCache, #hideGUI";
}, "all"] call CBA_fnc_registerChatCommand;

["tasten", {
    systemChat "STRG + ENDE  -> [LVL2] GCAM";
    systemChat "SHIFT + ENDE -> [LVL2] TFAR vom Spieler lösen, folgt der ZeusCam";
    systemChat "ALT + ENDE   -> [LVL3] Zeus in der Mission erstellen";
}, "all"] call CBA_fnc_registerChatCommand;

["rechte", {
    if (getPlayerUID player in TB_lvl3) exitWith {systemChat "### Rechte Level -> LVL3 (Admin)"};
    if (getPlayerUID player in TB_lvl2) exitWith {systemChat "### Rechte Level -> LVL2 (Spezi)"};
    systemChat "### Rechte Level -> LVL1 (Normalo)"
}, "all"] call CBA_fnc_registerChatCommand;

["zeus", {
    systemChat format ["Aktive Zeus: %1", ((allCurators select {isPlayer (getAssignedCuratorUnit _x)}) apply {name (getAssignedCuratorUnit _x)}) joinString ", "];
}, "all"] call CBA_fnc_registerChatCommand;

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
    if (getPlayerUID player in (TB_lvl3 + TB_lvl2)) then
    {
        switch (_this select 0) do {
            case "1":
            {
                [true] remoteExec ["TB_fnc_safe"];
                systemChat "SafeStart wurde global aktiviert!";
            };
            case "0":
            {
                [false] remoteExec ["TB_fnc_safe"];
                systemChat "SafeStart wurde global deaktiviert!";
            };
            default
            {
                systemChat format ["SafeStart wurde global %1aktiviert!", ["de", ""] select (isNil "TB_safeInfo")];
                [isNil "TB_safeInfo"] remoteExec ["TB_fnc_safe"];
            };
        };

        ["TB_informAdminsAndZeus", ["%1 hat den SAFE Status geändert!", profileName]] call CBA_fnc_globalEvent;
    };
}, "all"] call CBA_fnc_registerChatCommand;

["hideGroup", {
    if (getPlayerUID player in (TB_lvl3 + TB_lvl2)) then
    {
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
    };
}, "all"] call CBA_fnc_registerChatCommand;

["setGroup", {
    if (getPlayerUID player in (TB_lvl3 + TB_lvl2)) then
    {
        params ["_grpName"];
        if (_grpName == "") exitWith {systemChat "Kein Name wurde angegeben!"};

        private _unit = cursorObject;
        if (!isPlayer _unit) then {_unit = objNull};
        if (isNull _unit) then {_unit = ACE_player};

        systemChat format ["Gruppe '%1', mit Leader %3, heißt nun '%2'!", groupId (group _unit), _grpName, name (leader _unit)];
        (group _unit) setGroupIdGlobal [_grpName];
    };
}, "all"] call CBA_fnc_registerChatCommand;

// Credits to: http://killzonekid.com/arma-scripting-tutorials-3d-compass/
["kompass", {
    params ["_range"];

    if (cameraView != "GUNNER") exitWith {systemChat "Der virtuelle Kompass, wird nur in Optiken zu gelassen."};
    if (_range == "") exitWith {systemChat "Es wurde kein Abstand angegeben."};
    TB_compass_range = _range;

    if (isNil "TB_compass_id" && !(_range in ["0", "-1", "off"])) then
    {
        TB_compass_id = addMissionEventHandler ["Draw3D", {
            if (cameraView != "GUNNER") exitWith {removeMissionEventHandler ["Draw3D", _thisEventHandler]; TB_compass_id = nil};

            private _modifier = 1;
            private _show = true;
            private _center = if (TB_compass_range != "surface") then {positionCameraToWorld [0, 0, parseNumber TB_compass_range]} else
            {
                private _ins = lineIntersectsSurfaces [
                    AGLToASL positionCameraToWorld [0,0,0],
                    AGLToASL positionCameraToWorld [0,0,1000],
                    ACE_player,
                    vehicle ACE_player
                ];
                if !(_ins isEqualTo []) then
                {
                    private _pos = ASLToAGL ((_ins select 0) select 0);
                    _modifier = linearConversion [0, 1000, _pos distance (positionCameraToWorld [0, 0, 0]), 0.5, 10, true];
                    _pos;
                }
                else
                {
                    _show = false;
                    positionCameraToWorld [0, 0, 25];
                };
            };

            {
                _x params ["_color", "_array"];

                {
                    _x params ["_letter", "_offset"];
                    drawIcon3D [
                        "",
                        _color,
                        _center vectorAdd _offset,
                        0,
                        0,
                        0,
                        _letter,
                        2,
                        0.06 * (parseNumber _show)
                        //"PuristaMedium"
                    ];
                }
                forEach _array;
            } forEach [
                    [[1,0,0,0.75],[["N",[0,2 * _modifier,0]],[".",[0,1 * _modifier,0]],[".",[0,0.5 * _modifier,0]]]],
                    [[0,1,0,0.5],[["S",[0,-2 * _modifier,0]],[".",[0,-1 * _modifier,0]],[".",[0,-0.5 * _modifier,0]]]],
                    [[0,0,1,0.5],[["E",[2 * _modifier,0,0]],[".",[1 * _modifier,0,0]],[".",[0.5 * _modifier,0,0]]]],
                    [[1,1,0,0.5],[["W",[-2 * _modifier,0,0]],[".",[-1 * _modifier,0,0]],[".",[-0.5 * _modifier,0,0]]]]
                ];
        }];
    }
    else
    {
        if (!isNil "TB_compass_id") then {removeMissionEventHandler ["Draw3D", TB_compass_id]; TB_compass_id = nil};
    };
}, "all"] call CBA_fnc_registerChatCommand;

["clearCache", {
    if (getPlayerUID player in TB_lvl3) then
    {
        params ["_target"];
        [] remoteExec ["TB_fnc_clearCache", [player, 2] select (_target == "server")];
    }
    else
    {
        systemChat "Nicht deine Gehaltsstufe!";
    };
}, "all"] call CBA_fnc_registerChatCommand;

["hideGUI", {
    ["sthud_settings_hudmode", [0 , 3] select (sthud_settings_hudmode == 0)] call CBA_settings_fnc_set;
    systemChat format ["HUD ist nun %1",["sichtbar" , "unsichtbar"] select (sthud_settings_hudmode == 0)];
}, "all"] call CBA_fnc_registerChatCommand;
