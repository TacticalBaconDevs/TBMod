
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
        class Bandaging {
            // Field dressing is normal average treatment
            // packing bandage is average treatment, higher reopen chance, longer reopening delay
            // elastic bandage is higher treatment, higher reopen chance, shorter reopen delay
            // quickclot is lower treatment, lower reopen chance, longer reopening delay
            class Bandage { // basic bandage
                effectiveness = 5;
                reopeningChance = 0;
                reopeningMinDelay = 0;
                reopeningMaxDelay = 0;
            };

            class FieldDressing {
                // How effect is the bandage for treating one wounds type injury
                effectiveness = 1;
                // What is the chance and delays (in seconds) of the treated default injury reopening
                reopeningChance = 0.1;
                reopeningMinDelay = 120;
                reopeningMaxDelay = 200;

                class Abrasion {
                    effectiveness = 3;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 1000;
                };
                class AbrasionMinor: Abrasion {
                    effectiveness = 3;
                };
                class AbrasionMedium: Abrasion {
                    effectiveness = 2.5;
                    reopeningChance = 0.7;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.9;
                };

                class Avulsions: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 1;
                };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.9;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.75;
                };

                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 1000;
                };
                class CrushWoundMinor: CrushWound {
                    effectiveness = 1;
                    reopeningChance = 0.2;
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 0.7;
                    reopeningChance = 0.3;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.6;
                    reopeningChance = 0.4;
                };

                class Cut: Abrasion {
                    effectiveness = 4;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 1000;
                };
                class CutMinor: Cut {
                    effectiveness = 4;
                    reopeningChance = 0.1;
                };
                class CutMedium: Cut {
                    effectiveness = 3;
                    reopeningChance = 0.3;
                };
                class CutLarge: Cut {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                };

                class Laceration: Abrasion {
                    effectiveness = 0.95;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 100;
                    reopeningMaxDelay = 800;
                };
                class LacerationMinor: Laceration {
                    effectiveness = 0.95;
                    reopeningChance = 0.3;
                };
                class LacerationMedium: Laceration {
                    effectiveness = 0.7;
                    reopeningChance = 0.5;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.5;
                    reopeningChance = 0.6;
                };

                class velocityWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 100;
                    reopeningMaxDelay = 500;
                };
                class velocityWoundMinor: velocityWound {
                    effectiveness = 2;
                };
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.5;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 1;
                };

                class punctureWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 850;
                };
                class punctureWoundMinor: punctureWound {
                    effectiveness = 2;
                };
                class punctureWoundMedium: punctureWound {
                    effectiveness = 1.3;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.9;
                };
            };

            class PackingBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 3;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 800;
                    reopeningMaxDelay = 1500;
                };
                class AbrasionMinor: Abrasion {
                    effectiveness = 3;
                };
                class AbrasionMedium: Abrasion {
                    effectiveness = 2.5;
                    reopeningChance = 0.9;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 1;
                };

                class Avulsions: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 1000;
                    reopeningMaxDelay = 1600;
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 1;
                };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.9;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.75;
                };

                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 600;
                    reopeningMaxDelay = 1000;
                };
                class CrushWoundMinor: CrushWound {
                    effectiveness = 1;
                    reopeningChance = 0.6;
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 0.7;
                    reopeningChance = 0.7;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.6;
                    reopeningChance = 0.8;
                };

                class Cut: Abrasion {
                    effectiveness = 4;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 700;
                    reopeningMaxDelay = 1000;
                };
                class CutMinor: Cut {
                    effectiveness = 4;
                    reopeningChance = 0.6;
                };
                class CutMedium: Cut {
                    effectiveness = 3;
                    reopeningChance = 0.7;
                };
                class CutLarge: Cut {
                    effectiveness = 1;
                    reopeningChance = 0.8;
                };

                class Laceration: Abrasion {
                    effectiveness = 0.95;
                    reopeningChance = 0.65;
                    reopeningMinDelay = 500;
                    reopeningMaxDelay = 2000;
                };
                class LacerationMinor: Laceration {
                    effectiveness = 0.95;
                    reopeningChance = 0.65;
                };
                class LacerationMedium: Laceration {
                    effectiveness = 0.7;
                    reopeningChance = 0.8;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.5;
                    reopeningChance = 0.9;
                };

                class velocityWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 1;
                    reopeningMinDelay = 800;
                    reopeningMaxDelay = 2000;
                };
                class velocityWoundMinor: velocityWound {
                    effectiveness = 2;
                };
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.5;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 1;
                };

                class punctureWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 1;
                    reopeningMinDelay = 1000;
                    reopeningMaxDelay = 3000;
                };
                class punctureWoundMinor: punctureWound {
                    effectiveness = 2;
                };
                class punctureWoundMedium: punctureWound {
                    effectiveness = 1.3;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.9;
                };
            };

            class ElasticBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 4;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 80;
                    reopeningMaxDelay = 150;
                };
                class AbrasionMinor: Abrasion {
                    effectiveness = 4;
                };
                class AbrasionMedium: Abrasion {
                    effectiveness = 3;
                    reopeningChance = 0.9;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 2.5;
                    reopeningChance = 1;
                };

                class Avulsions: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 100;
                    reopeningMaxDelay = 160;
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 2;
                };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 1.4;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 1;
                };

                class Contusion: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 100;
                };
                class CrushWoundMinor: CrushWound {
                    effectiveness = 2;
                    reopeningChance = 0.6;
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 1.7;
                    reopeningChance = 0.7;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 1.6;
                    reopeningChance = 0.8;
                };

                class Cut: Abrasion {
                    effectiveness = 5;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 70;
                    reopeningMaxDelay = 100;
                };
                class CutMinor: Cut {
                    effectiveness = 5;
                    reopeningChance = 0.6;
                };
                class CutMedium: Cut {
                    effectiveness = 3.5;
                    reopeningChance = 0.7;
                };
                class CutLarge: Cut {
                    effectiveness = 2;
                    reopeningChance = 0.8;
                };

                class Laceration: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.65;
                    reopeningMinDelay = 50;
                    reopeningMaxDelay = 200;
                };
                class LacerationMinor: Laceration {
                    effectiveness = 2;
                    reopeningChance = 0.65;
                };
                class LacerationMedium: Laceration {
                    effectiveness = 1.5;
                    reopeningChance = 0.8;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 1;
                    reopeningChance = 0.9;
                };

                class velocityWound: Abrasion {
                    effectiveness = 2.2;
                    reopeningChance = 1;
                    reopeningMinDelay = 80;
                    reopeningMaxDelay = 200;
                };
                class velocityWoundMinor: velocityWound {
                    effectiveness = 2.2;
                };
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.75;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 1.5;
                };

                class punctureWound: Abrasion {
                    effectiveness = 2.5;
                    reopeningChance = 1;
                    reopeningMinDelay = 100;
                    reopeningMaxDelay = 300;
                };
                class punctureWoundMinor: punctureWound {
                    effectiveness = 2.5;
                };
                class punctureWoundMedium: punctureWound {
                    effectiveness = 2;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 1.5;
                };
            };

            class QuikClot: fieldDressing {
                class Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 800;
                    reopeningMaxDelay = 1500;
                };
                class AbrasionMinor: Abrasion {
                    effectiveness = 2;
                };
                class AbrasionMedium: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.4;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.5;
                };

                class Avulsions: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 1000;
                    reopeningMaxDelay = 1600;
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 0.7;
                };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.65;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.5;
                };

                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {
                    effectiveness = 0.6;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 600;
                    reopeningMaxDelay = 1000;
                };
                class CrushWoundMinor: CrushWound {
                    effectiveness = 0.6;
                    reopeningChance = 0.3;
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 0.5;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.4;
                };

                class Cut: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 700;
                    reopeningMaxDelay = 1000;
                };
                class CutMinor: Cut {
                    effectiveness = 2;
                    reopeningChance = 0.3;
                };
                class CutMedium: Cut {
                    effectiveness = 1;
                };
                class CutLarge: Cut {
                    effectiveness = 0.6;
                };

                class Laceration: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 500;
                    reopeningMaxDelay = 2000;
                };
                class LacerationMinor: Laceration {
                    effectiveness = 0.7;
                    reopeningChance = 0.4;
                };
                class LacerationMedium: Laceration {
                    effectiveness = 0.7;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.5;
                };

                class velocityWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 800;
                    reopeningMaxDelay = 2000;
                };
                class velocityWoundMinor: velocityWound {
                    effectiveness = 1;
                };
                class velocityWoundMedium: velocityWound {
                    effectiveness = 0.75;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.5;
                };

                class punctureWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 1000;
                    reopeningMaxDelay = 3000;
                };
                class punctureWoundMinor: punctureWound {
                    effectiveness = 1;
                };
                class punctureWoundMedium: punctureWound {
                    effectiveness = 0.7;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.4;
                };
            };
        };

        // class Medication {};

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
