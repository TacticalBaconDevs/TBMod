
class ACE_Medical_Actions {
    class Advanced {
        class FieldDressing {
            treatmentTime = 4; //8
        };
        class Tourniquet: fieldDressing {
            treatmentTime = 2; //4
        };
        class Morphine: fieldDressing {
            treatmentTime = 1.5; //3
        };
        class BloodIV: fieldDressing {
            treatmentTime = 3.5; //7
        };
        class SurgicalKit: fieldDressing {
            treatmentTime = "(count ((_this select 1) getVariable ['ACE_Medical_bandagedWounds', []]) * 2.5)"; // * 5
        };
        class CheckPulse: fieldDressing {
            treatmentTime = 1; //2
        };
        class RemoveTourniquet: Tourniquet {
            treatmentTime = 1; // 2.5
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