#include "macros.inc"
/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Willi "shukari" Graff
    
    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
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
                        class TB_mission_extremMedic
                        {
                            displayName = "extremes Sanisystem";
                            tooltip = "Arzt kann nur noch EHK verwenden usw. GENEMIGUNGSPFLICHTIG!";
                            property = "TB_main_mission_extremMedic";
                            control = "Checkbox";
                            expression = "if (!is3DEN) then {TB_extremSanisystem = _value; publicVariable 'TB_extremSanisystem'};";
                            defaultValue = "false";
                        };
                        class TB_mission_crashHelfer
                        {
                            displayName = "Crashhelfer";
                            tooltip = "Wenn jemand die Mission verlässt, wird alles über ihn gespeichert.";
                            property = "TB_mission_crashHelfer";
                            control = "Checkbox";
                            expression = "if (!is3DEN) then {TB_crashHelfer = _value; publicVariable 'TB_crashHelfer'};";
                            defaultValue = "true";
                        };
                        class TB_mission_doorBreach
                        {
                            displayName = "DoorBreach";
                            tooltip = "Schrotflinten SLUG Munition kann verschlossene Türen öffnen.";
                            property = "TB_mission_doorBreach";
                            control = "Checkbox";
                            expression = "if (!is3DEN) then {TB_doorBreach = _value; publicVariable 'TB_doorBreach'};";
                            defaultValue = "false";
                        };
                        class TB_mission_recoilSystem
                        {
                            displayName = "RecoilSystem Koeffizent";
                            tooltip = "Die Stärke des dynamischen Rückstoßes. -1 = AUS";
                            property = "TB_mission_recoilSystem";
                            control = "Edit";
                            expression = "if (!is3DEN) then {TB_recoilCoef = _value; publicVariable 'TB_recoilCoef'};";
                            defaultValue = "1";
                            validate = "number";
                            typeName = "NUMBER";
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
 
                        expression = "if (!is3DEN && _value) then {[_this] spawn TB_fnc_sitAI}";
 
                        defaultValue = "false";
 
                        condition = "objectControllable";
                    };
                    
                    class TBMod_main_animation
                    {
                        displayName = "Animation";
                        tooltip = "Setzt die KI hin, wenn kein verfügbarer Stuhl in der Nähe, wird einer erstellt.";
                        property = "TBMod_main_animation";
                        control = "TB_main_animationControl";
 
                        expression = "if (!is3DEN && _value != '') then {[_this, _value] spawn TB_fnc_animationAI}";
 
                        defaultValue = "";
 
                        condition = "objectControllable";
                    };
                    
                    class TBMod_main_keys
                    {
                        displayName = "Schlüssel für das Auto";
                        tooltip = "Gibt der KI mehere Schlüssel für Fahrzeuge, muss der Variablenname sein ([car1,car2])!";
                        property = "TBMod_main_keys";
                        control = "Edit";
                        typeName = "STRING";
 
                        expression = "if (!is3DEN && _value != '[]' && _value != '') then {[_this, _value] spawn TB_fnc_keysForAI}";
 
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
                    
                    // TODO
                    // class TBMod_main_kiDeckung
                    // {
                        // displayName = "UpDown Skript";
                        // tooltip = "KI UpDown Skript";
                        // property = "TBMod_Main_kiDeckung";
                        // control = "Checkbox";
 
                        // expression = "";
                        // //expression = "if (!is3DEN && _value) then {this addeventhandler ['FiredNear', {[_this select 0, ['UP', 'MIDDLE']] spawn TB_fnc_UpDown}]}";
 
                        // defaultValue = "false";
 
                        // unique = 0;
                        // condition = "objectControllable";
                    // };
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
                        class Acts_AidlPercMstpSlowWrflDnon_warmup01  
                        {  
                            text = Acts_AidlPercMstpSlowWrflDnon_warmup01;  
                            data = Acts_AidlPercMstpSlowWrflDnon_warmup01;  
                        };  
                        class Acts_AidlPercMstpSlowWrflDnon_warmup02  
                        {  
                            text = Acts_AidlPercMstpSlowWrflDnon_warmup02;  
                            data = Acts_AidlPercMstpSlowWrflDnon_warmup02;  
                        };  
                        class Acts_AidlPercMstpSlowWrflDnon_warmup03  
                        {  
                            text = Acts_AidlPercMstpSlowWrflDnon_warmup03;  
                            data = Acts_AidlPercMstpSlowWrflDnon_warmup03;  
                        };  
                        class Acts_AidlPercMstpSlowWrflDnon_warmup04  
                        {  
                            text = Acts_AidlPercMstpSlowWrflDnon_warmup04;  
                            data = Acts_AidlPercMstpSlowWrflDnon_warmup04;  
                        };  
                        class Acts_AidlPercMstpSlowWrflDnon_warmup05  
                        {  
                            text = Acts_AidlPercMstpSlowWrflDnon_warmup05;  
                            data = Acts_AidlPercMstpSlowWrflDnon_warmup05;  
                        };  
                        class Acts_AidlPercMstpSlowWrflDnon_warmup_loop  
                        {  
                            text = Acts_AidlPercMstpSlowWrflDnon_warmup_loop;  
                            data = Acts_AidlPercMstpSlowWrflDnon_warmup_loop;  
                        };  
                        class Acts_AidlPsitMstpSsurWnonDnon01  
                        {  
                            text = Acts_AidlPsitMstpSsurWnonDnon01;  
                            data = Acts_AidlPsitMstpSsurWnonDnon01;  
                        };  
                        class Acts_AidlPsitMstpSsurWnonDnon02  
                        {  
                            text = Acts_AidlPsitMstpSsurWnonDnon02;  
                            data = Acts_AidlPsitMstpSsurWnonDnon02;  
                        };  
                        class Acts_AidlPsitMstpSsurWnonDnon03  
                        {  
                            text = Acts_AidlPsitMstpSsurWnonDnon03;  
                            data = Acts_AidlPsitMstpSsurWnonDnon03;  
                        };  
                        class Acts_AidlPsitMstpSsurWnonDnon04  
                        {  
                            text = Acts_AidlPsitMstpSsurWnonDnon04;  
                            data = Acts_AidlPsitMstpSsurWnonDnon04;  
                        };  
                        class Acts_AidlPsitMstpSsurWnonDnon05  
                        {  
                            text = Acts_AidlPsitMstpSsurWnonDnon05;  
                            data = Acts_AidlPsitMstpSsurWnonDnon05;  
                        };  
                        class Acts_AidlPsitMstpSsurWnonDnon_loop  
                        {  
                            text = Acts_AidlPsitMstpSsurWnonDnon_loop;  
                            data = Acts_AidlPsitMstpSsurWnonDnon_loop;  
                        };  
                        class Acts_Briefing_SA_Loop  
                        {  
                            text = Acts_Briefing_SA_Loop;  
                            data = Acts_Briefing_SA_Loop;  
                        };  
                        class Acts_Briefing_SA_StartLoop  
                        {  
                            text = Acts_Briefing_SA_StartLoop;  
                            data = Acts_Briefing_SA_StartLoop;  
                        };  
                        class Acts_Briefing_SB_Loop  
                        {  
                            text = Acts_Briefing_SB_Loop;  
                            data = Acts_Briefing_SB_Loop;  
                        };  
                        class Acts_Briefing_SB_StartLoop  
                        {  
                            text = Acts_Briefing_SB_StartLoop;  
                            data = Acts_Briefing_SB_StartLoop;  
                        };  
                        class Acts_Briefing_SC_Loop  
                        {  
                            text = Acts_Briefing_SC_Loop;  
                            data = Acts_Briefing_SC_Loop;  
                        };  
                        class Acts_Briefing_SC_StartLoop  
                        {  
                            text = Acts_Briefing_SC_StartLoop;  
                            data = Acts_Briefing_SC_StartLoop;  
                        };  
                        class Acts_CivilHiding_1  
                        {  
                            text = Acts_CivilHiding_1;  
                            data = Acts_CivilHiding_1;  
                        };  
                        class Acts_CivilHiding_2  
                        {  
                            text = Acts_CivilHiding_2;  
                            data = Acts_CivilHiding_2;  
                        };  
                        class Acts_CivilIdle_1  
                        {  
                            text = Acts_CivilIdle_1;  
                            data = Acts_CivilIdle_1;  
                        };  
                        class Acts_CivilIdle_2  
                        {  
                            text = Acts_CivilIdle_2;  
                            data = Acts_CivilIdle_2;  
                        };  
                        class Acts_CivilInjuredArms_1  
                        {  
                            text = Acts_CivilInjuredArms_1;  
                            data = Acts_CivilInjuredArms_1;  
                        };  
                        class Acts_CivilInjuredChest_1  
                        {  
                            text = Acts_CivilInjuredChest_1;  
                            data = Acts_CivilInjuredChest_1;  
                        };  
                        class Acts_CivilInjuredGeneral_1  
                        {  
                            text = Acts_CivilInjuredGeneral_1;  
                            data = Acts_CivilInjuredGeneral_1;  
                        };  
                        class Acts_CivilInjuredHead_1  
                        {  
                            text = Acts_CivilInjuredHead_1;  
                            data = Acts_CivilInjuredHead_1;  
                        };  
                        class Acts_CivilInjuredLegs_1  
                        {  
                            text = Acts_CivilInjuredLegs_1;  
                            data = Acts_CivilInjuredLegs_1;  
                        };  
                        class Acts_CivilListening_1  
                        {  
                            text = Acts_CivilListening_1;  
                            data = Acts_CivilListening_1;  
                        };  
                        class Acts_CivilListening_2  
                        {  
                            text = Acts_CivilListening_2;  
                            data = Acts_CivilListening_2;  
                        };  
                        class Acts_CivilShocked_1  
                        {  
                            text = Acts_CivilShocked_1;  
                            data = Acts_CivilShocked_1;  
                        };  
                        class Acts_CivilShocked_2  
                        {  
                            text = Acts_CivilShocked_2;  
                            data = Acts_CivilShocked_2;  
                        };  
                        class Acts_CivilTalking_1  
                        {  
                            text = Acts_CivilTalking_1;  
                            data = Acts_CivilTalking_1;  
                        };  
                        class Acts_CivilTalking_2  
                        {  
                            text = Acts_CivilTalking_2;  
                            data = Acts_CivilTalking_2;  
                        };  
                        class Acts_CrouchingFiringLeftRifle04  
                        {  
                            text = Acts_CrouchingFiringLeftRifle04;  
                            data = Acts_CrouchingFiringLeftRifle04;  
                        };  
                        class Acts_EpicSplit_in  
                        {  
                            text = Acts_EpicSplit_in;  
                            data = Acts_EpicSplit_in;  
                        };  
                        class Acts_EpicSplit_out  
                        {  
                            text = Acts_EpicSplit_out;  
                            data = Acts_EpicSplit_out;  
                        };  
                        class Acts_Executioner_Standing  
                        {  
                            text = Acts_Executioner_Standing;  
                            data = Acts_Executioner_Standing;  
                        };  
                        class Acts_Executioner_StandingLoop  
                        {  
                            text = Acts_Executioner_StandingLoop;  
                            data = Acts_Executioner_StandingLoop;  
                        };  
                        class Acts_ExecutionVictim_Loop  
                        {  
                            text = Acts_ExecutionVictim_Loop;  
                            data = Acts_ExecutionVictim_Loop;  
                        };  
                        class Acts_GetAttention_Loop  
                        {  
                            text = Acts_GetAttention_Loop;  
                            data = Acts_GetAttention_Loop;  
                        };  
                        class Acts_gunner_MRAP_01_mocap  
                        {  
                            text = Acts_gunner_MRAP_01_mocap;  
                            data = Acts_gunner_MRAP_01_mocap;  
                        };  
                        class Acts_HeliCargo_loop  
                        {  
                            text = Acts_HeliCargo_loop;  
                            data = Acts_HeliCargo_loop;  
                        };  
                        class Acts_HeliCargoTalking_loop  
                        {  
                            text = Acts_HeliCargoTalking_loop;  
                            data = Acts_HeliCargoTalking_loop;  
                        };  
                        class Acts_InjuredAngryRifle01  
                        {  
                            text = Acts_InjuredAngryRifle01;  
                            data = Acts_InjuredAngryRifle01;  
                        };  
                        class Acts_InjuredCoughRifle02  
                        {  
                            text = Acts_InjuredCoughRifle02;  
                            data = Acts_InjuredCoughRifle02;  
                        };  
                        class Acts_InjuredLookingRifle01  
                        {  
                            text = Acts_InjuredLookingRifle01;  
                            data = Acts_InjuredLookingRifle01;  
                        };  
                        class Acts_InjuredLookingRifle02  
                        {  
                            text = Acts_InjuredLookingRifle02;  
                            data = Acts_InjuredLookingRifle02;  
                        };  
                        class Acts_InjuredLookingRifle03  
                        {  
                            text = Acts_InjuredLookingRifle03;  
                            data = Acts_InjuredLookingRifle03;  
                        };  
                        class Acts_InjuredLookingRifle04  
                        {  
                            text = Acts_InjuredLookingRifle04;  
                            data = Acts_InjuredLookingRifle04;  
                        };  
                        class Acts_InjuredLookingRifle05  
                        {  
                            text = Acts_InjuredLookingRifle05;  
                            data = Acts_InjuredLookingRifle05;  
                        };  
                        class Acts_InjuredLyingRifle01  
                        {  
                            text = Acts_InjuredLyingRifle01;  
                            data = Acts_InjuredLyingRifle01;  
                        };  
                        class Acts_InjuredLyingRifle02  
                        {  
                            text = Acts_InjuredLyingRifle02;  
                            data = Acts_InjuredLyingRifle02;  
                        };  
                        class Acts_InjuredLyingRifle02_180  
                        {  
                            text = Acts_InjuredLyingRifle02_180;  
                            data = Acts_InjuredLyingRifle02_180;  
                        };  
                        class Acts_InjuredSpeakingRifle01  
                        {  
                            text = Acts_InjuredSpeakingRifle01;  
                            data = Acts_InjuredSpeakingRifle01;  
                        };  
                        class Acts_JetsCrewaidF_idle  
                        {  
                            text = Acts_JetsCrewaidF_idle;  
                            data = Acts_JetsCrewaidF_idle;  
                        };  
                        class Acts_JetsCrewaidF_idle2  
                        {  
                            text = Acts_JetsCrewaidF_idle2;  
                            data = Acts_JetsCrewaidF_idle2;  
                        };  
                        class Acts_JetsCrewaidF_idle2_m  
                        {  
                            text = Acts_JetsCrewaidF_idle2_m;  
                            data = Acts_JetsCrewaidF_idle2_m;  
                        };  
                        class Acts_JetsCrewaidF_idle_m  
                        {  
                            text = Acts_JetsCrewaidF_idle_m;  
                            data = Acts_JetsCrewaidF_idle_m;  
                        };  
                        class Acts_JetsCrewaidFCrouch_loop  
                        {  
                            text = Acts_JetsCrewaidFCrouch_loop;  
                            data = Acts_JetsCrewaidFCrouch_loop;  
                        };  
                        class Acts_JetsCrewaidFCrouch_loop_m  
                        {  
                            text = Acts_JetsCrewaidFCrouch_loop_m;  
                            data = Acts_JetsCrewaidFCrouch_loop_m;  
                        };  
                        class Acts_JetsCrewaidFCrouchThumbup_loop  
                        {  
                            text = Acts_JetsCrewaidFCrouchThumbup_loop;  
                            data = Acts_JetsCrewaidFCrouchThumbup_loop;  
                        };  
                        class Acts_JetsCrewaidFCrouchThumbup_loop_m  
                        {  
                            text = Acts_JetsCrewaidFCrouchThumbup_loop_m;  
                            data = Acts_JetsCrewaidFCrouchThumbup_loop_m;  
                        };  
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
                        class Acts_JetsMarshallingClear_loop  
                        {  
                            text = Acts_JetsMarshallingClear_loop;  
                            data = Acts_JetsMarshallingClear_loop;  
                        };  
                        class Acts_JetsMarshallingEmergencyStop_loop  
                        {  
                            text = Acts_JetsMarshallingEmergencyStop_loop;  
                            data = Acts_JetsMarshallingEmergencyStop_loop;  
                        };  
                        class Acts_JetsMarshallingEnginesOff_loop  
                        {  
                            text = Acts_JetsMarshallingEnginesOff_loop;  
                            data = Acts_JetsMarshallingEnginesOff_loop;  
                        };  
                        class Acts_JetsMarshallingEnginesOn_loop  
                        {  
                            text = Acts_JetsMarshallingEnginesOn_loop;  
                            data = Acts_JetsMarshallingEnginesOn_loop;  
                        };  
                        class Acts_JetsMarshallingLeft_loop  
                        {  
                            text = Acts_JetsMarshallingLeft_loop;  
                            data = Acts_JetsMarshallingLeft_loop;  
                        };  
                        class Acts_JetsMarshallingRight_loop  
                        {  
                            text = Acts_JetsMarshallingRight_loop;  
                            data = Acts_JetsMarshallingRight_loop;  
                        };  
                        class Acts_JetsMarshallingSlow_loop  
                        {  
                            text = Acts_JetsMarshallingSlow_loop;  
                            data = Acts_JetsMarshallingSlow_loop;  
                        };  
                        class Acts_JetsMarshallingStop_loop  
                        {  
                            text = Acts_JetsMarshallingStop_loop;  
                            data = Acts_JetsMarshallingStop_loop;  
                        };  
                        class Acts_JetsMarshallingStraight_loop  
                        {  
                            text = Acts_JetsMarshallingStraight_loop;  
                            data = Acts_JetsMarshallingStraight_loop;  
                        };  
                        class Acts_JetsPilotWalking  
                        {  
                            text = Acts_JetsPilotWalking;  
                            data = Acts_JetsPilotWalking;  
                        };  
                        class Acts_JetsShooterIdle  
                        {  
                            text = Acts_JetsShooterIdle;  
                            data = Acts_JetsShooterIdle;  
                        };  
                        class Acts_JetsShooterIdle2  
                        {  
                            text = Acts_JetsShooterIdle2;  
                            data = Acts_JetsShooterIdle2;  
                        };  
                        class Acts_JetsShooterIdle2_m  
                        {  
                            text = Acts_JetsShooterIdle2_m;  
                            data = Acts_JetsShooterIdle2_m;  
                        };  
                        class Acts_JetsShooterIdle_m  
                        {  
                            text = Acts_JetsShooterIdle_m;  
                            data = Acts_JetsShooterIdle_m;  
                        };  
                        class Acts_JetsShooterIdle_stillpose  
                        {  
                            text = Acts_JetsShooterIdle_stillpose;  
                            data = Acts_JetsShooterIdle_stillpose;  
                        };  
                        class Acts_JetsShooterIdle_stillpose_m  
                        {  
                            text = Acts_JetsShooterIdle_stillpose_m;  
                            data = Acts_JetsShooterIdle_stillpose_m;  
                        };  
                        class Acts_JetsShooterIdleMoveaway_loop  
                        {  
                            text = Acts_JetsShooterIdleMoveaway_loop;  
                            data = Acts_JetsShooterIdleMoveaway_loop;  
                        };  
                        class Acts_JetsShooterIdleMoveaway_loop_m  
                        {  
                            text = Acts_JetsShooterIdleMoveaway_loop_m;  
                            data = Acts_JetsShooterIdleMoveaway_loop_m;  
                        };  
                        class Acts_JetsShooterMoveAway_stillpose  
                        {  
                            text = Acts_JetsShooterMoveAway_stillpose;  
                            data = Acts_JetsShooterMoveAway_stillpose;  
                        };  
                        class Acts_JetsShooterMoveAway_stillpose_m  
                        {  
                            text = Acts_JetsShooterMoveAway_stillpose_m;  
                            data = Acts_JetsShooterMoveAway_stillpose_m;  
                        };  
                        class Acts_JetsShooterNavigate_loop  
                        {  
                            text = Acts_JetsShooterNavigate_loop;  
                            data = Acts_JetsShooterNavigate_loop;  
                        };  
                        class Acts_JetsShooterNavigate_loop_m  
                        {  
                            text = Acts_JetsShooterNavigate_loop_m;  
                            data = Acts_JetsShooterNavigate_loop_m;  
                        };  
                        class Acts_JetsShooterNavigate_stop  
                        {  
                            text = Acts_JetsShooterNavigate_stop;  
                            data = Acts_JetsShooterNavigate_stop;  
                        };  
                        class Acts_JetsShooterNavigate_stop_m  
                        {  
                            text = Acts_JetsShooterNavigate_stop_m;  
                            data = Acts_JetsShooterNavigate_stop_m;  
                        };  
                        class Acts_JetsShooterShootingLaunch_loop  
                        {  
                            text = Acts_JetsShooterShootingLaunch_loop;  
                            data = Acts_JetsShooterShootingLaunch_loop;  
                        };  
                        class Acts_JetsShooterShootingLaunch_loop_m  
                        {  
                            text = Acts_JetsShooterShootingLaunch_loop_m;  
                            data = Acts_JetsShooterShootingLaunch_loop_m;  
                        };  
                        class Acts_JetsShooterShootingReady_loop  
                        {  
                            text = Acts_JetsShooterShootingReady_loop;  
                            data = Acts_JetsShooterShootingReady_loop;  
                        };  
                        class Acts_JetsShooterShootingReady_loop_m  
                        {  
                            text = Acts_JetsShooterShootingReady_loop_m;  
                            data = Acts_JetsShooterShootingReady_loop_m;  
                        };  
                        class Acts_Kore_IdleNoWeapon_loop  
                        {  
                            text = Acts_Kore_IdleNoWeapon_loop;  
                            data = Acts_Kore_IdleNoWeapon_loop;  
                        };  
                        class Acts_Kore_TalkingOverRadio_loop  
                        {  
                            text = Acts_Kore_TalkingOverRadio_loop;  
                            data = Acts_Kore_TalkingOverRadio_loop;  
                        };  
                        class Acts_listeningToRadio_Loop  
                        {  
                            text = Acts_listeningToRadio_Loop;  
                            data = Acts_listeningToRadio_Loop;  
                        };  
                        class Acts_LyingWounded_loop  
                        {  
                            text = Acts_LyingWounded_loop;  
                            data = Acts_LyingWounded_loop;  
                        };  
                        class Acts_MHCargo_JumpToWater_sittingloop  
                        {  
                            text = Acts_MHCargo_JumpToWater_sittingloop;  
                            data = Acts_MHCargo_JumpToWater_sittingloop;  
                        };  
                        class Acts_millerCamp_A  
                        {  
                            text = Acts_millerCamp_A;  
                            data = Acts_millerCamp_A;  
                        };  
                        class Acts_millerCamp_C  
                        {  
                            text = Acts_millerCamp_C;  
                            data = Acts_millerCamp_C;  
                        };  
                        class Acts_NavigatingChopper_Loop  
                        {  
                            text = Acts_NavigatingChopper_Loop;  
                            data = Acts_NavigatingChopper_Loop;  
                        };  
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
                        class Acts_PercMwlkSlowWrflDf2  
                        {  
                            text = Acts_PercMwlkSlowWrflDf2;  
                            data = Acts_PercMwlkSlowWrflDf2;  
                        };  
                        class Acts_PknlMstpSlowWrflDnon  
                        {  
                            text = Acts_PknlMstpSlowWrflDnon;  
                            data = Acts_PknlMstpSlowWrflDnon;  
                        };  
                        class Acts_PointingLeftUnarmed  
                        {  
                            text = Acts_PointingLeftUnarmed;  
                            data = Acts_PointingLeftUnarmed;  
                        };  
                        class Acts_ShieldFromSun_loop  
                        {  
                            text = Acts_ShieldFromSun_loop;  
                            data = Acts_ShieldFromSun_loop;  
                        };  
                        class Acts_ShowingTheRightWay_loop  
                        {  
                            text = Acts_ShowingTheRightWay_loop;  
                            data = Acts_ShowingTheRightWay_loop;  
                        };  
                        class Acts_SittingJumpingSaluting_loop  
                        {  
                            text = Acts_SittingJumpingSaluting_loop;  
                            data = Acts_SittingJumpingSaluting_loop;  
                        };  
                        class Acts_SittingJumpingSaluting_loop2  
                        {  
                            text = Acts_SittingJumpingSaluting_loop2;  
                            data = Acts_SittingJumpingSaluting_loop2;  
                        };  
                        class Acts_SittingJumpingSaluting_loop3  
                        {  
                            text = Acts_SittingJumpingSaluting_loop3;  
                            data = Acts_SittingJumpingSaluting_loop3;  
                        };  
                        class Acts_SittingWounded_in  
                        {  
                            text = Acts_SittingWounded_in;  
                            data = Acts_SittingWounded_in;  
                        };  
                        class Acts_SittingWounded_loop  
                        {  
                            text = Acts_SittingWounded_loop;  
                            data = Acts_SittingWounded_loop;  
                        };  
                        class Acts_StandingSpeakingUnarmed  
                        {  
                            text = Acts_StandingSpeakingUnarmed;  
                            data = Acts_StandingSpeakingUnarmed;  
                        };  
                        class Acts_starterPistol_loop  
                        {  
                            text = Acts_starterPistol_loop;  
                            data = Acts_starterPistol_loop;  
                        };  
                        class Acts_SupportTeam_Back_KneelLoop  
                        {  
                            text = Acts_SupportTeam_Back_KneelLoop;  
                            data = Acts_SupportTeam_Back_KneelLoop;  
                        };  
                        class Acts_SupportTeam_Front_KneelLoop  
                        {  
                            text = Acts_SupportTeam_Front_KneelLoop;  
                            data = Acts_SupportTeam_Front_KneelLoop;  
                        };  
                        class Acts_SupportTeam_Left_KneelLoop  
                        {  
                            text = Acts_SupportTeam_Left_KneelLoop;  
                            data = Acts_SupportTeam_Left_KneelLoop;  
                        };  
                        class Acts_SupportTeam_Right_KneelLoop  
                        {  
                            text = Acts_SupportTeam_Right_KneelLoop;  
                            data = Acts_SupportTeam_Right_KneelLoop;  
                        };  
                        class Acts_TacopsPoster  
                        {  
                            text = Acts_TacopsPoster;  
                            data = Acts_TacopsPoster;  
                        };  
                        class Acts_TerminalOpen  
                        {  
                            text = Acts_TerminalOpen;  
                            data = Acts_TerminalOpen;  
                        };  
                        class Acts_TreatingWounded01  
                        {  
                            text = Acts_TreatingWounded01;  
                            data = Acts_TreatingWounded01;  
                        };  
                        class Acts_TreatingWounded02  
                        {  
                            text = Acts_TreatingWounded02;  
                            data = Acts_TreatingWounded02;  
                        };  
                        class Acts_TreatingWounded03  
                        {  
                            text = Acts_TreatingWounded03;  
                            data = Acts_TreatingWounded03;  
                        };  
                        class Acts_TreatingWounded04  
                        {  
                            text = Acts_TreatingWounded04;  
                            data = Acts_TreatingWounded04;  
                        };  
                        class Acts_TreatingWounded05  
                        {  
                            text = Acts_TreatingWounded05;  
                            data = Acts_TreatingWounded05;  
                        };  
                        class Acts_TreatingWounded06  
                        {  
                            text = Acts_TreatingWounded06;  
                            data = Acts_TreatingWounded06;  
                        };  
                        class Acts_TreatingWounded_loop  
                        {  
                            text = Acts_TreatingWounded_loop;  
                            data = Acts_TreatingWounded_loop;  
                        };
                    };
                };
            };
        };
    };
};
