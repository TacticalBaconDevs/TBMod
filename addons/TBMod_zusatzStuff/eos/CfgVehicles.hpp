class TB_zusatz_eos_normaleZone : TB_zusatz_Module {
    scope = 2;
    displayName = "EOS Zone";
    function = "TB_EOS_fnc_moduleZone";
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa";
    
    class AttributeValues
    {
        isRectangle = 0;
        size3[] = {300,300,-1};
    };
    
    class Attributes: AttributesBase
    {
        class hausInf: Edit
        {
            property = "TB_zusatz_eos_normaleZone_hausInf";
            displayName = "Hausgruppen";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class patrolInf: Edit
        {
            property = "TB_zusatz_eos_normaleZone_patrolInf";
            displayName = "Patrouille";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class lightVeh: Edit
        {
            property = "TB_zusatz_eos_normaleZone_lightVeh";
            displayName = "Leichte Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, 1-5 Anzahl Leute Transport, (Wahrscheinlichkeit in Prozent)]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class armorVeh: Edit
        {
            property = "TB_zusatz_eos_normaleZone_armorVeh";
            displayName = "Schwere Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, (Wahrscheinlichkeit in Prozent)]";
            typeName = "STRING";
            defaultValue = "[0]";
        };
        class statics: Edit
        {
            property = "TB_zusatz_eos_normaleZone_statics";
            displayName = "Statische Geschütze";
            tooltip = "[ANZAHL der Gruppen, (Wahrscheinlichkeit in Prozent)]";
            typeName = "STRING";
            defaultValue = "[0]";
        };
        class helis: Edit
        {
            property = "TB_zusatz_eos_normaleZone_helis";
            displayName = "Helikopter";
            tooltip = "[ANZAHL der Gruppen, 1-5 Anzahl Leute Transport, (Wahrscheinlichkeit in Prozent)]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class activRadius: Edit
        {
            property = "TB_zusatz_eos_normaleZone_activRadius";
            displayName = "Aktivierungsabstand";
            tooltip = "Wird zudätzlich zur Markergröße genommen zum Start der Spawns";
            typeName = "NUMBER";
            defaultValue = "500";
        };
        class side: Edit
        {
            property = "TB_zusatz_eos_normaleZone_side";
            displayName = "Seite";
            tooltip = "Seite des Markers (EAST, WEST, INDEPENDENT, CIVILIAN)";
            typeName = "STRING";
            defaultValue = "EAST";
        };
        class heightCheck: Checkbox
        {
            property = "TB_zusatz_eos_normaleZone_heightCheck";
            displayName = "Nur Soldaten lösen aus";
            tooltip = "Keine Helikopter, nur unter Spieler unter 5m lösen aus";
            typeName = "BOOL";
            defaultValue = "true";
        };
        class settings: Edit
        {
            property = "TB_zusatz_eos_normaleZone_settings";
            displayName = "Settings";
            tooltip = "[FACTION, MARKERTYPE] | Factions: 11->Russland";
            typeName = "STRING";
            defaultValue = "[11, 0]";
        };
        class sichtbar: Checkbox
        {
            property = "TB_zusatz_eos_normaleZone_sichtbar";
            displayName = "Marker sichtbar";
            tooltip = "Zeigt den EOS Marker an";
            typeName = "BOOL";
            defaultValue = "false";
        };
    };
};

class TB_zusatz_eos_bastionZone : TB_zusatz_Module {
    scope = 2;
    displayName = "EOS BastionZone";
    function = "TB_EOS_fnc_moduleBastion";
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa";
    
    class AttributeValues
    {
        isRectangle = 0;
        size3[] = {300,300,-1};
    };
    
    class Attributes: AttributesBase
    {
        class patrolInf: Edit
        {
            property = "TB_zusatz_eos_bastionZone_patrolInf";
            displayName = "Patrouille";
            tooltip = "[ANZAHL der Gruppen, Größe 1-5]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class lightVeh: Edit
        {
            property = "TB_zusatz_eos_bastionZone_lightVeh";
            displayName = "Leichte Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, 1-5 Anzahl Leute Transport]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class armorVeh: Edit
        {
            property = "TB_zusatz_eos_bastionZone_armorVeh";
            displayName = "Schwere Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen]";
            typeName = "STRING";
            defaultValue = "[0]";
        };
        class helis: Edit
        {
            property = "TB_zusatz_eos_bastionZone_helis";
            displayName = "Helikopter";
            tooltip = "[ANZAHL der Gruppen, 1-5 Anzahl Leute Transport]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class activRadius: Edit
        {
            property = "TB_zusatz_eos_bastionZone_activRadius";
            displayName = "KI-SpawnAbstand";
            tooltip = "Wird zusätzlich zur Markergröße genommen zum Erstellen der KI";
            typeName = "NUMBER";
            defaultValue = "500";
        };
        class side: Edit
        {
            property = "TB_zusatz_eos_bastionZone_side";
            displayName = "Seite";
            tooltip = "Seite des Markers (EAST, WEST, INDEPENDENT, CIVILIAN)";
            typeName = "STRING";
            defaultValue = "EAST";
        };
        class heightCheck: Checkbox
        {
            property = "TB_zusatz_eos_bastionZone_heightCheck";
            displayName = "Nur Soldaten lösen aus";
            tooltip = "Keine Helikopter, nur unter Spieler unter 5m lösen aus";
            typeName = "BOOL";
            defaultValue = "true";
        };
        class settings: Edit
        {
            property = "TB_zusatz_eos_bastionZone_settings";
            displayName = "Settings";
            tooltip = "[FACTION, MARKERTYPE] | Factions: 11->Russland";
            typeName = "STRING";
            defaultValue = "[11, 0]";
        };
        class bastionSettings: Edit
        {
            property = "TB_zusatz_eos_bastionZone_bastionSettings";
            displayName = "Bastion Settings";
            tooltip = "[PAUSE bis Begin, Wellenanzahl, Zeit zwischen Wellen, Besetzen wenn zurückerobert, Hinweise anzeigen]";
            typeName = "STRING";
            defaultValue = "[30, 3, 300, true, false]";
        };
        class sichtbar: Checkbox
        {
            property = "TB_zusatz_eos_bastionZone_sichtbar";
            displayName = "Marker sichtbar";
            tooltip = "Zeigt den EOS Marker an";
            typeName = "BOOL";
            defaultValue = "false";
        };
    };
};
