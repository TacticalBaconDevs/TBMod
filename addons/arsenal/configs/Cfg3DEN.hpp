#include "macros.inc"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class ctrlCombo;

class Cfg3DEN
{
    class Attributes
    {
        class Default;
        class Title: Default
        {
            class Controls
            {
                class Title;
            };
        };

        class TB_arsenal_rollenControl : Title
        {
            attributeLoad = QUOTE([_this, _value] call EFUNC(eden,attributeLoadCombo));
            attributeSave = QUOTE([_this] call EFUNC(eden,attributeSaveCombo));

            class Controls : Controls
            {
                class Title : Title {};
                class Value : ctrlCombo
                {
                    idc = 100;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    w = ATTRIBUTE_CONTENT_W * GRID_W;
                    h = SIZE_M * GRID_H;

                    class Items
                    {
                        class keineRolle
                        {
                            text = "keine Rolle";
                            data = "";
                            default = 1;
                        };
                        class sani
                        {
                            text = "Kampfsanitäter";
                            data = "sani";
                        };
                        class arzt
                        {
                            text = "Arzt";
                            data = "arzt";
                        };
                        class pilot
                        {
                            text = "Pilot";
                            data = "pilot";
                        };
                        class spreng
                        {
                            text = "Sprengmeister";
                            data = "spreng";
                        };
                        class aaat
                        {
                            text = "Anti-Fahrzeug";
                            data = "aaat";
                        };
                        class trag
                        {
                            text = "Munitionsträger";
                            data = "trag";
                        };
                        class pionier
                        {
                            text = "Pionier";
                            data = "pionier";
                        };
                    };
                };
            };
        };
    };

    class Object
    {
        class AttributeCategories
        {
            class TB_arsenal
            {
                displayName = "TB Arsenal";
                collapsed = 1;

                class Attributes
                {
                    class TB_rolle
                    {
                        displayName = "Rolleneingenschaften";
                        tooltip = "Wähle hier eine Rolle aus, wenn du ohne das Arsenalsystem trotzdem bestimmte Eigenschaften der Rollen benötigst.";
                        property = "TB_rolle";
                        control = "TB_arsenal_rollenControl";

                        expression = "_this setVariable ['%s', _value param [1, ''], true]";

                        defaultValue = "";

                        condition = "objectBrain";
                        typeName = "STRING";
                    };
                };
            };
        };
    };
};
