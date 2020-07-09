class Cfg3DEN
{
    class Object
    {
        class AttributeCategories
        {
            class TB_ausbildung_eden
            {
                displayName = "TB Ausbildung";
                collapsed = 1;

                class Attributes
                {
                    class TB_ausbildung_popUpTargets
                    {
                        displayName = "Ziel Aktivierungsgruppe";
                        tooltip = "Bestimmt, in welcher Gruppe der aktivierten Ziele dieses Ziel ist (Werte Komma getrennt angeben)";
                        property = "TB_ausbildung_popUpTargets";
                        control = "Edit";
                        expression = "_this setVariable ['TB_ausbildung_popUpTargets', _value, true]";
                        defaultValue = "0";
                    };
                };
            };
        };
    };
};
