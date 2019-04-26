/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
class CfgVehicles
{
    // ###################### 3den Module ######################
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit; // Default edit box (i.e., text input field)
            class Combo; // Default combo box (i.e., drop-down menu)
            class Checkbox; // Default checkbox (returned value is Bool)
            class CheckboxNumber; // Default checkbox (returned value is Number)
            class ModuleDescription; // Module description
            class Units; // Selection of units on which the module is applied
        };
        class ModuleDescription
        {
            class AnyBrain;
        };
    };

    class TB_eden_base : Module_F
    {
        scope = 1;
        scopeCurator = 1;
        displayName = "Default TB modulename";
        category = "TB_categorie";
        function = "";
        functionPriority = 1;
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa";
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 1;
        canSetArea = 0;
        canSetAreaHeight = 0;
        canSetAreaShape = 0;

        class AttributeValues
        {
            isRectangle = 1;
            size3[] = {0, 0, -1};
        };
    };

    class TB_eden_frontverlauf : TB_eden_base
    {
        scope = 2;
        displayName = "Frontverlauf";
        function = "TB_fnc_moduleFrontverlauf";
        canSetArea = 1;
        canSetAreaHeight = 0;
        canSetAreaShape = 1;
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa";

        class AttributeValues
        {
            isRectangle = 1;
            size3[] = {500,500,-1};
        };

        class Attributes: AttributesBase
        {
            class modus: Combo
            {
                property = "TB_eden_frontverlauf_modus";
                displayName = "Modulmodus";
                tooltip = "Der Modus mit dem das Modul arbeitet.";
                typeName = "STRING";
                class values {
                    class MOSTSIDE {
                        name = "MeisteSeite";
                        value = "mostside";
                        default = 1;
                    };
                    class MOSTENEMY {
                        name = "MeisteFeind";
                        value = "mostenemy";
                    };
                    class MOSTENEMY_KNOWN {
                        name = "MeisteFeind (knownAbout Abhängig)";
                        value = "mostenemy_known";
                    };
                    class ENEMYFREE {
                        name = "Feindfrei";
                        value = "enemyfree";
                    };
                    class ENEMYFREE_KNOWN {
                        name = "Feindfrei (knownAbout Abhängig)";
                        value = "enemyfree_known";
                    };
                };
            };
            class gridSize: Edit
            {
                property = "TB_eden_frontverlauf_gridSize";
                displayName = "Gittergröße";
                tooltip = "Die Größe der quadratischen Gitters des Frontverlaufrasters. (Werte in m: 100-1000)";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class activateTime: Edit
            {
                property = "TB_eden_frontverlauf_activateTime";
                displayName = "Aktivierungszeit";
                tooltip = "Die Zeit die benötigt wird, bis das Gitter aktiviert wird, der Wert bildet den Median, Min und Max werden automatisch mit -+30% gebildet. (Werte in s)";
                typeName = "NUMBER";
                defaultValue = "60";
            };
            class unknownColor: Combo
            {
                property = "TB_eden_frontverlauf_unknownColor";
                displayName = "Unbekannten Gitterfarbe";
                tooltip = "Die Farbe die ein Gitter hat, wenn noch keine Infos da sind.";
                typeName = "STRING";
                class values {
                    class GREY {
                        name = "Grau";
                        value = "ColorGrey";
                        default = 1;
                    };
                    class EAST {
                        name = "Rot";
                        value = "colorOPFOR";
                    };
                    class WEST {
                        name = "Blau";
                        value = "colorBLUFOR";
                    };
                    class INDEPENDENT {
                        name = "Grün";
                        value = "colorIndependent";
                    };
                    class CIVILIAN {
                        name = "Violett";
                        value = "colorCivilian";
                    };
                };
            };
            class gridAlpha: Edit
            {
                property = "TB_eden_frontverlauf_gridAlpha";
                displayName = "Gitter Sichtbarkeit";
                tooltip = "Der Alphawert (Sichtbarkeit) der Gitter. Wenn nicht mehr unbekannt, wird 0.1 (10%) automatisch hinzugefügt!";
                typeName = "NUMBER";
                defaultValue = "0.7";
            };
            class playerSide: Combo
            {
                property = "TB_eden_frontverlauf_playerSide";
                displayName = "PlayerSide";
                tooltip = "Für alle Feindmodi benötigt.";
                typeName = "STRING";
                class values {
                    class BLUFOR {
                        name = "Blufor";
                        value = "blufor";
                        default = 1;
                    };
                    class Opfor {
                        name = "Opfor";
                        value = "opfor";
                    };
                    class INDEPENDENT {
                        name = "Independent";
                        value = "independent";
                    };
                };
            };
            class gridType: Combo
            {
                property = "TB_eden_frontverlauf_gridType";
                displayName = "Gittertyp";
                tooltip = "Der Gittertyp der auf der Karte angezeigt wird.";
                typeName = "STRING";
                class values {
                    class Solid {
                        name = "Solid";
                        value = "Solid";
                        default = 1;
                    };
                    class SolidFull {
                        name = "SolidFull";
                        value = "SolidFull";
                    };
                    class Horizontal {
                        name = "Horizontal";
                        value = "Horizontal";
                    };
                    class Vertical {
                        name = "Vertical";
                        value = "Vertical";
                    };
                    class Grid {
                        name = "Grid";
                        value = "Grid";
                    };
                    class FDiagonal {
                        name = "FDiagonal";
                        value = "FDiagonal";
                    };
                    class BDiagonal {
                        name = "BDiagonal";
                        value = "BDiagonal";
                    };
                    class DiagGrid {
                        name = "DiagGrid";
                        value = "DiagGrid";
                    };
                    class Cross {
                        name = "Cross";
                        value = "Cross";
                    };
                    class Border {
                        name = "Border";
                        value = "Border";
                    };
                    class SolidBorder {
                        name = "SolidBorder";
                        value = "SolidBorder";
                    };
                };
            };
        };
    };

    class TB_eden_atmoReinforcementLZ : TB_eden_base
    {
        scope = 2;
        displayName = "AtmoReinforcementLZ";
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa";

        class ModuleDescription : ModuleDescription
        {
            description = "Der Punkt, an dem das belandene Fahrzeug landet/hält und ablädt.";
            position = 1;
            duplicate = 1;
        };
    };
    class TB_eden_atmoLZ : TB_eden_atmoReinforcementLZ {}; // Backwards comp

    class TB_eden_atmoReinforcementEndpoint : TB_eden_base
    {
        scope = 2;
        displayName = "AtmoReinforcementEndPunkt";

        class ModuleDescription : ModuleDescription
        {
            description = "Der Punkt, an den die abgesessenen Truppen hingehen wollen.";
            position = 1;
        };
    };
    class TB_eden_endpoint : TB_eden_atmoReinforcementEndpoint {}; // Backwards comp

    class TB_eden_atmoReinforcementCore : TB_eden_base
    {
        scope = 2;
        displayName = "AtmoReinforcementCore";
        function = "TB_fnc_moduleAtmoCore";
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa";

        class ModuleDescription : ModuleDescription
        {
            description = "Der Punkt, an dem das Fahrzeug mit einem neuen Trupp aufgefüllt wird.";
            position = 1;
        };
    };
    class TB_eden_atmoCore : TB_eden_atmoReinforcementCore {}; // Backwards comp
};
