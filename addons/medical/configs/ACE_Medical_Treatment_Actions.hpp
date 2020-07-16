/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Original: https://github.com/acemod/ACE3/blob/master/addons/medical_treatment/ACE_Medical_Treatment_Actions.hpp
*/
class ace_medical_treatment_actions {
    class BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,ace_medical_treatment_fnc_getBandageTime)] call FUNC(calcTreatmentTime));
    };

    class ApplyTourniquet: BasicBandage {
        treatmentTime = 1;
    };

    class Morphine: BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,5)] call FUNC(calcTreatmentTime));
    };

    class BloodIV: BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,12)] call FUNC(calcTreatmentTime));
        displayName = "Bluttransfusion (2800ml)";
    };
    class BloodIV_500: BloodIV {
        displayName = "Bluttransfusion (1400ml)";
    };
    class BloodIV_250: BloodIV {
        displayName = "Bluttransfusion (700ml)";
    };
    class PlasmaIV: BloodIV {
        displayName = "Plasmatransfusion (1400ml)";
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = "Plasmatransfusion (700ml)";
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = "Plasmatransfusion (350ml)";
    };
    class SalineIV: BloodIV {
        displayName = "Kochsalztransfusion (700ml)";
        requiredMedic = 0;
    };
    class SalineIV_500: SalineIV {
        displayName = "Kochsalztransfusion (350ml)";
    };
    class SalineIV_250: SalineIV {
        displayName = "Kochsalztransfusion (125ml)";
    };

    class Diagnose : BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,2.5)] call FUNC(calcTreatmentTime));
    };

    class BodyBag: BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,10)] call FUNC(calcTreatmentTime));
    };

    class CPR: BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,10)] call FUNC(calcTreatmentTime));
    };

    class SurgicalKit: BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,ace_medical_treatment_fnc_getStitchTime)] call FUNC(calcTreatmentTime));
    };

    class PersonalAidKit: BasicBandage {
        treatmentTime = QUOTE([ARR_2(_this,ace_medical_treatment_fnc_getHealTime)] call FUNC(calcTreatmentTime));
    };

    class BloodPack: SurgicalKit {
        displayName = "Blut abnehmen";
        displayNameProgress = "Blut wird abgenommen...";

        consumeItem = 0;
        items[] = {"ACE_surgicalKit", "ACE_personalAidKit"};

        medicRequired = 1;
        allowSelfTreatment = 0;
        allowedSelections[] = {"LeftArm", "RightArm"};
        condition = "true";

        treatmentTime = QUOTE([ARR_2(_this,60)] call FUNC(calcTreatmentTime));

        callbackProgress = "";
        callbackSuccess = QUOTE(params ['_medic', '_patient']; _patient setVariable ['ace_medical_bloodVolume', (_patient getVariable ['ace_medical_bloodVolume', 6]) - 1, true]; _medic addItem 'ACE_bloodIV_250');
    };
};
