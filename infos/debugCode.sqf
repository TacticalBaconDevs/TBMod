/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// looped anims
((configProperties [configfile >> "CfgMovesMaleSdr" >> "States"]) select {((configName _x) find "Acts_" != -1) && getNumber (_x >> "looped") == 1}) apply {configName _x};
// Ausgabe: ["Acts_CrouchingFiringLeftRifle04","Acts_PointingLeftUnarmed","Acts_StandingSpeakingUnarmed","Acts_InjuredLyingRifle01","Acts_InjuredLyingRifle02","Acts_InjuredLyingRifle02_180","Acts_InjuredLookingRifle01","Acts_InjuredLookingRifle02","Acts_InjuredLookingRifle03","Acts_InjuredLookingRifle04","Acts_InjuredLookingRifle05","Acts_TacopsPoster","Acts_InjuredAngryRifle01","Acts_InjuredSpeakingRifle01","Acts_InjuredCoughRifle02","Acts_MHCargo_JumpToWater_sittingloop","Acts_JetsCrewaidL_idle","Acts_JetsCrewaidL_idle_m","Acts_JetsCrewaidRCrouchThumbup_loop","Acts_JetsCrewaidRCrouchThumbup_loop_m","Acts_JetsCrewaidRCrouch_loop","Acts_JetsCrewaidRCrouch_loop_m","Acts_JetsCrewaidF_idle","Acts_JetsCrewaidF_idle_m","Acts_JetsCrewaidR_idle","Acts_JetsCrewaidR_idle_m","Acts_JetsShooterNavigate_stop","Acts_JetsShooterNavigate_stop_m","Acts_JetsCrewaidFCrouchThumbup_loop","Acts_JetsCrewaidFCrouchThumbup_loop_m","Acts_JetsCrewaidLCrouchThumbup_loop","Acts_JetsCrewaidLCrouchThumbup_loop_m","Acts_JetsShooterIdleMoveaway_loop","Acts_JetsShooterIdleMoveaway_loop_m","Acts_JetsCrewaidF_idle2","Acts_JetsCrewaidF_idle2_m","Acts_JetsShooterShootingLaunch_loop","Acts_JetsShooterShootingLaunch_loop_m","Acts_JetsCrewaidLCrouch_loop","Acts_JetsCrewaidLCrouch_loop_m","Acts_JetsShooterIdle","Acts_JetsShooterIdle_m","Acts_JetsShooterIdle_stillpose","Acts_JetsShooterIdle_stillpose_m","Acts_JetsShooterMoveAway_stillpose","Acts_JetsShooterMoveAway_stillpose_m","Acts_JetsShooterIdle2","Acts_JetsShooterIdle2_m","Acts_JetsShooterShootingReady_loop","Acts_JetsShooterShootingReady_loop_m","Acts_JetsCrewaidFCrouch_loop","Acts_JetsCrewaidFCrouch_loop_m","Acts_JetsShooterNavigate_loop","Acts_JetsShooterNavigate_loop_m","Acts_JetsMarshallingClear_loop","Acts_JetsMarshallingEmergencyStop_loop","Acts_JetsMarshallingEnginesOff_loop","Acts_JetsMarshallingEnginesOn_loop","Acts_JetsMarshallingLeft_loop","Acts_JetsMarshallingRight_loop","Acts_JetsMarshallingSlow_loop","Acts_JetsMarshallingStop_loop","Acts_JetsMarshallingStraight_loop","Acts_JetsPilotWalking","Acts_PercMwlkSlowWrflDf2","Acts_SittingJumpingSaluting_loop","Acts_SittingJumpingSaluting_loop2","Acts_SittingJumpingSaluting_loop3","Acts_NavigatingChopper_Loop","Acts_TreatingWounded_loop","Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06","Acts_LyingWounded_loop","Acts_ShowingTheRightWay_loop","Acts_ShieldFromSun_loop","Acts_listeningToRadio_Loop","Acts_PknlMstpSlowWrflDnon","Acts_passenger_boat_holdright","Acts_passenger_boat_holdleft","Acts_passenger_boat_rightrear","Acts_gunner_MRAP_01_mocap","Acts_passenger_flatground_leanright","Acts_SittingWounded_in","Acts_SittingWounded_loop","Acts_starterPistol_loop","Acts_HeliCargo_loop","Acts_HeliCargoTalking_loop","Acts_Kore_IdleNoWeapon_loop","Acts_Kore_TalkingOverRadio_loop","Acts_AidlPsitMstpSsurWnonDnon_loop","Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_AidlPercMstpSlowWrflDnon_warmup_loop","Acts_AidlPercMstpSlowWrflDnon_warmup01","Acts_AidlPercMstpSlowWrflDnon_warmup02","Acts_AidlPercMstpSlowWrflDnon_warmup03","Acts_AidlPercMstpSlowWrflDnon_warmup04","Acts_AidlPercMstpSlowWrflDnon_warmup05","Acts_CivilHiding_1","Acts_CivilHiding_2","Acts_CivilIdle_1","Acts_CivilIdle_2","Acts_CivilInjuredArms_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredLegs_1","Acts_CivilListening_1","Acts_CivilListening_2","Acts_CivilShocked_1","Acts_CivilShocked_2","Acts_CivilTalking_1","Acts_CivilTalking_2","Acts_EpicSplit_in","Acts_EpicSplit_out","Acts_TerminalOpen","Acts_GetAttention_Loop","Acts_SupportTeam_Front_KneelLoop","Acts_SupportTeam_Back_KneelLoop","Acts_SupportTeam_Right_KneelLoop","Acts_SupportTeam_Left_KneelLoop","Acts_millerCamp_A","Acts_millerCamp_C","Acts_Briefing_SA_StartLoop","Acts_Briefing_SA_Loop","Acts_Briefing_SB_StartLoop","Acts_Briefing_SB_Loop","Acts_Briefing_SC_StartLoop","Acts_Briefing_SC_Loop","Acts_ExecutionVictim_Loop","Acts_Executioner_Standing","Acts_Executioner_StandingLoop"]


// looped anims fürs eden attribut
private _ausgabe = "";
private _array = ((configProperties [configfile >> "CfgMovesMaleSdr" >> "States"]) select {((configName _x) find "Acts_" != -1) && getNumber (_x >> "looped") == 1}) apply {configName _x};
_array sort true;
{_ausgabe = _ausgabe + "class "+ _x +"
{
    text = "+ _x +";
    data = "+ _x +";
};
";} forEach _array;
copyToClipboard _ausgabe;
_ausgabe


// vergleiche configs
TB_vergleich = {
    params ["_first", "_second", ["_depth", 1], ["_indentation", ""]];

    if (_depth <= 0) exitWith {};
    _depth = _depth - 1;

    private _indentation = _indentation + "    ";
    diag_log text format ["%3### Vergleich -> %1 | %2 ###", configName _first, configName _second, _indentation select [4]];

    private _attribute = [];
    {_attribute pushBackUnique (toLower (configName _x))} forEach (configProperties [_first, "true", true]);
    {_attribute pushBackUnique (toLower (configName _x))} forEach (configProperties [_second, "true", true]);
    {
        if (isClass (_first >> _x) && isClass (_second >> _x)) then
        {
            [_first >> _x, _second >> _x, _depth, _indentation] call TB_vergleich;
        }
        else
        {
            private _valueFirst = (_first >> _x) call BIS_fnc_getCfgData;
            private _valueSecond = (_second >> _x) call BIS_fnc_getCfgData;
            if !(_valueFirst isEqualTo _valueSecond) then {diag_log text format ["%4%1 -> %2 | %3", _x, _valueFirst, _valueSecond, _indentation select [4]]};
        };
    }
    forEach _attribute;
};
[configfile >> "CfgVehicles" >> "B_UGV_01_rcws_F", configfile >> "CfgVehicles" >> "TB_UGV_01_rcws_F", 2] call TB_vergleich;


// getValues for Vests
private _resultset = [];
{
    _resultset pushBack _x;
    private _value = (([[configfile >> "CfgWeapons" >> _x], ["passthrough", "armor", "maximumload"]] call BIS_fnc_configExtremes) select 1);
    _value = _value apply {if (_x < 1) then {parseNumber ((_x * 100) toFixed 0)} else {_x}};
    _resultset pushBack _value;
} forEach [
    "rhsusf_mbav_medic",
    "rhsusf_mbav_mg",
    "rhsusf_mbav_grenadier",
    "rhsusf_mbav_rifleman",
    "rhsusf_mbav_light",
    "rhsusf_mbav"
];
_resultset;


//get all weapons with name
_result = [];
{
    private _text = toLower (configName _x);

    if (_text find "bwa" != -1) then {
        _result pushBack (configName _x);
    };
}
forEach (("true" configClasses (configfile >> "CfgWeapons")) + ("true" configClasses (configfile >> "CfgMagazines")) + ("true" configClasses (configfile >> "CfgGlasses")) + ("true" configClasses (configfile >> "CfgVehicles")));
_result;


// spectator
[
    ["Spectator", {
        [allPlayers, allUnits - allPlayers] call ace_spectator_fnc_updateUnits;
        [[west], [east,civilian,independent]] call ace_spectator_fnc_updateSides;
        [[1,2,0], []] call ace_spectator_fnc_updateCameraModes;
        [[-2,-1,0], []] call ace_spectator_fnc_updateVisionModes;
        [true, false, false] call ace_spectator_fnc_setSpectator;
    }, nil, 0, false, true, ""]
] call CBA_fnc_addPlayerAction;


//Weapon Ammo Analysis extreme (json)
diag_log text "[";
{
    diag_log text "  {";
    diag_log text format ["    ""type"":""%1"",",_x];
    diag_log text "    ""weapons"":[";
    _weap = "((configName (_x)) isKindof ['"+_x+"', configFile >> 'cfgWeapons']) && (getText (_x >> 'displayName') != '')" configClasses (configFile >> "cfgWeapons");
    {
        if (count (getArray(_x >> "magazines"))!=0) then
        {
            diag_log text "      {";
            diag_log text format ["        ""weaponclass"":""%1"",", configName _x];
            diag_log text format ["        ""weaponname"":""%1"",", ((getText (_x >> 'displayName')) splitString """" joinString "")];
            diag_log text "        ""mags"": [";
            {
                _magclass = (configFile >> "CfgMagazines" >> _x);
                _ammoclass = (configFile >> "CfgAmmo" >> getText(_magclass >> "ammo"));
                diag_log text "          {";
                 //ammo = "B_338_NM_Ball";   "    ""weaponclass"":""%1"",",
                diag_log text format ["            ""magclass"":""%1"",", configName _magclass];
                diag_log text format ["            ""ammoname"":""%1"",", configName _ammoclass];
                {
                    diag_log text format ["          ""%1"":""%2"",", _x, (_ammoclass >> _x) call BIS_fnc_getCfgData];
                } forEach ["ACE_caliber","ACE_bulletMass","ACE_muzzleVelocities","indirectHit","indirectHitRange","hit","caliber"];
                diag_log text "            ""dummy"":""false""";
                diag_log text "          },";
            }forEach (getArray(_x >> "magazines"));
            diag_log text "          {""dummy"":""false""}";
            diag_log text "        ]";
            diag_log text "      },";
        };
    }
    forEach _weap;
    diag_log text "      {""dummy"":""false""}";
    diag_log text "    ]";
    diag_log text "    },";
} forEach ["Pistol","Rifle"];
diag_log text "  {""dummy"":""false""}";
diag_log text "]";


// Kisteninhalt erhalten
private _obj = cursorObject;
private _output = "PUBLIC_NAME("+ (str cursorObject) +");
";

{
_x params ["_className", "_cargo" ,"_macro"];
if !((_cargo select 0) isEqualTo []) then {
_output = _output + "
class "+ _className +"
{";
{_output = format ["%1
    %4(%2,%3);", _output, _x, (_cargo select 1) select _forEachIndex, _macro]} forEach (_cargo select 0);
_output = _output + "
};";
};
}
forEach [
        ["TransportItems", getItemCargo _obj, "MACRO_ADDITEM"],
        ["TransportMagazines", getMagazineCargo _obj, "MACRO_ADDMAGAZINE"],
        ["TransportWeapons", getWeaponCargo _obj, "MACRO_ADDWEAPON"],
        ["TransportBackpacks", getBackpackCargo _obj, "MACRO_ADDBACKPACK"]
    ];

_output


// Parents erhalten
_return = [];
{
    _return pushBack [_x, ([configFile >> "CfgAmmo" >> _x, true] call BIS_fnc_returnParents) param [1, ""]];
}
forEach [
    "ShellCore",
    "FlareCore"
];
_return


// Kisten Checken
private _naschschubConfigs = configProperties [configFile >> "CfgVehicles", "isClass _x && {(configName _x) select [0, 3] == 'TB_'}
        && {getNumber (_x >> 'scope') == 2} && {(getText (_x >> 'editorCategory')) isEqualTo 'EdCat_TB_MainCat_supply'}", false];
private _ausgabe = "";
{
    if (configName _x find "_WL_" == -1) then {
        private _obj = createVehicle [configName _x, [0,0,0], [], 0, "CAN_COLLIDE"];
        if ([_obj] call ace_dragging_fnc_getweight >= 600) then {_ausgabe = format ["%1%2 (%3),", _ausgabe, configName _x, [_obj] call ace_dragging_fnc_getweight]};
        deleteVehicle _obj;
    }
} forEach _naschschubConfigs;
systemChat format ["Zuschwere Kisten: %1", _ausgabe select [0, count _ausgabe - 1]];


// Backpack check
fnc_backpack = {
    params [["_backpack", ""]];
    if (_backpack == "") then {_backpack = backpack player};
    private _max = getNumber (configFile >> "cfgVehicles" >> _backpack >> "maximumload");
    private _mass = getNumber (configFile >> "cfgVehicles" >> _backpack >> "mass");

    [_backpack, _max, _mass, _max / _mass]
};
["rhsusf_assault_eagleaiii_coy"] call fnc_backpack;


// Strich BoundingBox
onEachFrame {
    (0 boundingBoxReal bob) params ["_minusPos", "_plusPos"];

    (bob modelToWorldVisual _minusPos) params ["_rechts", "_hinten", "_unten"];
    (bob modelToWorldVisual _plusPos) params ["_links", "_vorne", "_oben"];

    {
        drawLine3D [_x # 0, _x # 1, [1,0,1,1]];
    }
    forEach [
        // vorderes Viereck
        [[_links, _vorne, _oben], [_rechts, _vorne, _oben]],
        [[_rechts, _vorne, _oben], [_rechts, _vorne, _unten]],
        [[_rechts, _vorne, _unten], [_links, _vorne, _unten]],
        [[_links, _vorne, _unten], [_links, _vorne, _oben]],
        // hinteres Viereck
        [[_links, _hinten, _oben], [_rechts, _hinten, _oben]],
        [[_rechts, _hinten, _oben], [_rechts, _hinten, _unten]],
        [[_rechts, _hinten, _unten], [_links, _hinten, _unten]],
        [[_links, _hinten, _unten], [_links, _hinten, _oben]],
        // hinten und vorne verbinden
        [[_links, _vorne, _oben], [_links, _hinten, _oben]],
        [[_rechts, _vorne, _oben], [_rechts, _hinten, _oben]],
        [[_links, _vorne, _unten], [_links, _hinten, _unten]],
        [[_rechts, _vorne, _unten], [_rechts, _hinten, _unten]]
    ];
};


// Punkte BoundingBox
onEachFrame {
    (0 boundingBoxReal bob) params ["_minusPos", "_plusPos"];

    (bob modelToWorldVisual _minusPos) params ["_rechts", "_hinten", "_unten"];
    (bob modelToWorldVisual _plusPos) params ["_links", "_vorne", "_oben"];

    {
        drawIcon3D ["", [1,0,1,1], _x, 0, 0, 0, "X"];
    }
    forEach [
        [_links, _vorne, _oben],
        [_rechts, _vorne, _oben],
        [_links, _vorne, _unten],
        [_rechts, _vorne, _unten],
        [_links, _hinten, _oben],
        [_rechts, _hinten, _oben],
        [_links, _hinten, _unten],
        [_rechts, _hinten, _unten]
    ];
};


// Mittelachsen BoundingBox
onEachFrame {
    (0 boundingBoxReal bob) params ["_minusPos", "_plusPos"];

    (bob modelToWorldVisual _minusPos) params ["_rechts", "_hinten", "_unten"];
    (bob modelToWorldVisual _plusPos) params ["_links", "_vorne", "_oben"];

    private _mitteLR = _links - (abs (_links - _rechts) / 2);
    private _mitteVH = _vorne - (abs (_vorne - _hinten) / 2);
    private _mitteOU = _oben - (abs (_oben - _unten) / 2);

    {
        drawLine3D [_x # 0, _x # 1, [1,0,1,1]];
    }
    forEach [
        [[_mitteLR, _mitteVH, _oben], [_mitteLR, _mitteVH, _unten]],
        [[_rechts, _mitteVH, _mitteOU], [_links, _mitteVH, _mitteOU]]
    ];
};

