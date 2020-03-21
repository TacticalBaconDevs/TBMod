/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

class ace_medical_treatment_actions {
    class BasicBandage {
        treatmentTime = QFUNC(getBandageTime);
    };
    class FieldDressing: BasicBandage {};
    class PackingBandage: BasicBandage {};
    class ElasticBandage: BasicBandage {};
    class QuikClot: BasicBandage {};


    class ApplyTourniquet: BasicBandage {
        treatmentTime = 1;
    };
    class RemoveTourniquet: ApplyTourniquet {};

    class Morphine: BasicBandage {
        treatmentTime =  QFUNC(getMedicationTime);
    };
    class Adenosine: Morphine {};
    class Epinephrine: Morphine {};
    
    class BloodIV: BasicBandage {
        treatmentTime =  QFUNC(getIVTime);
        displayName = "Bluttransfusion (2800ml)";
    };
    class BloodIV_500: BloodIV {
        displayName = "Bluttransfusion (1400ml)";
    };
    class BloodIV_250: BloodIV {
        displayName = "Bluttransfusion (700ml)";
    };
    class PlasmaIV: BloodIV {
        treatmentTime =  QFUNC(getIVTime);
        displayName = "Plasmatransfusion (1400ml)";
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = "Plasmatransfusion (700ml)";
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = "Plasmatransfusion (350ml)";
    };
    class SalineIV: BloodIV {
        treatmentTime =  QFUNC(getIVTime);
        displayName = "Kochsalztransfusion (700ml)";
        requiredMedic = 0;
    };
    class SalineIV_500: SalineIV {
        displayName = "Kochsalztransfusion (350ml)";
        requiredMedic = 0;
    };
    class SalineIV_250: SalineIV {
        displayName = "Kochsalztransfusion (125ml)";
        requiredMedic = 0;
    };


    class Diagnose: BasicBandage {};

    class CheckPulse: Diagnose {};
    class CheckBloodPressure: Diagnose {};
    class CheckResponse: Diagnose {};

    class BodyBag: BasicBandage {
        treatmentTime =  10;
    };

    class CPR: BasicBandage {
        treatmentTime =  10; // wird vermutlich von adv_cpr überschrieben
    };

    class SurgicalKit: BasicBandage {
        treatmentTime =  QFUNC(getStitchTime);
    };
    class PersonalAidKit: BasicBandage {
        treatmentTime =  QFUNC(getHealTime);
    };
};

class ace_medical_treatment {
    class IV {
        volume = 1000; // volume is in millileters

        class BloodIV {
            volume = 2800; // 1000
        };
        class BloodIV_500: BloodIV {
            volume = 1400; // 500
        };
        class BloodIV_250: BloodIV {
            volume = 700; // 250
        };

        class PlasmaIV: BloodIV {
            volume = 1400;
        };
        class PlasmaIV_500: PlasmaIV {
            volume = 700;
        };
        class PlasmaIV_250: PlasmaIV {
            volume = 350;
        };

        class SalineIV: BloodIV {
            volume = 700;
        };
        class SalineIV_500: SalineIV {
            volume = 350;
        };
        class SalineIV_250: SalineIV {
            volume = 125;
        };
    };
};
