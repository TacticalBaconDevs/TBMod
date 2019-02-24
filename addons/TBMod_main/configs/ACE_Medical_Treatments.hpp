
class ACE_Medical_Actions {
    class Advanced {
        class FieldDressing {
            treatmentTime = "[8] call TB_fnc_calcTreatmentTime";
        };
        class Tourniquet: fieldDressing {
            treatmentTime = "[4] call TB_fnc_calcTreatmentTime";
        };
        class Morphine: fieldDressing {
            treatmentTime = "[3] call TB_fnc_calcTreatmentTime";
        };
        class BloodIV: fieldDressing {
            treatmentTime = "[7] call TB_fnc_calcTreatmentTime";
        };
        class SurgicalKit: fieldDressing {
            treatmentTime = "[count ((_this select 1) getVariable ['ACE_Medical_bandagedWounds', []]) * 5] call TB_fnc_calcTreatmentTime";
        };
        class PersonalAidKit: fieldDressing {
            treatmentTime = "[([_this select 1] call ace_medical_fnc_treatmentAdvanced_fullHealTreatmentTime) * 0.75] call TB_fnc_calcTreatmentTime";
        };
        class CheckPulse: fieldDressing {
            treatmentTime = "[2] call TB_fnc_calcTreatmentTime";
        };
        class RemoveTourniquet: Tourniquet {
            treatmentTime = "[2.5] call TB_fnc_calcTreatmentTime";
        };
        class CPR: fieldDressing {
            treatmentTime = "[15] call TB_fnc_calcTreatmentTime"; // wird vermutlich von adv_cpr überschrieben
        };
        class BodyBag: fieldDressing {
            treatmentTime = "[15] call TB_fnc_calcTreatmentTime";
        };
    };
};

class ACE_Medical_Advanced {
    class Treatment {
        class IV {
            volume = 1000; // volume is in millileters

            class BloodIV {
                volume = 1500; // 1000
            };
            class BloodIV_500: BloodIV {
                volume = 1000; // 500
            };
            class BloodIV_250: BloodIV {
                volume = 500; // 250
            };

            class PlasmaIV: BloodIV {
                volume = 1000;
            };
            class PlasmaIV_500: PlasmaIV {
                volume = 500;
            };
            class PlasmaIV_250: PlasmaIV {
                volume = 250;
            };

            class SalineIV: BloodIV {
                volume = 500;
            };
            class SalineIV_500: SalineIV {
                volume = 250;
            };
            class SalineIV_250: SalineIV {
                volume = 125;
            };
        };
    };
};
