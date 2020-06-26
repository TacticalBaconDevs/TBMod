class CfgVehicles
{
    class Static;
    class TargetBase : Static
    {
        class EventHandlers;
    };

    class TargetP_Inf_F : TargetBase
    {
        class Attributes
        {
            class TB_ausbildung_popUpTargets_upOrDown
            {
                displayName = "Bereits oben?";
                tooltip = "Soll das Ziel bereits oben sein oder erst auf Aktivierung warten?";
                property = "TB_ausbildung_popUpTargets_upOrDown";
                control = "Checkbox";
                expression = "_this animate ['Terc', parseNumber !_value]";
                defaultValue = "true";
            };
        };

        class EventHandlers : EventHandlers
        {
            hitPart = "(_this select 0) spawn TB_fnc_popUpTargets";
        };
    };
};