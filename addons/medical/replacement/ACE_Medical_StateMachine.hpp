/*
    ORIGINAL: https://github.com/acemod/ACE3/blob/master/addons/medical_statemachine/Statemachine.hpp
    Änderungen am DeathAI State um den Wert von der KI individuell zu holen
*/

class ACE_Medical_StateMachine
{
    class Unconscious
    {
        class DeathAI
        {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {!(_this getVariable ['ace_medical_statemachine_AIUnconsciousness', ace_medical_statemachine_AIUnconsciousness])});
        };
    };

    class CardiacArrest
    {
        class DeathAI
        {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {!(_this getVariable ['ace_medical_statemachine_AIUnconsciousness', ace_medical_statemachine_AIUnconsciousness])});
        };
    };
};
