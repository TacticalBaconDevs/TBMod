#include "macros.inc"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/eden_Editor:_Configuring_Attributes
*/
class ctrlCombo;
class Cfg3DEN
{
    class Mission
    {
        class Scenario
        {
            class AttributeCategories
            {
                class TB_main_missionVars
                {
                    collapsed = 0;
                    displayName = "TB Missionwerte";

                    class Attributes
                    {
                        class TB_mission_inkognitoSystem
                        {
                            displayName = "InkognitoSystem";
                            tooltip = "Man kann zwei Loadouts haben, zivil und militär.";
                            property = "TB_mission_inkognitoSystem";
                            control = "Checkbox";
                            expression = "if (!is3DEN) then {TB_inkognitoSystem = _value; publicVariable 'TB_inkognitoSystem'};";
                            defaultValue = "false";
                        };
                    };
                };
            };
        };
    };

    class Object
    {
        class AttributeCategories
        {
            class Inventory
            {
                class Attributes
                {
                    class TB_main_disableCargoCleanup
                    {
                        displayName = "Inventar nicht löschen";
                        tooltip = "Normalerweise werden alle Inventare gelöscht, wenn diese Option an ist nicht!";
                        property = "TB_main_disableCargoCleanup";
                        control = "Checkbox";
                        expression = "if (!is3DEN && _value) then {_this setVariable ['TB_main_disableCargoCleanup', true, true]}";
                        condition = "objectVehicle + objectSimulated + objectHasInventoryCargo";
                        defaultValue = "false";
                    };
                };
            };

            class TBMod_main_ki_actions
            {
                displayName = "TB Aktionen";
                collapsed = 1;

                class Attributes
                {
                    class TBMod_main_sitzen
                    {
                        displayName = "Hinsetzen";
                        tooltip = "Setzt die KI hin, wenn kein verfügbarer Stuhl in der Nähe, wird einer erstellt.";
                        property = "TBMod_Main_sitzen";
                        control = "Checkbox";

                        expression =  QUOTE(if (!is3DEN && _value) then {[_this] spawn FUNC(sitAI)});

                        defaultValue = "false";

                        condition = "objectControllable";
                    };

                    class TBMod_main_animation
                    {
                        displayName = "Animation";
                        tooltip = "Setzt die KI hin, wenn kein verfügbarer Stuhl in der Nähe, wird einer erstellt.";
                        property = "TBMod_main_animation";
                        control = "TB_main_animationControl";

                        expression =  QUOTE(if (!is3DEN && _value != '') then {[_this, _value] spawn FUNC(animationAI)});

                        defaultValue = "";

                        condition = "objectControllable";
                    };

                    class TBMod_main_animationDisableOverride
                    {
                        displayName = "Animation abbrechbar";
                        tooltip = "Animationen werden abgebrochen, wenn jemand in der Nähe schießt oder verletzt wird.";
                        property = "TBMod_main_animationDisableOverride";
                        control = "Checkbox";

                        expression =  QUOTE(if (!is3DEN && !_value) then {_this setVariable ['animDisableOverride', true, true]});

                        defaultValue = "false";

                        condition = "objectControllable";
                    };

                    class TBMod_main_keys
                    {
                        displayName = "Schlüssel für das Auto";
                        tooltip = "Gibt der KI Schlüssel für mehrere Fahrzeuge, muss der Variablenname sein! ( Bsp.: [""car1"",""car2""]  )";
                        property = "TBMod_main_keys";
                        control = "Edit";
                        typeName = "STRING";

                        expression =  QUOTE(if (!is3DEN && _value != '[]' && _value != '') then {[_this, _value] spawn FUNC(keysForAI)});

                        defaultValue = "[]";

                        condition = "objectControllable";
                    };

                    class TBMod_main_enableschauspieler
                    {
                        displayName = "Schauspieler";
                        tooltip = "Wenn aktiviert, besitzt Spieler Schauspielerrechte.";
                        property = "TBMod_main_enableschauspieler";
                        control = "Checkbox";
                        expression = "if (!is3DEN && _value) then {_this setVariable ['TBMod_main_enableschauspieler', _value, true]}";
                        condition = "objectControllable";
                        defaultValue = "false";
                    };

                    class TBMod_main_kiDeckung
                    {
                        displayName = "UpDown Skript";
                        tooltip = "KI UpDown Skript";
                        property = "TBMod_Main_kiDeckung";
                        control = "Checkbox";

                        expression =  QUOTE(if (!is3DEN && _value) then {[_this] call EFUNC(main,upDown)});

                        defaultValue = "false";

                        unique = 0;
                        condition = "objectControllable";
                    };

                    class TBMod_main_defineAmmo
                    {
                        displayName = "DefineAmmo";
                        tooltip = "Definiere die Munition der Fahrzeuge (Beispiel: ['rhs_mag_762x51_M240_1200'] (ganzes Mag) oder [['rhs_mag_762x51_M240_1200', 200]] (Mag mit 200 Schuss))";
                        property = "TBMod_main_defineAmmo";
                        control = "Edit";

                        expression =  "private _compValue = call compile _value; if (!is3DEN && _value != '[]' && _value != '' && !((magazines _this) isEqualTo _compValue)) then {_this setVehicleAmmoDef 0; {_x params ['_ammo', ['_amount', 999999]]; _this addMagazine [_ammo, _amount]} forEach _compValue; reload _this}";

                        defaultValue = "magazines _this";

                        unique = 0;
                        condition = "objectVehicle + objectSimulated + objectHasInventoryCargo";
                    };
                };
            };
        };
    };

    class Attributes
    {
        class Default;
        class Title: Default
        {
            class Controls
            {
                class Title;
            };
        };

        class TB_main_animationControl : Title
        {
            attributeLoad = "[_this controlsGroupCtrl 100, _config] call Enh_fnc_attributeLoadCombo";
            attributeSave = "[_this controlsGroupCtrl 100, _config] call Enh_fnc_attributeSaveCombo";

            class Controls : Controls
            {
                class Title : Title {};
                class Value : ctrlCombo
                {
                    idc = 100;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    w = ATTRIBUTE_CONTENT_W * GRID_W;
                    h = SIZE_M * GRID_H;

                    class Items
                    {
                        class keineAnimation
                        {
                            text = "keine Animation";
                            data = "";
                            default = 1;
                        };
                        class verstecken
                        {
                            text = "verstecken";
                            data = "Acts_CivilHiding_1";
                        };
                        class rumstehen
                        {
                            text = "rumstehen";
                            data = "Acts_CivilIdle_1";
                        };
                        class zuhoeren
                        {
                            text = "zuhören";
                            data = "Acts_CivilListening_1";
                        };
                        class reden
                        {
                            text = "reden";
                            data = "Acts_CivilTalking_1";
                        };
                        class geschockt
                        {
                            text = "geschockt";
                            data = "Acts_CivilShocked_1";
                        };
                        class bodenSitzen
                        {
                            text = "Boden sitzen";
                            data = "ACE_HandcuffedFFV";
                        };
                        class verletztArm
                        {
                            text = "verletzt Arm";
                            data = "Acts_CivilInjuredArms_1";
                        };
                        class verletztBauch
                        {
                            text = "verletzt Bauch";
                            data = "Acts_CivilInjuredChest_1";
                        };
                        class verletztGenerell
                        {
                            text = "verletzt Generell";
                            data = "Acts_CivilInjuredGeneral_1";
                        };
                        class verletztKopf
                        {
                            text = "verletzt Kopf";
                            data = "Acts_CivilInjuredHead_1";
                        };
                        class verletztFuesse
                        {
                            text = "verletzt Füße";
                            data = "Acts_CivilInjuredLegs_1";
                        };
                        class automatischeAbHier
                        {
                            text = "== Generiert ==";
                            data = "";
                        };
                        class ArmedGuardRelaxed01
                        {
                            text = "Entspannte Wache 01";
                            data = "Acts_AidlPercMstpSlowWrflDnon_warmup01";
                        };
                        class ArmedGuardRelaxed02
                        {
                            text = "Entspannte Wache 02";
                            data = "Acts_AidlPercMstpSlowWrflDnon_warmup02";
                        };
                        class ArmedGuardRelaxed03
                        {
                            text = "Entspannte Wache 03";
                            data = "Acts_AidlPercMstpSlowWrflDnon_warmup03";
                        };
                        class ArmedGuardRelaxed04
                        {
                            text = "Entspannte Wache Waffe in die Luft";
                            data = "Acts_AidlPercMstpSlowWrflDnon_warmup04";
                        };
                        class ArmedGuardRelaxed0105
                        {
                            text = "Entspannte Wache Schuss Vortäuchen";
                            data = "Acts_AidlPercMstpSlowWrflDnon_warmup05";
                        };
                        class Eingefroren
                        {
                            text = "Eingefroren";
                            data = "Acts_AidlPercMstpSlowWrflDnon_warmup_loop";
                        };
                        class GefesseltBoden01
                        {
                            text = "Gefesselt Boden 01";
                            data = "Acts_AidlPsitMstpSsurWnonDnon01";
                        };
                        class GefesseltBoden02
                        {
                            text = "Gefesselt Boden 02";
                            data = "Acts_AidlPsitMstpSsurWnonDnon02";
                        };
                        class GefesseltBoden03
                        {
                            text = "Gefesselt Boden 03";
                            data = "Acts_AidlPsitMstpSsurWnonDnon03";
                        };
                        class GefesseltBoden04
                        {
                            text = "Gefesselt Boden 04";
                            data = "Acts_AidlPsitMstpSsurWnonDnon04";
                        };
                        class GefesseltBoden05
                        {
                            text = "Gefesselt Boden 05";
                            data = "Acts_AidlPsitMstpSsurWnonDnon05";
                        };
                        class GefesseltBodenLoop
                        {
                            text = "Gefesselt Boden Loop";
                            data = "Acts_AidlPsitMstpSsurWnonDnon_loop";
                        };
                        class WaffeAnschauen
                        {
                            text = "Waffe Anschauen";
                            data = "Acts_Briefing_SA_Loop";
                        };
                        class Wache01
                        {
                            text = "Wache 01";
                            data = "Acts_Briefing_SA_StartLoop";
                        };
                        class Wache02
                        {
                            text = "Wache 02";
                            data = "Acts_Briefing_SB_Loop";
                        };
                        class Wache03
                        {
                            text = "Wache 03";
                            data = "Acts_Briefing_SB_StartLoop";
                        };
                        class Wache04
                        {
                            text = "Wache 04";
                            data = "Acts_Briefing_SC_Loop";
                        };
                        class Wache05
                        {
                            text = "Wache 05";
                            data = "Acts_Briefing_SC_StartLoop";
                        };
                        class CivilHiding01
                        {
                            text = "Civil Hiding 01";
                            data = "Acts_CivilHiding_1";
                        };
                        class CivilHiding02
                        {
                            text = "Civil Hiding 02";
                            data = "Acts_CivilHiding_2";
                        };
                        class Rumstehen01
                        {
                            text = "Rumstehen 01";
                            data = "Acts_CivilIdle_1";
                        };
                        class Rumstehen02
                        {
                            text = "Rumstehen 01";
                            data = "Acts_CivilIdle_2";
                        };
                        class CivilInjuredArms
                        {
                            text = "Civil Arm verletzt";
                            data = "Acts_CivilInjuredArms_1";
                        };
                        class CivilInjuredChest
                        {
                            text = "Civil Bauch verletzt";
                            data = "Acts_CivilInjuredChest_1";
                        };
                        class CivilInjuredGeneral
                        {
                            text = "Civil verletzt";
                            data = "Acts_CivilInjuredGeneral_1";
                        };
                        class CivilInjuredHead
                        {
                            text = "Civil Kopf verletzt";
                            data = "Acts_CivilInjuredHead_1";
                        };
                        class CivilInjuredLegs
                        {
                            text = "Civil Bein verletzt";
                            data = "Acts_CivilInjuredLegs_1";
                        };
                        class CivilListening01
                        {
                            text = "Civil Zuhören 01";
                            data = "Acts_CivilListening_1";
                        };
                        class CivilListening02
                        {
                            text = "Civil Zuhören 02";
                            data = "Acts_CivilListening_2";
                        };
                        class DeprimiertAmBoden01
                        {
                            text = "Deprimiert am Boden 01";
                            data = "Acts_CivilShocked_1";
                        };
                        class DeprimiertAmBoden02
                        {
                            text = "Deprimiert am Boden 02";
                            data = "Acts_CivilShocked_2";
                        };
                        class CivilTalking01
                        {
                            text = "Civil Sprechen 01";
                            data = "Acts_CivilTalking_1";
                        };
                        class CivilTalking02
                        {
                            text = "Civil Sprechen 02";
                            data = "Acts_CivilTalking_2";
                        };
                        class CrouchingFiringLeftRifle04
                        {
                            text = "Um die Ecke schießen";
                            data = "Acts_CrouchingFiringLeftRifle04";
                        };
                        class Acts_EpicSplit_in                         // Funktioniert nicht im Animations Viewer
                        {
                            text = Acts_EpicSplit_in;
                            data = Acts_EpicSplit_in;
                        };
                        class Acts_EpicSplit_out                        // Funktioniert nicht im Animations Viewer
                        {
                            text = Acts_EpicSplit_out;
                            data = Acts_EpicSplit_out;
                        };
                        class ExecutionerStanding
                        {
                            text = "Executioner Pistole";
                            data = "Acts_Executioner_StandingLoop";
                        };
                        class ExecutionVictim
                        {
                            text = "Gefesselt auf Knien";
                            data = "Acts_ExecutionVictim_Loop";
                        };
                        class WacheEineHand
                        {
                            text = "Wache eine Hand an der Waffe";
                            data = "Acts_GetAttention_Loop";
                        };
                        class Acts_gunner_MRAP_01_mocap                 // Nicht gefunden im Animations Viewer
                        {
                            text = Acts_gunner_MRAP_01_mocap;
                            data = Acts_gunner_MRAP_01_mocap;
                        };
                        class KisteSitzend
                        {
                            text = "Kiste sitzend";
                            data = "Acts_HeliCargo_loop";
                        };
                        class KisteSitzendReden
                        {
                            text = "Kiste sitzend reden";
                            data = "Acts_HeliCargoTalking_loop";
                        };
                        class ArmedAngry
                        {
                            text = "Armed verletzt wütend";
                            data = "Acts_InjuredAngryRifle01";
                        };
                        class InjuredRifle01
                        {
                            text = "Armed verletzt 01";
                            data = "Acts_InjuredCoughRifle02";
                        };
                        class InjuredRifle02                             
                        {
                            text = "Armed verletzt 02";
                            data = "Acts_InjuredLookingRifle01";
                        };
                        class InjuredRifle03
                        {
                            text = "Armed verletzt 03";
                            data = "Acts_InjuredLookingRifle02";
                        };
                        class InjuredRifle04
                        {
                            text = "Armed verletzt 04";
                            data = "Acts_InjuredLookingRifle03";
                        };
                        class InjuredRifle05
                        {
                            text = "Armed verletzt 05";
                            data = "Acts_InjuredLookingRifle04";
                        };
                        class InjuredRifle06
                        {
                            text = "Armed verletzt 06";
                            data = "Acts_InjuredLookingRifle05";
                        };
                        class InjuredRifle07
                        {
                            text = "Armed verletzt 06";
                            data = "Acts_InjuredLyingRifle01";
                        };
                        class InjuredRifle08
                        {
                            text = "Armed verletzt 07";
                            data = "Acts_InjuredLyingRifle02";
                        };
                        class InjuredRifle180
                        {
                            text = "Armed verletzt 180 grad";
                            data = "Acts_InjuredLyingRifle02_180";
                        };
                        class InjuredRifleSpeaking
                        {
                            text = "Armed verletzt redend";
                            data = "Acts_InjuredSpeakingRifle01";
                        };
                        class CivilTuersteher01rechts
                        {
                            text = "Civil Türsteher 01 Rechts";
                            data = "Acts_JetsCrewaidF_idle";
                        };
                        class CivilTuersteher01links
                        {
                            text = "Civil Türsteher 01 links";
                            data = "Acts_JetsCrewaidF_idle_m";
                        };
                        class CivilTuersteher02rechts
                        {
                            text = "Civil Türsteher 02 Rechts";
                            data = "Acts_JetsCrewaidF_idle2";
                        };
                        class  CivilTuersteher02links
                        {
                            text = "Civil Türsteher 02 links";
                            data = "Acts_JetsCrewaidF_idle2_m";
                        };
                        class CivilAnschauenKniendRechts
                        {
                            text = "Civil anschauen kniend Rechts";
                            data = "Acts_JetsCrewaidFCrouch_loop";
                        };
                        class CivilAnschauenKniendLinks
                        {
                            text = "Civil anschauen kniend Links";
                            data = "Acts_JetsCrewaidFCrouch_loop_m";
                        };
                        class CivilKniendDaumenHochRechts
                        {
                            text = "Civil kniend Daumen hoch rechts";
                            data = "Acts_JetsCrewaidFCrouchThumbup_loop";
                        };
                        class CivilKniendDaumenHochLinks
                        {
                            text = "Civil kniend Daumen hoch links";
                            data = "Acts_JetsCrewaidFCrouchThumbup_loop_m";
                        };
                        /*
                        Gleiche Animationen nur leicht verändert

                        class Acts_JetsCrewaidL_idle
                        {
                            text = Acts_JetsCrewaidL_idle;
                            data = Acts_JetsCrewaidL_idle;
                        };
                        class Acts_JetsCrewaidL_idle_m
                        {
                            text = Acts_JetsCrewaidL_idle_m;
                            data = Acts_JetsCrewaidL_idle_m;
                        };
                        class Acts_JetsCrewaidLCrouch_loop
                        {
                            text = Acts_JetsCrewaidLCrouch_loop;
                            data = Acts_JetsCrewaidLCrouch_loop;
                        };
                        class Acts_JetsCrewaidLCrouch_loop_m
                        {
                            text = Acts_JetsCrewaidLCrouch_loop_m;
                            data = Acts_JetsCrewaidLCrouch_loop_m;
                        };
                        class Acts_JetsCrewaidLCrouchThumbup_loop
                        {
                            text = Acts_JetsCrewaidLCrouchThumbup_loop;
                            data = Acts_JetsCrewaidLCrouchThumbup_loop;
                        };
                        class Acts_JetsCrewaidLCrouchThumbup_loop_m
                        {
                            text = Acts_JetsCrewaidLCrouchThumbup_loop_m;
                            data = Acts_JetsCrewaidLCrouchThumbup_loop_m;
                        };
                        class Acts_JetsCrewaidR_idle
                        {
                            text = Acts_JetsCrewaidR_idle;
                            data = Acts_JetsCrewaidR_idle;
                        };
                        class Acts_JetsCrewaidR_idle_m
                        {
                            text = Acts_JetsCrewaidR_idle_m;
                            data = Acts_JetsCrewaidR_idle_m;
                        };
                        class Acts_JetsCrewaidRCrouch_loop
                        {
                            text = Acts_JetsCrewaidRCrouch_loop;
                            data = Acts_JetsCrewaidRCrouch_loop;
                        };
                        class Acts_JetsCrewaidRCrouch_loop_m
                        {
                            text = Acts_JetsCrewaidRCrouch_loop_m;
                            data = Acts_JetsCrewaidRCrouch_loop_m;
                        };
                        class Acts_JetsCrewaidRCrouchThumbup_loop
                        {
                            text = Acts_JetsCrewaidRCrouchThumbup_loop;
                            data = Acts_JetsCrewaidRCrouchThumbup_loop;
                        };
                        class Acts_JetsCrewaidRCrouchThumbup_loop_m
                        {
                            text = Acts_JetsCrewaidRCrouchThumbup_loop_m;
                            data = Acts_JetsCrewaidRCrouchThumbup_loop_m;
                        };
                        */
                        class HighFive                                      // Hier kommen die Party moves
                        {
                            text = "High Five";
                            data = "Acts_JetsMarshallingClear_loop";
                        };
                        class CrewStop
                        {
                            text = "Crew Jet Stop";
                            data = "Acts_JetsMarshallingEmergencyStop_loop";
                        };
                        class CrewJetEngineOff
                        {
                            text = "Crew Jet Engine Off";
                            data = "Acts_JetsMarshallingEnginesOff_loop";
                        };
                        class CrewJetEngineOn
                        {
                            text = "Crew Jet Engine On";
                            data = "Acts_JetsMarshallingEnginesOn_loop";
                        };
                        class CrewJetLeft
                        {
                            text = "Crew Jet turn left";
                            data = "Acts_JetsMarshallingLeft_loop";
                        };
                        class CrewJetRight
                        {
                            text = "Crew Jet turn right";
                            data = "Acts_JetsMarshallingRight_loop";
                        };
                        class CrewJetSlowDown
                        {
                            text = "Crew Jet slow down";
                            data = "Acts_JetsMarshallingSlow_loop";
                        };
                        class CrewJetStop
                        {
                            text = "Crew Jet Stop";
                            data = "Acts_JetsMarshallingStop_loop";
                        };
                        class CrewJetStraight
                        {
                            text = "Crew Jet Straight";
                            data = "Acts_JetsMarshallingStraight_loop";
                        };
                        class PilotWalking
                        {
                            text = "Pilot walking";
                            data = "Acts_JetsPilotWalking";
                        };
                        class BriefingHandsBack01
                        {
                            text = "Briefing hände am Rücken 01";
                            data = "Acts_JetsShooterIdle";
                        };
                        class BriefingHandsBackAslant01
                        {
                            text = "Briefing hände am Rücken schräg 01";
                            data = "Acts_JetsShooterIdle2";
                        };
                        class BriefingHandsBackAslant02
                        {
                            text = "Briefing hände am Rücken schräg 02";
                            data = "Acts_JetsShooterIdle2_m";
                        };
                        class BriefingHandsBack02
                        {
                            text = "Briefing hände am Rücken 02";
                            data = "Acts_JetsShooterIdle_m";
                        };
                        class CrewJetLaunch01
                        {
                            text = "Crew Jet launch 01";
                            data = "Acts_JetsShooterShootingLaunch_loop";
                        };
                        class CrewJetLaunch02
                        {
                            text = "Crew Jet launch 02";
                            data = "Acts_JetsShooterShootingLaunch_loop_m";
                        };
                        class CrewShootingReady01
                        {
                            text = "Crew Shooting Ready 01";
                            data = "Acts_JetsShooterShootingReady_loop";
                        };
                        class CrewShootingReady02
                        {
                            text = "Crew Shooting Ready 02";
                            data = "Acts_JetsShooterShootingReady_loop_m";
                        };
                        class BriefingWeaponOnFloor
                        {
                            text = "Briefing Waffe am Boden";
                            data = "Acts_Kore_IdleNoWeapon_loop";
                        };
                        class TalkingOverRadio
                        {
                            text = "Hand am Funkgerät (Brust)";
                            data = "Acts_Kore_TalkingOverRadio_loop";
                        };
                        class ListeningToRadio
                        {
                            text = "Hand am Ohr (Funk)";
                            data = "Acts_listeningToRadio_Loop";
                        };
                        class sleeping
                        {
                            text = "Schlafende Person";
                            data = "Acts_LyingWounded_loop";
                        };
                        class SittingAir
                        {
                            text = "Sitzt 10 meter in der Luft";
                            data = "Acts_MHCargo_JumpToWater_sittingloop";
                        };
                        class BriefingMiller01
                        {
                            text = "Briefing Miller 01";
                            data = "Acts_millerCamp_A";
                        };
                        class BriefingMiller02
                        {
                            text = "Briefing Miller 02";
                            data = "Acts_millerCamp_C";
                        };
                        class CrewNavigateChopper
                        {
                            text = "Crew Navigate Chopper";
                            data = "Acts_NavigatingChopper_Loop";
                        };
                        class TacticalTalking
                        {
                            text = "Reden auf Wand zeigend";
                            data = "Acts_PointingLeftUnarmed";
                        };
                        class SchieldFromSun
                        {
                            text = "Shield From Sun";
                            data = "Acts_ShieldFromSun_loop";
                        };
                        class EntspanntesLiegen
                        {
                            text = "Halbliegend mit Pistole";
                            data = "Acts_SittingWounded_loop";
                        };
                        // Nicht im Animations Viewer gefunden
                        class Acts_passenger_boat_holdleft              
                        {
                            text = Acts_passenger_boat_holdleft;
                            data = Acts_passenger_boat_holdleft;
                        };
                        class Acts_passenger_boat_holdright
                        {
                            text = Acts_passenger_boat_holdright;
                            data = Acts_passenger_boat_holdright;
                        };
                        class Acts_passenger_boat_rightrear
                        {
                            text = Acts_passenger_boat_rightrear;
                            data = Acts_passenger_boat_rightrear;
                        };
                        class Acts_passenger_flatground_leanright
                        {
                            text = Acts_passenger_flatground_leanright;
                            data = Acts_passenger_flatground_leanright;
                        };


                        class KniendWaffeAnschauen
                        {
                            text = "Kniend Waffe Anschauen";
                            data = "Acts_PknlMstpSlowWrflDnon";
                        };
                        class BriefingUnarmed
                        {
                            text = "Briefing an die Wand zeigend";
                            data = "Acts_PointingLeftUnarmed";
                        };
                        class ShowingTheRightWay
                        {
                            text = "Showing the right way";
                            data = "Acts_ShowingTheRightWay_loop";
                        };
                        class StandingSpeakingUnarmed
                        {
                            text = "Briefing lange Animation";
                            data = "Acts_StandingSpeakingUnarmed";
                        };
                        class WachePistol
                        {
                            text = "Wache mit Pistole in der Hand";
                            data = "Acts_starterPistol_loop";
                        };
                        class KniendWaffeImAnschlagBack
                        {
                            text = "Wache kniend Waffe im Anschlag (Back)";
                            data = "Acts_SupportTeam_Back_KneelLoop";
                        };
                        class KniendWaffeImAnschlagFront
                        {
                            text = "Wache kniend Waffe im Anschlag (Front)";
                            data = "Acts_SupportTeam_Front_KneelLoop";
                        };
                        class KniendWaffeImAnschlagLeft
                        {
                            text = "Wache kniend Waffe im Anschlag (Left)";
                            data = "Acts_SupportTeam_Left_KneelLoop";
                        };
                        class KniendWaffeImAnschlagRight
                        {
                            text = "Wache kniend Waffe im Anschlag (Right)";
                            data = "Acts_SupportTeam_Right_KneelLoop";
                        };
                        class TerminalOpen
                        {
                            text = "Kniend Terminal öffnen";
                            data = "Acts_TerminalOpen";
                        };
                        class TreatingHLW
                        {
                            text = "HLW durchfüren";
                            data = "Acts_TreatingWounded01";
                        };
                        class TreatingAutoinjector
                        {
                            text = "Behandeln Autoinjector";
                            data = "Acts_TreatingWounded02";
                        };
                        class TreatingBandage
                        {
                            text = "Behandeln Bandage";
                            data = "Acts_TreatingWounded03";
                        };
                        class TreatingPulver
                        {
                            text = "Behandeln Pulver";
                            data = "Acts_TreatingWounded04";
                        };
                        class TreatingSew
                        {
                            text = "Behandeln Nähen";
                            data = "Acts_TreatingWounded05";
                        };
                        class TreatingDeinfection
                        {
                            text = "Behandeln Desinfizieren";
                            data = "Acts_TreatingWounded06";
                        };
                    };
                };
            };
        };
    };
};
