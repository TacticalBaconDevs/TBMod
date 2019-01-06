/*
    WARLORDS-SPECIFIC FUNCTION

    Author: Josef Zemánek

    Description: Init variables.

    Modified for: tacticalbacon.de
*/

BIS_WL_sidesPool = [
    EAST,
    WEST,
    RESISTANCE
];
BIS_WL_cfgVehs = configFile >> "CfgVehicles";
BIS_WL_cfgWpns = configFile >> "CfgWeapons";
BIS_WL_cfgMags = configFile >> "CfgMagazines";
BIS_WL_cfgWrld = configFile >> "CfgWorlds" >> worldName;
BIS_WL_cfgMods = configFile >> "CfgMods";
BIS_WL_cfgHints = configFile >> "CfgHints" >> "VehicleList";
BIS_WL_cfgIndepGrps = configFile >> "CfgGroups" >> "Indep";
BIS_WL_resetVoting = FALSE;
BIS_WL_AIVotingReset = FALSE;
BIS_WL_recalculateIncome = TRUE;
BIS_WL_purchaseMenuVisible = FALSE;
if (isNil "BIS_WL_selectionTimeout") then {BIS_WL_selectionTimeout = 60}; // _this getVariable "VotingTimeout"
BIS_WL_fundsPayoffTimeout = 60;
BIS_WL_startCP = _this getVariable "StartCP";
BIS_WL_spawnedRemovalTime = 600;
BIS_WL_scanCost = 350;
BIS_WL_scanDuration = 30;
if (isNil "BIS_WL_vehicleSpan") then {BIS_WL_vehicleSpan = 3600}; // _this getVariable "VehicleSpan"
if (isNil "BIS_WL_AICanVote") then {BIS_WL_AICanVote = 0}; // _this getVariable "AIVoting"
if (isNil "BIS_WL_arsenalEnabled") then {BIS_WL_arsenalEnabled = 0}; // _this getVariable "ArsenalEnabled"
if (isNil "BIS_WL_lastLoadoutEnabled") then {BIS_WL_lastLoadoutEnabled = 0};
if (isNil "BIS_WL_fundTransferEnabled") then {BIS_WL_fundTransferEnabled = 1};
BIS_WL_forcedProgress = _this getVariable "Progress";
if (isNil "BIS_WL_FTEnabled") then {BIS_WL_FTEnabled = 0}; // _this getVariable "FTEnabled"
if (isNil "BIS_WL_scanEnabled") then {BIS_WL_scanEnabled = 0}; // _this getVariable "ScanEnabled"
if (isNil "BIS_WLVotingResetEnabled") then {BIS_WLVotingResetEnabled = 0}; // _this getVariable "VotingResetEnabled"
if (isNil "BIS_WL_fatigueEnabled") then {BIS_WL_fatigueEnabled = 1}; // _this getVariable "FatigueEnabled"
BIS_WL_CPIncomeMult = _this getVariable "CPMultiplier";
BIS_WL_shoppingList = _this getVariable "AssetList";
if (BIS_WL_shoppingList == "") then {BIS_WL_shoppingList = "['A3DefaultAll']"};
BIS_WL_shoppingList = call compile BIS_WL_shoppingList;
BIS_WL_mapSize = getNumber (BIS_WL_cfgWrld >> "Grid" >> "offsetY");
if (isNil "BIS_WL_dropCost") then {BIS_WL_dropCost = 25};
if (isNil "BIS_WL_FTCost") then {BIS_WL_FTCost = 50};
if (isNil "BIS_WL_lastLoadoutCost") then {BIS_WL_lastLoadoutCost = 500}; // 50
if (isNil "BIS_WL_arsenalCost") then {BIS_WL_arsenalCost = 1000};
BIS_WL_newVoteCost = 500;
if (isNil "BIS_WL_transferCost") then {BIS_WL_transferCost = 0}; // 500
if (isNil "BIS_WL_votingResetCost") then {BIS_WL_votingResetCost = 500}; // 2000
BIS_WL_votingResetTimeout = 300;
BIS_WL_newlySelectedSector = objNull;
BIS_WL_markerIndex = 1;
BIS_WL_allWarlords = +(playableUnits + switchableUnits) select {(side group _x) in [WEST, EAST]};
addMissionEventHandler ["EntityRespawned", {BIS_WL_allWarlords = BIS_WL_allWarlords - [_this select 1]; if ((side group _x) in [WEST, EAST]) then {BIS_WL_allWarlords pushBackUnique (_this select 0)}}];
[] spawn {while {TRUE} do {{BIS_WL_allWarlords pushBackUnique _x} forEach ((playableUnits + switchableUnits) select {(side group _x) in [WEST, EAST]}); sleep 5}};
if (isServer) then {
    BIS_WL_factionsPool = [_this getVariable "FactionOPFOR", _this getVariable "FactionBLUFOR", _this getVariable "FactionIndep"];
    BIS_WL_unitsPool = [];
    BIS_WL_punishmentDuration = 60;
    BIS_WL_friendlyFirePunishPool = [];
    BIS_WL_mortarUnits = [
        "B_support_Mort_F",
        "B_support_AMort_F",
        "B_T_Support_Mort_F",
        "B_T_Support_AMort_F",
        "I_support_Mort_F",
        "I_support_AMort_F",
        "O_support_Mort_F",
        "O_support_AMort_F",
        "O_T_Support_Mort_F",
        "O_T_Support_AMort_F"
    ];
    {
        _faction = _this getVariable (["FactionOPFOR", "FactionBLUFOR", "FactionIndep"] select _forEachIndex);
        _factionUnits = [];
        _cfgGroups = configFile >> "CfgGroups";
        _groupTypes = "TRUE" configClasses (_cfgGroups >> ["East", "West", "Indep"] select _forEachIndex >> _faction);
        {
            _groupClasses = "TRUE" configClasses _x;
            {
                _unitClasses = "TRUE" configClasses _x;
                _includesVehicles = FALSE;
                _groupUnits = [];
                {
                    _unitClass = getText (_x >> "vehicle");
                    if (toLower getText (BIS_WL_cfgVehs >> _unitClass >> "simulation") == "soldier") then {
                        if (toLower getText (BIS_WL_cfgVehs >> _unitClass >> "vehicleClass") != "mendiver" && !(_unitClass in BIS_WL_mortarUnits)) then {
                            _groupUnits pushBackUnique _unitClass;
                        };
                    } else {
                        _includesVehicles = TRUE;
                    };
                } forEach _unitClasses;
                if !(_includesVehicles) then {{_factionUnits pushBackUnique _x} forEach _groupUnits};
            } forEach _groupClasses;
        } forEach _groupTypes;
        BIS_WL_unitsPool pushBack _factionUnits;
    } forEach BIS_WL_sidesPool;
};
if !(isDedicated) then {
    BIS_WL_dropPool = [];
    BIS_WL_markerIndex = 1;
    BIS_WL_hintArray = ["", "", "", "", "", "", "", "", "", "", ""];
    BIS_WL_hintPrio_voteReset = 0;
    BIS_WL_hintPrio_voteSector = 1;
    BIS_WL_hintPrio_services = 2;
    BIS_WL_hintPrio_basket = 3;
    BIS_WL_hintPrio_deployDefence = 4;
    BIS_WL_hintPrio_airDrop = 5;
    BIS_WL_hintPrio_fastTravel = 6;
    BIS_WL_hintPrio_sectorScan = 7;
    BIS_WL_hintPrio_noFunds = 8;
    BIS_WL_hintPrio_baseVulnerable = 9;
    BIS_WL_hintPrio_saved = 10;
    BIS_WL_currentSelection = "";
    BIS_WL_drawEH = -1;
    BIS_WL_lastLoadout = [];
    BIS_WL_loadoutApplied = FALSE;
    if (isNil "BIS_WL_matesAvailable") then {BIS_WL_matesAvailable = 0}; // 4
    BIS_WL_matesInBasket = 0;
    BIS_WL_vehsInBasket = 0;
    BIS_WL_servicesAvailable = [];
    BIS_WL_iconDrawArray = [];
    BIS_WL_iconDrawArrayMap = [];
    BIS_WL_baseFTDisabled = FALSE;
    BIS_WL_CDShown = FALSE;
    BIS_WL_airstrips = [];
    BIS_WL_revealArr = [];
    BIS_WL_markersAlpha = (_this getVariable "MarkersTransparency") * 0.25;
    BIS_WL_playersAlpha = (_this getVariable "PlayersTransparency") * 0.25;
    if (isNil "BIS_WL_voice") then {BIS_WL_voice = 1}; // _this getVariable "Voice"
    if (isNil "BIS_WL_music") then {BIS_WL_music = 0}; // _this getVariable "Music"
    BIS_WL_hoverPlayed = FALSE;
    BIS_WL_hoverAnimated = FALSE;
    BIS_WL_localized_m = localize "STR_A3_rscdisplayarcademap_meters";
    BIS_WL_localized_km = localize "STR_A3_WL_unit_km";
    BIS_WL_seizingBar_progress = [];
    BIS_WL_seizingBar_progress_prev = [];
    BIS_WL_seizingBar_progress_loop = scriptNull;
    BIS_WL_votingBar_progress = [];
    BIS_WL_votingBar_progress_prev = [];
    BIS_WL_votingBar_progress_loop = scriptNull;
    BIS_WL_recentlyPurchasedAssets = [];
    BIS_WL_sectorVotingReset_WEST = FALSE;
    BIS_WL_sectorVotingReset_EAST = FALSE;
    BIS_WL_sectorVotingResetName_WEST = "";
    BIS_WL_sectorVotingResetName_EAST = "";
    BIS_WL_travelling = FALSE;
    BIS_WL_factionAppropriateUniforms = "getNumber (_x >> 'scope') == 2" configClasses BIS_WL_cfgWpns;
    BIS_WL_factionAppropriateUniforms = (BIS_WL_factionAppropriateUniforms select {player isUniformAllowed configName _x}) apply {configName _x};
    BIS_WL_mortarBackpacks = [
        "B_Mortar_01_support_F",
        "B_Mortar_01_weapon_F",
        "B_Mortar_01_support_grn_F",
        "B_Mortar_01_Weapon_grn_F",
        "I_Mortar_01_support_F",
        "I_Mortar_01_weapon_F",
        "O_Mortar_01_support_F",
        "O_Mortar_01_weapon_F"
    ];
    {
        _class = _x;
        _stripArr = [];
        _runwayPos = getArray (_class >> "ilsPosition");
        {
            if (typeName _x == typeName "") then {_runwayPos set [_forEachIndex, parseNumber _x]};
        } forEach _runwayPos;
        if (count _runwayPos > 0) then {
            _incArr = getArray (_class >> "ilsDirection");
            if (count _incArr == 3) then {
                _runwayPos resize 2;
                _runwayPos pushBack 0;
                _stripArr pushBack _runwayPos;
                _incArr deleteAt 1;
                _incArr pushBack 0;
                _incArr = _incArr vectorMultiply 3500;
                _planeSpawnPos = _runwayPos vectorAdd _incArr;
                _stripArr pushBack _planeSpawnPos;
                _stripArr pushBack ([_planeSpawnPos, _runwayPos] call BIS_fnc_dirTo);
                BIS_WL_airstrips pushBack _stripArr;
            };
        };
    } forEach ([configFile >> "CfgWorlds" >> worldName] + ("TRUE" configClasses (BIS_WL_cfgWrld >> "SecondaryAirports")));
    BIS_WL_sectorColors = [
        [profileNamespace getVariable ["Map_OPFOR_R", 0], profileNamespace getVariable ["Map_OPFOR_G", 1], profileNamespace getVariable ["Map_OPFOR_B", 1], 0.8],
        [profileNamespace getVariable ["Map_BLUFOR_R", 0], profileNamespace getVariable ["Map_BLUFOR_G", 1], profileNamespace getVariable ["Map_BLUFOR_B", 1], 0.8],
        [profileNamespace getVariable ["Map_Independent_R", 0], profileNamespace getVariable ["Map_Independent_G", 1], profileNamespace getVariable ["Map_Independent_B", 1], 0.8]
    ];
    if (side group player == EAST) then {
        BIS_WL_sectorIcon = "\A3\ui_f\data\map\markers\nato\o_installation.paa";
        BIS_WL_sectorMarker = "o_installation";
        BIS_WL_baseIcon = "\A3\ui_f\data\map\markers\nato\o_hq.paa";
        BIS_WL_baseMarker = "o_hq";
    } else {
        BIS_WL_sectorIcon = "\A3\ui_f\data\map\markers\nato\b_installation.paa";
        BIS_WL_sectorMarker = "b_installation";
        BIS_WL_baseIcon = "\A3\ui_f\data\map\markers\nato\b_hq.paa";
        BIS_WL_baseMarker = "b_hq";
    };
    uiNamespace setVariable ["BIS_WL_purchaseMenuLastSelection", [0, 0]];
};
if (isNil "BIS_WL_sectorScanActiveSince_EAST") then {BIS_WL_sectorScanActiveSince_EAST = -1};
if (isNil "BIS_WL_sectorScanActiveSince_WEST") then {BIS_WL_sectorScanActiveSince_WEST = -1};
if (isNil "BIS_WL_currentSector_EAST") then {BIS_WL_currentSector_EAST = objNull};
if (isNil "BIS_WL_currentSector_WEST") then {BIS_WL_currentSector_WEST = objNull};
if (isNil "BIS_WL_conqueredSectors_EAST") then {BIS_WL_conqueredSectors_EAST = []};
if (isNil "BIS_WL_conqueredSectors_WEST") then {BIS_WL_conqueredSectors_WEST = []};
if (isNil "BIS_WL_leadingSector_EAST") then {BIS_WL_leadingSector_EAST = objNull};
if (isNil "BIS_WL_leadingSector_WEST") then {BIS_WL_leadingSector_WEST = objNull};
if (isNil "BIS_WL_selectionTime_EAST") then {BIS_WL_selectionTime_EAST = -1};
if (isNil "BIS_WL_selectionTime_WEST") then {BIS_WL_selectionTime_WEST = -1};