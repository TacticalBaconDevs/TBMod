/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
class Cfg3DEN
{
    class Object
    {
        class AttributeCategories
        {
            class TBMod_Building_Placeables
            {
                displayName = "TB Building";
                collapsed = 1;

                class Attributes
                {
                    class TBMod_Building_PlaceablesCargo
                    {
                        displayName = "$STR_PLACE_BuildTruckLoad";
                        tooltip = "$STR_PLACE_BuildTruckLoad_Description";
                        property = "TBMod_Building_PlaceablesCargo";
                        control = "Edit";

                        expression = "_this setVariable ['%s', _value, true];";

                        defaultValue = "-1";

                        unique = 0;
                        validate = "number";
                        condition = "objectVehicle + objectHasInventoryCargo";
                        typeName = "NUMBER";
                    };

                    class TBMod_Building_Cranwagen
                    {
                        displayName = "Kranwagen";
                        tooltip = "Für größere Bauwerke brauchst du Kranwagen zur Unterstützung!";
                        property = "TBMod_Building_Cranwagen";
                        control = "Checkbox";

                        expression = "_this setVariable ['%s', _value, true];";

                        defaultValue = "false";

                        unique = 0;
                        condition = "objectVehicle + objectHasInventoryCargo";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};