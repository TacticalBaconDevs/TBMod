/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
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
_ausgabe

// looped anims
((configProperties [configfile >> "CfgMovesMaleSdr" >> "States"]) select {((configName _x) find "Acts_" != -1) && getNumber (_x >> "looped") == 1}) apply {configName _x};
// Ausgabe: ["Acts_CrouchingFiringLeftRifle04","Acts_PointingLeftUnarmed","Acts_StandingSpeakingUnarmed","Acts_InjuredLyingRifle01","Acts_InjuredLyingRifle02","Acts_InjuredLyingRifle02_180","Acts_InjuredLookingRifle01","Acts_InjuredLookingRifle02","Acts_InjuredLookingRifle03","Acts_InjuredLookingRifle04","Acts_InjuredLookingRifle05","Acts_TacopsPoster","Acts_InjuredAngryRifle01","Acts_InjuredSpeakingRifle01","Acts_InjuredCoughRifle02","Acts_MHCargo_JumpToWater_sittingloop","Acts_JetsCrewaidL_idle","Acts_JetsCrewaidL_idle_m","Acts_JetsCrewaidRCrouchThumbup_loop","Acts_JetsCrewaidRCrouchThumbup_loop_m","Acts_JetsCrewaidRCrouch_loop","Acts_JetsCrewaidRCrouch_loop_m","Acts_JetsCrewaidF_idle","Acts_JetsCrewaidF_idle_m","Acts_JetsCrewaidR_idle","Acts_JetsCrewaidR_idle_m","Acts_JetsShooterNavigate_stop","Acts_JetsShooterNavigate_stop_m","Acts_JetsCrewaidFCrouchThumbup_loop","Acts_JetsCrewaidFCrouchThumbup_loop_m","Acts_JetsCrewaidLCrouchThumbup_loop","Acts_JetsCrewaidLCrouchThumbup_loop_m","Acts_JetsShooterIdleMoveaway_loop","Acts_JetsShooterIdleMoveaway_loop_m","Acts_JetsCrewaidF_idle2","Acts_JetsCrewaidF_idle2_m","Acts_JetsShooterShootingLaunch_loop","Acts_JetsShooterShootingLaunch_loop_m","Acts_JetsCrewaidLCrouch_loop","Acts_JetsCrewaidLCrouch_loop_m","Acts_JetsShooterIdle","Acts_JetsShooterIdle_m","Acts_JetsShooterIdle_stillpose","Acts_JetsShooterIdle_stillpose_m","Acts_JetsShooterMoveAway_stillpose","Acts_JetsShooterMoveAway_stillpose_m","Acts_JetsShooterIdle2","Acts_JetsShooterIdle2_m","Acts_JetsShooterShootingReady_loop","Acts_JetsShooterShootingReady_loop_m","Acts_JetsCrewaidFCrouch_loop","Acts_JetsCrewaidFCrouch_loop_m","Acts_JetsShooterNavigate_loop","Acts_JetsShooterNavigate_loop_m","Acts_JetsMarshallingClear_loop","Acts_JetsMarshallingEmergencyStop_loop","Acts_JetsMarshallingEnginesOff_loop","Acts_JetsMarshallingEnginesOn_loop","Acts_JetsMarshallingLeft_loop","Acts_JetsMarshallingRight_loop","Acts_JetsMarshallingSlow_loop","Acts_JetsMarshallingStop_loop","Acts_JetsMarshallingStraight_loop","Acts_JetsPilotWalking","Acts_PercMwlkSlowWrflDf2","Acts_SittingJumpingSaluting_loop","Acts_SittingJumpingSaluting_loop2","Acts_SittingJumpingSaluting_loop3","Acts_NavigatingChopper_Loop","Acts_TreatingWounded_loop","Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06","Acts_LyingWounded_loop","Acts_ShowingTheRightWay_loop","Acts_ShieldFromSun_loop","Acts_listeningToRadio_Loop","Acts_PknlMstpSlowWrflDnon","Acts_passenger_boat_holdright","Acts_passenger_boat_holdleft","Acts_passenger_boat_rightrear","Acts_gunner_MRAP_01_mocap","Acts_passenger_flatground_leanright","Acts_SittingWounded_in","Acts_SittingWounded_loop","Acts_starterPistol_loop","Acts_HeliCargo_loop","Acts_HeliCargoTalking_loop","Acts_Kore_IdleNoWeapon_loop","Acts_Kore_TalkingOverRadio_loop","Acts_AidlPsitMstpSsurWnonDnon_loop","Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_AidlPercMstpSlowWrflDnon_warmup_loop","Acts_AidlPercMstpSlowWrflDnon_warmup01","Acts_AidlPercMstpSlowWrflDnon_warmup02","Acts_AidlPercMstpSlowWrflDnon_warmup03","Acts_AidlPercMstpSlowWrflDnon_warmup04","Acts_AidlPercMstpSlowWrflDnon_warmup05","Acts_CivilHiding_1","Acts_CivilHiding_2","Acts_CivilIdle_1","Acts_CivilIdle_2","Acts_CivilInjuredArms_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredLegs_1","Acts_CivilListening_1","Acts_CivilListening_2","Acts_CivilShocked_1","Acts_CivilShocked_2","Acts_CivilTalking_1","Acts_CivilTalking_2","Acts_EpicSplit_in","Acts_EpicSplit_out","Acts_TerminalOpen","Acts_GetAttention_Loop","Acts_SupportTeam_Front_KneelLoop","Acts_SupportTeam_Back_KneelLoop","Acts_SupportTeam_Right_KneelLoop","Acts_SupportTeam_Left_KneelLoop","Acts_millerCamp_A","Acts_millerCamp_C","Acts_Briefing_SA_StartLoop","Acts_Briefing_SA_Loop","Acts_Briefing_SB_StartLoop","Acts_Briefing_SB_Loop","Acts_Briefing_SC_StartLoop","Acts_Briefing_SC_Loop","Acts_ExecutionVictim_Loop","Acts_Executioner_Standing","Acts_Executioner_StandingLoop"]


// vergleiche configs
private _first = configfile >> "CfgGesturesMale" >> "States" >> "tb_radioSR";
private _second = configfile >> "CfgGesturesMale" >> "States" >> "tb_radioLR";
private _attribute = [];
diag_log format ["### Vergleich -> %1 | %2 ###", configName _first, configName _second];
{_attribute pushBackUnique (toLower (configName _x))} forEach (configProperties [_first, "true", true]);
{_attribute pushBackUnique (toLower (configName _x))} forEach (configProperties [_second, "true", true]);
{
    private _valueFirst = (_first >> _x) call BIS_fnc_getCfgData;
    private _valueSecond = (_second >> _x) call BIS_fnc_getCfgData;
    
    if !(_valueFirst isEqualTo _valueSecond) then
    {
        diag_log format ["%1 -> %2 | %3", _x, _valueFirst, _valueSecond];
        systemChat format ["%1 -> %2 | %3", _x, _valueFirst, _valueSecond];
    };
}
forEach _attribute;


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
