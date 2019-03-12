
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
                    effectiveness = 1.25;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 660;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 600;
                    reopeningMaxDelay = 1500;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 0.75;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 1080;
                };

                class Avulsions: Abrasion {
                    effectiveness = 1.25;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 180;
                    reopeningMaxDelay = 1380;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {
                    effectiveness = 1;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 1080;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.75;
                    reopeningChance = 1;
                    reopeningMaxDelay = 360;
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
                    effectiveness = 1.25;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 1080;
                };
                class CrushWoundMinor: CrushWound {
                    reopeningChance = 0.3;
                    reopeningMinDelay = 180;
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 1;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 180;
                    reopeningMaxDelay = 1380;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.75;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 1500;
                };

                class Cut: Abrasion {
                    effectiveness = 1.25;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 180;
                    reopeningMaxDelay = 1080;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 1500;
                };
                class CutLarge: Cut {
                    effectiveness = 0.75;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 660;
                };

                class Laceration: Abrasion {
                    effectiveness = 1.25;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 180;
                    reopeningMaxDelay = 1080;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {
                    effectiveness = 1;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 1500;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.75;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 660;
                };

                class velocityWound: Abrasion {
                    effectiveness = 1.25;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 180;
                    reopeningMaxDelay = 1380;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 660;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.75;
                    reopeningChance = 1;
                    reopeningMaxDelay = 660;
                };

                class punctureWound: Abrasion {
                    effectiveness = 1.25;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 180;
                    reopeningMaxDelay = 1080;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    effectiveness = 1;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 1500;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.75;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 660;
                };
            };

            class PackingBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {
                    reopeningChance = 0.7;
                    reopeningMaxDelay = 1080;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 1.5;
                    reopeningChance = 0.5;
                    reopeningMaxDelay = 1560;
                };

                class Avulsions: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.5;
                    reopeningChance = 0.4;
                    reopeningMaxDelay = 1320;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 1.5;
                    reopeningChance = 0.2;
                    reopeningMinDelay =  420;
                    reopeningMaxDelay = 660;
                };

                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 1;
                    reopeningMinDelay = 240;
                    reopeningMaxDelay = 420;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 1.5;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 1560;
                };

                class Cut: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {
                    reopeningChance = 0.7;
                    reopeningMaxDelay = 1080;
                };
                class CutLarge: Cut {
                    effectiveness = 1.5;
                    reopeningChance = 0.5;
                    reopeningMaxDelay = 1560;
                };

                class Laceration: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {
                    reopeningChance = 0.7;
                    reopeningMaxDelay = 1080;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 1.5;
                    reopeningChance = 0.5;
                    reopeningMaxDelay = 1560;
                };

                class velocityWound: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {
                    reopeningChance = 0.4;
                    reopeningMaxDelay = 1320;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 1.5;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 420;
                    reopeningMaxDelay = 660;
                };

                class punctureWound: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 600;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    reopeningChance = 0.7;
                    reopeningMaxDelay = 1080;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 1.5;
                    reopeningChance = 0.5;
                    reopeningMaxDelay = 1560;
                };
            };

            class ElasticBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 300;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {
                    effectiveness = 1.75;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 120;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 120;
                };

                class Avulsions: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 240;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {
                    effectiveness = 1.75;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 300;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.25;
                    reopeningChance = 1;
                    reopeningMaxDelay = 180;
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
                    effectiveness = 2;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 180;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {
                    effectiveness = 1.75;
                    reopeningChance = 0.2;
                    reopeningMaxDelay = 240;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.5;
                    reopeningChance = 0.3;
                    reopeningMaxDelay = 300;
                };

                class Cut: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 300;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {
                    effectiveness = 1.75;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 120;
                };
                class CutLarge: Cut {
                    effectiveness = 0.5;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 120;
                };

                class Laceration: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 300;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {
                    effectiveness = 1.75;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 120;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.5;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 120;
                };

                class velocityWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 240;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.75;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 300;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.25;
                    reopeningChance = 1;
                    reopeningMaxDelay = 180;
                };

                class punctureWound: Abrasion {
                    effectiveness = 2;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 60;
                    reopeningMaxDelay = 300;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    effectiveness = 1.75;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 120;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.5;
                    reopeningChance = 0.7;
                    reopeningMinDelay = 120;
                };
            };

            class QuikClot: fieldDressing {
                class Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 660;
                    reopeningMaxDelay = 900;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 0.25;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 840;
                    reopeningMaxDelay = 1560;
                };

                class Avulsions: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 840;
                    reopeningMaxDelay = 1560;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.25;
                    reopeningChance = 0.7;
                    reopeningMaxDelay = 1860;
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.25;
                    reopeningChance = 1;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 960;
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
                    effectiveness = 0.5;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 660;
                    reopeningMaxDelay = 900;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.25;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };

                class Cut: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 660;
                    reopeningMaxDelay = 900;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };
                class CutLarge: Cut {
                    effectiveness = 0.25;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };

                class Laceration: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 660;
                    reopeningMaxDelay = 900;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.25;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };

                class velocityWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 840;
                    reopeningMaxDelay = 1560;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {
                    effectiveness = 0.25;
                    reopeningChance = 0.7;
                    reopeningMaxDelay = 1860;
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.25;
                    reopeningChance = 1;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 960;
                };

                class punctureWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 660;
                    reopeningMaxDelay = 900;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.25;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 780;
                    reopeningMaxDelay = 1260;
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
