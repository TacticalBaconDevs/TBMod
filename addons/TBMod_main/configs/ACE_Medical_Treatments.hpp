
class ACE_Medical_Actions {
    class Advanced {
        class FieldDressing {
            displayName = CSTRING(Actions_FieldDressing);
            displayNameProgress = CSTRING(Bandaging);
            category = "bandage";
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 4; //8
            // Item required for the action. Leave empty for no item required.
            items[] = {"ACE_fieldDressing"};
            condition = "";
            patientStateCondition = 0;
            // Callbacks
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_bandage));
            callbackFailure = "";
            callbackProgress = "";
            itemConsumed = 1;
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
            animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            litter[] = {
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class PackingBandage: fieldDressing {
            displayName = CSTRING(Actions_PackingBandage);
            items[] = {"ACE_packingBandage"};
            litter[] = {
                {"All", "", {"ACE_MedicalLitter_packingBandage"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class ElasticBandage: fieldDressing {
            displayName = CSTRING(Actions_ElasticBandage);
            items[] = {"ACE_elasticBandage"};
        };
        class QuikClot: fieldDressing {
            displayName = CSTRING(Actions_QuikClot);
            items[] = {"ACE_quikclot"};
            litter[] = {
                {"All", "", {"ACE_MedicalLitter_QuickClot"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class Tourniquet: fieldDressing {
            displayName = CSTRING(Apply_Tourniquet);
            displayNameProgress = CSTRING(Applying_Tourniquet);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            items[] = {"ACE_tourniquet"};
            treatmentTime = 2; //4
            callbackSuccess = QUOTE(DFUNC(treatmentTourniquet));
            condition = QUOTE(!([ARR_2(_this select 1, _this select 2)] call FUNC(hasTourniquetAppliedTo)));
            litter[] = {};
        };
        class Morphine: fieldDressing {
            displayName = CSTRING(Inject_Morphine);
            displayNameProgress = CSTRING(Injecting_Morphine);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            category = "medication";
            items[] = {"ACE_morphine"};
            treatmentTime = 1.5; //3
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_medication));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
        };
        class Adenosine: Morphine {
            displayName = CSTRING(Inject_Adenosine);
            displayNameProgress = CSTRING(Injecting_Adenosine);
            items[] = {"ACE_adenosine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_adenosine"}} };
        };
        class Atropine: Morphine {
            displayName = CSTRING(Inject_Atropine);
            displayNameProgress = CSTRING(Injecting_Atropine);
            items[] = {"ACE_atropine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_atropine"}} };
        };
        class Epinephrine: Morphine {
            displayName = CSTRING(Inject_Epinephrine);
            displayNameProgress = CSTRING(Injecting_Epinephrine);
            items[] = {"ACE_epinephrine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
        };
        class BloodIV: fieldDressing {
            displayName = CSTRING(Actions_Blood4_1000);
            displayNameProgress = CSTRING(Transfusing_Blood);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 0;
            category = "advanced";
            items[] = {"ACE_bloodIV"};
            requiredMedic = 1;
            treatmentTime = 3.5; //7
            callbackSuccess = QUOTE(DFUNC(treatmentIV));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = {};
        };
        class BloodIV_500: BloodIV {
            displayName = CSTRING(Actions_Blood4_500);
            items[] = {"ACE_bloodIV_500"};
        };
        class BloodIV_250: BloodIV {
            displayName = CSTRING(Actions_Blood4_250);
            items[] = {"ACE_bloodIV_250"};
        };
        class PlasmaIV: BloodIV {
            displayName = CSTRING(Actions_Plasma4_1000);
            displayNameProgress = CSTRING(Transfusing_Plasma);
            items[] = {"ACE_plasmaIV"};
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
        class PlasmaIV_500: PlasmaIV {
            displayName = CSTRING(Actions_Plasma4_500);
            items[] = {"ACE_plasmaIV_500"};
        };
        class PlasmaIV_250: PlasmaIV {
            displayName = CSTRING(Actions_Plasma4_250);
            items[] = {"ACE_plasmaIV_250"};
        };
        class SalineIV: BloodIV {
            displayName = CSTRING(Actions_Saline4_1000);
            displayNameProgress = CSTRING(Transfusing_Saline);
            items[] = {"ACE_salineIV"};
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
        class SalineIV_500: SalineIV {
            displayName = CSTRING(Actions_Saline4_500);
            items[] = {"ACE_salineIV_500"};
        };
        class SalineIV_250: SalineIV {
            displayName = CSTRING(Actions_Saline4_250);
            items[] = {"ACE_salineIV_250"};
        };
        class SurgicalKit: fieldDressing {
            displayName = CSTRING(Use_SurgicalKit);
            displayNameProgress = CSTRING(Stitching);
            category = "advanced";
            items[] = {"ACE_surgicalKit"};
            treatmentLocations[] = {QGVAR(useLocation_SurgicalKit)};
            allowSelfTreatment = 0;
            requiredMedic = QGVAR(medicSetting_SurgicalKit);
            patientStateCondition = QGVAR(useCondition_SurgicalKit);
            treatmentTime = "(count ((_this select 1) getVariable ['ACE_Medical_bandagedWounds', []]) * 2.5)"; // * 5
            callbackSuccess = "";
            callbackProgress = QUOTE(DFUNC(treatmentAdvanced_surgicalKit_onProgress));
            itemConsumed = QGVAR(consumeItem_SurgicalKit);
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"} }};
        };
        class PersonalAidKit: fieldDressing {
            displayName = CSTRING(Use_Aid_Kit);
            displayNameProgress = CSTRING(TreatmentAction);
            category = "advanced";
            items[] = {"ACE_personalAidKit"};
            treatmentLocations[] = {QGVAR(useLocation_PAK)};
            allowSelfTreatment = 0;
            requiredMedic = QGVAR(medicSetting_PAK);
            patientStateCondition = QGVAR(useCondition_PAK);
            treatmentTime = QUOTE((_this select 1) call FUNC(treatmentAdvanced_fullHealTreatmentTime));
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_fullHeal));
            itemConsumed = QGVAR(consumeItem_PAK);
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
            animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class CheckPulse: fieldDressing {
            displayName = CSTRING(Actions_CheckPulse);
            displayNameProgress = CSTRING(Check_Pulse_Content);
            category = "examine";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 1; //2
            items[] = {};
            callbackSuccess = QUOTE(DFUNC(actionCheckPulse));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = ""; // TODO
            animationCallerProne = "";
            animationCallerSelfProne = "";
            itemConsumed = 0;
            litter[] = {};
        };
        class CheckBloodPressure: CheckPulse {
            displayName = CSTRING(Actions_CheckBloodPressure);
            callbackSuccess = QUOTE(DFUNC(actionCheckBloodPressure));
            displayNameProgress = CSTRING(Check_Bloodpressure_Content);
        };
        class CheckResponse: CheckPulse {
            displayName = CSTRING(Check_Response);
            callbackSuccess = QUOTE(DFUNC(actionCheckResponse));
            displayNameProgress = CSTRING(Check_Response_Content);
            allowSelfTreatment = 0;
        };
        class RemoveTourniquet: Tourniquet {
            displayName = CSTRING(Actions_RemoveTourniquet);
            items[] = {};
            treatmentTime = 1; // 2.5
            callbackSuccess = QUOTE(DFUNC(actionRemoveTourniquet));
            condition = QUOTE([ARR_2(_this select 1, _this select 2)] call FUNC(hasTourniquetAppliedTo));
            displayNameProgress = CSTRING(RemovingTourniquet);
            litter[] = {};
        };
        class CPR: fieldDressing {
            displayName = CSTRING(Actions_CPR);
            displayNameProgress = CSTRING(Actions_PerformingCPR);
            category = "advanced";
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"body"};
            allowSelfTreatment = 0;
            requiredMedic = 0;
            treatmentTime = 15;
            items[] = {};
            condition = "!([(_this select 1)] call ace_common_fnc_isAwake)";
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
            callbackFailure = "";
            callbackProgress = "!([((_this select 0) select 1)] call ace_common_fnc_isAwake)";
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationCaller = "AinvPknlMstpSlayWnonDnon_medic";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            animationCallerSelf = "";
            animationCallerSelfProne = "";
            itemConsumed = 0;
            litter[] = {};
        };
        class BodyBag: fieldDressing {
            displayName = CSTRING(PlaceInBodyBag);
            displayNameProgress = CSTRING(PlacingInBodyBag);
            category = "advanced";
            treatmentLocations[] = {"All"};
            allowSelfTreatment = 0;
            requiredMedic = 0;
            treatmentTime = 7.5; // 15
            items[] = {"ACE_bodyBag"};
            condition = "!alive (_this select 1);";
            callbackSuccess = QUOTE(DFUNC(actionPlaceInBodyBag));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationPatientUnconscious = "";
            itemConsumed = 1;
            litter[] = {};
        };
    };
};

class ACE_Medical_Advanced {
    class Treatment {
        class IV {
            // volume is in millileters
            volume = 1000;
            ratio[] = {};
            type = "Blood";
            class BloodIV {
                volume = 1500; //1000
                ratio[] = {"Plasma", 1};
            };
            class BloodIV_500: BloodIV {
                volume = 1000; //500
            };
            class BloodIV_250: BloodIV {
                volume = 500; //250
            };
            class PlasmaIV: BloodIV {
                volume = 1000;
                ratio[] = {"Blood", 1};
                type = "Plasma";
            };
            class PlasmaIV_500: PlasmaIV {
                volume = 500;
            };
            class PlasmaIV_250: PlasmaIV {
                volume = 250;
            };
            class SalineIV: BloodIV {
                volume = 1000;
                type = "Saline";
                ratio[] = {};
            };
            class SalineIV_500: SalineIV {
                volume = 500;
            };
            class SalineIV_250: SalineIV {
                volume = 250;
            };
        };
    };
};