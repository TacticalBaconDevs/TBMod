/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Original: https://github.com/acemod/ACE3/blob/master/addons/medical_treatment/ACE_Medical_Treatment.hpp
*/
class ace_medical_treatment {
    class IV {
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
            volume = 1400; // 1000
        };
        class PlasmaIV_500: PlasmaIV {
            volume = 700; // 500
        };
        class PlasmaIV_250: PlasmaIV {
            volume = 350; // 250
        };

        class SalineIV: BloodIV {
            volume = 700; // 1000
        };
        class SalineIV_500: SalineIV {
            volume = 350; // 500
        };
        class SalineIV_250: SalineIV {
            volume = 125; // 250
        };
    };
    class Medication
    {
        class Adenosine;
        class TB_med_thrombin : Adenosine
        {
            hrIncreaseLow[] = {};
            hrIncreaseNormal[] = {};
            hrIncreaseHigh[] = {};
            incompatibleMedication[] = {};
            maxDose = 1;
            painReduce = 0;
            timeInSystem = 900;
            timeTillMaxEffect = 5;
            viscosityChange = 100;
        };
    };
};
