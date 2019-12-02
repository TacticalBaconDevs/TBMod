/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/eden_Editor:_Configuring_Attributes
*/
class Cfg3DEN
{
    class Object
    {
        class AttributeCategories
        {
            class ADDON
            {
                displayName = "TB Stealth";
                collapsed = 1;

                class Attributes
                {
                    class GVAR(activateStealth)
                    {
                        displayName = "Stealth aktivieren";
                        tooltip = "Fahrzeug ist ein Stealth Fahrzeug";
                        property = QGVAR(activateStealth);
                        control = "Checkbox";

                        expression = "_this setVariable ['%s', _value, true];";

                        defaultValue = "false";
                        
                        condition = "objectVehicle + objectHasInventoryCargo";
                    };
                };
            };
        };
    };
};
