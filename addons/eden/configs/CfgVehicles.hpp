/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
class CfgVehicles
{
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
        function = QFUNC(moduleFrontverlauf);
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

    class TB_eden_radio : TB_eden_base
    {
        scope = 2;
        displayName = "Radio";
        function = QFUNC(moduleRadio);
        // icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa";

        class Attributes: AttributesBase
        {
            class sound: Edit
            {
                property = "TB_eden_radio_sound";
                displayName = "Radiosound";
                tooltip = "Entweder der ConfigName der aus CfgMusic oder der Pfad zur Musik, Komanndo 'utils 4' lokal ausführen für alle möglichen Sounds";
                typeName = "STRING";
                defaultValue = "'RadioAmbient1'";
            };
            class dauer: Edit
            {
                property = "TB_eden_radio_dauer";
                displayName = "Sounddauer";
                tooltip = "Nur notwenig, wenn Fehler oder Soundpfad";
                typeName = "NUMBER";
                defaultValue = "-1";
            };
            class radius: Edit
            {
                property = "TB_eden_radio_radius";
                displayName = "Auslöserradius";
                tooltip = "Ab wann soll das Radio auslösen, Radiosound selber ist Radius * 0.8";
                typeName = "NUMBER";
                defaultValue = "30";
            };
            class inside: Checkbox
            {
                property = "TB_eden_radio_inside";
                displayName = "In einem Gebäude";
                tooltip = "In einem Gebäude etwas gedämpfter";
                typeName = "BOOL";
                defaultValue = "false";
            };
            class volume: Edit
            {
                property = "TB_eden_radio_volume";
                displayName = "Lautstärke";
                tooltip = "Lautstärke von 0-5";
                typeName = "NUMBER";
                defaultValue = "2";
            };
        };
    };


    // ######################## ATMO Module
    class TB_eden_atmoBase : TB_eden_base
    {
        category = "TB_categorie_eden_atmo";
    };

    class TB_eden_atmoReinforcementLZ : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoReinforcementLZ";
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa";
    };

    class TB_eden_atmoReinforcementEndpoint : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoReinforcementEndPunkt";
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\move_ca.paa";
    };

    class TB_eden_atmoReinforcementCore : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoReinforcementCore";
        function = QFUNC(moduleAtmoCore);
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa";
    };

    class TB_eden_atmoShootingRange : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoShootingRange";
        function = QFUNC(moduleAtmoShootingRange);
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\kill_ca.paa";
    };

    class TB_eden_atmoMortarSupport : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoMortarSupport";
        function = QFUNC(moduleAtmoMortarSupport);
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\destroy_ca.paa";
    };

    class TB_eden_atmoMortarSuppression : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoMortarSuppression";
        function = QFUNC(moduleAtmoMortarSuppression);
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\danger_ca.paa";
    };

    class TB_eden_atmoFireSuppression : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoFireSuppression";
        function = QFUNC(moduleAtmoFireSuppression);
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa";
    };

    class TB_eden_atmoTarget : TB_eden_atmoBase
    {
        scope = 2;
        displayName = "AtmoTarget";
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\target_ca.paa";
    };
};
